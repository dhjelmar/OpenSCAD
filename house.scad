// set a few tolerances
$fa = 0.05;     // angle between facets
$fs = 0.05;     // facet length


// define module that can be used to construct house object
module house(roof="flat", paint=[1,0,0]){
    color(paint)
    if(roof=="flat"){
        translate([0.5,-0.5,0.5])
        cube(center=true);
    }else if( roof=="pitched"){
       rotate([90,0,0])
       linear_extrude(height=1)
       polygon(points=[[0,0],[0,1],[0.5,1.5],[1,1],[1,0]],paths=[ [0,1,2,3,4] ]);
    }else if(roof=="domical"){
       translate([0.5,-0.5,0.5])
         union(){
            translate([0,0,0.5]) 
              sphere(r=0.5);
            //cube();
            cylinder(h=1,r=0.5,center=true);
            }
        }
    }

difference() { union() {
  // Added stuff

  // construct house object with default flat roof
  house();

  // construct another house object with pitched roof
  translate([1.2,0,0])
    house(roof="pitched", paint=[0,1,0]);
    
  // construct a yurt
  translate([2.5,0,0])
    house("domical", [0,0,1]);

    
} union() {
  // Subtracted stuff
    
  translate([1,-0.5,0.5])
    rotate([0,90,0])
    cylinder(h=5, r=0.2, center=true);
    
}}