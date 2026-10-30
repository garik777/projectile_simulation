(function (root) {
  "use strict";

  const DEG = Math.PI / 180.0;

  // ---------- Libraries ----------
  const fh = (name, quality, damageQuality, backLayer, softShatter, cmpnd, thkthn, thnchl) =>
    ({ name, quality, damageQuality, backLayer, softShatter, cmpnd, thkthn, thnchl });

  const FacehardLibrary = {
    1: fh("Gruson Chilled Cast Iron", 0.617, 0.617, 0, 0, 0, 0, 0),
    2: fh("Compound", 0.575, 0.45, 70.0, 0, 1, 0, 0),
    3: fh("Harvey Mild Steel", 0.702, 0, 0, 0, 0, 0, 0),
    4: fh("Harvey Nickel-Steel", 0.724, 0, 0, 0, 0, 0, 0),
    5: fh("1892 KC a/A", 0.632, 0.632, 65.0, 0, 0, 0, 0),
    6: fh("1894 KC a/A", 0.712, 0.712, 65.0, 0, 0, 0, 0),
    7: fh("1906 KC a/A", 0.828, 0.828, 65.0, 0, 0, 0, 0),
    8: fh("1928 KC n/A", 0.9, 0.9, 59.0, 0, 0, 1, 0),
    9: fh("1935 KC n/A", 0.96, 0.96, 59.0, 1, 0, 1, 0),
    10: fh("British 1911 KC", 0.85, 0.85, 65.0, 2, 0, 2, 0),
    11: fh("British 1922 KC", 0.9, 0.9, 65.0, 2, 0, 2, 0),
    12: fh("CA", 0.928, 0.928, 70.0, 1, 0, 1, 0),
    13: fh("Terni KC", 0.98, 0.98, 0, 1, 0, 1, 0),
    14: fh("VH", 0.839, 0.839, 65.0, 0, 0, 0, 0),
    15: fh("Witkowitz KC", 0.947, 0.947, 65.0, 1, 0, 1, 0),
    16: fh("BNC Class A", 0.787, 0.787, 18.0, 0, 0, 0, 0),
    17: fh("MNC Class A", 0.881, 0.881, 18.0, 1, 0, 0, 0),
    18: fh("1906 'Crazy-Quilt' Class A", 0, 0, 0, 0, 0, 0, 0),
    19: fh("1911 Class A", 0.889, 0.889, 65.0, 0, 0, 0, 0),
    20: fh("BTC Class A", 0.889, 0.889, 85.0, 0, 0, 0, 1),
    21: fh("1935 Class A", 1.0, 1.0, 45.0, 1, 0, 1, 0),
    22: fh("1944 Class A", 1.025, 1.025, 45.0, 1, 0, 1, 0),
    23: fh("French 1912 KC", 0.85, 0.85, 65.0, 0, 0, 0, 0),
    24: fh("French 1932 KC", 0.96, 0.96, 65.0, 1, 0, 1, 0),
    25: fh("Average Worldwide 1898 KC", 0.787, 0.787, 65.0, 0, 0, 0, 0),
  };

  const hom = (name, quality, qBack, percentEL) => ({ name, quality, qBack, percentEL });

  const HomogeneousLibrary = {
    1: hom("Wrought Iron", 0.55, null, 22.0),
    2: hom("1876 Mild Steel", 0.7, null, 16.0),
    3: hom("1890 Mild Steel", 0.75, 0.7, 21.0),
    4: hom("1918 Mild Steel", 0.8, 0.8, 25.0),
    5: hom("1889 Nickel-Steel", 0.76, 0.8, 19.0),
    6: hom("1900 Nickel-Steel", 0.9, 0.8, 19.0),
    7: hom("Schiffbaustahl", 0.75, null, 16.0),
    8: hom("Schiffbaustahl I", 0.75, null, 24.0),
    9: hom("Schiffbaustahl II", 0.78, null, 20.0),
    10: hom("Schiffbaustahl III", 0.8, null, 18.0),
    11: hom("Low-% Nickel-Steel", 0.8, 0.8, 21.0),
    12: hom("Bulkhead Low-% Nickel-Steel", 0.85, null, 21.0),
    13: hom("Ste. 42", 0.78, null, 18.0),
    14: hom("Ste. 52", 0.8, 0.8, 18.0),
    15: hom("High-% Nickel-Steel", 0.95, null, 20.0),
    16: hom("Wh", 1.0, null, 18.0),
    17: hom("Ww", 0.95, null, 22.0),
    18: hom("Wsh", 1.1, null, 16.0),
    19: hom("German KNC", 0.97, null, 20.0),
    20: hom("1895 HTS", 0.8, 0.8, 22.0),
    21: hom("1918 HTS", 0.85, 0.9, 22.0),
    22: hom("Ducol", 0.9, 0.9, 22.0),
    23: hom("KNC", 0.95, null, 22.0),
    24: hom("NCA", 1.0, null, 25.0),
    25: hom("POV", 1.0, null, 17.1),
    26: hom("AOD", 1.0, null, 15.0),
    27: hom("1910 STS", 0.95, 1.0, 25.0),
    28: hom("1930 STS", 1.0, 1.0, 25.0),
    29: hom("1910 Class B", 0.95, null, 22.0),
    30: hom("1933 Class B", 1.0, null, 25.0),
    31: hom("NVNC", 0.95, null, 20.0),
    32: hom("MNC", 0.97, null, 23.0),
    33: hom("CNC", 0.95, null, 22.0),
  };

  const proj = (name, diameter, weight, muzzleVelocity, qualityLimit, damageLimit, apCap, cardonald, bend,
    nsdamagl, ltcase, shatres, braak, ald, bld, cld, aed, bed, ced, critagl) =>
    ({ name, diameter, weight, muzzleVelocity, qualityLimit, damageLimit, apCap, cardonald, bend,
      nsdamagl, ltcase, shatres, braak, ald, bld, cld, aed, bed, ced, critagl });

  const ProjectileLibrary = {
    1: proj("A/N Steel AP Shot/Shell", 14.0, 1400.0, 2600.0, 0.7, 0.616, 0, 0, 0, 15.0, 1, 1, 2, 0.0004301, 1.845, 0.0027, 0.03322, 1.172, 0.02222, 0.0),
    2: proj("Midvale tough soft-capped APC", 14.0, 1400.0, 2600.0, 0.7, 0.7, 1, 0, 2, 15.0, 0, 0, 1, 0.0, 0.0, 0.0, -1.0, -1.0, -1.0, 5.0),
    3: proj("Midvale unbreakable APC", 14.0, 1400.0, 2600.0, 1.0, 1.0, 1, 2, 0, 15.0, 0, 0, 0, 0.0, 0.0, 0.0, -1.0, -1.0, -1.0, 5.0),
    4: proj("16-in Mk 8-1-5 APC", 16.0, 2700.0, 2300.0, 0.9, 0.9, 2, 0, 0, 20.0, 0, 0, 0, 0.0, 0.0, 0.0, -1.0, -1.0, -1.0, 20.0),
    5: proj("16-in Mk 8-6-8 APC", 16.0, 2700.0, 2500.0, 1.0, 1.0, 2, 0, 0, 30.0, 0, 0, 0, 0.0, 0.0, 0.0, -1.0, -1.0, -1.0, 30.0),
    6: proj("Type 91 APC", 18.11, 3219.0, 2559.0, 0.945, 0.85, 2, 0, 0, 15.0, 0, 0, 1, 0.00336, 1.418, 0.0091701, 0.00104, 1.773, 0.00823, 0.0),
    7: proj("38cm Psgr. L/4,4", 14.96, 1764.0, 2690.0, 0.988, 0.977, 2, 0, 0, 25.0, 0, 0, 1, 0.00006891, 2.26, 0.00333, 0.0000971, 2.283, 0.0035, 0.0),
    8: proj("28cm Psgr. L/3,2", 11.14, 665.8, 2890.0, 0.877, 0.754, 3, 0, 0, 15.0, 0, 1, 0, 0.00006, 2.249, 0.00267, 0.000247, 2.129, 0.00172, 0.0),
    9: proj("12-in Mk 15 APC", 12.0, 870.0, 2900.0, 0.89, -1.0, 1, 0, 0, 15.0, 0, 0, 1, 0.0, 0.0, 0.0, -1.0, -1.0, -1.0, 5.0),
  };

  // Slope types: "normal" | "reverse" | "deck"
  // Layers: { kind: "homogeneous", plates:[{id,thickness}], slopeType, slopeAngle }
  //         { kind: "faceHardened", faceHardenedID, thickness, slopeType, slopeAngle,
  //           backingPlates:[{id,thickness}], woodThickness, cementThickness }

  const fmt2 = (n) => Number(n).toFixed(2);
  const clampIdx = (i, len) => Math.min(Math.max(i, 0), len - 1);

  // ---------- External ballistics ----------
  const Ballistics = {
    atmosphereDensityUSN: (alt) => 1.225 * Math.exp(-0.00010361 * alt),
    jurensGravity: (alt) => 9.80665 * (1.0 - 0.000000314 * alt),
    speedOfSound(alt) {
      const tempK = Math.max(288.15 - 0.0065 * alt, 216.65);
      return 20.05 * Math.sqrt(tempK);
    },
    g8DragCoefficient(mach) {
      if (mach < 0.8) return 0.15;
      else if (mach < 1.0) return 0.15 + (mach - 0.8) * 0.8;
      else if (mach < 1.2) return 0.31 + (mach - 1.0) * 0.2;
      else if (mach < 2.0) return 0.35 - (mach - 1.2) * 0.05;
      else return Math.max(0.31 - (mach - 2.0) * 0.02, 0.15);
    },
    calculate(projectileID, targetRangeYards) {
      const p = ProjectileLibrary[projectileID];
      if (!p) return { strikingVelocity: 0, impactObliquity: 0 };

      const targetRangeMeters = targetRangeYards * 0.9144;
      const dM = p.diameter * 0.0254;
      const area = Math.PI * Math.pow(dM / 2.0, 2.0);
      const wKg = p.weight * 0.453592;
      const v0 = p.muzzleVelocity * 0.3048;
      const formFactor = (p.weight / Math.pow(p.diameter, 3.0)) * 1.517;

      let bestRangeMeters = 0.0;
      let strikingVel = v0;
      let strikingAngle = 0.0;
      let angleMin = 0.0;
      let angleMax = 45.0;
      const dt = 0.05;

      for (let i = 0; i < 30; i++) {
        const currentAngle = (angleMin + angleMax) / 2.0;
        let vx = v0 * Math.cos(currentAngle * DEG);
        let vy = v0 * Math.sin(currentAngle * DEG);
        let x = 0.0;
        let y = 0.0;

        for (let step = 0; y >= 0.0 && step < 5000000; step++) {
          const v = Math.sqrt(vx * vx + vy * vy);
          const mach = v / Ballistics.speedOfSound(y);
          const cd = Ballistics.g8DragCoefficient(mach);
          const rho = Ballistics.atmosphereDensityUSN(y);

          const drag = 0.5 * rho * v * v * cd * area * formFactor;
          const ax = -(drag * (vx / v)) / wKg;
          const ay = -Ballistics.jurensGravity(y) - (drag * (vy / v)) / wKg;

          vx += ax * dt;
          vy += ay * dt;
          x += vx * dt;
          y += vy * dt;

          if (y < 0) {
            bestRangeMeters = x;
            strikingVel = v;
            strikingAngle = Math.atan2(-vy, vx) * 180.0 / Math.PI;
            break;
          }
        }

        if (bestRangeMeters < targetRangeMeters) angleMin = currentAngle;
        else angleMax = currentAngle;
      }

      return { strikingVelocity: strikingVel / 0.3048, impactObliquity: strikingAngle };
    },
  };

  // ---------- Armor calculations ----------
  const EXP = 1.4;
  const INV_EXP = 1.0 / 1.4;
  const VXP = 1.0 / 1.21;

  const MPLTBITE = [1.0, 0.999, 0.998, 0.995, 0.991, 0.986, 0.981, 0.974, 0.966, 0.958, 0.948, 0.937, 0.925, 0.912, 0.901, 0.889, 0.881, 0.879, 0.885];

  const MP_TABLE = [
    [0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885, 0.885],
    [0.918, 0.916, 0.912, 0.906, 0.902, 0.901, 0.905, 0.909, 0.912, 0.914, 0.914, 0.914, 0.914, 0.914, 0.914, 0.914, 0.914, 0.914, 0.914],
    [0.968, 0.96, 0.949, 0.932, 0.922, 0.921, 0.928, 0.936, 0.944, 0.951, 0.956, 0.96, 0.961, 0.961, 0.961, 0.961, 0.961, 0.961, 0.961],
    [1.05, 1.028, 1.0, 0.97, 0.958, 0.952, 0.96, 0.968, 0.982, 0.995, 1.005, 1.015, 1.021, 1.023, 1.023, 1.023, 1.023, 1.023, 1.023],
    [1.153, 1.111, 1.057, 1.008, 0.992, 0.987, 0.993, 1.006, 1.024, 1.042, 1.062, 1.076, 1.088, 1.094, 1.098, 1.098, 1.098, 1.098, 1.098],
    [1.272, 1.203, 1.12, 1.053, 1.027, 1.021, 1.031, 1.049, 1.072, 1.094, 1.12, 1.14, 1.154, 1.165, 1.172, 1.179, 1.182, 1.184, 1.184],
    [1.376, 1.29, 1.178, 1.092, 1.058, 1.052, 1.067, 1.089, 1.116, 1.142, 1.172, 1.197, 1.215, 1.231, 1.241, 1.25, 1.257, 1.26, 1.261],
    [1.441, 1.354, 1.213, 1.119, 1.083, 1.079, 1.095, 1.119, 1.147, 1.178, 1.211, 1.24, 1.262, 1.28, 1.294, 1.302, 1.31, 1.315, 1.316],
    [1.5, 1.4, 1.232, 1.134, 1.099, 1.094, 1.111, 1.139, 1.165, 1.194, 1.232, 1.262, 1.291, 1.313, 1.326, 1.339, 1.345, 1.351, 1.353],
    [1.519, 1.414, 1.232, 1.13, 1.098, 1.092, 1.109, 1.138, 1.165, 1.195, 1.232, 1.265, 1.295, 1.32, 1.337, 1.35, 1.36, 1.365, 1.37],
    [1.498, 1.386, 1.2, 1.109, 1.075, 1.07, 1.087, 1.114, 1.14, 1.171, 1.209, 1.24, 1.27, 1.293, 1.311, 1.325, 1.337, 1.344, 1.349],
    [1.448, 1.326, 1.157, 1.064, 1.029, 1.02, 1.037, 1.064, 1.091, 1.119, 1.156, 1.189, 1.217, 1.24, 1.257, 1.268, 1.28, 1.287, 1.292],
    [1.36, 1.255, 1.087, 1.004, 0.968, 0.961, 0.977, 1.0, 1.026, 1.055, 1.087, 1.112, 1.149, 1.17, 1.19, 1.202, 1.212, 1.218, 1.221],
    [1.26, 1.167, 1.013, 0.932, 0.897, 0.891, 0.906, 0.929, 0.957, 0.98, 1.012, 1.04, 1.066, 1.088, 1.109, 1.121, 1.132, 1.14, 1.145],
    [1.153, 1.071, 0.933, 0.858, 0.826, 0.82, 0.837, 0.853, 0.881, 0.908, 0.933, 0.961, 0.982, 1.007, 1.025, 1.039, 1.049, 1.055, 1.06],
  ];

  const FH_M_TABLE = [1.0, 1.045, 1.09, 1.135, 1.18, 1.235, 1.31, 1.4, 1.53, 1.695, 1.9, 2.3, 3.2, 4.9, 8.0, 15.0];

  const MS_TABLE = [1.0, 1.002, 1.0078, 1.0176, 1.0314, 1.0495, 1.0722, 1.0994, 1.1317, 1.1672, 1.2018, 1.2377, 1.2782, 1.3236, 1.3715, 1.429, 1.51, 1.6036];

  function calculateLaminatedThickness(plates) {
    if (plates.length === 0) return { thickness: 0.0, percentEL: 0.0 };
    let tSum = 0.0;
    let teSum = 0.0;
    const first = HomogeneousLibrary[plates[0].id];
    const baseEL = first ? first.percentEL : 20.0;

    for (const plate of plates) {
      const armor = HomogeneousLibrary[plate.id];
      if (armor) {
        const te = plate.thickness * armor.quality;
        tSum += te;
        teSum += Math.pow(te, EXP);
      }
    }
    const spaced = Math.pow(teSum, INV_EXP);
    return { thickness: (tSum + spaced) / 2.0, percentEL: baseEL };
  }

  function combineNBLs(nbls) {
    const valid = nbls.filter((n) => n > 0);
    if (valid.length === 0) return 0.0;
    const sum = valid.map((n) => Math.pow(n, EXP)).reduce((a, b) => a + b, 0);
    return Math.pow(sum, INV_EXP);
  }

  function calculateFinalObliquity(shellObliquity, slopeType, plateSlope) {
    switch (slopeType) {
      case "deck": return Math.abs(90.0 - shellObliquity);
      case "reverse": return plateSlope + shellObliquity;
      default: return Math.abs(plateSlope - shellObliquity);
    }
  }

  function getCoefficients(t) {
    const c = (nc, tExp, ja, jb, jc) => ({ nc, tExp, ja, jb, jc });
    if (t <= 0.01156) return c(335.25392, 0.4336513, 0.0, 0.0, 0.0);
    if (t <= 0.05) return c(516.85756, 0.5306597, -0.02, 4682.6223, 54.131113);
    if (t <= 0.075) return c(902.41425, 0.7166931, -0.01, 7200.0, 360.0);
    if (t <= 0.1) return c(1290.90181, 0.8549115, 0.0, 0.0, 0.0);
    if (t <= 0.2549) return c(1687.6956, 0.9713125, 0.0, 0.0, 0.0);
    if (t <= 0.47931) return c(1361.41055, 0.8141355, 0.02, 802.10329, 204.45613);
    if (t <= 1.0) return c(1179.94178, 0.619609, 0.0, 0.0, 0.0);
    if (t <= 2.0) return c(1179.94178, 0.6387357, 0.0, 0.0, 0.0);
    if (t <= 3.0) return c(1173.77728, 0.6462927, 0.0, 0.0, 0.0);
    if (t <= 4.0) return c(1201.73299, 0.6248678, 0.0, 0.0, 0.0);
    return c(1227.31234, 0.609576, 0.0, 0.0, 0.0);
  }

  function homogeneousObliquityMultiplier(ob, tSlashD) {
    if (ob <= 45.0) {
      const i1 = clampIdx(Math.trunc(ob / 2.5), MPLTBITE.length);
      const i2 = (ob - 2.5 * i1) / 2.5;
      const next = MPLTBITE[clampIdx(i1 + 1, MPLTBITE.length)];
      const mPrime = MPLTBITE[i1] + i2 * (next - MPLTBITE[i1]);
      return mPrime / Math.cos(ob * DEG);
    }

    let obClamp = ob;
    if (obClamp > 80.0) obClamp = 79.9999;

    const c1 = Math.trunc((obClamp - 45.0) / 2.5);
    const c2 = ((obClamp - 45.0) - 2.5 * c1) / 2.5;

    let tPR = tSlashD;
    if (tPR > 0.899) tPR = 0.899;

    const t1 = Math.trunc(tPR / 0.05);
    const t2 = (tPR - 0.05 * t1) / 0.05;

    const mp0 = MP_TABLE[c1][t1] + t2 * (MP_TABLE[c1][t1 + 1] - MP_TABLE[c1][t1]);
    const mp1 = MP_TABLE[c1 + 1][t1] + t2 * (MP_TABLE[c1 + 1][t1 + 1] - MP_TABLE[c1 + 1][t1]);
    const mPrime = mp0 + c2 * (mp1 - mp0);
    return mPrime / Math.cos(obClamp * DEG);
  }

  function facehardObliquityMultiplier(ob) {
    if (ob > 70.0) return 100.0;
    if (ob === 70.0) return 8.0;
    const n = FH_M_TABLE.length;
    const int1 = Math.trunc(ob / 5.0);
    const int2 = (ob - int1 * 5.0) / 5.0;
    const point5 = int1 > 11 ? 0.0 : 0.5;

    const m1 = FH_M_TABLE[clampIdx(int1, n)];
    const m2 = FH_M_TABLE[clampIdx(int1 + 1, n)];
    const m3 = FH_M_TABLE[clampIdx(int1 + 2, n)];
    return m1 + int2 * (m2 - m1) + point5 * int2 * (int2 - 1.0) * (m3 - 2.0 * m2 + m1);
  }

  function shatterObliquity(ob, isThin) {
    if (isThin) {
      if (ob > 80.0) return 1.51;
      const n = MS_TABLE.length;
      const int1 = Math.trunc(ob / 5.0);
      const int2 = (ob - int1 * 5.0) / 5.0;
      const m1 = MS_TABLE[clampIdx(int1, n)];
      const m2 = MS_TABLE[clampIdx(int1 + 1, n)];
      const m3 = MS_TABLE[clampIdx(int1 + 2, n)];
      return m1 + int2 * (m2 - m1) + 0.5 * int2 * (int2 - 1.0) * (m3 - 2.0 * m2 + m1);
    }
    if (ob > 75.0) return 100.0;
    return 1.0 / Math.cos(1.061 * ob * DEG);
  }

  function calculateHomogeneousNBL(layer, shell) {
    const { thickness: effectiveThickness, percentEL } = calculateLaminatedThickness(layer.plates);
    if (effectiveThickness <= 0) return 0.0;

    const finalObliquity = calculateFinalObliquity(shell.obliquity, layer.slopeType, layer.slopeAngle);
    const tSlashD = effectiveThickness / shell.diameter;
    const projDensity = shell.weight / Math.pow(shell.diameter, 3.0);
    const scaleFactor = Math.sqrt(1.0 - 0.04 * Math.log(shell.diameter / 3.0));
    const coeffs = getCoefficients(tSlashD);

    let jsin = 0.0;
    if (coeffs.ja !== 0.0) {
      const jdeg = coeffs.jb * tSlashD - coeffs.jc;
      jsin = Math.sin(jdeg * DEG);
      if (jsin < 0) jsin = 0;
    }
    const J = 1.0 + coeffs.ja * jsin;
    const mObliquity = homogeneousObliquityMultiplier(finalObliquity, tSlashD);

    const qaTsD = 1.0 * tSlashD;
    let navyBL = coeffs.nc * J * mObliquity * scaleFactor * Math.pow(qaTsD, coeffs.tExp) / Math.sqrt(projDensity);

    if (percentEL < 25.0 && shell.diameter > 8.0) {
      const peEffect = (1.0 - Math.sqrt(percentEL / 25.0)) * (shell.diameter - 8.0) / 8.0;
      navyBL = navyBL * (1.0 - peEffect);
    }
    return navyBL;
  }

  function getHarveyQMod(armorID, thickness) {
    const tMax = Math.min(thickness, 20.0);
    const qVelHThick = -0.027917 * tMax + 1.2525;
    const qVelHMult = thickness < 8.0 ? (-0.035 * tMax + 1.28) * qVelHThick : qVelHThick;
    const qBase = armorID === 3 ? 0.702 : 0.724;
    return qBase * 0.982 * Math.pow(qVelHMult, 1.0 / 1.21);
  }

  function getFaceCalcBackLayer(armorID, thickness) {
    let ub = 45.0;
    switch (armorID) {
      case 1:
        if (thickness <= 15.75) ub = 45.0;
        else if (thickness >= 33.07) ub = 67.0;
        else ub = 45.0 + 22.0 * (thickness - 15.75) / 17.32;
        break;
      case 3:
      case 4:
        ub = 100.0 * (1.0 - 1.25 / thickness);
        break;
      case 13:
        if (thickness < 6.2205) ub = 50.0;
        else if (thickness > 10.433) ub = 70.0;
        else {
          const face = 3.1102 + 0.004682 * (thickness - 6.2205);
          ub = 100.0 * (1.0 - face / thickness);
        }
        break;
      default:
        return 45.0;
    }
    return Math.floor(ub);
  }

  function calculateFaceHardenedNBL(beltConfig, shell) {
    let belt = beltConfig;
    if (belt.faceHardenedID === 18) {
      const roll = 1 + Math.floor(Math.random() * 3);
      const newID = roll === 1 ? 16 : roll === 2 ? 17 : 25;
      belt = Object.assign({}, belt, { faceHardenedID: newID });
    }

    const fhArmor = FacehardLibrary[belt.faceHardenedID];
    const p = ProjectileLibrary[shell.id];
    if (!fhArmor || !p) return 0.0;

    const id = belt.faceHardenedID;
    const finalObliquity = calculateFinalObliquity(shell.obliquity, belt.slopeType, belt.slopeAngle);
    const tSlashD = belt.thickness / shell.diameter;

    let backingSum = 0.0;
    let backingSpacedSum = 0.0;
    for (const bPlate of belt.backingPlates) {
      const hArmor = HomogeneousLibrary[bPlate.id];
      if (hArmor) {
        const qBack = hArmor.qBack === null ? 1.0 : hArmor.qBack;
        const teN = qBack * bPlate.thickness;
        backingSum += teN;
        backingSpacedSum += Math.pow(teN, 1.4);
      }
    }

    let tLam = backingSum;
    if (belt.backingPlates.length > 1) {
      const tSpaced = Math.pow(backingSpacedSum, 0.71429);
      tLam = (backingSum + tSpaced) / 2.0;
    }

    let armorQuality = fhArmor.quality;
    let armorQualityDamage = fhArmor.damageQuality;
    let backLayer = fhArmor.backLayer;
    let thnchl = fhArmor.thnchl;

    if (id === 3 || id === 4) {
      armorQuality = getHarveyQMod(id, belt.thickness);
      armorQualityDamage = 0.864 * armorQuality;
    }

    if ([1, 3, 4, 13].includes(id)) {
      backLayer = getFaceCalcBackLayer(id, belt.thickness);
      if (id === 3 || id === 4) thnchl = backLayer > 75.0 ? 1 : 0;
    }
    if (fhArmor.thkthn === 1) {
      if (tSlashD < 0.70) armorQuality *= 1.0 - 0.23077 * Math.pow(0.70 - tSlashD, 1.5);
    } else if (fhArmor.thkthn === 2) {
      if (tSlashD < 0.5833) armorQuality *= 1.0 - 0.25 * (0.5833 - tSlashD);
    }

    if (fhArmor.cmpnd === 1 && tSlashD > 0.5) armorQuality *= 1.0 - 0.1 * (tSlashD - 0.5);
    if (thnchl === 1 && tSlashD > 1.0) armorQuality *= 1.0 - 0.05 * (tSlashD - 1.0);

    const targetEffectiveThickness = belt.thickness * armorQuality + belt.woodThickness / 100.0 + belt.cementThickness / 25.0 + tLam / 2.0;
    const tcal = (belt.thickness * armorQualityDamage) / shell.diameter;
    const THIN = fhArmor.thkthn === 1 ? 0.35 : fhArmor.thkthn === 2 ? 0.45 : 0.55;

    let pplus = 0.0;
    if (fhArmor.cmpnd === 1) {
      if (p.shatres === 2) pplus = 0.0;
      else if (p.braak === 2 || p.bend === 2) pplus = 0.1;
      else pplus = 0.2;
    } else if (thnchl === 1) {
      if (p.shatres === 2 || p.braak === 2 || p.bend === 2) pplus = 0.0;
      else pplus = 0.1;
    }

    let effectivePLIM = p.qualityLimit;
    if (effectivePLIM < 1.0) effectivePLIM = Math.min(effectivePLIM + pplus, 1.0);
    let effectivePDAM = p.damageLimit;
    if (effectivePDAM > 0.0 && effectivePDAM < 1.0) effectivePDAM = Math.min(effectivePDAM + pplus, 1.0);

    let isShattered = false;
    let shatMult = 1.0;

    if (p.apCap === 0 || p.shatres === 2) {
      isShattered = true;
    } else if (p.braak === 2 && (id === 3 || id === 4)) {
      isShattered = true;
    } else if (p.apCap === 1) {
      if (fhArmor.softShatter === 1) isShattered = true;
      else if (fhArmor.softShatter === 2 && finalObliquity > 20.0) isShattered = true;
      else if (fhArmor.softShatter === 0 && finalObliquity > 20.0) isShattered = true;
    } else if (p.apCap === 2) {
      isShattered = false;
    } else if (p.apCap === 3) {
      if (fhArmor.softShatter === 1 && tSlashD >= 0.67 && finalObliquity > 30.0) isShattered = true;
    }
    if (fhArmor.softShatter === 2 && p.cardonald === 2 && finalObliquity <= 15.0) isShattered = false;

    if (isShattered) {
      if (fhArmor.softShatter === 1 && p.apCap < 3) shatMult = 1.4;
      else if (fhArmor.softShatter === 2 && p.apCap === 1) shatMult = 1.35;
      else shatMult = 1.3;

      if (id === 3 || id === 4) {
        shatMult = belt.thickness >= 8.0 ? 1.0 : 1.25 - 0.03125 * belt.thickness;
      }
      if (effectivePLIM / shatMult < 0.607) shatMult = effectivePLIM / 0.607;
      if (shatMult < 1.0) shatMult = 1.0;
    }

    effectivePLIM = isShattered ? effectivePLIM / shatMult : effectivePLIM;
    effectivePDAM = isShattered ? effectivePDAM / shatMult : effectivePDAM;

    // Retained from the Swift source; the values feed no result.
    let ndap = p.nsdamagl;
    if (fhArmor.cmpnd === 1) ndap += 10.0;
    else if (id === 3 || id === 4) {
      if (belt.thickness >= 8.0) ndap += 10.0;
      else if (thnchl === 1) ndap += 5.0 + 5.0 * ((belt.thickness - 5.0) / 3.0);
    } else if (thnchl === 1) ndap += 5.0;

    if (fhArmor.softShatter === 1) ndap -= 10.0;
    else if (fhArmor.softShatter === 2) ndap -= 5.0;
    if (ndap < 5.0 && p.nsdamagl > 0.0) ndap = 5.0;
    if (ndap < 0.0) ndap = 0.0;

    let lcDam = 0.0;
    if (p.ltcase === 2 && tcal > 0.67) lcDam = 0.5;
    const lcmod = lcDam * (tcal - 0.67);

    let oprimel = finalObliquity;
    let oprimed = finalObliquity;
    if (finalObliquity > 60.0) { oprimel = 60.0; oprimed = 60.0; }

    let polmod = 1.0 + p.cld * oprimel - p.ald * tcal * Math.pow(oprimel, p.bld) - lcmod;
    if (polmod > 1.0) polmod = 1.0;
    if (polmod < 0.1) polmod = 0.1;

    let poimod = polmod;
    if (p.aed >= 0.0) {
      poimod = 1.0 + p.ced * oprimed - p.aed * tcal * Math.pow(oprimed, p.bed) - lcmod;
      if (poimod > 1.0) poimod = 1.0;
      if (poimod < 0.095) poimod = 0.095;
    }

    const obMultiplier = isShattered
      ? shatterObliquity(finalObliquity, tcal < THIN)
      : facehardObliquityMultiplier(finalObliquity);

    let AZ, BZ, CZ;
    if (backLayer > 90.0) { AZ = 0.0; BZ = 1.0; CZ = 79.0; }
    else if (backLayer > 75.0) { AZ = 6.65e-07; BZ = 5.35; CZ = 78.5; }
    else if (backLayer > 67.5) { AZ = 0.00037; BZ = 3.23; CZ = 77.8; }
    else if (backLayer > 62.0) { AZ = 0.003; BZ = 2.75; CZ = 77.7; }
    else if (backLayer > 52.0) { AZ = 0.03; BZ = 2.1; CZ = 77.0; }
    else if (backLayer > 30.0) { AZ = 1.0; BZ = 1.25; CZ = 67.0; }
    else { AZ = 10.57; BZ = 0.80625; CZ = 17.26; }

    const scaleFactor = AZ * Math.pow(shell.diameter, BZ) + CZ;
    const density = Math.pow(shell.weight / Math.pow(shell.diameter, 3.0), 0.2);
    const penConst = 1.9822e-06 * shell.diameter * scaleFactor * density;

    const baseTermNBL = (targetEffectiveThickness * obMultiplier) / (penConst * effectivePLIM * polmod);
    return Math.pow(baseTermNBL, VXP) * 1.0225;
  }

  function layerNBL(layer, shell) {
    return layer.kind === "homogeneous"
      ? calculateHomogeneousNBL(layer, shell)
      : calculateFaceHardenedNBL(layer, shell);
  }

  function effectiveThicknessOf(nbl, shell) {
    return (0.0004689 * Math.pow(shell.weight, 0.55) * Math.pow(nbl, 1.1)) / Math.pow(shell.diameter, 0.65);
  }

  function verdict(shell, finalNBL) {
    return shell.velocity >= finalNBL ? "RESULT: ARRAY DEFEATED (PENETRATION)" : "RESULT: ARRAY HELD (NO PENETRATION)";
  }

  function evaluateDeckArmor(layers, shell, out) {
    out.push("\n--- DECK ARMOR ARRAY EVALUATION ---");
    const nbls = [];
    layers.forEach((layer, i) => {
      const nbl = layerNBL(layer, shell);
      nbls.push(nbl);
      out.push(`Deck Layer ${i + 1} Effective Thickness: ${fmt2(effectiveThicknessOf(nbl, shell))} inches`);
    });
    const finalNBL = combineNBLs(nbls);
    out.push(`>> TOTAL DECK ARRAY EFFECTIVE THICKNESS: ${fmt2(effectiveThicknessOf(finalNBL, shell))} inches`);
    out.push(verdict(shell, finalNBL));
  }

  function evaluateSideArmor(outerHull, bulkheads, mainBelt, shell, out) {
    out.push("\n--- SIDE ARMOR ARRAY EVALUATION ---");
    const nbls = [];

    const hullNBL = layerNBL(outerHull, shell);
    nbls.push(hullNBL);
    out.push(`Outer Hull Effective Thickness: ${fmt2(effectiveThicknessOf(hullNBL, shell))} inches`);

    bulkheads.forEach((bulkhead, i) => {
      const nbl = layerNBL(bulkhead, shell);
      nbls.push(nbl);
      out.push(`Splinter Bulkhead ${i + 1} Effective Thickness: ${fmt2(effectiveThicknessOf(nbl, shell))} inches`);
    });

    const beltNBL = calculateFaceHardenedNBL(mainBelt, shell);
    nbls.push(beltNBL);
    out.push(`Main Belt Effective Thickness: ${fmt2(effectiveThicknessOf(beltNBL, shell))} inches`);

    const finalNBL = combineNBLs(nbls);
    out.push(`>> TOTAL SIDE ARRAY EFFECTIVE THICKNESS: ${fmt2(effectiveThicknessOf(finalNBL, shell))} inches`);
    out.push(verdict(shell, finalNBL));
  }

  // Returns the report as an array of lines.
  function runNavalBallisticLimitCalculator({ projectileID, rangeYards, deckArray, sideOuterHull, sideBulkheads, sideMainBelt }) {
    const p = ProjectileLibrary[projectileID];
    if (!p) return ["Projectile ID Not Found."];

    const { strikingVelocity, impactObliquity } = Ballistics.calculate(projectileID, rangeYards);
    const shellPenetration = effectiveThicknessOf(strikingVelocity, { weight: p.weight, diameter: p.diameter });

    const out = [
      "\n==========================================",
      "      NAVAL BALLISTICS & NBL REPORT         ",
      "==========================================",
      `Shell Used: ${p.name}`,
      `Target Range: ${rangeYards} yards`,
      `Striking Velocity: ${fmt2(strikingVelocity)} fps`,
      `Impact Obliquity (Angle of Fall): ${fmt2(impactObliquity)}°`,
      `Raw Armor Penetration: ${fmt2(shellPenetration)} inches`,
      "==========================================",
    ];

    const shell = {
      id: projectileID,
      diameter: p.diameter,
      weight: p.weight,
      velocity: strikingVelocity,
      obliquity: impactObliquity,
    };

    evaluateDeckArmor(deckArray, shell, out);
    evaluateSideArmor(sideOuterHull, sideBulkheads, sideMainBelt, shell, out);
    return out;
  }

  // ---------- Default scenario from the Swift sample ----------
  const homLayer = (plates, slopeType, slopeAngle) => ({ kind: "homogeneous", plates, slopeType, slopeAngle });

  const defaultScenario = () => ({
    projectileID: 4,
    rangeYards: 32000.0,
    deckArray: [
      homLayer([{ id: 4, thickness: 0.197 }], "deck", 90.0),
      homLayer([{ id: 4, thickness: 0.984 }], "deck", 90.0),
      homLayer([{ id: 23, thickness: 5.9 }, { id: 4, thickness: 0.59 }], "deck", 90.0),
      homLayer([{ id: 23, thickness: 1.57 }], "deck", 90.0),
    ],
    sideOuterHull: homLayer([{ id: 4, thickness: 0.394 }], "normal", 0.0),
    sideBulkheads: [
      homLayer([{ id: 23, thickness: 1.97 }], "normal", 38.0),
      homLayer([{ id: 4, thickness: 1.18 }], "normal", 0.0),
    ],
    sideMainBelt: {
      kind: "faceHardened", faceHardenedID: 24, thickness: 12.874, slopeType: "reverse", slopeAngle: 15.0,
      backingPlates: [{ id: 4, thickness: 0.71 }], woodThickness: 2.36, cementThickness: 0,
    },
  });

  const api = {
    FacehardLibrary, HomogeneousLibrary, ProjectileLibrary,
    BallisticsCalculator: Ballistics,
    runNavalBallisticLimitCalculator, defaultScenario,
  };

  if (typeof module !== "undefined" && module.exports) module.exports = api;
  else root.Facehard = api;
})(typeof globalThis !== "undefined" ? globalThis : this);
