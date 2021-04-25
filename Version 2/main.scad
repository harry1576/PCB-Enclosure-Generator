include <threads.scad>;

$fn=100;


wall_thickness = 3;
wall_thickness_vector = [wall_thickness,wall_thickness,wall_thickness];


thread_size = 4.0; // M4 -> 0.7mm Pitch
thread_length = 50.0;

cube_x = 100;
cube_y = 70;
cube_z = 80;
cube_dimensions = [cube_x,cube_y,cube_z];


module generate_post() {
    difference(){
        cylinder(h=cube_y,r=thread_size+wall_thickness,center=true);   
        translate([0,0,+cube_y/2-thread_length]){
            metric_thread(diameter=thread_size, pitch=0.7, length=thread_length+0.01);
        }
    }
}


difference(){
    translate(-0.5*cube_dimensions){cube(cube_dimensions);};
    translate(-0.5*(cube_dimensions-wall_thickness_vector)){cube([cube_x,cube_y+wall_thickness+1,cube_z]-wall_thickness_vector);};
}


difference(){
    rotate([270,0,0]){
        translate([-cube_x/2+4+4,cube_z/2-4-4,0]){generate_post();};
        //translate([-cube_x/2+4,-cube_z/2+4,0]){generate_post();};
        //translate([cube_x/2-4,-cube_z/2+4,0]){generate_post();};
        //translate([cube_x/2-4,cube_z/2-4,0]){generate_post();};
    }
}


