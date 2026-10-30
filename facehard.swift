import Foundation

struct FacehardLibrary {
    let name: String
    let quality: Double
    let damageQuality: Double
    let backLayer: Double
    let softShatter: Int
    let cmpnd: Int
    let thkthn: Int
    let thnchl: Int
   
    static let library: [Int: FacehardLibrary] = [
        1: FacehardLibrary(name: "Gruson Chilled Cast Iron", quality: 0.617, damageQuality: 0.617, backLayer: 0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        2: FacehardLibrary(name: "Compound", quality: 0.575, damageQuality: 0.45, backLayer: 70.0, softShatter: 0, cmpnd: 1, thkthn: 0, thnchl: 0),
        3: FacehardLibrary(name: "Harvey Mild Steel", quality: 0.702, damageQuality: 0, backLayer: 0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        4: FacehardLibrary(name: "Harvey Nickel-Steel", quality: 0.724, damageQuality: 0, backLayer: 0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        5: FacehardLibrary(name: "1892 KC a/A", quality: 0.632, damageQuality: 0.632, backLayer: 65.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        6: FacehardLibrary(name: "1894 KC a/A", quality: 0.712, damageQuality: 0.712, backLayer: 65.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        7: FacehardLibrary(name: "1906 KC a/A", quality: 0.828, damageQuality: 0.828, backLayer: 65.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        8: FacehardLibrary(name: "1928 KC n/A", quality: 0.9, damageQuality: 0.9, backLayer: 59.0, softShatter: 0, cmpnd: 0, thkthn: 1, thnchl: 0),
        9: FacehardLibrary(name: "1935 KC n/A", quality: 0.96, damageQuality: 0.96, backLayer: 59.0, softShatter: 1, cmpnd: 0, thkthn: 1, thnchl: 0),
        10: FacehardLibrary(name: "British 1911 KC", quality: 0.85, damageQuality: 0.85, backLayer: 65.0, softShatter: 2, cmpnd: 0, thkthn: 2, thnchl: 0),
        11: FacehardLibrary(name: "British 1922 KC", quality: 0.9, damageQuality: 0.9, backLayer: 65.0, softShatter: 2, cmpnd: 0, thkthn: 2, thnchl: 0),
        12: FacehardLibrary(name: "CA", quality: 0.928, damageQuality: 0.928, backLayer: 70.0, softShatter: 1, cmpnd: 0, thkthn: 1, thnchl: 0),
        13: FacehardLibrary(name: "Terni KC", quality: 0.98, damageQuality: 0.98, backLayer: 0, softShatter: 1, cmpnd: 0, thkthn: 1, thnchl: 0),
        14: FacehardLibrary(name: "VH", quality: 0.839, damageQuality: 0.839, backLayer: 65.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        15: FacehardLibrary(name: "Witkowitz KC", quality: 0.947, damageQuality: 0.947, backLayer: 65.0, softShatter: 1, cmpnd: 0, thkthn: 1, thnchl: 0),
        16: FacehardLibrary(name: "BNC Class A", quality: 0.787, damageQuality: 0.787, backLayer: 18.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        17: FacehardLibrary(name: "MNC Class A", quality: 0.881, damageQuality: 0.881, backLayer: 18.0, softShatter: 1, cmpnd: 0, thkthn: 0, thnchl: 0),
        18: FacehardLibrary(name: "1906 'Crazy-Quilt' Class A", quality: 0, damageQuality: 0, backLayer: 0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        19: FacehardLibrary(name: "1911 Class A", quality: 0.889, damageQuality: 0.889, backLayer: 65.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        20: FacehardLibrary(name: "BTC Class A", quality: 0.889, damageQuality: 0.889, backLayer: 85.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 1),
        21: FacehardLibrary(name: "1935 Class A", quality: 1.0, damageQuality: 1.0, backLayer: 45.0, softShatter: 1, cmpnd: 0, thkthn: 1, thnchl: 0),
        22: FacehardLibrary(name: "1944 Class A", quality: 1.025, damageQuality: 1.025, backLayer: 45.0, softShatter: 1, cmpnd: 0, thkthn: 1, thnchl: 0),
        23: FacehardLibrary(name: "French 1912 KC", quality: 0.85, damageQuality: 0.85, backLayer: 65.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
        24: FacehardLibrary(name: "French 1932 KC", quality: 0.96, damageQuality: 0.96, backLayer: 65.0, softShatter: 1, cmpnd: 0, thkthn: 1, thnchl: 0),
        25: FacehardLibrary(name: "Average Worldwide 1898 KC", quality: 0.787, damageQuality: 0.787, backLayer: 65.0, softShatter: 0, cmpnd: 0, thkthn: 0, thnchl: 0),
    ]
}

struct HomogeneousLibrary {
    let name: String
    let quality: Double
    let qBack: Double?
    let percentEL: Double
   
    static let library: [Int: HomogeneousLibrary] = [
        1: HomogeneousLibrary(name: "Wrought Iron", quality: 0.55, qBack: nil, percentEL: 22.0),
        2: HomogeneousLibrary(name: "1876 Mild Steel", quality: 0.7, qBack: nil, percentEL: 16.0),
        3: HomogeneousLibrary(name: "1890 Mild Steel", quality: 0.75, qBack: 0.7, percentEL: 21.0),
        4: HomogeneousLibrary(name: "1918 Mild Steel", quality: 0.8, qBack: 0.8, percentEL: 25.0),
        5: HomogeneousLibrary(name: "1889 Nickel-Steel", quality: 0.76, qBack: 0.8, percentEL: 19.0),
        6: HomogeneousLibrary(name: "1900 Nickel-Steel", quality: 0.9, qBack: 0.8, percentEL: 19.0),
        7: HomogeneousLibrary(name: "Schiffbaustahl", quality: 0.75, qBack: nil, percentEL: 16.0),
        8: HomogeneousLibrary(name: "Schiffbaustahl I", quality: 0.75, qBack: nil, percentEL: 24.0),
        9: HomogeneousLibrary(name: "Schiffbaustahl II", quality: 0.78, qBack: nil, percentEL: 20.0),
        10: HomogeneousLibrary(name: "Schiffbaustahl III", quality: 0.8, qBack: nil, percentEL: 18.0),
        11: HomogeneousLibrary(name: "Low-% Nickel-Steel", quality: 0.8, qBack: 0.8, percentEL: 21.0),
        12: HomogeneousLibrary(name: "Bulkhead Low-% Nickel-Steel", quality: 0.85, qBack: nil, percentEL: 21.0),
        13: HomogeneousLibrary(name: "Ste. 42", quality: 0.78, qBack: nil, percentEL: 18.0),
        14: HomogeneousLibrary(name: "Ste. 52", quality: 0.8, qBack: 0.8, percentEL: 18.0),
        15: HomogeneousLibrary(name: "High-% Nickel-Steel", quality: 0.95, qBack: nil, percentEL: 20.0),
        16: HomogeneousLibrary(name: "Wh", quality: 1.0, qBack: nil, percentEL: 18.0),
        17: HomogeneousLibrary(name: "Ww", quality: 0.95, qBack: nil, percentEL: 22.0),
        18: HomogeneousLibrary(name: "Wsh", quality: 1.1, qBack: nil, percentEL: 16.0),
        19: HomogeneousLibrary(name: "German KNC", quality: 0.97, qBack: nil, percentEL: 20.0),
        20: HomogeneousLibrary(name: "1895 HTS", quality: 0.8, qBack: 0.8, percentEL: 22.0),
        21: HomogeneousLibrary(name: "1918 HTS", quality: 0.85, qBack: 0.9, percentEL: 22.0),
        22: HomogeneousLibrary(name: "Ducol", quality: 0.9, qBack: 0.9, percentEL: 22.0),
        23: HomogeneousLibrary(name: "KNC", quality: 0.95, qBack: nil, percentEL: 22.0),
        24: HomogeneousLibrary(name: "NCA", quality: 1.0, qBack: nil, percentEL: 25.0),
        25: HomogeneousLibrary(name: "POV", quality: 1.0, qBack: nil, percentEL: 17.1),
        26: HomogeneousLibrary(name: "AOD", quality: 1.0, qBack: nil, percentEL: 15.0),
        27: HomogeneousLibrary(name: "1910 STS", quality: 0.95, qBack: 1.0, percentEL: 25.0),
        28: HomogeneousLibrary(name: "1930 STS", quality: 1.0, qBack: 1.0, percentEL: 25.0),
        29: HomogeneousLibrary(name: "1910 Class B", quality: 0.95, qBack: nil, percentEL: 22.0),
        30: HomogeneousLibrary(name: "1933 Class B", quality: 1.0, qBack: nil, percentEL: 25.0),
        31: HomogeneousLibrary(name: "NVNC", quality: 0.95, qBack: nil, percentEL: 20.0),
        32: HomogeneousLibrary(name: "MNC", quality: 0.97, qBack: nil, percentEL: 23.0),
        33: HomogeneousLibrary(name: "CNC", quality: 0.95, qBack: nil, percentEL: 22.0)
    ]
}

struct ProjectileData {
    let name: String
    let diameter: Double        
    let weight: Double        
    let muzzleVelocity: Double
    let qualityLimit: Double
    let damageLimit: Double
    let apCap: Int
    let cardonald: Int
    let bend: Int
    let nsdamagl: Double
    let ltcase: Int
    let shatres: Int
    let braak: Int
    let ald: Double
    let bld: Double
    let cld: Double
    let aed: Double
    let bed: Double
    let ced: Double
    let critagl: Double
   
    static let usLibrary: [Int: ProjectileData] = [
        1: ProjectileData(name: "A/N Steel AP Shot/Shell", diameter: 14.0, weight: 1400.0, muzzleVelocity: 2600.0, qualityLimit: 0.7, damageLimit: 0.616, apCap: 0, cardonald: 0, bend: 0, nsdamagl: 15.0, ltcase: 1, shatres: 1, braak: 2, ald: 0.0004301, bld: 1.845, cld: 0.0027, aed: 0.03322, bed: 1.172, ced: 0.02222, critagl: 0.0),
        2: ProjectileData(name: "Midvale tough soft-capped APC", diameter: 14.0, weight: 1400.0, muzzleVelocity: 2600.0, qualityLimit: 0.7, damageLimit: 0.7, apCap: 1, cardonald: 0, bend: 2, nsdamagl: 15.0, ltcase: 0, shatres: 0, braak: 1, ald: 0.0, bld: 0.0, cld: 0.0, aed: -1.0, bed: -1.0, ced: -1.0, critagl: 5.0),
        3: ProjectileData(name: "Midvale unbreakable APC", diameter: 14.0, weight: 1400.0, muzzleVelocity: 2600.0, qualityLimit: 1.0, damageLimit: 1.0, apCap: 1, cardonald: 2, bend: 0, nsdamagl: 15.0, ltcase: 0, shatres: 0, braak: 0, ald: 0.0, bld: 0.0, cld: 0.0, aed: -1.0, bed: -1.0, ced: -1.0, critagl: 5.0),
        4: ProjectileData(name: "16-in Mk 8-1-5 APC", diameter: 16.0, weight: 2700.0, muzzleVelocity: 2300.0, qualityLimit: 0.9, damageLimit: 0.9, apCap: 2, cardonald: 0, bend: 0, nsdamagl: 20.0, ltcase: 0, shatres: 0, braak: 0, ald: 0.0, bld: 0.0, cld: 0.0, aed: -1.0, bed: -1.0, ced: -1.0, critagl: 20.0),
        5: ProjectileData(name: "16-in Mk 8-6-8 APC", diameter: 16.0, weight: 2700.0, muzzleVelocity: 2500.0, qualityLimit: 1.0, damageLimit: 1.0, apCap: 2, cardonald: 0, bend: 0, nsdamagl: 30.0, ltcase: 0, shatres: 0, braak: 0, ald: 0.0, bld: 0.0, cld: 0.0, aed: -1.0, bed: -1.0, ced: -1.0, critagl: 30.0),
        6: ProjectileData(name: "Type 91 APC", diameter: 18.11, weight: 3219.0, muzzleVelocity: 2559.0, qualityLimit: 0.945, damageLimit: 0.85, apCap: 2, cardonald: 0, bend: 0, nsdamagl: 15.0, ltcase: 0, shatres: 0, braak: 1, ald: 0.00336, bld: 1.418, cld: 0.0091701, aed: 0.00104, bed: 1.773, ced: 0.00823, critagl: 0.0),
        7: ProjectileData(name: "38cm Psgr. L/4,4", diameter: 14.96, weight: 1764.0, muzzleVelocity: 2690.0, qualityLimit: 0.988, damageLimit: 0.977, apCap: 2, cardonald: 0, bend: 0, nsdamagl: 25.0, ltcase: 0, shatres: 0, braak: 1, ald: 0.00006891, bld: 2.26, cld: 0.00333, aed: 0.0000971, bed: 2.283, ced: 0.0035, critagl: 0.0),
        8: ProjectileData(name: "28cm Psgr. L/3,2", diameter: 11.14, weight: 665.8, muzzleVelocity: 2890.0, qualityLimit: 0.877, damageLimit: 0.754, apCap: 3, cardonald: 0, bend: 0, nsdamagl: 15.0, ltcase: 0, shatres: 1, braak: 0, ald: 0.00006, bld: 2.249, cld: 0.00267, aed: 0.000247, bed: 2.129, ced: 0.00172, critagl: 0.0),
        9: ProjectileData(name: "12-in Mk 15 APC", diameter: 12.0, weight: 870.0, muzzleVelocity: 2900.0, qualityLimit: 0.89, damageLimit: -1.0, apCap: 1, cardonald: 0, bend: 0, nsdamagl: 15.0, ltcase: 0, shatres: 0, braak: 1, ald: 0.0, bld: 0.0, cld: 0.0, aed: -1.0, bed: -1.0, ced: -1.0, critagl: 5.0),
    ]
}

enum SlopeType {
    case normal
    case reverse
    case deck
}

struct ShellState {
    let id: Int
    let diameter: Double
    let weight: Double
    let velocity: Double
    let obliquity: Double
}

struct HomogeneousPlate {
    let id: Int
    let thickness: Double
}

struct LayerConfig {
    let plates: [HomogeneousPlate]
    let slopeType: SlopeType
    let slopeAngle: Double
}

struct MainBeltConfig {
    let faceHardenedID: Int
    let thickness: Double
    let slopeType: SlopeType
    let slopeAngle: Double
    let backingPlates: [HomogeneousPlate]
    let woodThickness: Double
    let cementThickness: Double
}

enum ArmorLayer {
    case homogeneous(LayerConfig)
    case faceHardened(MainBeltConfig)
}

class BallisticsCalculator {
   
    static func atmosphereDensityUSN(_ altitudeMeters: Double) -> Double {
        return 1.225 * exp(-0.00010361 * altitudeMeters)
    }
   
    static func jurensGravity(_ altitudeMeters: Double) -> Double {
        return 9.80665 * (1.0 - 0.000000314 * altitudeMeters)
    }
   
    static func speedOfSound(_ altitudeMeters: Double) -> Double {
        let tempK = max(288.15 - 0.0065 * altitudeMeters, 216.65)
        return 20.05 * sqrt(tempK)
    }
   
    static func g8DragCoefficient(mach: Double) -> Double {
        if mach < 0.8 { return 0.15 }
        else if mach < 1.0 { return 0.15 + (mach - 0.8) * 0.8 }
        else if mach < 1.2 { return 0.31 + (mach - 1.0) * 0.2 }
        else if mach < 2.0 { return 0.35 - (mach - 1.2) * 0.05 }
        else { return max(0.31 - (mach - 2.0) * 0.02, 0.15) }
    }
   
    static func calculate(projectileID: Int, targetRangeYards: Double) -> (strikingVelocity: Double, impactObliquity: Double) {
        guard let proj = ProjectileData.usLibrary[projectileID] else { return (0, 0) }
       
        let targetRangeMeters = targetRangeYards * 0.9144
       
        let d_m = proj.diameter * 0.0254
        let area = Double.pi * pow(d_m / 2.0, 2.0)
        let w_kg = proj.weight * 0.453592
        let v0_ms = proj.muzzleVelocity * 0.3048
       
        let formFactor = (proj.weight / pow(proj.diameter, 3.0)) * 1.517
       
        var bestRangeMeters = 0.0
        var strikingVel_ms = v0_ms
        var strikingAngle = 0.0
       
        var angleMin = 0.0
        var angleMax = 45.0
        var currentAngle = 0.0
       
        for _ in 0..<30 {
            currentAngle = (angleMin + angleMax) / 2.0
            var vx = v0_ms * cos(currentAngle * .pi / 180.0)
            var vy = v0_ms * sin(currentAngle * .pi / 180.0)
            var x = 0.0
            var y = 0.0
            let dt = 0.05
           
            while y >= 0.0 {
                let v = sqrt(vx*vx + vy*vy)
                let mach = v / speedOfSound(y)
                let cd = g8DragCoefficient(mach: mach)
                let rho = atmosphereDensityUSN(y)
               
                let drag = 0.5 * rho * v * v * cd * area * formFactor
                let ax = -(drag * (vx / v)) / w_kg
                let ay = -jurensGravity(y) - (drag * (vy / v)) / w_kg
               
                vx += ax * dt
                vy += ay * dt
                x += vx * dt
                y += vy * dt
               
                if y < 0 {
                    bestRangeMeters = x
                    strikingVel_ms = v
                    strikingAngle = atan2(-vy, vx) * 180.0 / .pi
                    break
                }
            }
           
            if bestRangeMeters < targetRangeMeters {
                angleMin = currentAngle
            } else {
                angleMax = currentAngle
            }
        }
       
        return (strikingVelocity: strikingVel_ms / 0.3048, impactObliquity: strikingAngle)
    }
}

class ArmorArrayCalculator {
    let exp: Double = 1.4
    let invExp: Double = 1.0 / 1.4
    let VXP: Double = 1.0 / 1.21
   
    private func calculateLaminatedThickness(plates: [HomogeneousPlate]) -> (thickness: Double, percentEL: Double) {
        guard !plates.isEmpty else { return (0.0, 0.0) }
        var tSum = 0.0
        var teSum = 0.0
        let baseEL = HomogeneousLibrary.library[plates[0].id]?.percentEL ?? 20.0
       
        for plate in plates {
            if let armor = HomogeneousLibrary.library[plate.id] {
                let te = plate.thickness * armor.quality
                tSum += te
                teSum += pow(te, exp)
            }
        }
        let spaced = pow(teSum, invExp)
        let tLam = (tSum + spaced) / 2.0
        return (tLam, baseEL)
    }
   
    private func combineNBLs(_ nbls: [Double]) -> Double {
        let validNBLs = nbls.filter { $0 > 0 }
        guard !validNBLs.isEmpty else { return 0.0 }
        let sum = validNBLs.map { pow($0, exp) }.reduce(0, +)
        return pow(sum, invExp)
    }

    private func calculateFinalObliquity(shellObliquity: Double, slopeType: SlopeType, plateSlope: Double) -> Double {
        switch slopeType {
        case .deck:
            return abs(90.0 - shellObliquity)
        case .reverse:
            return plateSlope + shellObliquity
        case .normal:
            return abs(plateSlope - shellObliquity)
        }
    }
   
    private func calculateHomogeneousNBL(layer: LayerConfig, shell: ShellState) -> Double {
        let (effectiveThickness, percentEL) = calculateLaminatedThickness(plates: layer.plates)
        if effectiveThickness <= 0 { return 0.0 }
       
        let finalObliquity = calculateFinalObliquity(shellObliquity: shell.obliquity, slopeType: layer.slopeType, plateSlope: layer.slopeAngle)
        let tSlashD = effectiveThickness / shell.diameter
        let projDensity = shell.weight / pow(shell.diameter, 3.0)
        let logTmp = shell.diameter / 3.0
        let scaleFactor = sqrt(1.0 - 0.04 * log(logTmp))
        let coeffs = getCoefficients(tSlashD: tSlashD)
       
        var jsin = 0.0
        if coeffs.ja != 0.0 {
            let jdeg = coeffs.jb * tSlashD - coeffs.jc
            let jrad = jdeg * .pi / 180.0
            jsin = sin(jrad)
            if jsin < 0 { jsin = 0 }
        }
        let J = 1.0 + coeffs.ja * jsin
        let mObliquity = calculateHomogeneousObliquityMultiplier(ob: finalObliquity, tSlashD: tSlashD)

        let qaTsD = 1.0 * tSlashD
        var navyBL = coeffs.nc * J * mObliquity * scaleFactor * pow(qaTsD, coeffs.tExp) / sqrt(projDensity)
       
        if percentEL < 25.0 && shell.diameter > 8.0 {
           let peEffect = (1.0 - sqrt(percentEL / 25.0)) * (shell.diameter - 8.0) / 8.0
            navyBL = navyBL * (1.0 - peEffect)
        }
        return navyBL
    }
   
    private func getHarveyQMod(armorID: Int, thickness: Double) -> Double {
        let tharveyMax = min(thickness, 20.0)
        let qVelHThick = -0.027917 * tharveyMax + 1.2525
       
        let qVelHMult: Double
        if thickness < 8.0 {
            qVelHMult = (-0.035 * tharveyMax + 1.28) * qVelHThick
        } else {
            qVelHMult = qVelHThick
        }
        let qBase = (armorID == 3) ? 0.702 : 0.724
        return qBase * 0.982 * pow(qVelHMult, 1.0 / 1.21)
    }
   
    private func getFaceCalcBackLayer(armorID: Int, thickness: Double) -> Double {
        var ubCalc: Double = 45.0
        switch armorID {
        case 1:
            if thickness <= 15.75 { ubCalc = 45.0 }
            else if thickness >= 33.07 { ubCalc = 67.0 }
            else { ubCalc = 45.0 + 22.0 * (thickness - 15.75) / 17.32 }
        case 3, 4:
            ubCalc = 100.0 * (1.0 - (1.25 / thickness))
        case 13:
            if thickness < 6.2205 { ubCalc = 50.0 }
            else if thickness > 10.433 { ubCalc = 70.0 }
            else {
                let face = 3.1102 + (0.004682 * (thickness - 6.2205))
                ubCalc = 100.0 * (1.0 - (face / thickness))
            }
        default:
            return 45.0
        }
        return floor(ubCalc)
    }
   
    private func calculateFaceHardenedNBL(belt beltConfig: MainBeltConfig, shell: ShellState) -> Double {
        var belt = beltConfig
        if belt.faceHardenedID == 18 {
            let roll = Int.random(in: 1...3)
            let newID = roll == 1 ? 16 : (roll == 2 ? 17 : 25)
            belt = MainBeltConfig(
                faceHardenedID: newID, thickness: belt.thickness, slopeType: belt.slopeType, slopeAngle: belt.slopeAngle,
                backingPlates: belt.backingPlates, woodThickness: belt.woodThickness, cementThickness: belt.cementThickness
            )
        }
       
        guard let fhArmor = FacehardLibrary.library[belt.faceHardenedID],
              let proj = ProjectileData.usLibrary[shell.id] else { return 0.0 }
             
        let finalObliquity = calculateFinalObliquity(shellObliquity: shell.obliquity, slopeType: belt.slopeType, plateSlope: belt.slopeAngle)
        let tSlashD = belt.thickness / shell.diameter

        var backingT_Sum = 0.0
        var backingT_SpacedSum = 0.0
        for bPlate in belt.backingPlates {
            if let hArmor = HomogeneousLibrary.library[bPlate.id] {
                let qBack = hArmor.qBack ?? 1.0
                let teN = qBack * bPlate.thickness
                backingT_Sum += teN
                backingT_SpacedSum += pow(teN, 1.4)
            }
        }
       
        var tLam = backingT_Sum
        if belt.backingPlates.count > 1 {
            let tSpaced = pow(backingT_SpacedSum, 0.71429)
            tLam = (backingT_Sum + tSpaced) / 2.0
        }
       
        var modifiedArmorQuality = fhArmor.quality
        var modifiedArmorQualityDamage = fhArmor.damageQuality
        var currentBackLayer = fhArmor.backLayer
        var currentThnchlFlag = fhArmor.thnchl
       
        if belt.faceHardenedID == 3 || belt.faceHardenedID == 4 {
            modifiedArmorQuality = getHarveyQMod(armorID: belt.faceHardenedID, thickness: belt.thickness)
            modifiedArmorQualityDamage = 0.864 * modifiedArmorQuality
        }
       
        if [1, 3, 4, 13].contains(belt.faceHardenedID) {
            currentBackLayer = getFaceCalcBackLayer(armorID: belt.faceHardenedID, thickness: belt.thickness)
            if (belt.faceHardenedID == 3 || belt.faceHardenedID == 4) {
                currentThnchlFlag = currentBackLayer > 75.0 ? 1 : 0
            }
        }
        if fhArmor.thkthn == 1 {
            if tSlashD < 0.70 {
                let diff = 0.70 - tSlashD
                modifiedArmorQuality *= (1.0 - 0.23077 * pow(diff, 1.5))
            }
        } else if fhArmor.thkthn == 2 {
            if tSlashD < 0.5833 {
                let diff = 0.5833 - tSlashD
                modifiedArmorQuality *= (1.0 - 0.25 * diff)
            }
        }
       
        if fhArmor.cmpnd == 1 {
            if tSlashD > 0.5 { modifiedArmorQuality *= (1.0 - 0.1 * (tSlashD - 0.5)) }
        }
        if currentThnchlFlag == 1 {
            if tSlashD > 1.0 { modifiedArmorQuality *= (1.0 - 0.05 * (tSlashD - 1.0)) }
        }
       
        let targetEffectiveThickness = (belt.thickness * modifiedArmorQuality) + (belt.woodThickness / 100.0) + (belt.cementThickness / 25.0) + (tLam / 2.0)
        let tcal = (belt.thickness * modifiedArmorQualityDamage) / shell.diameter
        let THIN: Double = (fhArmor.thkthn == 1) ? 0.35 : ((fhArmor.thkthn == 2) ? 0.45 : 0.55)
       
        var pplus = 0.0
        if fhArmor.cmpnd == 1 {
            if proj.shatres == 2 { pplus = 0.0 }
            else if proj.braak == 2 || proj.bend == 2 { pplus = 0.1 }
            else { pplus = 0.2 }
        } else if currentThnchlFlag == 1 {
            if proj.shatres == 2 || proj.braak == 2 || proj.bend == 2 { pplus = 0.0 }
            else { pplus = 0.1 }
        }
       
        var effectivePLIM = proj.qualityLimit
        if effectivePLIM < 1.0 { effectivePLIM = min(effectivePLIM + pplus, 1.0) }
        var effectivePDAM = proj.damageLimit
        if effectivePDAM > 0.0 && effectivePDAM < 1.0 { effectivePDAM = min(effectivePDAM + pplus, 1.0) }

        var isShattered = false
        var shatMult = 1.0
       
        if proj.apCap == 0 || proj.shatres == 2 {
            isShattered = true
        } else if proj.braak == 2 && (belt.faceHardenedID == 3 || belt.faceHardenedID == 4) {
            isShattered = true
        } else if proj.apCap == 1 {
            if fhArmor.softShatter == 1 { isShattered = true }
            else if fhArmor.softShatter == 2 && finalObliquity > 20.0 { isShattered = true }
            else if fhArmor.softShatter == 0 && finalObliquity > 20.0 { isShattered = true }
        } else if proj.apCap == 2 {
            isShattered = false
        } else if proj.apCap == 3 {
            if fhArmor.softShatter == 1 && tSlashD >= 0.67 && finalObliquity > 30.0 { isShattered = true }
        }
        if fhArmor.softShatter == 2 && proj.cardonald == 2 && finalObliquity <= 15.0 { isShattered = false }
       
        if isShattered {
            if fhArmor.softShatter == 1 && proj.apCap < 3 { shatMult = 1.4 }
            else if fhArmor.softShatter == 2 && proj.apCap == 1 { shatMult = 1.35 }
            else { shatMult = 1.3 }
           
            if belt.faceHardenedID == 3 || belt.faceHardenedID == 4 {
                shatMult = belt.thickness >= 8.0 ? 1.0 : 1.25 - (0.03125 * belt.thickness)
            }
            if (effectivePLIM / shatMult) < 0.607 { shatMult = effectivePLIM / 0.607 }
            if shatMult < 1.0 { shatMult = 1.0 }
        }
       
        effectivePLIM = isShattered ? (effectivePLIM / shatMult) : effectivePLIM
        effectivePDAM = isShattered ? (effectivePDAM / shatMult) : effectivePDAM

        var ndap = proj.nsdamagl
        if fhArmor.cmpnd == 1 { ndap += 10.0 }
        else if belt.faceHardenedID == 3 || belt.faceHardenedID == 4 {
            if belt.thickness >= 8.0 { ndap += 10.0 }
            else if currentThnchlFlag == 1 { ndap += 5.0 + 5.0 * ((belt.thickness - 5.0) / 3.0) }
        } else if currentThnchlFlag == 1 { ndap += 5.0 }
       
        if fhArmor.softShatter == 1 { ndap -= 10.0 }
        else if fhArmor.softShatter == 2 { ndap -= 5.0 }
        if ndap < 5.0 && proj.nsdamagl > 0.0 { ndap = 5.0 }
        if ndap < 0.0 { ndap = 0.0 }
       
        var lcDam = 0.0
        if proj.ltcase == 2 && tcal > 0.67 { lcDam = 0.5 }
        let lcmod = lcDam * (tcal - 0.67)
       
        var oprimel = finalObliquity
        var oprimed = finalObliquity
        if finalObliquity > 60.0 { oprimel = 60.0; oprimed = 60.0 }
       
        var obcrit = -1.0
        if proj.bend == 1 {
            obcrit = abs(proj.critagl)
            if fhArmor.cmpnd == 1 { obcrit += 12.0 }
            else if currentThnchlFlag == 0 { obcrit += 6.0 }
        }

        var polmod = 1.0 + (proj.cld * oprimel) - (proj.ald * tcal * pow(oprimel, proj.bld)) - lcmod
        if polmod > 1.0 { polmod = 1.0 }
        if polmod < 0.1 { polmod = 0.1 }
       
        var poimod = polmod
        if proj.aed >= 0.0 {
            poimod = 1.0 + (proj.ced * oprimed) - (proj.aed * tcal * pow(oprimed, proj.bed)) - lcmod
            if poimod > 1.0 { poimod = 1.0 }
            if poimod < 0.095 { poimod = 0.095 }
        }
   
        let obMultiplier = isShattered ? calculateShatterObliquity(ob: finalObliquity, isThin: (tcal < THIN)) : calculateFacehardObliquityMultiplier(ob: finalObliquity)
       
        var AZ = 0.003; var BZ = 2.75; var CZ = 77.7
        if currentBackLayer > 90.0 { AZ = 0.0; BZ = 1.0; CZ = 79.0 }
        else if currentBackLayer > 75.0 { AZ = 6.65e-07; BZ = 5.35; CZ = 78.5 }
        else if currentBackLayer > 67.5 { AZ = 0.00037; BZ = 3.23; CZ = 77.8 }
        else if currentBackLayer > 62.0 { AZ = 0.003; BZ = 2.75; CZ = 77.7 }
        else if currentBackLayer > 52.0 { AZ = 0.03; BZ = 2.1; CZ = 77.0 }
        else if currentBackLayer > 30.0 { AZ = 1.0; BZ = 1.25; CZ = 67.0 }
        else { AZ = 10.57; BZ = 0.80625; CZ = 17.26 }
       
        let scaleFactor = (AZ * pow(shell.diameter, BZ)) + CZ
        let density = pow(shell.weight / pow(shell.diameter, 3.0), 0.2)
        let penConst = 1.9822e-06 * shell.diameter * scaleFactor * density
       
        let baseTermNBL = (targetEffectiveThickness * obMultiplier) / (penConst * effectivePLIM * polmod)
        let navyBallisticLimit = pow(baseTermNBL, VXP) * 1.0225
       
        let targetEffectiveDamageThickness = belt.thickness * modifiedArmorQualityDamage
        let baseTermEBL = (targetEffectiveDamageThickness * obMultiplier) / (penConst * effectivePDAM * poimod)
        var effectiveBallisticLimit = pow(baseTermEBL, VXP)
        if effectiveBallisticLimit < navyBallisticLimit { effectiveBallisticLimit = navyBallisticLimit }
        return navyBallisticLimit
    }
   
    func evaluateDeckArmor(layers: [ArmorLayer], shell: ShellState) {
        print("\n--- DECK ARMOR ARRAY EVALUATION ---")
        var layerNBLs: [Double] = []
        for (i, layer) in layers.enumerated() {
            let nbl: Double
            switch layer {
            case .homogeneous(let config):
                nbl = calculateHomogeneousNBL(layer: config, shell: shell)
            case .faceHardened(let config):
                nbl = calculateFaceHardenedNBL(belt: config, shell: shell)
            }
            layerNBLs.append(nbl)
           
            let effThick = (0.0004689 * pow(shell.weight, 0.55) * pow(nbl, 1.1)) / pow(shell.diameter, 0.65)
            print("Deck Layer \(i+1) Effective Thickness: \(String(format: "%.2f", effThick)) inches")
        }
       
        let finalNBL = combineNBLs(layerNBLs)
        let finalEffThick = (0.0004689 * pow(shell.weight, 0.55) * pow(finalNBL, 1.1)) / pow(shell.diameter, 0.65)
        print(">> TOTAL DECK ARRAY EFFECTIVE THICKNESS: \(String(format: "%.2f", finalEffThick)) inches")
        print(shell.velocity >= finalNBL ? "RESULT: ARRAY DEFEATED (PENETRATION)" : "RESULT: ARRAY HELD (NO PENETRATION)")
    }
   
    func evaluateSideArmor(outerHull: ArmorLayer, bulkheads: [ArmorLayer], mainBelt: MainBeltConfig, shell: ShellState) {
        print("\n--- SIDE ARMOR ARRAY EVALUATION ---")
        var layerNBLs: [Double] = []
       
        let hullNBL: Double
        switch outerHull {
        case .homogeneous(let config):
            hullNBL = calculateHomogeneousNBL(layer: config, shell: shell)
        case .faceHardened(let config):
            hullNBL = calculateFaceHardenedNBL(belt: config, shell: shell)
        }
        layerNBLs.append(hullNBL)
        let hullEffThick = (0.0004689 * pow(shell.weight, 0.55) * pow(hullNBL, 1.1)) / pow(shell.diameter, 0.65)
        print("Outer Hull Effective Thickness: \(String(format: "%.2f", hullEffThick)) inches")
       
        for (i, bulkhead) in bulkheads.enumerated() {
            let nbl: Double
            switch bulkhead {
            case .homogeneous(let config):
                nbl = calculateHomogeneousNBL(layer: config, shell: shell)
            case .faceHardened(let config):
                nbl = calculateFaceHardenedNBL(belt: config, shell: shell)
            }
            layerNBLs.append(nbl)
            let blkEffThick = (0.0004689 * pow(shell.weight, 0.55) * pow(nbl, 1.1)) / pow(shell.diameter, 0.65)
            print("Splinter Bulkhead \(i+1) Effective Thickness: \(String(format: "%.2f", blkEffThick)) inches")
        }
       
        let beltNBL = calculateFaceHardenedNBL(belt: mainBelt, shell: shell)
        layerNBLs.append(beltNBL)
        let beltEffThick = (0.0004689 * pow(shell.weight, 0.55) * pow(beltNBL, 1.1)) / pow(shell.diameter, 0.65)
        print("Main Belt Effective Thickness: \(String(format: "%.2f", beltEffThick)) inches")
       
        let finalNBL = combineNBLs(layerNBLs)
        let finalEffThick = (0.0004689 * pow(shell.weight, 0.55) * pow(finalNBL, 1.1)) / pow(shell.diameter, 0.65)
        print(">> TOTAL SIDE ARRAY EFFECTIVE THICKNESS: \(String(format: "%.2f", finalEffThick)) inches")
        print(shell.velocity >= finalNBL ? "RESULT: ARRAY DEFEATED (PENETRATION)" : "RESULT: ARRAY HELD (NO PENETRATION)")
    }

    private func getCoefficients(tSlashD: Double) -> (nc: Double, tExp: Double, ja: Double, jb: Double, jc: Double) {
        if tSlashD <= 0.01156 { return (335.25392, 0.4336513, 0.0, 0.0, 0.0) }
        if tSlashD <= 0.05 { return (516.85756, 0.5306597, -0.02, 4682.6223, 54.131113) }
        if tSlashD <= 0.075 { return (902.41425, 0.7166931, -0.01, 7200.0, 360.0) }
        if tSlashD <= 0.1 { return (1290.90181, 0.8549115, 0.0, 0.0, 0.0) }
        if tSlashD <= 0.2549 { return (1687.6956, 0.9713125, 0.0, 0.0, 0.0) }
        if tSlashD <= 0.47931 { return (1361.41055, 0.8141355, 0.02, 802.10329, 204.45613) }
        if tSlashD <= 1.0 { return (1179.94178, 0.619609, 0.0, 0.0, 0.0) }
        if tSlashD <= 2.0 { return (1179.94178, 0.6387357, 0.0, 0.0, 0.0) }
        if tSlashD <= 3.0 { return (1173.77728, 0.6462927, 0.0, 0.0, 0.0) }
        if tSlashD <= 4.0 { return (1201.73299, 0.6248678, 0.0, 0.0, 0.0) }
        return (1227.31234, 0.609576, 0.0, 0.0, 0.0)
    }
   
    private func calculateHomogeneousObliquityMultiplier(ob: Double, tSlashD: Double) -> Double {
        if ob <= 45.0 {
            let mpltbite = [1.0, 0.999, 0.998, 0.995, 0.991, 0.986, 0.981, 0.974, 0.966, 0.958, 0.948, 0.937, 0.925, 0.912, 0.901, 0.889, 0.881, 0.879, 0.885]
            let i1Tmp = ob / 2.5
            let i1 = Int(i1Tmp)
            let i2 = (ob - 2.5 * Double(i1)) / 2.5
            let mPrime = mpltbite[i1] + i2 * (mpltbite[i1 + 1] - mpltbite[i1])
            return mPrime / cos(ob * .pi / 180.0)
        } else {
            let mpTable: [[Double]] = [
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
                [1.153, 1.071, 0.933, 0.858, 0.826, 0.82, 0.837, 0.853, 0.881, 0.908, 0.933, 0.961, 0.982, 1.007, 1.025, 1.039, 1.049, 1.055, 1.06]
            ]
            var obClamp = ob
            if obClamp > 80.0 { obClamp = 79.9999 }
           
            let c1Tmp = (obClamp - 45.0) / 2.5
            let c1 = Int(c1Tmp)
            let c2 = ((obClamp - 45.0) - 2.5 * Double(c1)) / 2.5
           
            var tSlashDPR = tSlashD
            if tSlashDPR > 0.899 { tSlashDPR = 0.899 }
           
            let t1Tmp = tSlashDPR / 0.05
            let t1 = Int(t1Tmp)
            let t2 = (tSlashDPR - 0.05 * Double(t1)) / 0.05
           
            let mpth0_0 = mpTable[c1][t1]
            let mpth1_0 = mpTable[c1][t1 + 1]
            let mp0 = mpth0_0 + t2 * (mpth1_0 - mpth0_0)
           
            let mpth0_1 = mpTable[c1 + 1][t1]
            let mpth1_1 = mpTable[c1 + 1][t1 + 1]
            let mp1 = mpth0_1 + t2 * (mpth1_1 - mpth0_1)
           
            let mPrime = mp0 + c2 * (mp1 - mp0)
            return mPrime / cos(obClamp * .pi / 180.0)
        }
    }
 
    private func calculateFacehardObliquityMultiplier(ob: Double) -> Double {
        if ob > 70.0 { return 100.0 }
        if ob == 70.0 { return 8.0 }
        let mTable: [Double] = [
            1.0, 1.045, 1.09, 1.135, 1.18, 1.235, 1.31, 1.4, 1.53, 1.695,
            1.9, 2.3, 3.2, 4.9, 8.0, 15.0
        ]
        let int1 = Int(ob / 5.0)
        let int2 = (ob - Double(int1) * 5.0) / 5.0
        let point5 = (int1 > 11) ? 0.0 : 0.5
       
        let m1 = mTable[int1]
        let m2 = (int1 + 1) < mTable.count ? mTable[int1 + 1] : mTable[mTable.count - 1]
        let m3 = (int1 + 2) < mTable.count ? mTable[int1 + 2] : mTable[mTable.count - 1]
        return m1 + (int2 * (m2 - m1)) + (point5 * int2 * (int2 - 1.0) * (m3 - (2.0 * m2) + m1))
    }
   
    private func calculateShatterObliquity(ob: Double, isThin: Bool) -> Double {
        if isThin {
            if ob > 80.0 { return 1.51 }
            let msTable: [Double] = [
                1.0, 1.002, 1.0078, 1.0176, 1.0314, 1.0495, 1.0722, 1.0994,
                1.1317, 1.1672, 1.2018, 1.2377, 1.2782, 1.3236, 1.3715, 1.429, 1.51, 1.6036
            ]
            let int1 = Int(ob / 5.0)
            let int2 = (ob - Double(int1) * 5.0) / 5.0
           
            let m1 = (int1 < msTable.count) ? msTable[int1] : msTable.last!
            let m2 = (int1 + 1) < msTable.count ? msTable[int1 + 1] : msTable.last!
            let m3 = (int1 + 2) < msTable.count ? msTable[int1 + 2] : msTable.last!
            return m1 + (int2 * (m2 - m1)) + (0.5 * int2 * (int2 - 1.0) * (m3 - (2.0 * m2) + m1))
        } else {
            if ob > 75.0 { return 100.0 }
            let obRad = ob * .pi / 180.0
            return 1.0 / cos(1.061 * obRad)
        }
    }
}

func runNavalBallisticLimitCalculator(projectileID: Int, rangeYards: Double, deckArray: [ArmorLayer], sideOuterHull: ArmorLayer, sideBulkheads: [ArmorLayer], sideMainBelt: MainBeltConfig) {
    guard let proj = ProjectileData.usLibrary[projectileID] else {
        print("Projectile ID Not Found.")
        return
    }
    let (strikingVel, impactObq) = BallisticsCalculator.calculate(projectileID: projectileID, targetRangeYards: rangeYards)
   
    let shellPenetration = (0.0004689 * pow(proj.weight, 0.55) * pow(strikingVel, 1.1)) / pow(proj.diameter, 0.65)
   
    print("\n==========================================")
    print("      NAVAL BALLISTICS & NBL REPORT         ")
    print("==========================================")
    print("Shell Used: \(proj.name)")
    print("Target Range: \(rangeYards) yards")
    print("Striking Velocity: \(String(format: "%.2f", strikingVel)) fps")
    print("Impact Obliquity (Angle of Fall): \(String(format: "%.2f", impactObq))°")
    print("Raw Armor Penetration: \(String(format: "%.2f", shellPenetration)) inches")
    print("==========================================")
   
    let attackingShell = ShellState(
        id: projectileID,          
        diameter: proj.diameter,
        weight: proj.weight,
        velocity: strikingVel,
        obliquity: impactObq
    )
   
    let calculator = ArmorArrayCalculator()
    calculator.evaluateDeckArmor(layers: deckArray, shell: attackingShell)
    calculator.evaluateSideArmor(outerHull: sideOuterHull, bulkheads: sideBulkheads, mainBelt: sideMainBelt, shell: attackingShell)
}

let targetRangeYards = 32000.0
let targetProjectileID = 4

let deckArray: [ArmorLayer] = [
    .homogeneous(LayerConfig(plates: [HomogeneousPlate(id: 4, thickness: 0.197)], slopeType: .deck, slopeAngle: 90.0)),
    .homogeneous(LayerConfig(plates: [HomogeneousPlate(id: 4, thickness: 0.984)], slopeType: .deck, slopeAngle: 90.0)),
    .homogeneous(LayerConfig(plates: [HomogeneousPlate(id: 23, thickness: 5.9), HomogeneousPlate(id: 4, thickness: 0.59)], slopeType: .deck, slopeAngle: 90.0)),
    .homogeneous(LayerConfig(plates: [HomogeneousPlate(id: 23, thickness: 1.57)], slopeType: .deck, slopeAngle: 90.0))
]


let outerHull: ArmorLayer = .homogeneous(LayerConfig(plates: [HomogeneousPlate(id: 4, thickness: 0.394)], slopeType: .normal, slopeAngle: 0.0))
let bulkheads: [ArmorLayer] = [
    .homogeneous(LayerConfig(plates: [HomogeneousPlate(id: 23, thickness: 1.97)], slopeType: .normal, slopeAngle: 38.0)),
    .homogeneous(LayerConfig(plates: [HomogeneousPlate(id: 4, thickness: 1.18)], slopeType: .normal, slopeAngle: 0.0))
]
let mainBelt = MainBeltConfig(
    faceHardenedID: 24, thickness: 12.874, slopeType: .reverse, slopeAngle: 15.0,
    backingPlates: [HomogeneousPlate(id: 4, thickness: 0.71)], woodThickness: 2.36, cementThickness: 0
)



runNavalBallisticLimitCalculator(projectileID: targetProjectileID, rangeYards: targetRangeYards, deckArray: deckArray, sideOuterHull: outerHull, sideBulkheads: bulkheads, sideMainBelt: mainBelt)

