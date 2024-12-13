// OpenSCAD is unitless, but most 3D printers default to mm.

$fn=200;

use <bounding_box.scad>;

//funnel
//import("../COPIED/Staresso/Staresso_funnel/files/Staresso_Trichter.stl", convexity=5);

//press
//import("../COPIED/Staresso/Staresso_Loffel/files/Staresso_Löffel.stl", convexity=5);

//stand
//import("../COPIED/Staresso/Staresso_stand/files/STARESSO_stand_.stl", convexity=5);

//###########################################################
//###########################################################
// first cup adapter design

module cup_adapter() {
    // cup adapter
    // https://www.thingiverse.com/thing:6205809
    // need to check diameter against mine so make sure it was designed for the same model
    import("../COPIED/Staresso/Staresso_adapter/files/Staresso_Tassenadapter.stl", convexity=5);
}

//cup_adapter();

/*
// figure out thickness

// automatically create box around cup_adapter (no dimensions available when done)
%bbox() cup_adapter();

// guess box dimensions 
xbox=22.85;
ybox=33.3*2;
zbox=125;
translate([xbox/2+13.9,0,zbox/2])
#color("blue")
cube([xbox, ybox, zbox], center=true);

// guess diameter of hole
d=53.2;
x=d*sin(45);
//color("red") translate([30,0,h/2]) sphere(d=d, center=true);
color("red") translate([30,0,zbox/2]) cube([x,x,x], center=true);
*/

//###########################################################
//###########################################################
// 2nd cup adapter design

// add to thickness by slicing, translating and using hull to fill the gap
module original() {
    //import("../COPIED/Staresso/Staresso_cup_adapter/files/base.stl");
    //import("../COPIED/Staresso/Staresso_cup_adapter/files/base_fixed_in_meshlab.stl");
    // problem with both of the models above fixed here:
    // https://www.formware.co/onlinestlrepair
    import("../COPIED/Staresso/Staresso_cup_adapter/files/base_fixed.stl");

}

module check_holes(){
    original();
    dinner=37;
    xinner=dinner*sin(45);
    #color("red") cube(size=xinner,center=true);
    douter=43;
    xouter=douter*sin(45);
    #color("red") cube(size=xouter,center=true);
}
//check_holes();

// determine dimensions
module vertical_bar(base=[0,0,0], height=1, color="blue"){
    color(color) translate(base+[0,0,height/2]) cube([1,1,height], center=true);
}
// started with guesses and iterated until check_height bar looked right
top_of_cup = 0.19;       // location of bottom flat surface
thick = 2.8;             // original thickness
//original();
//vertical_bar([40,0,top_of_cup], thick, "red");
echo("top_of_cup=", top_of_cup, "mm");
echo("original thickness =", thick, "mm =", thick/25.4, "in");

module check_thickness(){    
    original();
    color("green") translate([40,0,top_of_cup]) cube([3,3,thick], center=true);
}
// check_thickness();


//########################################
//# define modification parameters in mm #
// guess at position of cutplane to find location just below top radius of top surface
cutplane = top_of_cup + thick - 1;
//original();
//#translate([0,0,cutplane]) cylinder(h=0.001, r=60, center=true);
odcup = 3.5 * 25.4;                    // OD of cup to use adapter on
//final_thickness = 2.8;               // original
//final_thickness = 2.9;               // modified
final_thickness = 0.2 * 25.4;          // modified
tol = 0.001;                           // to provide some overlap

// calculations for later use
scale_diam = odcup / (3.25 * 25.4);
separate = final_thickness - thick;

//########################################
// scale original to increase outer but not innner diameter

module outer_ring(){
    render() difference(){
        original();
        cylinder(h=100, r=30, center=true);
    }
}
//outer_ring();

module flat(){
    render() 
    intersection(){
        difference(){
            original();
            cylinder(h=100, r=29, center=true);
        }   
        cylinder(h=100, r=40, center=true);
    }
}

module inner_ring(){
    render() intersection(){
        original();
        cylinder(h=100, r=32, center=true);
    }
}
//inner_ring();

module wider(){
    scale([scale_diam, scale_diam, 1]) outer_ring();
    color("red") flat();
    inner_ring();
}
//wider();


//########################################
// split top from bottom and add filler to create specified thickness

//wider();
//hcyl=10;
//#translate([0,0,cutplane-hcyl]) cylinder(h=hcyl,r=50);
module top() {
    difference() {
        // add original
        wider();
        // cut 
        hcyl=10;
        translate([0,0,cutplane-hcyl]) cylinder(h=hcyl,r=50);
    }
}

//wider();
//#translate([0,0,cutplane]) cylinder(h=10,r=50);
module bottom() {
    difference() {
        // add original
        wider();
        // cut 
        translate([0,0,cutplane]) cylinder(h=10,r=50);
    }
}


//wider();
//translate([0,0,cutplane]) cylinder(h=0.001,r=50);
module filler(){
    // shift down to cutplane
    // create 2D projection at z=0 with cut=true
    // extrude in z direction
    linear_extrude(height=separate+2*tol)
    projection(cut=true) 
    translate([0,0,-cutplane-tol]) wider(); 
}


//########################################
// put it together

// use render to get rid of image weirdness
module thicker_cup_adapter(){
    translate([0,0,separate]) top();
    color("blue") translate([0,0,cutplane]) filler();
    bottom();
}
//thicker_cup_adapter();
thicker_cup_adapter();
//render() thicker_cup_adapter();

// check on final dimensions
//vertical_bar([40,0,top_of_cup], final_thickness, "red");
echo("final    thickness =", final_thickness, "mm =", final_thickness/25.4, "in");
tower_height = 0.35* 25.4;
//vertical_bar([25,0,top_of_cup+final_thickness], tower_height, "red");
echo("tower height       =", tower_height, "mm =", tower_height/25.4, "in");


//###########################################################
// check cup size
//hcup = .001;
//color("green") translate([0,0,top_of_cup - hcup/2 -2]) cylinder(h=hcup, d=odcup, center=true);
    