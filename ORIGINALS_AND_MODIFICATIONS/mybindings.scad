// Credit to: https://www.printables.com/model/300217-3d-ski-binding-jig

//Use this file to  make or modify an existing template. This is the easiest way to modify drill size to you liking for a standard template, or use to tweak the width of the arms for a tighter fit if needed. 
//Uncomment a specific pattern, and then modify any necessary parameters in the primary or secondary parameters section. 

//FORMAT: [(unused),[[holes],[holes],[holes],[holes]], toe/heel/pin line x, nominal length, nominal width, nominal pattern shift, arrow adjust pos, config, label];
//For script output make sure there is one template uncommented to initiate the variable

//--- dlh bindings---

//Voile TTS Transit DIMENSIONS NOT CORRECT YET
// I believe units assumed to be mm for STL files for 3D printer
x1=0;
x2=25;
x3=60;
x4=85;
dy=x2;
xpin=(x3+x4)/2;
templ_length=x4+40;
templ_width=dy*2.25;
pattern_shift=30;    // just shifts pattern on the template
templ_arrow=30;
hole1R=[x1, -dy/2, 0];
hole1L=[x1,  dy/2, 0];
hole2R=[x2, -dy/2, 0];
hole2L=[x2,  dy/2, 0];
hole3R=[x3, -dy/2, 0];
hole3L=[x3,  dy/2, 0];
hole4R=[x4, -dy/2, 0];
hole4L=[x4,  dy/2, 0];
type = "pin_toe";     // turns on or off features for toe stop, heel stop, or pins | options: "toe", "heel", "pin", "pin_toe" (pin and toe stop features), or "none".
template=[0,[hole1L,hole1R,hole2L,hole2R,hole3L,hole3R,hole4L,hole4R],xpin,templ_length,templ_width,pattern_shift,templ_arrow,type,"Voile TTS Transit - Toe"];
//template=[0,[[25.4,0,0],[63.5,0,0]],0,110,30,-30,52,"heel","Voile TTS Transit - Heel"];


//---Tech Bindings---


//PLUM Toe [30 x 26.5], Source=mfg paper template
//template=[0,[[0,15,0],[0,-15,0],[26.5,15,0],[26.5,-15,0]],13.25,70,50,0,0,"pin","PLUM Toe [30 x 26.5]"];

//PLUM Toe [36 x 69], Source=mfg paper template
//template=[0,[[0,18,0],[0,-18,0],[69,18,0],[69,-18,0]],34.5,100,50,-4,0,"pin","PLUM Toe [36 x 69]"];

//PLUM R99 / R120 / R150, Source=mfg paper template
//template=[0,[[0,10.25,0],[0,-10.25,0],[26,10.25,0],[26,-10.25,0]],30.5,60,50,15,0,"tech_heel","PLUM R99 & R120 & R150 Heel"];

//PLUM R170 / OAZO, Source=mfg paper template
//template=[0,[[0,12.5,0],[0,-12.5,0],[55,12.5,0],[55,-12.5,0]],45,90,40,15,0,"tech_heel","PLUM R170 & OAZO Heel"];

//PLUM 40mm plate, Source=mfg paper template
//template=[0,[[0,12.5,0],[0,-12.5,0],[86,12.5,0],[86,-12.5,0]],60.5,120,40,15,0,"tech_heel","PLUM 40mm race plate"];

//PLUM Guide/WEPA/PIKA heel, Source=mfg paper template
//template=[0,[[0,18,0],[0,-18,0],[53,16,0],[53,-16,0]],46.65,80,50,16,0,"tech_heel","PLUM Guide WEPA PIKA Heel [32 x 53]"];

//PLUM Summit Heel [36 x 72], Source=mfg paper template
//template=[0,[[0,18,0],[0,-18,0],[72,18,0],[72,-18,0]],55.65,100,50,16,0,"tech_heel","PLUM Summit Heel [36 x 72]"];

//PLUM Yak, Source=mfg template
//template=[0,[[0,25,0],[0,-25,0],[50,25,0],[50,-25,0]],25,72,45,-4,0,"pin","PLUM Yak Toe"];
//template=[0,[[0,27.5,0],[0,-27.5,0],[58,27.5,0],[58,-27.5,0]],48.6,80,50,16,0,"tech_heel","PLUM Yak Heel"];

//22 Designs Telemark Bindings
//template=[0,[[0,19.05,0],[0,-19.05,0],[38.1,19.05,0],[38.1,-19.05,0],[76.2,19.05,0],[76.2,-19.05,0]],71.628,110,58,25,20,"toe","22 Designs Toe - Vice,Outlaw,Lynx"];
//template=[0,[[0,19.05,0],[0,-19.05,0],[38.1,19.05,0],[38.1,-19.05,0],[76.2,19.05,0],[76.2,-19.05,0]],63.628,102,58,20,20,"toe","22 Designs Toe - AXL"];
//template=[0,[[25.4,0,0],[63.5,0,0]],0,110,30,-30,52,"tech_heel","22 Designs Heel"];



binding_plate(template);



// ---------PRIMARY PARAMTERS---------
//HOLE SIZE
hole_diam=9.0; 
hole_chamfer=0.5;
hole_shoulder=1;//change this to zero if not using a sleeve/bushing

//template arms
arm_width=146.7; //adjust for small width difference in jig to make template a tight fit

//The following primary parameters are controlled by whichever template is uncommented above. If multiple it will be the last one. 
//CONFIGURATION
config=template[7]; //turns on or off features for toe stop, heel stop, or pins | options: "toe", "heel", "pin", "pin_toe" (pin and toe stop features), or "none". Something other than the listed option will result in no features (same as "none") 

//TEXT LABEL
label_text= template[8]; //MFG, model, heel/toe, etc

//BASE PLATFORM DIMENSIONS
length=template[3]; 
width=template[4];
shift_pattern=template[5]; //shift the entire pattern forwards or back to keep template small
arrow_x_adjust=template[6]; //move arrow forward or back as needed to avoid features


// ---------END PRIMARY PARAMTERS---------

//Secondary Paramters - Normally shouldn't need adjustment
$fn=30;


//body
ext_chamfer_size=-.75; //corner
lead_in_chamfer_size=1; //bottom
overlap=2;              // default was 1 but holes were not clean
height=20.3;
arm_length=12.7;
arm_radius=1;
center_mark_size=3;
int_chamfer_size=15; //internal corners between body and arms

//ref lines
ref_line_width=width-10;
ref_line_size=1;
ref_line_depth=.5;

//holes and z-seam clearance, shoulder at bottom of hole
clearance=.5;
clearance_angle=180;
shoulder_height=1*hole_shoulder; 
shoulder_rad=.3; //diference from larger hole size, not actual radius. 


//Toe
screw_size=4.5; //heel and toe
hex_size=7.8; //heel and toe
hex_depth=13; //heel and toe

stop_offset=.125*25.4; 
stop_width=9.91;
stop_length=16.13;
stop_depth=2.29; //heel and toe
stop_hole_shift=0; //hole to rect cut centered or not?

//Heel(most are similar to toe features)
h_stop_offset=.125*25.4;
h_stop_width=9.91;
h_stop_length=16.13;
h_stop_hole_shift=0; //hole to rect cut centered or not?

//pins
pin_x=shift_pattern;

bar_offset=38;
bar_width=4.78;
bar_hole_size=4.5;
hole_y=0;
hole_height=height/2;

notch_width=10.16;
notch_depth=3.18;
notch_boss=3;
bar_height=height;


//text
margin=2;
text_loc=[length/2-arm_length/2,0,height];

text_depth=.5;

L_loc=[-length/2+arm_length/2,arm_width/2-margin,height];
R_loc=[-length/2+arm_length/2,-(arm_width/2-margin),height];
arrow_symbol="↑";
arrow_size=25;
arrow_loc=[-length/2+arm_length/2+arrow_x_adjust,0,height];
text_size=5;

demo_loc=[0,+10,height];
demo_text="Demo Template";
demo_loc_l2=[0,-10,height];
demo_text_l2="Use Spacer";

module binding_plate (template){

// ---------SHAPES AND LOCATIONS---------
bar_hole=[pin_x,bar_offset,height];

toe=[1,0,0,1,0];
heel=[0,1,0,1,0];
pin=[0,0,1,0,0];
pin_toe=[1,0,1,1,0];
none=[0,0,0,0,0];
demo_toe=[1,0,0,1,1];
demo_heel=[0,1,0,1,1];

config_list=[toe, heel, pin, pin_toe, none, demo_toe,demo_heel];
config_set= (config=="toe") ? config_list[0]:(config=="heel") ? config_list[1]:(config=="tech_heel") ? config_list[1]: (config=="pin") ? config_list[2]:(config=="pin_toe") ? config_list[3]: (config=="demo_toe") ? config_list[5] : (config=="demo_heel") ? config_list[6]: config_list[4];


td=config_set[0]; //toe features on/off
hd=config_set[1]; //heel features on/off
pd=config_set[2]; //pin features on/off
rd=config_set[3]; //ref line on/off, used for heel and toe
dd=config_set[4]; //demo text on/off

shape=[
[length/2,arm_width/2,ext_chamfer_size],
[length/2,-arm_width/2,ext_chamfer_size],
[length/2-arm_length,-arm_width/2,ext_chamfer_size],
[length/2-arm_length,-width/2,int_chamfer_size],
[-(length/2-arm_length),-width/2,int_chamfer_size],
[-(length/2-arm_length),-arm_width/2,ext_chamfer_size],
[-length/2,-arm_width/2,ext_chamfer_size],
[-length/2,arm_width/2,ext_chamfer_size],
[-(length/2-arm_length),arm_width/2,ext_chamfer_size],
[-(length/2-arm_length),width/2,int_chamfer_size],
[(length/2-arm_length),width/2,int_chamfer_size],
[(length/2-arm_length),arm_width/2,ext_chamfer_size],
];

//heel and toe stop actuall positions
hole_forward=stop_length/2+stop_offset;
h_hole_forward=-h_stop_length/2-h_stop_offset;

// ---------MODELING---------
union(){
union(){
difference(){
    //base shape
    difference(){
        //center mark and base shape
        linear_extrude (height = height) chamfer_corners(shape);
        union(){
        translate([length/2,0,0])   
                rotate([0,0,45])
                cube([center_mark_size,center_mark_size,height*2.1],center=true);
        translate([-length/2,0,0])  
                rotate([0,0,-45])
                cube([center_mark_size,center_mark_size,height*2.1],center=true);
        translate([0,arm_width/2,0])  
                rotate([45,0,])
                cube([length,lead_in_chamfer_size*2,lead_in_chamfer_size*2],center=true);
        translate([0,-arm_width/2,0])  
                rotate([45,0,])
                cube([length,lead_in_chamfer_size*2,lead_in_chamfer_size*2],center=true);
            
    }}
    //holes and reference features
    translate([shift_pattern,0,0]){
        union (){
            translate([-template[2],0,0]) //negative to shift pattern backwards
                union(){
                    for (h=[0:len(template[1])-1])
                        echo(template[1][h])
                        hole_w_clearance (template[1][h],hole_diam/2,height,clearance,clearance_angle,hole_chamfer,overlap,shoulder_height, shoulder_rad);
                           }
//            //reference line
//            hull(){
//                translate([0,ref_line_width/2,height-ref_line_depth])cylinder(h=(ref_line_depth+overlap)*rd,r=ref_line_size/2);
//                translate([0,-ref_line_width/2,height-ref_line_depth])cylinder(h=(ref_line_depth+overlap)*rd,r=ref_line_size/2);
//            }
            //toe features
            ref_hole_center=[hole_forward,0,0]; 
            hex_hole (ref_hole_center,hex_size,screw_size,hex_depth*td,height*td,1,overlap*td);
            translate([ref_hole_center.x+stop_hole_shift,0,height-stop_depth/2]){
                cube([stop_length,stop_width,(stop_depth+overlap)*td],center=true);
            }
            //heel features
            h_ref_hole_center=[h_hole_forward,0,0]; 
            hex_hole (h_ref_hole_center,hex_size,screw_size,hex_depth*hd,height*hd,1,overlap*hd);
            translate([h_ref_hole_center.x+h_stop_hole_shift,0,height-stop_depth/2]){
            cube([h_stop_length,h_stop_width,(stop_depth+overlap)*hd],center=true);
            }}
        }}

 

 
 
//toe pin features
copy_mirror(vec=[0,1,0]){;
    translate([0,bar_offset,bar_height/2]){
        union(){
        difference(){
            cube([length,bar_width*pd, bar_height], center=true);
            translate([pin_x,0,hole_y/2]){    //center hole in main part of bar
                rotate([90,0,0])
                    cylinder(bar_width+2*overlap*pd,d=bar_hole_size,center=true);
                    translate([0,0,(height/2-notch_depth/2)])
                        cube([notch_width,bar_width+overlap,notch_depth+overlap],center=true);
        }}
            translate([pin_x,0,-height/2+bar_width/2])
                rotate([0,0,0])
                    for(e=[1,-1]){ 
                        bar_notch=[[e*(notch_width/2),0],[e*(notch_width/2),-(notch_depth+bar_width/2)],[e*(notch_width/2+notch_boss),-(notch_depth+bar_width/2)],[e*(notch_width/2+notch_boss+notch_depth),0]];    
                    linear_extrude(height=bar_width*pd,center=true) polygon(bar_notch);
}}}}    

//Text cuts
difference(){
union(){
translate(text_loc)
rotate([0,0,-90])
linear_extrude(text_depth*2,center=true) text(label_text,text_size,font="Arial:style=Bold",halign="center", valign="center");

translate(arrow_loc)
rotate([0,0,-90])
linear_extrude(text_depth*2,center=true) text(arrow_symbol,arrow_size,halign="center", valign="bottom");

translate(L_loc)
rotate([0,0,-90])
linear_extrude(text_depth*2,center=true) text("L",text_size,halign="left", valign="center");

translate(R_loc)
rotate([0,0,-90])
linear_extrude(text_depth*2,center=true) text("R",text_size,halign="right", valign="center");
    
translate(demo_loc)
rotate([0,0,0])
linear_extrude(text_depth*2*dd,center=true) text(demo_text,text_size,halign="center", valign="center");
    
translate(demo_loc_l2)
rotate([0,0,0])
linear_extrude(text_depth*2*dd,center=true) text(demo_text_l2,text_size,halign="center", valign="center"); 

 //reference line
  translate([shift_pattern,0,0]){
    hull(){
        translate([0,ref_line_width/2,height])cylinder(h=(ref_line_depth)*rd,r=ref_line_size/2);
        translate([0,-ref_line_width/2,height])cylinder(h=(ref_line_depth)*rd,r=ref_line_size/2);
            }}
            
//pin ref line
translate([pin_x,0,height]){
    hull(){
        translate([0,ref_line_width/2,0])cylinder(h=(ref_line_depth+overlap)*pd,r=ref_line_size/2,center=true);
        translate([0,-ref_line_width/2,0])cylinder(h=(ref_line_depth+overlap)*pd,r=ref_line_size/2,center=true);
 }}}
//clearnance around holes
translate([shift_pattern,0,0]){
        translate([-template[2],0,height-ref_line_depth]) //negative to shift pattern backwards, height to get on top
            union(){
                for (h=[0:len(template[1])-1])
                    translate(template[1][h]){
                        cylinder(h=ref_line_depth*3, d=hole_diam+2);}
                           }} 
}  
     
}}}

 




// ---------MODULES---------

//camfers 90 deg corners, with square rotated to 45deg. Use on 2d shapes only
// 3rd data point for size, +/- for internal vs external
module chamfer_corners(points){
    l=len(points);
    difference() {  
        union() {
            for (i=[0:l-1])
                if (points[i].z>0){
                    lastx= points[i-1].x==undef ? points[l-1].x:points[i-1].x;            
                    lasty= points[i-1].y==undef ? points[l-1].y:points[i-1].y;
                    nextx= points[i+1].x==undef ? points[0].x:points[i+1].x;
                    nexty= points[i+1].y==undef ? points[0].y:points[i+1].y;
                    
                    segment_length_last=((lastx-points[i].x)^2+(lasty-points[i].y)^2)^0.5;
                    segment_length_next=((nextx-points[i].x)^2+(nexty-points[i].y)^2)^0.5;

                    polygon([[points[i].x, points[i].y],
                    [points[i].x-(points[i].x-lastx)*abs(points[i].z)/segment_length_last,points[i].y-(points[i].y-lasty)*abs(points[i].z)/segment_length_last], //chamfer point on last segment
                    [points[i].x+(nextx-points[i].x)*abs(points[i].z)/segment_length_next,points[i].y+(nexty-points[i].y)*abs(points[i].z)/segment_length_next] //chamfer point on next segment
                    ]);
                    }   
               polygon([for(i=[0:l-1])[points[i].x,points[i].y]]);
                }
        union() {
            for (i=[0:l-1])            
                if (points[i].z<0){
                    lastx= points[i-1].x==undef ? points[l-1].x:points[i-1].x;            
                    lasty= points[i-1].y==undef ? points[l-1].y:points[i-1].y;
                    nextx= points[i+1].x==undef ? points[0].x:points[i+1].x;
                    nexty= points[i+1].y==undef ? points[0].y:points[i+1].y;
                    
                    segment_length_last=((lastx-points[i].x)^2+(lasty-points[i].y)^2)^0.5;
                    segment_length_next=((nextx-points[i].x)^2+(nexty-points[i].y)^2)^0.5;

                    polygon([[points[i].x, points[i].y],
                    [points[i].x-(points[i].x-lastx)*abs(points[i].z)/segment_length_last,points[i].y-(points[i].y-lasty)*abs(points[i].z)/segment_length_last], //chamfer point on last segment
                    [points[i].x+(nextx-points[i].x)*abs(points[i].z)/segment_length_next,points[i].y+(nexty-points[i].y)*abs(points[i].z)/segment_length_next] //chamfer point on next segment
                    ]);   
                    }
                }
            }      
}
    


//Hole module for Z-seam clearance | args: center loc, radius, height, radial z-seam clearance, angle of z-seam clearance, hole chamfer size, vertical overlap for modeling, shoulder height, and shoulder radial diff
module hole_w_clearance (c,r,h,cl,angle,hc,vc,sh,sr){
    theta=acos(r/(r+cl));
    translate([0,0,-vc]){
    translate(c){
        rotate(a=angle) {
            difference(){
                union(){
                linear_extrude(height=h+2*vc){
                    polygon(points=[[0,0],[r*cos(theta),r*sin(theta)],[r+cl,0],[r*cos(theta),-r*sin(theta)]]);}
                cylinder(h+2*vc,r,r);
                translate([0,0,h+vc-hc])    
                    cylinder(hc+vc,r,(r+hc+vc));
                }
                //small shoulder for insert
                translate ([0,0,-cl]) {
                    difference(){
                        cylinder(sh+2*cl,r+hc*4,r+hc*4);
                        cylinder(sh+cl*2,r-sr,r-sr);
}}}}}}}

//module for hole with hex for press in nut
module hex_hole (c,s,d,cb,h,dir,vc){ //through hole with hex for nut |args: center, size of hex, depth of hex (counterbore),hole dia direction of hole (1 or -1), height of through hole, vetrical clearance
    flip= dir==-1 ? 180:0;
    translate([c.x,c.y,(c.z-vc)*dir]){
        rotate([0,flip,0])
        union(){
        hull(){
        for(i=[0:60:360])
            rotate(i){
            translate([s/2,0,0])
                cylinder(cb+vc,r=0.25);
            }}   
        cylinder((h+2*vc),r=d/2);
 }}}
 
 
 module copy_mirror(vec=[0,1,0]){
    children();
    mirror(vec) children();
} 