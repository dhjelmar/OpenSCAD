// https://github.com/Irev-Dev/Round-Anything
include <../../OpenSCAD_Round-Anything/polyround.scad>
polygon(polyRound([
  [0, 0, 0],
  [10,0, 1],
  [0, 10,0]
],10));
