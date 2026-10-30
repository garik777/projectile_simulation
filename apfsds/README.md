# APFSDS vs Armor Protection Calculator

A small web page that answers one question: **can a given tank round get through a given piece of armor?**

It is a JavaScript version of an original Swift program. No installation or server is needed.

## What it does

You choose three things:

1. **An armor array**: a tank's front plate, turret front, etc. (254 are included).
2. **A tank round**: an armor-piercing "dart" round fired from a tank gun (103 are included).
3. **A distance** in kilometres.

The calculator works out how much armor the round can punch through at that distance, and how much protection the armor offers. It then gives one of three verdicts:

| Verdict | Meaning |
|---|---|
| **Full penetration** | The round gets through. |
| **Partial penetration** | The armor holds, but only just. |
| **No penetration** | The armor holds comfortably. |

Results are shown as a short report, plus a table of the armor's layers. A second feature tests the chosen round against *every* armor at once, in a table you can sort and filter.

## How to use it

Open `index.html` in any web browser, pick an armor and a round, enter a distance and press **Calculate**. To compare against all armors, press **Test all armors**.

## What's in this folder

| File | Purpose |
|---|---|
| `index.html` | The web page you open and interact with. |
| `apfsds.js` | The calculations: how far a round penetrates, how much protection the armor gives, and the final verdict. |
| `apfsds-data.js` | The library of armors and rounds. It's a large file, but it is only a list of figures. |

## References

- W. Lanz and W. Odermatt, *Penetration Limits of Conventional Large Caliber Anti Tank Guns / Kinetic Energy Projectiles*, 13th International Symposium on Ballistics, Stockholm, 1992.


## Good to know

- The data and formulas were converted directly from the original Swift code.
- The numbers are estimates from simplified formulas. Treat them as a comparison tool, not a precise prediction.
