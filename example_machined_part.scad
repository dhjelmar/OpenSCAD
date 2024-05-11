width = 98;
depth = 31;
height = 25;
thickness = 2;
finger_d = 20;
// define tolerance for creating hole size to avoid rendering issues
// try with tol=0 to see rendering issues
tol=0.001;

well_depth = depth - 2*thickness;
small_width = depth - thickness;
large_width = width - small_width - 3*thickness;

$fn = 100;

module hole(){
  // created a hole a bit thicker than the wall to avoid rendering issues
  // created on center so translation is for center
  rotate([-90,0,0])
  cylinder(d=finger_d, h=thickness+tol, center=true);
}

difference() {
  // Main body
  cube([width, depth, height]); 
  
  // Small well
  translate([thickness, thickness, thickness])
    cube([small_width, well_depth, height]);
  
  // Large well
  translate([depth+thickness, thickness, thickness])
    cube([large_width, well_depth, height]);
   
  // Small well finger cutout
  translate([thickness+small_width/2, thickness/2, height])
    hole();
  
  // Large well finger cutout
  translate([width-thickness-large_width/2, thickness/2, height])
    hole();
}
