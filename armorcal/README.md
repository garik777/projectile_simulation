# Tank Armor Effectiveness Calculator

A small web page that answers one question: **how well does a tank's armor stand up to a given anti-tank shell?**

It covers steel tank armor from the interwar years up to the mid-1970s. It is a JavaScript version of an original Swift program. No installation or server is needed.

## What it does

You describe:

1. **The armor**: one to six steel plates. For each plate you give the type of steel, thickness, hardness, the angles the shot arrives at, and how flawed the plate is. You can also say how close to a plate edge or weak point the shot lands.
2. **How the plates are arranged**:
   - **Single plate**
   - **Laminated**: two plates joined together
   - **Triple laminated**: three plates joined together
   - **Spaced**: two or more plates with gaps between them
3. **The shell**: its type, size and, for some types, extra details such as its inner core or cap.

The calculator gives one number: the **effective thickness** in millimetres. This is how much plain, flat steel armor would resist the shell as well as your arrangement does. A bigger number means better protection.

## How to use it

Open `index.html` in any web browser. The page starts with an example already filled in, so you can press **Calculate** straight away.

- **Try your own armor**: change any value, add or remove plates, and press **Calculate**.
- **Use a ready-made tank**: pick one from the preset list (about 180 tanks from the 1930s to the 1970s, such as Shermans, Panzers and Stuarts) and press **Load into form**.
- **Compare everything**: press **Run all presets** to see every preset in one sortable, filterable table.

The presets are all tested against a 75mm armor-piercing shell, which almost every major country used in World War II. The original author notes this is a convenient yardstick, but some tanks are well above or below what that shell can handle.

## What's in this folder

| File | Purpose |
|---|---|
| `index.html` | The web page you open and interact with. |
| `armorcalc.js` | The calculations: how each plate resists the shell, and how plates combine. |
| `armor-data.js` | The library of about 180 ready-made tank armor examples. |

## References

The original Swift code lists these sources for its formulas and data:

- *Principles of Armor Protection*: https://apps.dtic.mil/sti/tr/pdf/AD0492002.pdf
- *WW2 Gunnery: Armor and Ballistics* by Lorrin Bird and Robert Livingston: https://www.scribd.com/doc/219173969/WWII-Ballistics-Armor-and-Gunnery
- *Guns vs. Armour 1939 to 1945*: https://amizaur.prv.pl/www.wargamer.org/GvA/index.html
- *Decapping Revisited* by Nathan Okun: http://www.navweaps.com/index_tech/tech-085.php
- *TM 9-1907 Ballistic Data Performance of Ammunition*: https://archive.org/details/TM91907BalisticDataPreformaceOfAmmunition/mode/2up

The original author adds that there are probably a few more sources that were not listed.

## Good to know

- The data and formulas were converted directly from the original Swift code.
- The numbers are estimates from simplified formulas. Treat them as a comparison tool, not a precise prediction.
