# Armor & Ballistics Calculators

A set of three small web calculators that estimate how well armor stands up to different kinds of shells. Each one is a JavaScript and HTML version of an original Swift program. They run in any web browser with no installation or server.

## The three calculators

| Folder | Question it answers | Era and subject |
|---|---|---|
| [`apfsds/`](./apfsds) | Can a modern tank round get through a given piece of armor? | Modern tanks and long-rod penetrator rounds |
| [`armorcal/`](./armorcal) | How well does a tank's steel armor resist a given shell? | Tanks from the 1930s to the 1970s |
| [`facehard/`](./facehard) | Would a battleship's shell get through a warship's armor? | Naval guns and ship armor |

## How to use them

Each folder is self-contained. Open the `index.html` file in that folder in a web browser. Each page starts with an example filled in, so you can press **Calculate** straight away and then change the inputs.

## Where to find more

Each folder has its own `README.md` that explains what the calculator does, how to use it, what its files are, and what could be found about its sources. Start there for details.

## Good to know

- The data and formulas were converted directly from the original Swift code.
- The results are estimates from simplified formulas. Treat them as a comparison tool, not a precise prediction.
