include <threads.scad>;

$fn = $preview ? 0 : 32;
fragments = $preview ? 5 : 32;


$fn = 100;

wall_thickness = 3;
wall_thickness_vector = [wall_thickness,wall_thickness,wall_thickness];

thread_size = 4.0; // M4 -> 0.7mm Pitch
thread_hole_size = 3.3; // M4 -> 0.7mm Pitch
thread_length = 16.0;
head_radius = 8.0;
head_depth = 1.9;


pcb_x = 20;
pcb_y = 20;
pcb_z = 20;

cube_x = pcb_x  + (wall_thickness*4) + (thread_size*2); // Has 
cube_y = pcb_y  + (wall_thickness*4) + (thread_size*2);
cube_z = pcb_z  + (wall_thickness*2);
cube_dimensions = [cube_x,cube_y,cube_z];


module generate_post() {
    difference(){
        cylinder(h=cube_z,r=thread_size/2+wall_thickness,center=true);   
        translate([0,0,cube_z/2]){
         //metric_thread (diameter=thread_size, pitch=1, length=4);
         // simple_iso_thread(5, 1, thread_length+0.5, type="internal", chamfer_top=0, chamfer_bottom=0,fragments=fragments);
         cylinder(h=thread_length,r=thread_hole_size/2,center=true);   


        }
    }
}

module generate_cylinder() {
        cylinder(h=cube_y,r=thread_size/2+wall_thickness,center=true);   

}


difference(){
    cube(cube_dimensions,center=true);
    translate([0,0,wall_thickness*2]){cube([cube_x,cube_y,cube_z]-wall_thickness_vector*2,center=true);}

  
}



translate([-cube_x/2+thread_size+1,cube_y/2-thread_size-1,0]){generate_post();};
translate([-cube_x/2+thread_size+1,-cube_y/2+thread_size+1,0]){generate_post();};
translate([cube_x/2-(thread_size+1),-cube_y/2+thread_size+1,0]){generate_post();};
translate([cube_x/2-(thread_size+1),cube_y/2-(thread_size+1),0]){generate_post();};


// Make Lid

