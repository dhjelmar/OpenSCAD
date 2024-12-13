$fn=200;
module cup_adapter() {
    // cup adapter
    // https://www.thingiverse.com/thing:6205809
    // need to check diameter against mine so make sure it was designed for the same model
    import("../COPIED/Staresso/Staresso_adapter/files/Staresso_Tassenadapter.stl", convexity=5);
}
//#translate([0,-60,-15]) rotate([0,-90,-90]) cup_adapter();

module modified_cup_adapter() {
    // https://www.formware.co/onlinestlrepair
    import("staresso_cup_adapter_0.2thick_3.5cup.stl");
}

module original() {
    // https://www.formware.co/onlinestlrepair
    import("../COPIED/Staresso/Staresso_cup_adapter/files/base_fixed.stl");
}
//#color("blue") modified_cup_adapter();
//color("green") original();

// grab cross-section
module old_cross_section(){
    intersection(){
        // positive x-axis
        translate([60/2,0,0]) cube([60,60,10], center=true);
        // cross-section in +/- x-axis
        projection(cut=true)
        rotate([-90,0,0]) 
        modified_cup_adapter();
    }
}
//old_cross_section();

//#########################################################
// my cup adapter

// set dimensions (mm)
// tolerance
tol = 0.5;
// fillets
fr = 2;
// center stack above disk
stack_ro = (1.635 * 25.4 - tol)/2; // outer radius  CRITICAL DIMENSION
stack_t = 0.15 * 25.4;             // stack thickness
stack_ri = stack_ro - stack_t;  // inner radius
stack_h = 0.33 * 25.4 + tol + fr;  // height above disk
// inner foot below stack
foot_ri = stack_ri;
foot_rou = foot_ri + 0.25 * 25.4;   // outer radius of upper part of foot
foot_rol = foot_ri + 0.15 * 25.4;   // outer radius of lower part of foot
foot_h = 0.1 * 25.4; // distance below disk
// outer rim (height is the same as for the foot)
rim_tu = 0.15* 25.4;                // upper thickness of rim
rim_tl = 0.2 * 25.4;                // lower thickness of rim
// disk
cup_r = 3.5/2 * 25.4;     // flat region to sit on top of cup
disk_t = 0.25 * 25.4;

// calculated dimensions
disk_ru = cup_r + fr + rim_tu;    // outer diameter at top
disk_rlo = cup_r + fr + rim_tl;   // outer diameter at bottom
disk_rli = max(cup_r + fr, disk_rlo - rim_tu);   // inner diameter at bottom

// https://github.com/Irev-Dev/Round-Anything
include <../../OpenSCAD_Round-Anything/polyround.scad>

// create cross-section
// consider the base to be at z=0
module cross_section(){
    // points = [x, y, radius]
    pointA = [foot_ri, 0, fr];
    pointB = [stack_ri, foot_h + disk_t + stack_h, 0];
    pointC = [stack_ro, foot_h + disk_t + stack_h, 0];
    pointD = [stack_ro, foot_h + disk_t, fr];
    pointF = [disk_ru, foot_h + disk_t, fr];
    pointG = [disk_rlo, 0, fr];
    //pointH = [cup_r + fr, 0, fr];
    pointH = [disk_rli, 0, fr];
    pointI = [cup_r + fr, foot_h, fr];
    pointK = [foot_rou, foot_h, fr];
    pointM = [foot_rol, 0, fr];
    echo("pointA=",pointA);
    echo("pointB=",pointB);
    echo("pointC=",pointC);
    difference(){
        polygon(polyRound([pointA, pointB, pointC, pointD, pointF, pointG,
                           pointH, pointI, pointK, pointM], 10));
        // subtract chamfers
        translate(pointB) rotate([0,0,45]) square(0.5,center=true);
        translate(pointC) rotate([0,0,45]) square(0.5,center=true);
    }
}
//cross_section();
//rotate([90,0,0]) cross_section();

module my_cup_adapter() {
    // openSCAD rotates the xy plane about the z-axis
    rotate_extrude(angle=360) cross_section();
}
//my_cup_adapter();


module my_cup_adapter_stl() {
    // https://www.formware.co/onlinestlrepair
    import("staresso_v2.stl");
}
my_cup_adapter_stl();

//#############################################################
// checks

// staresso
module staresso(){
    tol=0.015;   // in
    depth = 0.358 + 0.002; // in
    //tol=0;
    #translate([0,0,foot_h+disk_t+stack_h-depth*25.4])
    rotate([90,0,0]) 
    color("red")
    polygon(points=[[1.635/2+tol,0],
                    [1.635/2+tol,depth], 
                    [1.49/2,depth], 
                    [1.49/2,0.5], 
                    [1.99/2,0.5], 
                    [1.959/2,0]]*25.4); 
}
//staresso();

// cup
//color("red") cylinder(h=10, r=cup_r, center=true);

// determine dimensions
module vertical_bar(base=[0,0,0], height=1, color="blue"){
    color(color) translate(base+[0,0,height/2]) cube([1,1,height], center=true);
}
//vertical_bar([0,0,0], 0.9*25.4, "blue");
