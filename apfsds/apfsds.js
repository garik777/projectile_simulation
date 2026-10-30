(function (root) {
  "use strict";

  const DEG = Math.PI / 180.0;

  // ---------- Enums ----------
  const ARMOR_TYPE_MODIFIER = {
    rha: 1.0, cha: 1.0, rubber: 1.0, polycarbonate: 1.0,
    aramid: 0.39, tpu: 0.3, dua: 2.37, titanium: 0.9, aluminum: 0.2, ly12: 0.37,
    a00: 0.0, kvartz: 0.0, sic: 1.66, b4c: 1.66, al2o3: 0.685, dottikon: 1.76,
    gap: 3.08, stb: 0.394, ncs: 1.4,
  };

  const ERA_TYPES = {
    brennus: { label: "BRENNUS", modifier: 0.17 },
    kontakt5: { label: "Kontakt-5", modifier: 0.2 },
    relikt: { label: "Relikt", modifier: 0.4 },
    fy2: { label: "FY-2", modifier: 0.23 },
    fy4: { label: "FY-4", modifier: 0.3 },
    fy5: { label: "FY-5", modifier: 0.4 },
    nizh: { label: "Nizh", modifier: 0.45 },
    duplet: { label: "Duplet", modifier: 0.6 },
    erawa2: { label: "ERAWA-2", modifier: 0.32 },
    dyna: { label: "DYNA", modifier: 0.3 },
    m19: { label: "M19", modifier: 0.4 },
  };

  const nz = (v) => (v === undefined ? null : v);

  // ---------- APFSDS round ----------
  // type: wha | whass | du | steel ; subtype: monobloc | cored | jacketed
  // antiERACapability: none | gen1 | gen2
  function APFSDSRound(o) {
    return {
      name: o.name, type: o.type, subtype: o.subtype,
      diameter: o.diameter, length: o.length, density: o.density,
      muzzleVelocity: o.muzzleVelocity, velocityDropPerKm: o.velocityDropPerKm,
      penetratorBHN: nz(o.penetratorBHN), mass: nz(o.mass),
      antiERACapability: o.antiERACapability || "none",
      steelTipLength: nz(o.steelTipLength), steelTipDiameter: nz(o.steelTipDiameter),
      steelTipDensity: nz(o.steelTipDensity), steelTipBHN: nz(o.steelTipBHN),
      coreDiameter: nz(o.coreDiameter), coreLength: nz(o.coreLength),
      jacketThickness: nz(o.jacketThickness), jacketDensity: nz(o.jacketDensity), jacketBHN: nz(o.jacketBHN),
    };
  }

  function runLanzOdermatt(type, length, diameter, density, bhnP, vImpact) {
    const b0 = 0.283;
    const b1 = 0.0656;
    const rhoT = 7850.0;
    const bhnT = 260.0;
    const vKmS = vImpact / 1000.0;

    let a = 0.0;
    let s2 = 0.0;

    switch (type) {
      case "wha": {
        a = 0.994;
        const c0 = 134.5, c1 = -0.148;
        s2 = ((c0 + c1 * bhnT) * bhnT) / density;
        break;
      }
      case "whass": {
        a = 0.825;
        const c0 = 90.0, c1 = -0.148;
        s2 = ((c0 + c1 * bhnT) * bhnT) / density;
        break;
      }
      case "du": {
        a = 0.825;
        const c0 = 90.0, c1 = -0.0849;
        s2 = ((c0 + c1 * bhnT) * bhnT) / density;
        break;
      }
      case "steel": {
        a = 1.104;
        const c0 = 9874.0, k = 0.3598, n = -0.2342;
        const hardness = bhnP ?? 600.0;
        s2 = (c0 * Math.pow(bhnT, k) * Math.pow(hardness, n)) / density;
        break;
      }
    }

    const aspect = length / diameter;
    const tanhTerm = Math.tanh(b0 + b1 * aspect);
    if (!(tanhTerm > 0)) return 0.0;

    return length * a * (1.0 / tanhTerm) * Math.sqrt(density / rhoT) * Math.exp(-s2 / Math.pow(vKmS, 2.0));
  }

  function calculatePenetration(round, distance) {
    const vImpact = Math.max(0.0, round.muzzleVelocity - round.velocityDropPerKm * distance);
    if (vImpact <= 0) return 0.0;

    let total = 0.0;

    switch (round.subtype) {
      case "cored": {
        const m = round.mass ?? 0.0;
        const numerator = m * Math.pow(vImpact * 1.0, 2.0);
        const denominator = Math.pow(2800.0, 2.0) * Math.pow(round.diameter * 0.01, 1.56);
        if (denominator > 0) total = Math.pow(numerator / denominator, 1.0 / 1.34) * 100.0;
        break;
      }
      case "monobloc":
        total = runLanzOdermatt(round.type, round.length, round.diameter, round.density, round.penetratorBHN, vImpact);
        break;
      case "jacketed": {
        const dc = round.coreDiameter ?? round.diameter;
        const lc = round.coreLength ?? round.length;
        const t = round.jacketThickness ?? (round.diameter - dc) / 2.0;

        const pCore = runLanzOdermatt(round.type, lc, dc, round.density, round.penetratorBHN, vImpact);
        const pJacket = runLanzOdermatt("steel", round.length, round.diameter,
          round.jacketDensity ?? 7850.0, round.jacketBHN ?? 600.0, vImpact);

        const angle = Math.PI * (t / round.diameter);
        const cosFactor = Math.pow(Math.max(0, Math.cos(angle)), 1.4);
        total = (pCore - pJacket) * cosFactor + pJacket;
        break;
      }
    }

    if (round.steelTipLength !== null && round.steelTipDiameter !== null) {
      total += runLanzOdermatt("steel", round.steelTipLength, round.steelTipDiameter,
        round.steelTipDensity ?? 7850.0, round.steelTipBHN ?? 600.0, vImpact);
    }
    return total;
  }

  // ---------- Armor ----------
  function ArmorPlate(o) {
    return {
      type: o.type,
      physicalThickness: o.thickness,
      hardnessBHN: o.hardnessBHN,
      VangleAngle: o.VangleAngle,
      LangleAngle: o.LangleAngle,
      // Thickness scaled by the material modifier (matches the Swift computed property)
      thickness: o.thickness * ARMOR_TYPE_MODIFIER[o.type],
    };
  }

  function ArmorArray(o) {
    return { name: o.name, plates: o.plates, airGaps: o.airGaps || [], eraType: o.eraType ?? null };
  }

  function getCompoundAngle(plate) {
    const vRad = plate.VangleAngle * DEG;
    const lRad = plate.LangleAngle * DEG;
    return Math.acos(Math.cos(vRad) * Math.cos(lRad)) / DEG;
  }

  function coredSlopeModifier(angle) {
    if (angle <= 0) return 1.0;
    const a = 0.000244444, b = -0.011, c = 1.19;
    return a * Math.pow(angle, 2.0) + b * angle + c;
  }

  function effectiveThickness(plate, shell) {
    const T = plate.thickness;
    const A = getCompoundAngle(plate);
    const aRad = A * DEG;

    let slopeMod;
    if (shell.subtype === "cored") {
      slopeMod = A < 90.0 ? coredSlopeModifier(A) / Math.cos(aRad) : Infinity;
    } else {
      const m = -0.224;
      slopeMod = A < 90.0 ? 1.0 / Math.pow(Math.cos(aRad), m + 1.0) : Infinity;
    }

    const rhoP = shell.density;
    const vKmS = Math.max(0.1, shell.velocity > 100.0 ? shell.velocity / 1000.0 : shell.velocity);

    const s2 = (bhn) => {
      switch (shell.type) {
        case "wha":
        case "whass":
          return (0.01255 * bhn * 1000.0) / rhoP;
        case "du":
          return (0.011 * bhn * 1000.0) / rhoP;
        default: {
          const bhnP = shell.penetratorBHN ?? 600.0;
          return (9874.0 * Math.pow(bhn, 0.3598) * Math.pow(bhnP, -0.2342)) / rhoP;
        }
      }
    };

    const exponent = (s2(plate.hardnessBHN) - s2(260.0)) / Math.pow(vKmS, 2.0);
    const bhnMod = Math.exp(exponent);

    const D = shell.diameter;
    const TD = T / D;

    let castMod = 1.0;
    if (plate.type === "cha") {
      castMod = Math.min(1.0, 0.8063 + T * 0.001238 - 0.0002628 * D + TD * 0.02706);
    }
    return T * slopeMod * bhnMod * castMod;
  }

  const sum = (xs) => xs.reduce((a, b) => a + b, 0);

  function calculateLaminated(plates, shell) {
    if (plates.length === 0) return 0.0;
    return 0.893 * plates.reduce((s, p) => s + effectiveThickness(p, shell), 0.0);
  }

  function calculateSpaced(plates, airGaps, shell) {
    if (plates.length === 0) return 0.0;
    const eff = plates.map((p) => effectiveThickness(p, shell));

    if (shell.subtype === "cored") {
      const totalSteelRHA = 1.045 * sum(eff);
      let gapMods = 0.0;
      const loopCount = Math.min(airGaps.length, plates.length - 1);
      for (let i = 0; i < loopCount; i++) {
        const t1 = eff[i];
        const t2 = eff[i + 1];
        const angle = getCompoundAngle(plates[i]);
        const losGap = angle < 90.0 ? airGaps[i] / Math.cos(angle * DEG) : Infinity;
        const gapScaling = Math.pow(losGap, 0.254);
        const bracket = 0.183 * t2 + 0.093 * t1 - 0.00059 * (t1 * t2) - 17.03;
        gapMods += gapScaling * bracket;
      }
      return totalSteelRHA + gapMods;
    }

    const totalSteelRHA = 0.893 * sum(eff);
    let gapBonus = 0.0;
    const loopCount = Math.min(airGaps.length, plates.length);
    for (let i = 0; i < loopCount; i++) {
      const angle = getCompoundAngle(plates[i]);
      const losGap = angle < 90.0 ? airGaps[i] / Math.cos(angle * DEG) : Infinity;
      gapBonus += 0.173 * Math.pow(losGap, 0.72);
    }
    return totalSteelRHA + gapBonus;
  }

  // ---------- Registries ----------
  const apfsdsRegistry = {};
  const armorRegistry = {};

  function loadData() {
    const data = typeof module !== "undefined" && module.exports ? require("./apfsds-data.js") : root.ApfsdsData;
    data.build({ ArmorPlate, ArmorArray, APFSDSRound, apfsdsRegistry, armorRegistry });
  }

  // ---------- Protection test ----------
  // Returns a result object; formatReport() renders it like the Swift console output.
  function testArmorProtection(armorName, apfsdsName, distance) {
    const armor = armorRegistry[armorName];
    if (!armor) return { error: `Test Failure: Armor array '${armorName}' not found in registry.` };
    const shell = apfsdsRegistry[apfsdsName];
    if (!shell) return { error: `Test Failure: APFSDS profile '${apfsdsName}' not found in registry.` };

    const vImpact = Math.max(0.0, shell.muzzleVelocity - shell.velocityDropPerKm * distance);
    const calculatedPen = calculatePenetration(shell, distance);

    const sim = {
      type: shell.type, subtype: shell.subtype, length: shell.length, diameter: shell.diameter,
      density: shell.density, velocity: vImpact, penetratorBHN: shell.penetratorBHN,
      antiERACapability: shell.antiERACapability,
    };

    let effectiveProtection = 0.0;
    if (armor.airGaps.length > 0) {
      effectiveProtection = calculateSpaced(armor.plates, armor.airGaps, sim);
    } else if (armor.plates.length > 1) {
      effectiveProtection = calculateLaminated(armor.plates, sim);
    } else if (armor.plates.length > 0) {
      effectiveProtection = effectiveThickness(armor.plates[0], sim);
    }

    if (armor.eraType) {
      let modifier = ERA_TYPES[armor.eraType].modifier;
      if (sim.antiERACapability === "gen2") {
        if (modifier <= 0.4) modifier = 0.0;
      } else if (sim.antiERACapability === "gen1") {
        if (modifier < 0.4) modifier = 0.0;
      }
      effectiveProtection += calculatedPen * modifier;
    }

    const margin = effectiveProtection - calculatedPen;
    let status;
    if (calculatedPen <= 0) status = "no penetration";
    else if (margin <= 0.0) status = "full penetration";
    else if (margin < 20.0) status = "partial penetration";
    else status = "no penetration";

    return { status, apfsdsName, armorName, distance, vImpact, calculatedPen, effectiveProtection };
  }

  const fixed = (n, d) => (Number.isNaN(n) ? "nan" : Number.isFinite(n) ? n.toFixed(d) : n > 0 ? "inf" : "-inf");

  function formatReport(r) {
    if (r.error) return r.error;
    return [
      `--- PROTECTION TEST RESULT: ${r.status.toUpperCase()} ---`,
      `Attacking APFSDS Type: ${r.apfsdsName}`,
      `Calculated Penetration: ${fixed(r.calculatedPen, 0)}mm`,
      `Distance: ${fixed(r.distance, 2)} km`,
      `Impact Velocity: ${fixed(r.vImpact, 0)} m/s`,
      `Tested Target Array: ${r.armorName}`,
      `Effective Protection: ${fixed(r.effectiveProtection, 0)}mm`,
      "--------------------------------------------------",
    ].join("\n");
  }

  loadData();

  const api = {
    ARMOR_TYPE_MODIFIER, ERA_TYPES, apfsdsRegistry, armorRegistry,
    calculatePenetration, effectiveThickness, calculateLaminated, calculateSpaced,
    getCompoundAngle, testArmorProtection, formatReport,
  };

  if (typeof module !== "undefined" && module.exports) module.exports = api;
  else root.Apfsds = api;
})(typeof globalThis !== "undefined" ? globalThis : this);
