nominal_size=11;
step=0.1;
steps_down=2;
steps_up=2;


height=20;
text_depth=1;
margin=.01;
$fn=30;

spacing=nominal_size+5;

min_size=nominal_size-steps_down*step;
max_size=nominal_size+steps_up*step;
sizes=[for (i=[min_size : step : max_size+margin]) i]; //extra on max side is required due to some weird inclusivity thing that only shows up with short vectors 
echo(min_size);
echo(max_size);
echo(sizes);


for(i=[0:steps_up+steps_down]){
    translate([0,spacing*(i),0]){
        difference(){
            translate([3,0,height/2]){
                cube([nominal_size+15, nominal_size+6, height],center=true);}
            union(){
                cylinder(height+margin,d=sizes[i]);
                translate([nominal_size/2+5,0,height-text_depth+margin]){ 
                    rotate(90){
                    linear_extrude(text_depth){
                        text(str(sizes[i]), size=5, valign="center", halign="center"  );
                    }
            }}}
        }}
    }