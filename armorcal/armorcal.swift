

/* useful info:(aka incoherent ramblings that may or may not help to understand this code)
This is a swift calculator that I spent wayy too much time of my life on, that is used to calculate 
the effectiveness of steel tank armor from the interwar period up to the mid 70s, against various 
types of AT shells from those times.
1. Insert this code into any ide that can run swift(preferably Programiz as that is where I made 
all of this)
2. Setting up the armor arrangement: Armor can be arranged in one of four ways; either in just a 
single steel plate, a laminated array(two individual plates bolted or welded together), a triple 
laminated array(same as the previous one, just with three plates instead of two), and a spaced 
array(two or more plates spaced apart).
3. Setting up the target plate: For each armor plate present in the calculation, Insert the type of 
the armor, either rha(rolled homogeneous armor, cha(cast homogeneous armor, or fha(face 
hardened armor), the thickness in mm, the hardness in BHN(should be set to 0 if the type is 
fha), the vertical and lateral impact angles of the shot, and then the armor's flaw rating(noFlaws, 
small, medium, or large) and the "edge", which represents the free edge effect(basically a 
modifier that models the reduced effectiveness of an armor plate if the shot impacts near any 
structural weak points, such as holes, weld lines, or the edge of the plate itself). This is also on 
a none -> large spectrum. 
4. Setting up the attacking shell: The shell that is being tested should have two constant 
variables, and then depending on shell type, some optionals as well. The constant variables that 
every shell type has are its type, either AP, APBC, APC, APCBC, APCR, or APDS, and its 
diameter in mm. If testing an APC or APCBC shell, you must insert its cap type, either type 1 or 
2, and if testing a APCR or APDS round, the diameter of the shell's tungsten core must be 
inserted, as that is what will be doing the actual penetration with these types of shells. 
Additionally, with APDS shells, you must insert the generation of the APDS shell that is being 
tested(gen1, gen2, or gen3), as this determines the effect that sloped armor will have on the 
shell
listed below the actual body of code is a vast amount of tests based off of the specs of tanks 
from the 30s to the 70s, all tested against 75mm APCBC, as almost every single major 
participant of ww2 had at least one version of this shell type(not the best testing constant, as 
many of these tanks' armor arrays are either heavily overmatched by 75mm apcbc, or heavily 
overmatch it, but it is a good enough constant to test against). These should give a good look at 
how to input data into the calculator, and how the results are printed out. I do highly recommend 
to fold code that isn't being looked at(like the calculation code and shi cause ts is like over 3000 
lines of code and is a chore to parse through). As always, feel free to inspect the code as much 
as needed to get some more knowledge on the inner workings of the calculator.
Sources:
Principles of Armor Protection:
https://apps.dtic.mil/sti/tr/pdf/AD0492002.pdf:

WW2 Gunnery: Armor and Ballistics by Lorrin Bird and Robert Livingston:
https://www.scribd.com/doc/219173969/WWII-Ballistics-Armor-and-Gunnery

Guns vs. Armour 1939 to 1945:
https://amizaur.prv.pl/www.wargamer.org/GvA/index.html

Decapping Revisited by Nathan Okun:
http://www.navweaps.com/index_tech/tech-085.php

TM 9-1907 Ballistic Data Performance of Ammunition:
https://archive.org/details/TM91907BalisticDataPreformaceOfAmmunition/mode/2up
there are probably some that I forgot lmfao but these are the big ones
*/

import Foundation

enum ArmorType {
    case rha, cha, fha
}

enum ShellType {
    case ap, apc, apbc, apcbc, apcr, apds
}

enum APDSGen {
    case gen1, gen2, gen3
}

enum FlawRating {
    case noFlaws, small, medium, large
}

enum FreeEdgeType {
    case none, small, medium, large
}

enum CapType {
    case type1, type2 
}

enum DecapState {
    case intact, partial, full
}

struct ArmorPlate {
    var type: ArmorType
    var thickness: Double 
    var hardnessBHN: Double
    var VangleAngle: Double
    var LangleAngle: Double
    var flawRating: FlawRating
    var freeEdge: FreeEdgeType 
    
    var compoundAngle: Double {
        let vRad = VangleAngle * .pi / 180.0
        let lRad = lRadAngle * .pi / 180.0
        let aRad = acos(cos(vRad) * cos(lRad))
        return aRad * 180.0 / .pi
    }
    
    private var lRadAngle: Double { LangleAngle }
}

struct AttackingShell {
    var type: ShellType
    var diameter: Double
    var coreDiameter: Double?
    var capType: CapType? 
    var apdsGen: APDSGen? 

    var activeDiameter: Double {
        switch type {
        case .apcr, .apds:
            return coreDiameter ?? diameter
        default:
            return diameter
        }
    }
}

class ArmorCalculator {
    
    static func calculateSinglePlate(plate: ArmorPlate, shell: AttackingShell) -> Double {
        let T = plate.thickness
        let D = shell.activeDiameter
        let A = plate.compoundAngle
        let TD = T / D
        
        let slopeMod = getSlopeModifier(A: A, TD: TD, shell: shell)
        let typeMod = getTypeModifier(plate: plate, shell: shell, TD: TD)
        
        var castMod = 1.0
        if plate.type == .cha {
            let rawCastMod = 0.8063 + (T * 0.001238) - (0.0002628 * D) + (TD * 0.02706)
            castMod = min(1.0, rawCastMod) 
        }
        
        let flawMod = getFlawModifier(plate: plate, TD: TD)
        let edgeMod = getFreeEdgeModifier(plate: plate, shell: shell) 
        
        return T * slopeMod * typeMod * castMod * flawMod * edgeMod
    }
    
    private static func getDecapResult(thickness: Double, angle: Double, refDiameter: Double, 
cap: CapType, shellType: ShellType) -> (state: DecapState, multiplier: Double) {
        guard shellType == .apc || shellType == .apcbc else { return (.intact, 1.0) }
        
        let A = angle
        let TD = thickness / refDiameter
        
        let fullThreshold: Double
        if A <= 25 {
            fullThreshold = 0.35
        } else if A <= 45 {
            fullThreshold = ((-0.005 * A) + 0.475)
        } else {
            fullThreshold = 0.14
        }
        
        let intactThreshold: Double
        if cap == .type1 {
            if A <= 15 { intactThreshold = 0.105 }
            else { intactThreshold = 0.0805 }
        } else { 
            if A <= 45 { intactThreshold = 0.155 }
            else { intactThreshold = 0.12 }
        }
        
        if TD > fullThreshold {
            return (.full, 1.25)
        } else if TD > intactThreshold {
            let progress = (TD - intactThreshold) / (fullThreshold - intactThreshold)
            let scaledMultiplier = 1.0 + (progress * 0.25)
            return (.partial, max(1.0001, min(1.2499, scaledMultiplier)))
        } else {
            return (.intact, 1.0)
        }
    }
    
    static func calculateLaminated(plate1: ArmorPlate, plate2: ArmorPlate, shell: AttackingShell) -
> Double {
        let t1 = calculateSinglePlate(plate: plate1, shell: shell)
        var shellForT2 = shell
        var t2Multiplier = 1.0
        
        let decap = getDecapResult(thickness: plate1.thickness, angle: plate1.compoundAngle, 
refDiameter: shell.activeDiameter, cap: shell.capType ?? .type2, shellType: shell.type)
        
        if decap.state == .full {
            shellForT2.type = .ap
        }
        
        if plate2.type != .fha {
            t2Multiplier = decap.multiplier
        }

        let t2Base = calculateSinglePlate(plate: plate2, shell: shellForT2)
        let t2 = t2Base * t2Multiplier
        let tMax = max(t1, t2)

        let multiplier = 0.3129 * pow(t1 / t2, 0.02527) * pow(tMax, 0.2439)
        return multiplier * (t1 + t2)
    }

    static func calculateTripleLaminated(plate1: ArmorPlate, plate2: ArmorPlate, plate3: 
ArmorPlate, shell: AttackingShell) -> Double {
        let t1 = calculateSinglePlate(plate: plate1, shell: shell)
        
        var shellForPlate2 = shell
        var t2Multiplier = 1.0
        let decap1 = getDecapResult(thickness: plate1.thickness, angle: plate1.compoundAngle, 
refDiameter: shell.activeDiameter, cap: shell.capType ?? .type2, shellType: shell.type)
        
        if decap1.state == .full { shellForPlate2.type = .ap }
        if plate2.type != .fha { t2Multiplier = decap1.multiplier }
        
        let t2Base = calculateSinglePlate(plate: plate2, shell: shellForPlate2)
        let t2 = t2Base * t2Multiplier
        
        var shellForPlate3 = shellForPlate2
        var t3Multiplier = 1.0
        let decap2 = getDecapResult(thickness: plate2.thickness, angle: plate2.compoundAngle, 
refDiameter: shell.activeDiameter, cap: shell.capType ?? .type2, shellType: shellForPlate2.type)
        
        if decap2.state == .full { shellForPlate3.type = .ap }
        if plate3.type != .fha {
            t3Multiplier = max(decap1.multiplier, decap2.multiplier)
        }
        
        let t3Base = calculateSinglePlate(plate: plate3, shell: shellForPlate3)
        let t3 = t3Base * t3Multiplier
        
        let tMax = max(t1, t2, t3)
        let t1_t2_ratio = (t1 / t3)
        let complex_ratio = pow(t1_t2_ratio, 0.02527)
        let multiplier = 0.3129 * complex_ratio * pow(tMax, 0.2439)
        
        return multiplier * (t1 + t2 + t3)
    }

    static func calculateSpaced(plates: [ArmorPlate], shell: AttackingShell) -> Double {
        guard !plates.isEmpty else { return 0.0 }
        
        if plates.count == 1 { 
            return calculateSinglePlate(plate: plates[0], shell: shell) 
        }

        var currentShell = shell
        var totalPower = 0.0
        
        var currentDecapState: DecapState = (shell.type == .apcbc || shell.type == .apc) ? .intact : 
.full
        var cumulativeDecapMultiplier = 1.0

        for (index, plate) in plates.enumerated() {
            let tBase = calculateSinglePlate(plate: plate, shell: currentShell)
            let t = (index > 0 && plate.type != .fha) ? (tBase * cumulativeDecapMultiplier) : tBase

            if index == 0 {
                totalPower += pow(1.15 * t, 1.4)
            } else {
                var B = 1.00
                if currentShell.type == .ap { B = 1.05 }
                else if currentShell.type == .apc || currentShell.type == .apcbc { B = 1.10 }

                totalPower += pow(B, 1.4) * pow(t, 1.4)
            }

            if currentDecapState != .full {
                let decapResult = getDecapResult(
                    thickness: plate.thickness, 
                    angle: plate.compoundAngle, 
                    refDiameter: currentShell.activeDiameter, 
                    cap: currentShell.capType ?? .type2, 
                    shellType: currentShell.type
                )
                
                if decapResult.state == .full {
                    currentDecapState = .full
                    currentShell.type = .ap
                    cumulativeDecapMultiplier = max(cumulativeDecapMultiplier, 
decapResult.multiplier)
                } else if decapResult.state == .partial && currentDecapState == .intact {
                    currentDecapState = .partial
                    cumulativeDecapMultiplier = max(cumulativeDecapMultiplier, 
decapResult.multiplier)
                } else if currentDecapState == .partial {
                    if decapResult.state == .partial || decapResult.state == .full {
                        currentDecapState = .full
                        currentShell.type = .ap
                        cumulativeDecapMultiplier = max(cumulativeDecapMultiplier, 1.25)
                    }
                }
            }
        }

        return pow(totalPower, 1.0 / 1.4)
    }
    
    private static func getFreeEdgeModifier(plate: ArmorPlate, shell: AttackingShell) -> Double {
        let D = shell.activeDiameter 
        var mod = 1.0
        switch plate.freeEdge {
        case .none: mod = 1.0
        case .large: mod = 0.25 + 0.5 * (37.5 / (D * 0.5))
        case .medium: mod = 0.75 + 0.15 * ((62.5 / (D * 0.5)) - 1)
        case .small: mod = 0.9 + 0.025 * ((150 / (D * 0.5)) - 2)
        }
        return min(1.0, mod)
    }

    private static func getSlopeModifier(A: Double, TD: Double, shell: AttackingShell) -> Double {
        let e = exp(1.0)
        switch shell.type {
        case .apc, .apcbc:
            if A == 0 { return 1.0 }
            if A <= 55 {
                let F = pow(e, 0.0000408 * pow(A, 2.5))
                let G = 0.0101 * pow(e, 0.1313 * pow(A, 0.8))
                return F * pow(TD, G)
            } else if A <= 60 {
                let F = -3.434 + 0.10856 * A
                let G = 0.2174 + 0.00046 * A
                return F * pow(TD, G)
            } else if A <= 70 {
                let F = 0.00000518 * pow(A, 3.25)
                let G = 0.00002123 * pow(A, 2.295)
                return F * pow(TD, G)
            } else {
                let F = 0.0678 * pow(1.0634, A)
                let G = 0.1017 * pow(1.0178, A)
                return F * pow(TD, G)
            }
        case .ap:
            if A == 0 { return 1.0 }
            if A <= 40 {
                let F = 0.95 * pow(e, 0.0000539 * pow(A, 2.5))
                let G = 0.04433 * pow(e, 0.04867 * A)
                return F * pow(TD, G)
            } else if A <= 55 {
                return 0.04754 * pow(A, 0.953) * pow(TD, 0.02047164 * pow(A, 0.46471))
            } else {
                return 0.0001675 * pow(A, 2.3655) * pow(TD, 0.02047164 * pow(A, 0.46471))
            }
        case .apbc:
            if A == 0 { return 1.0 }
            if A <= 55 {
                let F = pow(e, 0.019925 * pow(1.06758, A))
                let G = 0.007012 * pow(1.08289, A)
                return F * pow(TD, G)
            } else if A <= 60 {
                let F = pow(e, 0.002542 * pow(1.1089, A))
                let G = 0.0004763 * pow(1.1373, A)
                return F * pow(TD, G)
            } else {
                let F = pow(e, 0.03723 * pow(1.06033, A))
                let G = -3.3667 + 0.07411 * A
                return F * pow(TD, G)
            }
        case .apcr:
            if A == 0 { return 1.0 }
            let outerDiameter = shell.diameter
            if outerDiameter > 76.2 {
                if A <= 30 { return pow(e, pow(A, 1.75) * 0.000662) }
                else { return 0.9043 * pow(e, pow(A, 2.2) * 0.0001987) }
            } else {
                if A <= 25 { return pow(e, pow(A, 2.2) * 0.0001727) }
                else { return 0.7277 * pow(e, pow(A, 1.5) * 0.003787) }
            }
        case .apds:
            if A == 0 { return 1.0 }
            
            switch shell.apdsGen {
            case .gen1:
                return pow(e, pow(A, 2.6) * 0.00003011)
            case .gen2:
                return pow(e, pow(A, 3.5105) * 0.00000056238)
            case .gen3:
                return pow(e, pow(A, 2.1253) * 0.00010141)
            case .none:
                return pow(e, pow(A, 2.6) * 0.00003011)
            }
        }
    }
    
    private static func getTypeModifier(plate: ArmorPlate, shell: AttackingShell, TD: Double) -> 
Double {
        let BHN = plate.hardnessBHN
        let A = plate.compoundAngle
        if plate.type == .fha {
            let C: Double
            switch shell.type {
            case .ap, .apbc: C = 1.35
            case .apc, .apcbc: C = 0.96
            default: C = 0.822
            }
            return C * pow(TD, 0.15)
        }
        if plate.type == .rha || plate.type == .cha {
            if BHN <= 260 {
                return A <= 35 ? (1 + 0.0018 * (BHN - 260)) : (1 + 0.0027 * (BHN - 260))
            } else if BHN <= 320 {
                return A <= 35 ? (1 + 0.0042 * (BHN - 260)) : (1 + 0.00325 * (BHN - 260))
            } else if BHN <= 375 {
                return A <= 35 ? (1.255 + 0.0008 * (BHN - 320)) : 1.195
            } else {
                return 0.01 * 1011.79 * pow(shell.activeDiameter, 0.06111) * pow(TD, 0.2821) * 
pow(BHN, -0.4363)
            }
        }
        return 1.00
    }
    
    private static func getFlawModifier(plate: ArmorPlate, TD: Double) -> Double {
        var mod = 1.0
        let A = plate.compoundAngle
        switch plate.flawRating {
        case .noFlaws: return 1.0
        case .large:
            if A <= 30 { mod = (0.25 * TD) + 0.725 }
            else if A <= 60 { mod = (0.23 * TD) + 0.678 }
            else if A <= 75 { mod = (0.23 * TD) + 0.605 }
            else { mod = (0.23 * TD) + 0.575 }
        case .medium:
            if A <= 30 { mod = (0.22 * TD) + 0.75 }
            else if A <= 60 { mod = (0.22 * TD) + 0.718 }
            else if A <= 75 { mod = (0.22 * TD) + 0.7}
            else { mod = (0.22 * TD) + 0.678 }
        case .small:
            if A <= 30 { mod = (0.11 * TD) + 0.87 }
            else if A <= 60 { mod = (0.11 * TD) + 0.86 }
            else if A <= 75 { mod = (0.12 * TD) + 0.84 }
            else { mod = (0.115 * TD) + 0.84 }
        }
        return min(1.0, mod) 
    }
}

func evaluateArmorHit(
    arrangementName: String,
    p1Type: ArmorType, p1Thickness: Double, p1Hardness: Double, p1Vangle: Double, 
p1Langle: Double, p1Flaw: FlawRating, p1Edge: FreeEdgeType = .none,
    p2Type: ArmorType? = nil, p2Thickness: Double? = nil, p2Hardness: Double? = nil, 
p2Vangle: Double? = nil, p2Langle: Double? = nil, p2Flaw: FlawRating? = nil, p2Edge: 
FreeEdgeType = .none,
    p3Type: ArmorType? = nil, p3Thickness: Double? = nil, p3Hardness: Double? = nil, 
p3Vangle: Double? = nil, p3Langle: Double? = nil, p3Flaw: FlawRating? = nil, p3Edge: 
FreeEdgeType = .none,
    p4Type: ArmorType? = nil, p4Thickness: Double? = nil, p4Hardness: Double? = nil, 
p4Vangle: Double? = nil, p4Langle: Double? = nil, p4Flaw: FlawRating? = nil, p4Edge: 
FreeEdgeType = .none,
    p5Type: ArmorType? = nil, p5Thickness: Double? = nil, p5Hardness: Double? = nil, 
p5Vangle: Double? = nil, p5Langle: Double? = nil, p5Flaw: FlawRating? = nil, p5Edge: 
FreeEdgeType = .none,
    p6Type: ArmorType? = nil, p6Thickness: Double? = nil, p6Hardness: Double? = nil, 
p6Vangle: Double? = nil, p6Langle: Double? = nil, p6Flaw: FlawRating? = nil, p6Edge: 
FreeEdgeType = .none,
    shellType: ShellType, shellDiameter: Double, coreDiameter: Double? = nil, capType: 
CapType? = nil, apdsGen: APDSGen? = nil
  
) {

    let shell = AttackingShell(type: shellType, diameter: shellDiameter, coreDiameter: 
coreDiameter, capType: capType, apdsGen: apdsGen)
    let plate1 = ArmorPlate(type: p1Type, thickness: p1Thickness, hardnessBHN: p1Hardness, 
VangleAngle: p1Vangle, LangleAngle: p1Langle, flawRating: p1Flaw, freeEdge: p1Edge)
    
    var plates: [ArmorPlate] = [plate1]
    
    if let type2 = p2Type, let thick2 = p2Thickness, let hard2 = p2Hardness, let vert2 = p2Vangle, 
let lat2 = p2Langle, let flaw2 = p2Flaw {
        plates.append(ArmorPlate(type: type2, thickness: thick2, hardnessBHN: hard2, 
VangleAngle: vert2, LangleAngle: lat2, flawRating: flaw2, freeEdge: p2Edge))
    }

    if let type3 = p3Type, let thick3 = p3Thickness, let hard3 = p3Hardness, let vert3 = p3Vangle, 
let lat3 = p3Langle, let flaw3 = p3Flaw {
        plates.append(ArmorPlate(type: type3, thickness: thick3, hardnessBHN: hard3, 
VangleAngle: vert3, LangleAngle: lat3, flawRating: flaw3, freeEdge: p3Edge))
    }

    if let type4 = p4Type, let thick4 = p4Thickness, let hard4 = p4Hardness, let vert4 = p4Vangle, 
let lat4 = p4Langle, let flaw4 = p4Flaw {
        plates.append(ArmorPlate(type: type4, thickness: thick4, hardnessBHN: hard4, 
VangleAngle: vert4, LangleAngle: lat4, flawRating: flaw4, freeEdge: p4Edge))
    }

    if let type5 = p5Type, let thick5 = p5Thickness, let hard5 = p5Hardness, let vert5 = p5Vangle, 
let lat5 = p5Langle, let flaw5 = p5Flaw {
        plates.append(ArmorPlate(type: type5, thickness: thick5, hardnessBHN: hard5, 
VangleAngle: vert5, LangleAngle: lat5, flawRating: flaw5, freeEdge: p5Edge))
    }
    
    if let type6 = p6Type, let thick6 = p6Thickness, let hard6 = p6Hardness, let vert6 = p6Vangle, 
let lat6 = p6Langle, let flaw6 = p6Flaw {
        plates.append(ArmorPlate(type: type6, thickness: thick6, hardnessBHN: hard6, 
VangleAngle: vert6, LangleAngle: lat6, flawRating: flaw6, freeEdge: p6Edge))
    }
    
    let result: Double
    if plates.count == 1 {
        result = ArmorCalculator.calculateSinglePlate(plate: plates[0], shell: shell)
    } else if plates.count == 3 && arrangementName.lowercased().contains("triple") && 
!arrangementName.lowercased().contains("spaced") {
        result = ArmorCalculator.calculateTripleLaminated(plate1: plates[0], plate2: plates[1], 
plate3: plates[2], shell: shell)
    } else if plates.count == 2 && arrangementName.lowercased().contains("laminated") {
        result = ArmorCalculator.calculateLaminated(plate1: plates[0], plate2: plates[1], shell: shell)
    } else if arrangementName.lowercased().contains("spaced") {
        result = ArmorCalculator.calculateSpaced(plates: plates, shell: shell)
    } else {
        print("Invalid arrangement.")
        return
    }
    
    let coreInfo = coreDiameter != nil ? " (Core: \(coreDiameter!)mm)" : ""
    let genInfo = apdsGen != nil ? " (\(apdsGen!))" : ""
    print("--- \(arrangementName) vs \(shellDiameter)mm \(shellType)\(genInfo)\(coreInfo) ---")
    print(String(format: "Effective Thickness: %.0fmm\n", result))
}

print("M2A4 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 25.4, 
    p1Hardness: 0,
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M2A4 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 25.4, 
    p1Hardness: 402, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .large,
    
    p2Type: .fha, 
    p2Thickness: 25.4, 
    p2Hardness: 0, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3 / M3(Late) / M3(T-1020-4) / M3A1 Stuart Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3 Stuart Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 38.1, 
    p1Hardness: 402, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .large,
    
    p2Type: .fha, 
    p2Thickness: 38.1, 
    p2Hardness: 0, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: .medium,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3A3 Stuart Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 25.4, 
    p1Hardness: 330,
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3(Late) / M3(T-1020-4) / M3A1 / M3A3 / M5 Stuart Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 253, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .large,
    
    p2Type: .rha, 
    p2Thickness: 38.1, 
    p2Hardness: 300, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: .medium,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M5 / M5A1 Stuart Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 28.575, 
    p1Hardness: 330,
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M5A1 Stuart Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .large,
    
    p2Type: .rha, 
    p2Thickness: 44.45, 
    p2Hardness: 290, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: .medium,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M22 Locust Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 12.7, 
    p1Hardness: 355,
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M22 Locust Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 25.4, 
    p1Hardness: 314,
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M22 Locust Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 25.4, 
    p1Hardness: 314,
    p1Vangle: 50.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M24 Chaffee Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 25.4, 
    p1Hardness: 330,
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M24 Chaffee Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 38.1, 
    p1Hardness: 252,
    p1Vangle: 44.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M41 Walker Bulldog Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 25.4, 
    p1Hardness: 330,
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M41 Walker Bulldog Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 31.75, 
    p1Hardness: 314,
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M2A1 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 28.575, 
    p1Hardness: 0,
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M2A1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 25.4, 
    p1Hardness: 402, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .large,
    
    p2Type: .fha, 
    p2Thickness: 25.4, 
    p2Hardness: 0, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("MTLS-1G14 Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("MTLS-1G14 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("MTLS-1G14 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("MTLS-1G14 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 38.1, 
    p1Hardness: 253,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3 / M3A3 / M3A4 / M3A5 Lee / Grant Mk. I / Grant Mk. II Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 38.1, 
    p1Hardness: 300, 
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3 / M3A3 / M3A4 / M3A5 Lee / Grant Mk. I / Grant Mk. II Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 50.8, 
    p1Hardness: 275, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3A1 Lee Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 38.1, 
    p1Hardness: 314, 
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3A1 Lee Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M3 / M3A1 / M3A3 / M3A4 / M3A5 Lee Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Grant Mk. I / Grant Mk. II Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 76.2, 
    p1Hardness: 248, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4(Early) / M4 / M4 Composite / M4A1(Early) / M4A1 / M4A2 / M4A3 / M4A4 Sherman") 
print("Lower Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A2(75)W / M4A3(75)W / M4A6 / M4A1(76)W / M4A2(76)W") 
print("/ M4A3(76)W / M4(105) / M4A3(105) Sherman Lower Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 107.95, 
    p1Hardness: 235,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A3E2 Sherman Lower Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 139.7, 
    p1Hardness: 235,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A1(Early) / M4A1 / M4A2 / M4A4 Sherman Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4(Early) / M4 / M4 Composite / M4A3 Sherman Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A2(75)W / M4A3(75)W / M4A6 / M4A1(76)W / M4A2(76)W") 
print("/ M4A3(76)W / M4(105) / M4A3(105) Sherman Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A3E2 Sherman Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 114.3, 
    p1Hardness: 235,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4(Early) / M4 / M4A2 / M4A3 / M4A4 Sherman Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 50.8, 
    p1Hardness: 275,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A1(Early) / M4A1 / M4 Composite Sherman Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .ap, 
    shellDiameter: 20,
    capType: .type1
)

print("M4A6 Sherman Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .ap, 
    shellDiameter: 20,
    capType: .type1
)

print("M4A1(76)W Sherman Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 63.5, 
    p1Hardness: 252, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A2(75)W / M4A2(76)W / M4A3(76)W / M4(105) / M4A3(105) Sherman Upper Hull 
Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 63.5, 
    p1Hardness: 258, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A3E2 Sherman Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 38.1, 
    p1Hardness: 300, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 63.5, 
    p2Hardness: 258, 
    p2Vangle: 47.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4(Early) / M4 / M4A1(Early) / M4A1 / M4 Composite / M4A2 / M4A3 / M4A4 Sherman")
print("Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 76.2, 
    p1Hardness: 248, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A6 / M4(105) / M4A3(105) Sherman Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 76.2, 
    p1Hardness: 248, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A1 / M4 Composite / M4A2 / M4A3 / M4A4 Sherman Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    p2Type: .cha, 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .medium,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A6 Sherman Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    p2Type: .cha, 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4(105) / M4A3(105) Sherman Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 91.44, 
    p1Hardness: 235, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 25.4, 
    p2Hardness: 314, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A1(76)W / M4A2(76)W / M4A3(76)W Sherman Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 88.9, 
    p1Hardness: 235, 
    p1Vangle: 12.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 50.8, 
    p2Hardness: 252, 
    p2Vangle: 12.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M4A3E2 Sherman Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 127.0, 
    p1Hardness: 235, 
    p1Vangle: 12.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 50.8, 
    p2Hardness: 252, 
    p2Vangle: 12.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .ap, 
    shellDiameter: 20,
    capType: .type1
)

print("M6 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 82.55, 
    p1Hardness: 235,
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M6A1 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 82.55, 
    p1Hardness: 250,
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M6 / M6A1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .medium,
    
    p2Type: .cha, 
    p2Thickness: 50.8, 
    p2Hardness: 252, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .medium,
    p2Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M26 Pershing Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 46.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M26 Pershing Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 114.3, 
    p1Hardness: 235, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M45 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 46.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M45 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 203.2, 
    p1Hardness: 200, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T26E5 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 152.4, 
    p1Hardness: 200, 
    p1Vangle: 46.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T26E5 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 279.4, 
    p1Hardness: 200, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M103 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 127, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M103 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 155.575, 
    p1Hardness: 200, 
    p1Vangle: 23.0, 
    p1Langle: 58.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M103 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 162.56, 
    p2Hardness: 200, 
    p2Vangle: 55.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M47 Patton Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M47 Patton Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 32.0, 
    p1Langle: 37.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M47 Patton Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 114.3, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M48 Patton Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 109.982, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M48C Patton Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 109.982, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .large,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M48 Patton / M60 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 136.525, 
    p1Hardness: 235, 
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M48 Patton / M60 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 152.4, 
    p1Hardness: 200, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 82.55, 
    p2Hardness: 235, 
    p2Vangle: 30.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 93.218, 
    p1Hardness: 235, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60A1 / M60A2 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 108.966, 
    p1Hardness: 235, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60A1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 114.3, 
    p1Hardness: 235, 
    p1Vangle: 37.0, 
    p1Langle: 58.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60A1 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 254, 
    p1Hardness: 200, 
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60A2 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 127, 
    p1Hardness: 235, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 165.1, 
    p2Hardness: 200, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60A3 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 108.966, 
    p1Hardness: 270, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60A3 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 114.3, 
    p1Hardness: 270, 
    p1Vangle: 37.0, 
    p1Langle: 58.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M60A3 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 254, 
    p1Hardness: 270, 
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IIC Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 20, 
    p1Hardness: 368, 
    p1Vangle: 6.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 14.5, 
    p2Hardness: 450, 
    p2Vangle: 6.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IIC Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 20, 
    p1Hardness: 368, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 14.5, 
    p2Hardness: 450, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IIC Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 14.5, 
    p1Hardness: 450, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 14.5, 
    p2Hardness: 450, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer 38(t)A Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 25.0, 
    p1Hardness: 0, 
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer 38(t)E Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .fha, 
    p1Thickness: 25.0, 
    p1Hardness: 0, 
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 25.0, 
    p2Hardness: 368, 
    p2Vangle: 18.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer 38(t)G Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 50.0, 
    p1Hardness: 331, 
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IIIF Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .fha, 
    p1Thickness: 30.0, 
    p1Hardness: 0, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .fha, 
    p2Thickness: 30.0, 
    p2Hardness: 0, 
    p2Vangle: 9.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IIIM Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 20.0, 
    p1Hardness: 368, 
    p1Vangle: 11.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .fha, 
    p2Thickness: 50.0, 
    p2Hardness: 0, 
    p2Vangle: 11.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IIIM Turret Front:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 20.0, 
    p1Hardness: 368, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .fha, 
    p2Thickness: 50.0, 
    p2Hardness: 0, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)
 

print("Panzer IVH Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .fha, 
    p1Thickness: 30.0, 
    p1Hardness: 0, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .fha, 
    p2Thickness: 50.0, 
    p2Hardness: 0, 
    p2Vangle: 9.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IVG Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 80.0, 
    p1Hardness: 0, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panzer IVJ Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 80.0, 
    p1Hardness: 289, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panther D Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .fha, 
    p1Thickness: 80.0, 
    p1Hardness: 0, 
    p1Vangle: 55.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panther A / Panther G Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 80.0, 
    p1Hardness: 289, 
    p1Vangle: 55.0, 
    p1Langle: 0.0, 
    p1Flaw: .medium,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panther D / Panther A Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 100.0, 
    p1Hardness: 294, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Panther G Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 110.0, 
    p1Hardness: 294, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("All Panthers Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 100.0, 
    p1Hardness: 243, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Tiger I Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 100, 
    p1Hardness: 294, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Tiger I Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 140, 
    p1Hardness: 243, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Tiger II(Early) / Tiger II Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 150, 
    p1Hardness: 243, 
    p1Vangle: 50.0, 
    p1Langle: 0.0, 
    p1Flaw: .large,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Tiger II(Early) Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 100.0, 
    p1Hardness: 243, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Tiger II Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 185, 
    p1Hardness: 243, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: .large,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Leopard 1 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 70, 
    p1Hardness: 260, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Leopard 1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 43, 
    p1Hardness: 260, 
    p1Vangle: 17.0, 
    p1Langle: 59.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Leopard 1 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .cha, 
    p1Thickness: 65.0, 
    p1Hardness: 260, 
    p1Vangle: 35.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 65.0, 
    p2Hardness: 260, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    p3Type: .cha, 
    p3Thickness: 25.0, 
    p3Hardness: 260, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .none,
    
    p4Type: .cha, 
    p4Thickness: 25.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: .noFlaws,
    p4Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Leopard 1A1A1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 20.0, 
    p1Hardness: 260, 
    p1Vangle: 16.0, 
    p1Langle: 58.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .cha, 
    p2Thickness: 43.0, 
    p2Hardness: 260, 
    p2Vangle: 17.0, 
    p2Langle: 59.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Leopard 1A1A1 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 35.0, 
    p1Hardness: 260, 
    p1Vangle: 37.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 65.0, 
    p2Hardness: 260, 
    p2Vangle: 35.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    p3Type: .cha, 
    p3Thickness: 65.0, 
    p3Hardness: 260, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .small,
    
    p4Type: .cha, 
    p4Thickness: 25.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: .noFlaws,
    p4Edge: .none,
    
    p5Type: .cha, 
    p5Thickness: 25.0, 
    p5Hardness: 260, 
    p5Vangle: 0.0, 
    p5Langle: 0.0, 
    p5Flaw: .noFlaws,
    p5Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Leopard 1A3 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 33.0, 
    p1Hardness: 260, 
    p1Vangle: 67.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .rha, 
    p2Thickness: 25.0, 
    p2Hardness: 260, 
    p2Vangle: 52.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    p3Type: .rha, 
    p3Thickness: 20.0, 
    p3Hardness: 260, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .none,
    
    p4Type: .cha, 
    p4Thickness: 25.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: .noFlaws,
    p4Edge: .none,
    
    p5Type: .cha, 
    p5Thickness: 25.0, 
    p5Hardness: 260, 
    p5Vangle: 0.0, 
    p5Langle: 0.0, 
    p5Flaw: .noFlaws,
    p5Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("AMX-30B Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 79, 
    p1Hardness: 260, 
    p1Vangle: 68.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("AMX-30B Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 50, 
    p1Hardness: 260, 
    p1Vangle: 76.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("AMX-30B Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 41.5, 
    p1Hardness: 260, 
    p1Vangle: 30.0, 
    p1Langle: 60.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("AMX-30B Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .cha, 
    p1Thickness: 60.0, 
    p1Hardness: 260, 
    p1Vangle: 41.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 60.0, 
    p2Hardness: 260, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Crusader Mk. I Upper Hull Front Left Side:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 17.9832, // "18mm"
    p1Hardness: 458, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 22.225, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Crusader Mk. I Upper Hull Front Right Side:")
evaluateArmorHit(
    arrangementName: "Triple Laminated",
    p1Type: .rha, 
    p1Thickness: 13.9954, // "14mm" 
    p1Hardness: 458, 
    p1Vangle: 33.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 9.525, 
    p2Hardness: 285, 
    p2Vangle: 33.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    p3Type: .rha, 
    p3Thickness: 4.7498, 
    p3Hardness: 285, 
    p3Vangle: 33.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Crusader Mk. II Upper Hull Front Left Side:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 17.9832, // "18mm"
    p1Hardness: 458, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 22.225, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Crusader Mk. II Upper Hull Front Right Side:")
evaluateArmorHit(
    arrangementName: "Triple Laminated",
    p1Type: .rha, 
    p1Thickness: 19.98472, // "20mm" 
    p1Hardness: 458, 
    p1Vangle: 33.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 9.525, 
    p2Hardness: 285, 
    p2Vangle: 33.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    p3Type: .rha, 
    p3Thickness: 4.7498, 
    p3Hardness: 285, 
    p3Vangle: 33.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Churchill Mk. I Upper Hull Front Left Side:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 88.9, 
    p1Hardness: 313, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    p2Type: .rha, 
    p2Thickness: 12.7, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Churchill Mk. I Upper Hull Front Right Side:")
evaluateArmorHit(
    arrangementName: "Triple Laminated",
    p1Type: .cha, 
    p1Thickness: 88.9, 
    p1Hardness: 313, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .large,
    
    p2Type: .cha, 
    p2Thickness: 88.9, 
    p2Hardness: 313, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .large,
    
    p3Type: .rha, 
    p3Thickness: 12.7, 
    p3Hardness: 285, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Churchill Mk. VII Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 152.4, 
    p1Hardness: 313, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Cromwell Mk. VC Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 63.5, 
    p1Hardness: 292, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 12.7, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Cromwell Mk. VwD Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Triple Laminated",
    p1Type: .rha, 
    p1Thickness: 38.1, 
    p1Hardness: 292, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 63.5, 
    p2Hardness: 292, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    p3Type: .rha, 
    p3Thickness: 12.7, 
    p3Hardness: 285, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Centurion Mk. 1 / Mk. 2 / Mk. 3 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 76.2, 
    p1Hardness: 292, 
    p1Vangle: 57.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Centurion Mk. 5 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 76.2, 
    p1Hardness: 255, 
    p1Vangle: 57.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Centurion Mk. 5/1 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 44.45, 
    p1Hardness: 262, 
    p1Vangle: 57.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 76.2, 
    p2Hardness: 255, 
    p2Vangle: 57.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Centurion Mk. 1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 127, 
    p1Hardness: 312, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Centurion Mk. 2 / Mk. 3 / Mk. 5 / Mk. 5/1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 152.4, 
    p1Hardness: 312, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Centurion Mk. 8 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 152.4, 
    p1Hardness: 312, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 152.4, 
    p2Hardness: 312, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Conqueror Mk. 2 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 130.048, // "130mm"
    p1Hardness: 255, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Conqueror Mk. 2 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 297.4, 
    p1Hardness: 312, 
    p1Vangle: 34.0, 
    p1Langle: 33.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Conqueror Mk. 2 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .cha, 
    p1Thickness: 127.0, 
    p1Hardness: 312, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 101.6, 
    p2Hardness: 312, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .large,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Vickers Mk. 1 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 60.0, 
    p1Hardness: 262, 
    p1Vangle: 55.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Vickers Mk. 1 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 80.0, 
    p1Hardness: 255, 
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Vickers Mk. 1 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 80.0, 
    p1Hardness: 263, 
    p1Vangle: 6.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 50.0, 
    p2Hardness: 263, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Cheiftain Mk. 3 / Mk. 5 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 84.0, 
    p1Hardness: 263, 
    p1Vangle: 70.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Cheiftain Mk. 3 / Mk. 5 Turret Front Left Side:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 125.0, 
    p1Hardness: 263, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Cheiftain Mk. 3 / Mk. 5 Turret Front Right Side:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 195.0, 
    p1Hardness: 263, 
    p1Vangle: 50.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-34 Obr. 1940 / 1941 / 1942 / T-34-85 Obr. 1943 / 1944 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 45, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-34E STZ Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 15, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 45, 
    p2Hardness: 445, 
    p2Vangle: 60.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-34 Obr. 1940 / 1941 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 45, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-34 Obr. 1942 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 53, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-34E Turret Front:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 16, 
    p1Hardness: 445, 
    p1Vangle: 25.0, 
    p1Langle: 47.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 45, 
    p2Hardness: 445, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-34-85 Obr. 1943 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 54, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-34-85 Obr. 1944 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 90, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("KV-1 Obr. 1939 / 1940 / KV-1S / KV-85 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 75, 
    p1Hardness: 280, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("KV-1 Obr. 1941 / 1942 / KV-1E Obr. 1940 / 1941 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 25, 
    p1Hardness: 445, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 75,
    p2Hardness: 280, 
    p2Vangle: 30.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("KV-1 Obr. 1939 / 1940 / KV-1E Obr. 1940 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 75, 
    p1Hardness: 280, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("KV-1S Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 82, 
    p1Hardness: 320, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("KV-1 Obr. 1941 / KV-1E Obr. 1941 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 90, 
    p1Hardness: 320, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("KV-1 Obr. 1942 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 105, 
    p1Hardness: 320, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("IS-1 / IS-2 Obr. 1943 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 120, 
    p1Hardness: 445, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("IS-2 Obr. 1944 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 100, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("IS-2 Obr. 1944 UZTM Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 90, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("KV-85 / IS-1 / IS-2 Obr. 1943 / 1944 / 1944 UZTM Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 100, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-44 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 90, 
    p1Hardness: 290, 
    p1Vangle: 62.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-44 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 120, 
    p1Hardness: 270, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-54 Obr. 1947 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 120, 
    p1Hardness: 290, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-54 Obr. 1949 / 1951 / T-55 / T-62 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 100, 
    p1Hardness: 290, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-54 Obr. 1947 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 200, 
    p1Hardness: 270, 
    p1Vangle: 24.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-54 Obr. 1949 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 200, 
    p1Hardness: 270, 
    p1Vangle: 25.0, 
    p1Langle: 27.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-54 Obr. 1951 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 200, 
    p1Hardness: 270, 
    p1Vangle: 34.0, 
    p1Langle: 27.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-55 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 200, 
    p1Hardness: 259, 
    p1Vangle: 34.0, 
    p1Langle: 27.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-62 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 214, 
    p1Hardness: 259, 
    p1Vangle: 33.0, 
    p1Langle: 30.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("IS-3 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 110, 
    p1Hardness: 290, 
    p1Vangle: 56.0, 
    p1Langle: 30.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("IS-3 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 249.0, 
    p1Hardness: 270, 
    p1Vangle: 15.0, 
    p1Langle: 40.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("IS-4 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 140, 
    p1Hardness: 290, 
    p1Vangle: 61.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("IS-4 Turret Front:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 170.0, 
    p1Hardness: 270, 
    p1Vangle: 26.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .large,
    
    p2Type: .cha, 
    p2Thickness: 250.0, 
    p2Hardness: 270, 
    p2Vangle: 26.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-10A / T-10B / T-10M Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 120, 
    p1Hardness: 290, 
    p1Vangle: 55.0, 
    p1Langle: 40.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-10A / T-10B Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 250.0, 
    p1Hardness: 270, 
    p1Vangle: 15.0, 
    p1Langle: 40.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("T-10M Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 200.0, 
    p1Hardness: 270, 
    p1Vangle: 24.0, 
    p1Langle: 48.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M13/40 / M14/41 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 30.0, 
    p1Hardness: 245, 
    p1Vangle: 11.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M15/42 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 42.0, 
    p1Hardness: 210, 
    p1Vangle: 12.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M13/40 / M14/41 / M15/42 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 40.0, 
    p1Hardness: 210, 
    p1Vangle: 16.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("M13/40 / M14/41 / M15/42 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 40.0, 
    p1Hardness: 210, 
    p1Vangle: 16.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .medium,
    
    p2Type: .cha, 
    p2Thickness: 30.0, 
    p2Hardness: 245, 
    p2Vangle: 16.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .medium,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("P40 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 50.0, 
    p1Hardness: 210, 
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("P40 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 50.0, 
    p1Hardness: 210, 
    p1Vangle: 20.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("P40 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .rha, 
    p1Thickness: 48.0, 
    p1Hardness: 210, 
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 48.0, 
    p2Hardness: 210, 
    p2Vangle: 30.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Semovente M43 da 75/46 Superstructure Front:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 25.0, 
    p1Hardness: 245, 
    p1Vangle: 25.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    p2Type: .rha, 
    p2Thickness: 75.0, 
    p2Hardness: 210, 
    p2Vangle: 5.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("OF-40 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 70, 
    p1Hardness: 260, 
    p1Vangle: 68.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("OF-40 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .rha, 
    p1Thickness: 30.0, 
    p1Hardness: 260, 
    p1Vangle: 58.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .rha, 
    p2Thickness: 45.0, 
    p2Hardness: 260, 
    p2Vangle: 32.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    p3Type: .rha, 
    p3Thickness: 45.0, 
    p3Hardness: 260, 
    p3Vangle: 32.0, 
    p3Langle: 0.0, 
    p3Flaw: .noFlaws,
    p3Edge: .none,
    
    p4Type: .cha, 
    p4Thickness: 34.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: .noFlaws,
    p4Edge: .none,
    
    p5Type: .cha, 
    p5Thickness: 34.0, 
    p5Hardness: 260, 
    p5Vangle: 0.0, 
    p5Langle: 0.0, 
    p5Flaw: .noFlaws,
    p5Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Pz. 58 / 61 / 68 Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 120, 
    p1Hardness: 260, 
    p1Vangle: 36.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Pz. 58 / 61 / 68 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 65, 
    p1Hardness: 260, 
    p1Vangle: 54.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Pz. 58 / 61 / 68 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 65, 
    p1Hardness: 260, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Pz. 58 / 61 / 68 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Laminated",
    p1Type: .cha, 
    p1Thickness: 120, 
    p1Hardness: 260, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 120, 
    p2Hardness: 260, 
    p2Vangle: 11.0, 
    p2Langle: 0.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Type 61 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 45, 
    p1Hardness: 260, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Type 61 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 125.0, 
    p1Hardness: 260, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Type 74 Middle Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 80, 
    p1Hardness: 260, 
    p1Vangle: 64.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Type 74 Upper Hull Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .rha, 
    p1Thickness: 40, 
    p1Hardness: 260, 
    p1Vangle: 73.0, 
    p1Langle: 0.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Type 74 Turret Front:")
evaluateArmorHit(
    arrangementName: "Single Plate",
    p1Type: .cha, 
    p1Thickness: 132, 
    p1Hardness: 260, 
    p1Vangle: 28.0, 
    p1Langle: 40.0, 
    p1Flaw: .noFlaws,
    p1Edge: .none,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

print("Type 74 Gun Mantlet:")
evaluateArmorHit(
    arrangementName: "Spaced",
    p1Type: .cha, 
    p1Thickness: 116.0, 
    p1Hardness: 260, 
    p1Vangle: 39.0, 
    p1Langle: 30.0, 
    p1Flaw: .noFlaws,
    p1Edge: .small,
    
    p2Type: .cha, 
    p2Thickness: 50.0, 
    p2Hardness: 260, 
    p2Vangle: 39.0, 
    p2Langle: 30.0, 
    p2Flaw: .noFlaws,
    p2Edge: .small,
    
    shellType: .apcbc, 
    shellDiameter: 75,
    capType: .type1
)

