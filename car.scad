/*
Example creation

Notes:
- F5 to update preview
- end command with ;
*/

// define tolerance to help overlap parts to connect them
tol=0.5;

// define car body
body_length=80;
body_width=20;
body_height=10;
color("blue", alpha=0.5)
cube([body_length, body_width, body_height], center=true);
  
// using tol to attach top to body
top_length=20;
top_width=body_width-2;
top_height=10;
// object center=true so translation will be relative to center of object
translate([5,0,10-tol])
color("yellow", alpha=0.5)
   cube([top_length, top_width, top_height+tol], center=true); 
   
// create wheel object
wheel_width=3;
wheel_radius=8;
module wheel()
{rotate([90,0,0])
  color("black")
  cylinder(h=wheel_width,r=wheel_radius, center=true);
}

// add wheels
front_dist_from_front=10;
back_dist_from_back=10;
bodysep=1;
// front left
translate([-(body_length/2-front_dist_from_front),-body_width/2-wheel_width/2-bodysep,0])
    wheel();
// front right
translate([-(body_length/2-front_dist_from_front), body_width/2+wheel_width/2+bodysep,0])
    wheel();
// back left
translate([ (body_length/2-front_dist_from_front),-body_width/2-wheel_width/2-bodysep,0])
    wheel();
// back right
translate([ (body_length/2-front_dist_from_front), body_width/2+wheel_width/2+bodysep,0])
    wheel();
