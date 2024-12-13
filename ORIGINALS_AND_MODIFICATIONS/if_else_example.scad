// study on if else

$fn = 200;

circle = true;
color = "green";
if (circle)
   #color(color) circle(r);
else if (! circle) AND (color=="red")
   #color("red") square(r, center=true);
else
   #color(color) square(r, center=true);

// following does not work because can only assign values after equals or within {}
// and values are not available outside {}
r=1;
quadrant = 1;
if (quadrant==1) {
  loc1 = [r/2, r/2, 0];}
else if (quadrant==2) {
  loc1 = [-r/2, r/2, 0];}
else if (quadrant==3) {
  loc1 = [-r/2, -r/2, 0];}
else {
  loc1 = [r/2, -r/2, 0];}
echo("loc1 =", loc1, "; quadrant =", quadrant);       // result is undefined
// interestingly, the above quadrant gets interpretted as 3 from its last definition

// nested if example (pain in the neck)
// c = a > b ? b-w : (a < b ? a-w : a-w);
quadrant = 2;
loc2 = quadrant==1 ? [r/2, r/2, 0] : (quadrant==2 ? [-r/2, r/2, 0] : (quadrant==3 ? [-r/2, -r/2, 0] : [r/2, -r/2, 0]));
color("yellow") translate(loc2) circle(r);
echo("loc2 =", loc2, "; quadrant =", quadrant);
// Odd behavior: If comment out quadrant=3, the circle goes in quadrant 2 as specified, but setting it to 3 below affects everywhere regardless of position in the code. Must assign all values before running logic.

// or can write it out so it is easier to understand
quadrant = 3;
loc3 = quadrant==1 ? [2*r, 2*r, 0]
  //else if
  : (quadrant==2 ? [-2*r, 2*r, 0]
     //else if
     : (quadrant==3 ? [-2*r, -2*r, 0]
	//else
	: [2*r, -2*r, 0]));
color("blue") translate(loc3) circle(r);
echo("loc3 =", loc3, "; quadrant =", quadrant);

