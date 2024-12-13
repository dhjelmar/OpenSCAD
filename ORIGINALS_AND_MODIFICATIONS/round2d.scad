// example use
$fn = 200;
fr=1;
module mysketch(){
    pointA = [0,0];
    pointB = [0,10];
    pointC = [10,10];
    pointDa = [10,5+fr];
    pointDb = [10+fr,5];
    pointE = [20,5];
    pointF = [20,0];
    difference(){
        // create cross-section with extra material to round where needed
        polygon(points=[pointA, pointB, pointC, pointDa, pointDb, pointE, pointF]);
        // round C
        translate(pointC) round2d(fr, inner=false, quadrant=3);
        // round D
        translate(pointDa+[fr,0]) round2d(fr, inner=true, quadrant=3);
    }   
}
mysketch();

module round2d(r, inner=true, quadrant=1){
    // returns quater circle or inverse of quater circle in x-y plane
    // useful for rounding corners in a 2D sketch with difference()
    
    // r = radius to remove
    // inner = true (default) returns 1/4 circle of radius r
    //       = false returns inverse of 1/4 circle of radius r
    // quadrant = 1 (default) positive x, y
    //            2 negative x, positive y
    //            3 negative x, negative y
    //            4 positive x, negative y
    
    // nested if example (pain in the neck)
    // c = a > b ? b-w : (a < b ? a-w : a-w);
    loc = quadrant==1 ? [r/2, r/2, 0] : (quadrant==2 ? [-r/2, r/2, 0] : (quadrant==3 ? [-r/2, -r/2, 0] : [r/2, -r/2, 0]));

    if (inner==true)
        intersection(){
            // leaves quarter circle to use for cutting
            circle(r);
            translate(loc) square(r, center=true);
        }   
    else
        difference(){
            translate(loc) square(r, center=true);
            translate(2*loc) circle(r);
        }
 }
