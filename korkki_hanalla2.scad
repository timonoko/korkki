
use <threads-library-by-cuiso-v1.scad>

module korkki() {
 difference() {
   union() {
     thread_for_screw_fullparm(diameter=27.5, length=15,pitch=1.8); 
     translate([0,0,-4])cylinder(d=38, h=4, $fn=50);
     translate([0,0,-16])cylinder(d1=12,d2=38,h=12);
     translate([0,0,13]) rotate([150,0,0])  cylinder(d=10,h=33);
     translate([0,0,13]) rotate([150,0,180])  cylinder(d=10,h=33);
   }
   translate([0,-0,-17])cylinder(d=10, h=28, $fn=50);
   translate([0,-0,0])cylinder(d=17, h=28, $fn=50);
   translate([0,0,13]) rotate([150,0,0])     cylinder(d=7,h=36);
   translate([0,0,13]) rotate([150,0,180])  cylinder(d=7,h=36);
   translate([0,0,14.2]) cylinder(d1=17,d2=21,h=2,$fn=50);
 }
 translate([5.1,-1,0])  cube([5,2,10]);
}

module tappi() {
  difference () {
    union () {
      translate([0,0,31]) thread_for_screw(diameter=10, length=15); 
      translate([0,-0,0])cylinder(d=9.5, h=31, $fn=50);
      translate([0,-0,0])cylinder(d1=16.5,d2=16.8, h=2, $fn=50);
      translate([0,-0,-3])cylinder(d=22, h=3, $fn=8);
      rotate([0,0,90]) translate([-7,0,12]) rotate([0,90,0]) cylinder(d=4, h=14, $fn=10);
      
    }
    translate([0,0,-4]) thread_for_nut(diameter=3, length=55);
  }
}

module mutteri() {
  difference(){
    cylinder(d=22,h=15,$fn=30);
    thread_for_nut(diameter=10, length=20, usrclearance=0.1);
    for (x=[0:30:360]) translate([11*sin(x),11*cos(x),0]) cylinder(d=3,h=16,$fn=10);
   }
}

module kasaus () {
  difference() {
    union() {
      translate([0,0,15])rotate([180,0,0])korkki();
      //translate([30,0,0])
      color("GREEN") translate([0,0,31]) mutteri();
    }
    translate([0,0,-4])  cube(53);
  }
  color("RED","BLUE")tappi();
}

module tulostus () {
  translate([0,0,15])rotate([180,0,0])korkki();
  translate([20,20,3])   tappi();
  translate([31,0,0]) mutteri();
}

kasaus();

