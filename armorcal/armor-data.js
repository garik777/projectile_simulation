// Generated from the Swift test cases. Each preset is one armor arrangement tested against a shell.
(function (root) {
  "use strict";

  function build({ title, evaluateArmorHit }) {

title("M2A4 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 25.4, 
    p1Hardness: 0,
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M2A4 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 25.4, 
    p1Hardness: 402, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "large",
    
    p2Type: "fha", 
    p2Thickness: 25.4, 
    p2Hardness: 0, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3 / M3(Late) / M3(T-1020-4) / M3A1 Stuart Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3 Stuart Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 38.1, 
    p1Hardness: 402, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "large",
    
    p2Type: "fha", 
    p2Thickness: 38.1, 
    p2Hardness: 0, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: "medium",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3A3 Stuart Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 25.4, 
    p1Hardness: 330,
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3(Late) / M3(T-1020-4) / M3A1 / M3A3 / M5 Stuart Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 253, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "large",
    
    p2Type: "rha", 
    p2Thickness: 38.1, 
    p2Hardness: 300, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: "medium",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M5 / M5A1 Stuart Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 28.575, 
    p1Hardness: 330,
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M5A1 Stuart Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "large",
    
    p2Type: "rha", 
    p2Thickness: 44.45, 
    p2Hardness: 290, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: "medium",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M22 Locust Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 12.7, 
    p1Hardness: 355,
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M22 Locust Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 25.4, 
    p1Hardness: 314,
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M22 Locust Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 25.4, 
    p1Hardness: 314,
    p1Vangle: 50.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M24 Chaffee Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 25.4, 
    p1Hardness: 330,
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M24 Chaffee Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 38.1, 
    p1Hardness: 252,
    p1Vangle: 44.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M41 Walker Bulldog Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 25.4, 
    p1Hardness: 330,
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M41 Walker Bulldog Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 31.75, 
    p1Hardness: 314,
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M2A1 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 28.575, 
    p1Hardness: 0,
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M2A1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 25.4, 
    p1Hardness: 402, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "large",
    
    p2Type: "fha", 
    p2Thickness: 25.4, 
    p2Hardness: 0, 
    p2Vangle: 10.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("MTLS-1G14 Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("MTLS-1G14 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("MTLS-1G14 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 38.1, 
    p1Hardness: 0,
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("MTLS-1G14 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 38.1, 
    p1Hardness: 253,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3 / M3A3 / M3A4 / M3A5 Lee / Grant Mk. I / Grant Mk. II Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 38.1, 
    p1Hardness: 300, 
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3 / M3A3 / M3A4 / M3A5 Lee / Grant Mk. I / Grant Mk. II Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 50.8, 
    p1Hardness: 275, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3A1 Lee Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 38.1, 
    p1Hardness: 314, 
    p1Vangle: 53.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3A1 Lee Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M3 / M3A1 / M3A3 / M3A4 / M3A5 Lee Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Grant Mk. I / Grant Mk. II Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 76.2, 
    p1Hardness: 248, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4(Early) / M4 / M4 Composite / M4A1(Early) / M4A1 / M4A2 / M4A3 / M4A4 Sherman") 
title("Lower Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A2(75)W / M4A3(75)W / M4A6 / M4A1(76)W / M4A2(76)W") 
title("/ M4A3(76)W / M4(105) / M4A3(105) Sherman Lower Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 107.95, 
    p1Hardness: 235,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A3E2 Sherman Lower Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 139.7, 
    p1Hardness: 235,
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A1(Early) / M4A1 / M4A2 / M4A4 Sherman Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4(Early) / M4 / M4 Composite / M4A3 Sherman Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A2(75)W / M4A3(75)W / M4A6 / M4A1(76)W / M4A2(76)W") 
title("/ M4A3(76)W / M4(105) / M4A3(105) Sherman Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A3E2 Sherman Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 114.3, 
    p1Hardness: 235,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4(Early) / M4 / M4A2 / M4A3 / M4A4 Sherman Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 50.8, 
    p1Hardness: 275,
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A1(Early) / M4A1 / M4 Composite Sherman Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "ap", 
    shellDiameter: 20,
    capType: "type1"
})

title("M4A6 Sherman Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 56.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "ap", 
    shellDiameter: 20,
    capType: "type1"
})

title("M4A1(76)W Sherman Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 63.5, 
    p1Hardness: 252, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A2(75)W / M4A2(76)W / M4A3(76)W / M4(105) / M4A3(105) Sherman Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 63.5, 
    p1Hardness: 258, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A3E2 Sherman Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 38.1, 
    p1Hardness: 300, 
    p1Vangle: 47.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 63.5, 
    p2Hardness: 258, 
    p2Vangle: 47.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4(Early) / M4 / M4A1(Early) / M4A1 / M4 Composite / M4A2 / M4A3 / M4A4 Sherman")
title("Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 76.2, 
    p1Hardness: 248, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A6 / M4(105) / M4A3(105) Sherman Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 76.2, 
    p1Hardness: 248, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A1 / M4 Composite / M4A2 / M4A3 / M4A4 Sherman Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    p2Type: "cha", 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "medium",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A6 Sherman Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    p2Type: "cha", 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4(105) / M4A3(105) Sherman Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 91.44, 
    p1Hardness: 235, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 25.4, 
    p2Hardness: 314, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A1(76)W / M4A2(76)W / M4A3(76)W Sherman Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 88.9, 
    p1Hardness: 235, 
    p1Vangle: 12.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 50.8, 
    p2Hardness: 252, 
    p2Vangle: 12.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M4A3E2 Sherman Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 127.0, 
    p1Hardness: 235, 
    p1Vangle: 12.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 50.8, 
    p2Hardness: 252, 
    p2Vangle: 12.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "ap", 
    shellDiameter: 20,
    capType: "type1"
})

title("M6 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 82.55, 
    p1Hardness: 235,
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M6A1 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 82.55, 
    p1Hardness: 250,
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M6 / M6A1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 50.8, 
    p1Hardness: 252, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "medium",
    
    p2Type: "cha", 
    p2Thickness: 50.8, 
    p2Hardness: 252, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "medium",
    p2Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M26 Pershing Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 46.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M26 Pershing Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 114.3, 
    p1Hardness: 235, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M45 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 46.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M45 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 203.2, 
    p1Hardness: 200, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T26E5 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 152.4, 
    p1Hardness: 200, 
    p1Vangle: 46.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T26E5 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 279.4, 
    p1Hardness: 200, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 88.9, 
    p2Hardness: 235, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M103 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 127, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M103 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 155.575, 
    p1Hardness: 200, 
    p1Vangle: 23.0, 
    p1Langle: 58.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M103 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 162.56, 
    p2Hardness: 200, 
    p2Vangle: 55.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M47 Patton Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M47 Patton Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 101.6, 
    p1Hardness: 235, 
    p1Vangle: 32.0, 
    p1Langle: 37.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M47 Patton Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 114.3, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M48 Patton Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 109.982, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M48C Patton Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 109.982, 
    p1Hardness: 235, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "large",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M48 Patton / M60 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 136.525, 
    p1Hardness: 235, 
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M48 Patton / M60 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 152.4, 
    p1Hardness: 200, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 82.55, 
    p2Hardness: 235, 
    p2Vangle: 30.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 93.218, 
    p1Hardness: 235, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60A1 / M60A2 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 108.966, 
    p1Hardness: 235, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60A1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 114.3, 
    p1Hardness: 235, 
    p1Vangle: 37.0, 
    p1Langle: 58.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60A1 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 254, 
    p1Hardness: 200, 
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60A2 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 127, 
    p1Hardness: 235, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 165.1, 
    p2Hardness: 200, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60A3 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 108.966, 
    p1Hardness: 270, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60A3 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 114.3, 
    p1Hardness: 270, 
    p1Vangle: 37.0, 
    p1Langle: 58.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M60A3 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 254, 
    p1Hardness: 270, 
    p1Vangle: 48.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IIC Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 20, 
    p1Hardness: 368, 
    p1Vangle: 6.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 14.5, 
    p2Hardness: 450, 
    p2Vangle: 6.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IIC Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 20, 
    p1Hardness: 368, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 14.5, 
    p2Hardness: 450, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IIC Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 14.5, 
    p1Hardness: 450, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 14.5, 
    p2Hardness: 450, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer 38(t)A Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 25.0, 
    p1Hardness: 0, 
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer 38(t)E Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "fha", 
    p1Thickness: 25.0, 
    p1Hardness: 0, 
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 25.0, 
    p2Hardness: 368, 
    p2Vangle: 18.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer 38(t)G Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 50.0, 
    p1Hardness: 331, 
    p1Vangle: 18.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IIIF Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "fha", 
    p1Thickness: 30.0, 
    p1Hardness: 0, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "fha", 
    p2Thickness: 30.0, 
    p2Hardness: 0, 
    p2Vangle: 9.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IIIM Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 20.0, 
    p1Hardness: 368, 
    p1Vangle: 11.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "fha", 
    p2Thickness: 50.0, 
    p2Hardness: 0, 
    p2Vangle: 11.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IIIM Turret Front:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 20.0, 
    p1Hardness: 368, 
    p1Vangle: 14.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "fha", 
    p2Thickness: 50.0, 
    p2Hardness: 0, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})
 

title("Panzer IVH Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "fha", 
    p1Thickness: 30.0, 
    p1Hardness: 0, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "fha", 
    p2Thickness: 50.0, 
    p2Hardness: 0, 
    p2Vangle: 9.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IVG Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 80.0, 
    p1Hardness: 0, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panzer IVJ Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 80.0, 
    p1Hardness: 289, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panther D Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "fha", 
    p1Thickness: 80.0, 
    p1Hardness: 0, 
    p1Vangle: 55.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panther A / Panther G Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 80.0, 
    p1Hardness: 289, 
    p1Vangle: 55.0, 
    p1Langle: 0.0, 
    p1Flaw: "medium",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panther D / Panther A Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 100.0, 
    p1Hardness: 294, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Panther G Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 110.0, 
    p1Hardness: 294, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("All Panthers Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 100.0, 
    p1Hardness: 243, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Tiger I Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 100, 
    p1Hardness: 294, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Tiger I Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 140, 
    p1Hardness: 243, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Tiger II(Early) / Tiger II Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 150, 
    p1Hardness: 243, 
    p1Vangle: 50.0, 
    p1Langle: 0.0, 
    p1Flaw: "large",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Tiger II(Early) Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 100.0, 
    p1Hardness: 243, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Tiger II Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 185, 
    p1Hardness: 243, 
    p1Vangle: 9.0, 
    p1Langle: 0.0, 
    p1Flaw: "large",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Leopard 1 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 70, 
    p1Hardness: 260, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Leopard 1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 43, 
    p1Hardness: 260, 
    p1Vangle: 17.0, 
    p1Langle: 59.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Leopard 1 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "cha", 
    p1Thickness: 65.0, 
    p1Hardness: 260, 
    p1Vangle: 35.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 65.0, 
    p2Hardness: 260, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    p3Type: "cha", 
    p3Thickness: 25.0, 
    p3Hardness: 260, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "none",
    
    p4Type: "cha", 
    p4Thickness: 25.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: "noFlaws",
    p4Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Leopard 1A1A1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 20.0, 
    p1Hardness: 260, 
    p1Vangle: 16.0, 
    p1Langle: 58.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "cha", 
    p2Thickness: 43.0, 
    p2Hardness: 260, 
    p2Vangle: 17.0, 
    p2Langle: 59.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Leopard 1A1A1 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 35.0, 
    p1Hardness: 260, 
    p1Vangle: 37.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 65.0, 
    p2Hardness: 260, 
    p2Vangle: 35.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    p3Type: "cha", 
    p3Thickness: 65.0, 
    p3Hardness: 260, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "small",
    
    p4Type: "cha", 
    p4Thickness: 25.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: "noFlaws",
    p4Edge: "none",
    
    p5Type: "cha", 
    p5Thickness: 25.0, 
    p5Hardness: 260, 
    p5Vangle: 0.0, 
    p5Langle: 0.0, 
    p5Flaw: "noFlaws",
    p5Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Leopard 1A3 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 33.0, 
    p1Hardness: 260, 
    p1Vangle: 67.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "rha", 
    p2Thickness: 25.0, 
    p2Hardness: 260, 
    p2Vangle: 52.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    p3Type: "rha", 
    p3Thickness: 20.0, 
    p3Hardness: 260, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "none",
    
    p4Type: "cha", 
    p4Thickness: 25.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: "noFlaws",
    p4Edge: "none",
    
    p5Type: "cha", 
    p5Thickness: 25.0, 
    p5Hardness: 260, 
    p5Vangle: 0.0, 
    p5Langle: 0.0, 
    p5Flaw: "noFlaws",
    p5Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("AMX-30B Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 79, 
    p1Hardness: 260, 
    p1Vangle: 68.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("AMX-30B Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 50, 
    p1Hardness: 260, 
    p1Vangle: 76.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("AMX-30B Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 41.5, 
    p1Hardness: 260, 
    p1Vangle: 30.0, 
    p1Langle: 60.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("AMX-30B Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "cha", 
    p1Thickness: 60.0, 
    p1Hardness: 260, 
    p1Vangle: 41.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 60.0, 
    p2Hardness: 260, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Crusader Mk. I Upper Hull Front Left Side:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 17.9832, // "18mm"
    p1Hardness: 458, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 22.225, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Crusader Mk. I Upper Hull Front Right Side:")
evaluateArmorHit({
    arrangementName: "Triple Laminated",
    p1Type: "rha", 
    p1Thickness: 13.9954, // "14mm" 
    p1Hardness: 458, 
    p1Vangle: 33.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 9.525, 
    p2Hardness: 285, 
    p2Vangle: 33.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    p3Type: "rha", 
    p3Thickness: 4.7498, 
    p3Hardness: 285, 
    p3Vangle: 33.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Crusader Mk. II Upper Hull Front Left Side:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 17.9832, // "18mm"
    p1Hardness: 458, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 22.225, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Crusader Mk. II Upper Hull Front Right Side:")
evaluateArmorHit({
    arrangementName: "Triple Laminated",
    p1Type: "rha", 
    p1Thickness: 19.98472, // "20mm" 
    p1Hardness: 458, 
    p1Vangle: 33.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 9.525, 
    p2Hardness: 285, 
    p2Vangle: 33.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    p3Type: "rha", 
    p3Thickness: 4.7498, 
    p3Hardness: 285, 
    p3Vangle: 33.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Churchill Mk. I Upper Hull Front Left Side:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 88.9, 
    p1Hardness: 313, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    p2Type: "rha", 
    p2Thickness: 12.7, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Churchill Mk. I Upper Hull Front Right Side:")
evaluateArmorHit({
    arrangementName: "Triple Laminated",
    p1Type: "cha", 
    p1Thickness: 88.9, 
    p1Hardness: 313, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "large",
    
    p2Type: "cha", 
    p2Thickness: 88.9, 
    p2Hardness: 313, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "large",
    
    p3Type: "rha", 
    p3Thickness: 12.7, 
    p3Hardness: 285, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Churchill Mk. VII Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 152.4, 
    p1Hardness: 313, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Cromwell Mk. VC Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 63.5, 
    p1Hardness: 292, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 12.7, 
    p2Hardness: 285, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Cromwell Mk. VwD Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Triple Laminated",
    p1Type: "rha", 
    p1Thickness: 38.1, 
    p1Hardness: 292, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 63.5, 
    p2Hardness: 292, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    p3Type: "rha", 
    p3Thickness: 12.7, 
    p3Hardness: 285, 
    p3Vangle: 0.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Centurion Mk. 1 / Mk. 2 / Mk. 3 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 76.2, 
    p1Hardness: 292, 
    p1Vangle: 57.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Centurion Mk. 5 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 76.2, 
    p1Hardness: 255, 
    p1Vangle: 57.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Centurion Mk. 5/1 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 44.45, 
    p1Hardness: 262, 
    p1Vangle: 57.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 76.2, 
    p2Hardness: 255, 
    p2Vangle: 57.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Centurion Mk. 1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 127, 
    p1Hardness: 312, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Centurion Mk. 2 / Mk. 3 / Mk. 5 / Mk. 5/1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 152.4, 
    p1Hardness: 312, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Centurion Mk. 8 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 152.4, 
    p1Hardness: 312, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 152.4, 
    p2Hardness: 312, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Conqueror Mk. 2 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 130.048, // "130mm"
    p1Hardness: 255, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Conqueror Mk. 2 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 297.4, 
    p1Hardness: 312, 
    p1Vangle: 34.0, 
    p1Langle: 33.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Conqueror Mk. 2 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "cha", 
    p1Thickness: 127.0, 
    p1Hardness: 312, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 101.6, 
    p2Hardness: 312, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "large",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Vickers Mk. 1 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 60.0, 
    p1Hardness: 262, 
    p1Vangle: 55.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Vickers Mk. 1 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 80.0, 
    p1Hardness: 255, 
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Vickers Mk. 1 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 80.0, 
    p1Hardness: 263, 
    p1Vangle: 6.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 50.0, 
    p2Hardness: 263, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Cheiftain Mk. 3 / Mk. 5 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 84.0, 
    p1Hardness: 263, 
    p1Vangle: 70.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Cheiftain Mk. 3 / Mk. 5 Turret Front Left Side:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 125.0, 
    p1Hardness: 263, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Cheiftain Mk. 3 / Mk. 5 Turret Front Right Side:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 195.0, 
    p1Hardness: 263, 
    p1Vangle: 50.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-34 Obr. 1940 / 1941 / 1942 / T-34-85 Obr. 1943 / 1944 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 45, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-34E STZ Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 15, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 45, 
    p2Hardness: 445, 
    p2Vangle: 60.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-34 Obr. 1940 / 1941 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 45, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-34 Obr. 1942 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 53, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-34E Turret Front:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 16, 
    p1Hardness: 445, 
    p1Vangle: 25.0, 
    p1Langle: 47.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 45, 
    p2Hardness: 445, 
    p2Vangle: 0.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-34-85 Obr. 1943 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 54, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-34-85 Obr. 1944 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 90, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("KV-1 Obr. 1939 / 1940 / KV-1S / KV-85 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 75, 
    p1Hardness: 280, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("KV-1 Obr. 1941 / 1942 / KV-1E Obr. 1940 / 1941 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 25, 
    p1Hardness: 445, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 75,
    p2Hardness: 280, 
    p2Vangle: 30.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("KV-1 Obr. 1939 / 1940 / KV-1E Obr. 1940 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 75, 
    p1Hardness: 280, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("KV-1S Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 82, 
    p1Hardness: 320, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("KV-1 Obr. 1941 / KV-1E Obr. 1941 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 90, 
    p1Hardness: 320, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("KV-1 Obr. 1942 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 105, 
    p1Hardness: 320, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("IS-1 / IS-2 Obr. 1943 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 120, 
    p1Hardness: 445, 
    p1Vangle: 30.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("IS-2 Obr. 1944 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 100, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("IS-2 Obr. 1944 UZTM Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 90, 
    p1Hardness: 445, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("KV-85 / IS-1 / IS-2 Obr. 1943 / 1944 / 1944 UZTM Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 100, 
    p1Hardness: 445, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-44 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 90, 
    p1Hardness: 290, 
    p1Vangle: 62.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-44 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 120, 
    p1Hardness: 270, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-54 Obr. 1947 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 120, 
    p1Hardness: 290, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-54 Obr. 1949 / 1951 / T-55 / T-62 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 100, 
    p1Hardness: 290, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-54 Obr. 1947 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 200, 
    p1Hardness: 270, 
    p1Vangle: 24.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-54 Obr. 1949 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 200, 
    p1Hardness: 270, 
    p1Vangle: 25.0, 
    p1Langle: 27.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-54 Obr. 1951 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 200, 
    p1Hardness: 270, 
    p1Vangle: 34.0, 
    p1Langle: 27.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-55 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 200, 
    p1Hardness: 259, 
    p1Vangle: 34.0, 
    p1Langle: 27.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-62 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 214, 
    p1Hardness: 259, 
    p1Vangle: 33.0, 
    p1Langle: 30.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("IS-3 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 110, 
    p1Hardness: 290, 
    p1Vangle: 56.0, 
    p1Langle: 30.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("IS-3 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 249.0, 
    p1Hardness: 270, 
    p1Vangle: 15.0, 
    p1Langle: 40.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("IS-4 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 140, 
    p1Hardness: 290, 
    p1Vangle: 61.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("IS-4 Turret Front:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 170.0, 
    p1Hardness: 270, 
    p1Vangle: 26.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "large",
    
    p2Type: "cha", 
    p2Thickness: 250.0, 
    p2Hardness: 270, 
    p2Vangle: 26.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-10A / T-10B / T-10M Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 120, 
    p1Hardness: 290, 
    p1Vangle: 55.0, 
    p1Langle: 40.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-10A / T-10B Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 250.0, 
    p1Hardness: 270, 
    p1Vangle: 15.0, 
    p1Langle: 40.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("T-10M Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 200.0, 
    p1Hardness: 270, 
    p1Vangle: 24.0, 
    p1Langle: 48.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M13/40 / M14/41 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 30.0, 
    p1Hardness: 245, 
    p1Vangle: 11.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M15/42 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 42.0, 
    p1Hardness: 210, 
    p1Vangle: 12.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M13/40 / M14/41 / M15/42 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 40.0, 
    p1Hardness: 210, 
    p1Vangle: 16.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("M13/40 / M14/41 / M15/42 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 40.0, 
    p1Hardness: 210, 
    p1Vangle: 16.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "medium",
    
    p2Type: "cha", 
    p2Thickness: 30.0, 
    p2Hardness: 245, 
    p2Vangle: 16.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "medium",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("P40 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 50.0, 
    p1Hardness: 210, 
    p1Vangle: 45.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("P40 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 50.0, 
    p1Hardness: 210, 
    p1Vangle: 20.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("P40 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "rha", 
    p1Thickness: 48.0, 
    p1Hardness: 210, 
    p1Vangle: 17.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 48.0, 
    p2Hardness: 210, 
    p2Vangle: 30.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Semovente M43 da 75/46 Superstructure Front:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 25.0, 
    p1Hardness: 245, 
    p1Vangle: 25.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    p2Type: "rha", 
    p2Thickness: 75.0, 
    p2Hardness: 210, 
    p2Vangle: 5.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("OF-40 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 70, 
    p1Hardness: 260, 
    p1Vangle: 68.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("OF-40 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "rha", 
    p1Thickness: 30.0, 
    p1Hardness: 260, 
    p1Vangle: 58.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "rha", 
    p2Thickness: 45.0, 
    p2Hardness: 260, 
    p2Vangle: 32.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    p3Type: "rha", 
    p3Thickness: 45.0, 
    p3Hardness: 260, 
    p3Vangle: 32.0, 
    p3Langle: 0.0, 
    p3Flaw: "noFlaws",
    p3Edge: "none",
    
    p4Type: "cha", 
    p4Thickness: 34.0, 
    p4Hardness: 260, 
    p4Vangle: 0.0, 
    p4Langle: 0.0, 
    p4Flaw: "noFlaws",
    p4Edge: "none",
    
    p5Type: "cha", 
    p5Thickness: 34.0, 
    p5Hardness: 260, 
    p5Vangle: 0.0, 
    p5Langle: 0.0, 
    p5Flaw: "noFlaws",
    p5Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Pz. 58 / 61 / 68 Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 120, 
    p1Hardness: 260, 
    p1Vangle: 36.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Pz. 58 / 61 / 68 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 65, 
    p1Hardness: 260, 
    p1Vangle: 54.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Pz. 58 / 61 / 68 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 65, 
    p1Hardness: 260, 
    p1Vangle: 65.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Pz. 58 / 61 / 68 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Laminated",
    p1Type: "cha", 
    p1Thickness: 120, 
    p1Hardness: 260, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 120, 
    p2Hardness: 260, 
    p2Vangle: 11.0, 
    p2Langle: 0.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Type 61 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 45, 
    p1Hardness: 260, 
    p1Vangle: 60.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Type 61 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 125.0, 
    p1Hardness: 260, 
    p1Vangle: 0.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Type 74 Middle Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 80, 
    p1Hardness: 260, 
    p1Vangle: 64.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Type 74 Upper Hull Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "rha", 
    p1Thickness: 40, 
    p1Hardness: 260, 
    p1Vangle: 73.0, 
    p1Langle: 0.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Type 74 Turret Front:")
evaluateArmorHit({
    arrangementName: "Single Plate",
    p1Type: "cha", 
    p1Thickness: 132, 
    p1Hardness: 260, 
    p1Vangle: 28.0, 
    p1Langle: 40.0, 
    p1Flaw: "noFlaws",
    p1Edge: "none",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})

title("Type 74 Gun Mantlet:")
evaluateArmorHit({
    arrangementName: "Spaced",
    p1Type: "cha", 
    p1Thickness: 116.0, 
    p1Hardness: 260, 
    p1Vangle: 39.0, 
    p1Langle: 30.0, 
    p1Flaw: "noFlaws",
    p1Edge: "small",
    
    p2Type: "cha", 
    p2Thickness: 50.0, 
    p2Hardness: 260, 
    p2Vangle: 39.0, 
    p2Langle: 30.0, 
    p2Flaw: "noFlaws",
    p2Edge: "small",
    
    shellType: "apcbc", 
    shellDiameter: 75,
    capType: "type1"
})


  }

  if (typeof module !== "undefined" && module.exports) module.exports = { build };
  else root.ArmorData = { build };
})(typeof globalThis !== "undefined" ? globalThis : this);
