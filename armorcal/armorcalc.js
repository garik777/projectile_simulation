(function (root) {
  "use strict";

  const DEG = Math.PI / 180.0;

  // Armor types: rha | cha | fha ; shell types: ap | apc | apbc | apcbc | apcr | apds
  // apdsGen: gen1 | gen2 | gen3 ; flaw: noFlaws | small | medium | large
  // freeEdge: none | small | medium | large ; capType: type1 | type2

  function compoundAngle(plate) {
    const vRad = plate.VangleAngle * DEG;
    const lRad = plate.LangleAngle * DEG;
    return Math.acos(Math.cos(vRad) * Math.cos(lRad)) / DEG;
  }

  function activeDiameter(shell) {
    return (shell.type === "apcr" || shell.type === "apds") ? (shell.coreDiameter ?? shell.diameter) : shell.diameter;
  }

  function getDecapResult(thickness, angle, refDiameter, cap, shellType) {
    if (shellType !== "apc" && shellType !== "apcbc") return { state: "intact", multiplier: 1.0 };

    const A = angle;
    const TD = thickness / refDiameter;

    let fullThreshold;
    if (A <= 25) fullThreshold = 0.35;
    else if (A <= 45) fullThreshold = (-0.005 * A) + 0.475;
    else fullThreshold = 0.14;

    let intactThreshold;
    if (cap === "type1") intactThreshold = A <= 15 ? 0.105 : 0.0805;
    else intactThreshold = A <= 45 ? 0.155 : 0.12;

    if (TD > fullThreshold) return { state: "full", multiplier: 1.25 };
    if (TD > intactThreshold) {
      const progress = (TD - intactThreshold) / (fullThreshold - intactThreshold);
      const scaled = 1.0 + progress * 0.25;
      return { state: "partial", multiplier: Math.max(1.0001, Math.min(1.2499, scaled)) };
    }
    return { state: "intact", multiplier: 1.0 };
  }

  function getFreeEdgeModifier(plate, shell) {
    const D = activeDiameter(shell);
    let mod = 1.0;
    switch (plate.freeEdge) {
      case "large": mod = 0.25 + 0.5 * (37.5 / (D * 0.5)); break;
      case "medium": mod = 0.75 + 0.15 * ((62.5 / (D * 0.5)) - 1); break;
      case "small": mod = 0.9 + 0.025 * ((150 / (D * 0.5)) - 2); break;
    }
    return Math.min(1.0, mod);
  }

  function getSlopeModifier(A, TD, shell) {
    const e = Math.E;
    const pow = Math.pow;
    switch (shell.type) {
      case "apc":
      case "apcbc": {
        if (A === 0) return 1.0;
        if (A <= 55) {
          const F = pow(e, 0.0000408 * pow(A, 2.5));
          const G = 0.0101 * pow(e, 0.1313 * pow(A, 0.8));
          return F * pow(TD, G);
        } else if (A <= 60) {
          const F = -3.434 + 0.10856 * A;
          const G = 0.2174 + 0.00046 * A;
          return F * pow(TD, G);
        } else if (A <= 70) {
          const F = 0.00000518 * pow(A, 3.25);
          const G = 0.00002123 * pow(A, 2.295);
          return F * pow(TD, G);
        }
        const F = 0.0678 * pow(1.0634, A);
        const G = 0.1017 * pow(1.0178, A);
        return F * pow(TD, G);
      }
      case "ap": {
        if (A === 0) return 1.0;
        if (A <= 40) {
          const F = 0.95 * pow(e, 0.0000539 * pow(A, 2.5));
          const G = 0.04433 * pow(e, 0.04867 * A);
          return F * pow(TD, G);
        } else if (A <= 55) {
          return 0.04754 * pow(A, 0.953) * pow(TD, 0.02047164 * pow(A, 0.46471));
        }
        return 0.0001675 * pow(A, 2.3655) * pow(TD, 0.02047164 * pow(A, 0.46471));
      }
      case "apbc": {
        if (A === 0) return 1.0;
        if (A <= 55) {
          const F = pow(e, 0.019925 * pow(1.06758, A));
          const G = 0.007012 * pow(1.08289, A);
          return F * pow(TD, G);
        } else if (A <= 60) {
          const F = pow(e, 0.002542 * pow(1.1089, A));
          const G = 0.0004763 * pow(1.1373, A);
          return F * pow(TD, G);
        }
        const F = pow(e, 0.03723 * pow(1.06033, A));
        const G = -3.3667 + 0.07411 * A;
        return F * pow(TD, G);
      }
      case "apcr": {
        if (A === 0) return 1.0;
        if (shell.diameter > 76.2) {
          if (A <= 30) return pow(e, pow(A, 1.75) * 0.000662);
          return 0.9043 * pow(e, pow(A, 2.2) * 0.0001987);
        }
        if (A <= 25) return pow(e, pow(A, 2.2) * 0.0001727);
        return 0.7277 * pow(e, pow(A, 1.5) * 0.003787);
      }
      case "apds": {
        if (A === 0) return 1.0;
        switch (shell.apdsGen) {
          case "gen2": return pow(e, pow(A, 3.5105) * 0.00000056238);
          case "gen3": return pow(e, pow(A, 2.1253) * 0.00010141);
          default: return pow(e, pow(A, 2.6) * 0.00003011); // gen1, or no generation given
        }
      }
    }
    return 1.0;
  }

  function getTypeModifier(plate, shell, TD) {
    const BHN = plate.hardnessBHN;
    const A = compoundAngle(plate);
    if (plate.type === "fha") {
      let C;
      switch (shell.type) {
        case "ap": case "apbc": C = 1.35; break;
        case "apc": case "apcbc": C = 0.96; break;
        default: C = 0.822;
      }
      return C * Math.pow(TD, 0.15);
    }
    if (plate.type === "rha" || plate.type === "cha") {
      if (BHN <= 260) return A <= 35 ? 1 + 0.0018 * (BHN - 260) : 1 + 0.0027 * (BHN - 260);
      if (BHN <= 320) return A <= 35 ? 1 + 0.0042 * (BHN - 260) : 1 + 0.00325 * (BHN - 260);
      if (BHN <= 375) return A <= 35 ? 1.255 + 0.0008 * (BHN - 320) : 1.195;
      return 0.01 * 1011.79 * Math.pow(activeDiameter(shell), 0.06111) * Math.pow(TD, 0.2821) * Math.pow(BHN, -0.4363);
    }
    return 1.0;
  }

  function getFlawModifier(plate, TD) {
    let mod = 1.0;
    const A = compoundAngle(plate);
    switch (plate.flawRating) {
      case "noFlaws": return 1.0;
      case "large":
        if (A <= 30) mod = 0.25 * TD + 0.725;
        else if (A <= 60) mod = 0.23 * TD + 0.678;
        else if (A <= 75) mod = 0.23 * TD + 0.605;
        else mod = 0.23 * TD + 0.575;
        break;
      case "medium":
        if (A <= 30) mod = 0.22 * TD + 0.75;
        else if (A <= 60) mod = 0.22 * TD + 0.718;
        else if (A <= 75) mod = 0.22 * TD + 0.7;
        else mod = 0.22 * TD + 0.678;
        break;
      case "small":
        if (A <= 30) mod = 0.11 * TD + 0.87;
        else if (A <= 60) mod = 0.11 * TD + 0.86;
        else if (A <= 75) mod = 0.12 * TD + 0.84;
        else mod = 0.115 * TD + 0.84;
        break;
    }
    return Math.min(1.0, mod);
  }

  function calculateSinglePlate(plate, shell) {
    const T = plate.thickness;
    const D = activeDiameter(shell);
    const A = compoundAngle(plate);
    const TD = T / D;

    const slopeMod = getSlopeModifier(A, TD, shell);
    const typeMod = getTypeModifier(plate, shell, TD);

    let castMod = 1.0;
    if (plate.type === "cha") {
      castMod = Math.min(1.0, 0.8063 + T * 0.001238 - 0.0002628 * D + TD * 0.02706);
    }

    return T * slopeMod * typeMod * castMod * getFlawModifier(plate, TD) * getFreeEdgeModifier(plate, shell);
  }

  function calculateLaminated(plate1, plate2, shell) {
    const t1 = calculateSinglePlate(plate1, shell);
    const shellForT2 = Object.assign({}, shell);
    let t2Multiplier = 1.0;

    const decap = getDecapResult(plate1.thickness, compoundAngle(plate1), activeDiameter(shell), shell.capType ?? "type2", shell.type);
    if (decap.state === "full") shellForT2.type = "ap";
    if (plate2.type !== "fha") t2Multiplier = decap.multiplier;

    const t2 = calculateSinglePlate(plate2, shellForT2) * t2Multiplier;
    const tMax = Math.max(t1, t2);
    const multiplier = 0.3129 * Math.pow(t1 / t2, 0.02527) * Math.pow(tMax, 0.2439);
    return multiplier * (t1 + t2);
  }

  function calculateTripleLaminated(plate1, plate2, plate3, shell) {
    const t1 = calculateSinglePlate(plate1, shell);

    const shellForPlate2 = Object.assign({}, shell);
    let t2Multiplier = 1.0;
    const decap1 = getDecapResult(plate1.thickness, compoundAngle(plate1), activeDiameter(shell), shell.capType ?? "type2", shell.type);

    if (decap1.state === "full") shellForPlate2.type = "ap";
    if (plate2.type !== "fha") t2Multiplier = decap1.multiplier;

    const t2 = calculateSinglePlate(plate2, shellForPlate2) * t2Multiplier;

    const shellForPlate3 = Object.assign({}, shellForPlate2);
    let t3Multiplier = 1.0;
    const decap2 = getDecapResult(plate2.thickness, compoundAngle(plate2), activeDiameter(shell), shell.capType ?? "type2", shellForPlate2.type);

    if (decap2.state === "full") shellForPlate3.type = "ap";
    if (plate3.type !== "fha") t3Multiplier = Math.max(decap1.multiplier, decap2.multiplier);

    const t3 = calculateSinglePlate(plate3, shellForPlate3) * t3Multiplier;

    const tMax = Math.max(t1, t2, t3);
    // The source divides t1 by t3 here (not t2); kept as is.
    const multiplier = 0.3129 * Math.pow(t1 / t3, 0.02527) * Math.pow(tMax, 0.2439);
    return multiplier * (t1 + t2 + t3);
  }

  function calculateSpaced(plates, shell) {
    if (plates.length === 0) return 0.0;
    if (plates.length === 1) return calculateSinglePlate(plates[0], shell);

    const currentShell = Object.assign({}, shell);
    let totalPower = 0.0;
    let decapState = (shell.type === "apcbc" || shell.type === "apc") ? "intact" : "full";
    let cumulative = 1.0;

    plates.forEach((plate, index) => {
      const tBase = calculateSinglePlate(plate, currentShell);
      const t = (index > 0 && plate.type !== "fha") ? tBase * cumulative : tBase;

      if (index === 0) {
        totalPower += Math.pow(1.15 * t, 1.4);
      } else {
        let B = 1.0;
        if (currentShell.type === "ap") B = 1.05;
        else if (currentShell.type === "apc" || currentShell.type === "apcbc") B = 1.10;
        totalPower += Math.pow(B, 1.4) * Math.pow(t, 1.4);
      }

      if (decapState !== "full") {
        const r = getDecapResult(plate.thickness, compoundAngle(plate), activeDiameter(currentShell),
          currentShell.capType ?? "type2", currentShell.type);

        if (r.state === "full") {
          decapState = "full";
          currentShell.type = "ap";
          cumulative = Math.max(cumulative, r.multiplier);
        } else if (r.state === "partial" && decapState === "intact") {
          decapState = "partial";
          cumulative = Math.max(cumulative, r.multiplier);
        } else if (decapState === "partial") {
          if (r.state === "partial" || r.state === "full") {
            decapState = "full";
            currentShell.type = "ap";
            cumulative = Math.max(cumulative, 1.25);
          }
        }
      }
    });

    return Math.pow(totalPower, 1.0 / 1.4);
  }

  // Swift prints Doubles with a trailing ".0" when they are whole numbers
  const swiftDouble = (n) => (Number.isInteger(n) ? n.toFixed(1) : String(n));
  const fixed0 = (n) => (Number.isNaN(n) ? "nan" : Number.isFinite(n) ? n.toFixed(0) : n > 0 ? "inf" : "-inf");

  // args uses the same names as the Swift function: arrangementName, p1Type ... p6Edge,
  // shellType, shellDiameter, coreDiameter, capType, apdsGen.
  function evaluateArmorHit(args) {
    const shell = {
      type: args.shellType, diameter: args.shellDiameter,
      coreDiameter: args.coreDiameter ?? null, capType: args.capType ?? null, apdsGen: args.apdsGen ?? null,
    };

    const plates = [];
    for (let i = 1; i <= 6; i++) {
      const type = args[`p${i}Type`], thickness = args[`p${i}Thickness`], hardness = args[`p${i}Hardness`];
      const v = args[`p${i}Vangle`], l = args[`p${i}Langle`], flaw = args[`p${i}Flaw`];
      const present = [type, thickness, hardness, v, l, flaw].every((x) => x !== undefined && x !== null);
      if (!present) {
        if (i === 1) return { error: "Plate 1 is incomplete." };
        continue;
      }
      plates.push({
        type, thickness, hardnessBHN: hardness, VangleAngle: v, LangleAngle: l,
        flawRating: flaw, freeEdge: args[`p${i}Edge`] ?? "none",
      });
    }

    const name = (args.arrangementName || "").toLowerCase();
    let result;
    if (plates.length === 1) {
      result = calculateSinglePlate(plates[0], shell);
    } else if (plates.length === 3 && name.includes("triple") && !name.includes("spaced")) {
      result = calculateTripleLaminated(plates[0], plates[1], plates[2], shell);
    } else if (plates.length === 2 && name.includes("laminated")) {
      result = calculateLaminated(plates[0], plates[1], shell);
    } else if (name.includes("spaced")) {
      result = calculateSpaced(plates, shell);
    } else {
      return { error: "Invalid arrangement." };
    }

    const coreInfo = shell.coreDiameter !== null ? ` (Core: ${swiftDouble(shell.coreDiameter)}mm)` : "";
    const genInfo = shell.apdsGen !== null ? ` (${shell.apdsGen})` : "";
    const heading = `--- ${args.arrangementName} vs ${swiftDouble(shell.diameter)}mm ${shell.type}${genInfo}${coreInfo} ---`;
    return { result, heading, report: `${heading}\nEffective Thickness: ${fixed0(result)}mm` };
  }

  // ---------- Preset library (the Swift test cases) ----------
  const presets = [];
  let currentTitle = "";

  function loadPresets() {
    const data = typeof module !== "undefined" && module.exports ? require("./armor-data.js") : root.ArmorData;
    data.build({
      title: (t) => { currentTitle = t.replace(/:\s*$/, ""); },
      evaluateArmorHit: (args) => { presets.push({ title: currentTitle || "Untitled", args }); },
    });
  }
  loadPresets();

  const api = { presets, evaluateArmorHit, calculateSinglePlate, calculateLaminated, calculateTripleLaminated, calculateSpaced, compoundAngle };

  if (typeof module !== "undefined" && module.exports) module.exports = api;
  else root.ArmorCalc = api;
})(typeof globalThis !== "undefined" ? globalThis : this);
