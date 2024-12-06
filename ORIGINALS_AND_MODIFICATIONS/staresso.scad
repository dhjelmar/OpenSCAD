// OpenSCAD is unitless, but most 3D printers default to mm.

$fn=100;

//funnel
//import("../COPIED/Staresso/Staresso_funnel/files/Staresso_Trichter.stl", convexity=5);

//press
//import("../COPIED/Staresso/Staresso_Loffel/files/Staresso_Löffel.stl", convexity=5);

//stand
//import("../COPIED/Staresso/Staresso_stand/files/STARESSO_stand_.stl", convexity=5);

// cup adapter
// https://www.thingiverse.com/thing:6205809
// need to check diameter against mine so make sure it was designed for the same model
import("../COPIED/Staresso/Staresso_adapter/files/Staresso_Tassenadapter.stl", convexity=5);

color("red") translate([30,0,62.5]) sphere(d=53.5, center=true);

//import("../COPIED/Staresso/Staresso_cup_adapter/files/base.stl");
//color("red") cube(size=5,center=false);
//color("red") translate([24,0,2.5]) sphere(d=1, center=true);
//#color("blue") translate([0,0,12]) cylinder(h=5, d=42, center=false);
