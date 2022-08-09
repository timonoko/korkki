
use <threads-library-by-cuiso-v1.scad>


module korkki() {
 difference() {
  thread_for_screw_fullparm(diameter=27.5, length=15,pitch=1.8); 
  cylinder(d=15, h=16, $fn=50);
  }
 translate([0,-0,-2])cylinder(d=38, h=4, $fn=50);
 
}

module mutteri() {
translate([0,0,2]) 
  difference(){
   union() {
    cylinder(d1=38,d2=18,h=8);
    cylinder(d=18, h=15); } 
   thread_for_nut(diameter=10, length=15, usrclearance=0.1); 
   }
}

module kokokorkki () {
//reikä
 difference() {
  rotate([0,180,0]) korkki();
  translate([0,0,-3]) cylinder(d=5,h=10,$fn=20); }
//sivuputki, jossa reikä
 difference() {
  union() {
   mutteri();
   translate([0,-5,5.5]) rotate([90,0,0]) cylinder(d=8,h=15);
   translate([0,20,5.5]) rotate([90,0,0]) cylinder(d=8,h=15);
   }
  translate([0,27,5.5]) rotate([90,0,0]) cylinder(d=4,h=55,$fn=20);
  }
}

/*
module ruuvi() {
  thread_for_screw(diameter=10, length=20); 
  translate([0,0,-8])cylinder(d=25, h=12, $fn=10);
  translate([0,0,20]) cylinder(d=4.9,h=2,$fn=20);
  }
*/

module ruuvi2() {
  difference() { union () {
    thread_for_screw(diameter=10, length=20); 
    translate([0,0,-8])cylinder(d=25, h=12, $fn=10);
    translate([0,0,20]) cylinder(d=4.9,h=2,$fn=20); }
    translate([0,0,-9]) thread_for_nut(diameter=3, length=40); } 
  }


/*
difference (){
kokokorkki();
 translate([-10,-30,-10]) cube(30);
 }
*/

kokokorkki();
 
translate([27,0,-7])
ruuvi2();


