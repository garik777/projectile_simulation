# Naval Ballistics & Armor Calculator

A small web page that answers one question: **would a battleship's shell get through a warship's armor?**

It is a JavaScript version of an original Swift program. No installation or server is needed.

## What it does

You choose:

1. **A shell**: a naval gun shell, such as a 16-inch armor-piercing round (9 are included).
2. **A range** in yards.
3. **The ship's armor**, made up of:
   - **Deck layers**: the horizontal armor that shells land on when fired from long range.
   - **Side armor**: an outer hull, optional inner bulkheads, and a thick main belt.

The calculator first works out how fast the shell is travelling when it arrives, and at what angle it comes down. It then works out how much each armor layer can resist. Finally it combines the layers and tells you whether the deck and the side armor **held** or were **defeated**.

## How to use it

Open `index.html` in any web browser. The page starts filled in with an example ship, so you can press **Calculate** straight away. You can then change the shell, range or any armor layer, add or remove layers, and calculate again. **Reset to defaults** restores the example.

The report lists how thick each layer is in "effective" terms, the total for the deck and for the side, and the final held-or-defeated result for each.

## What's in this folder

| File | Purpose |
|---|---|
| `index.html` | The web page you open and interact with. |
| `facehard.js` | The calculations: the shell's flight, the armor's resistance, and the final result. It also holds the lists of shells and armor types. |

## Good to know

- The data and formulas were converted directly from the original Swift code.
- One armor type ("Crazy-Quilt") is chosen at random each time you calculate, so repeated runs with it can give slightly different answers.
- The numbers are estimates from simplified formulas. Treat them as a comparison tool, not a precise prediction.
