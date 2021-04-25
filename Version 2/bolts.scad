include <threads.scad>;

$fn=100;

wall_thickness = 3.0;
thread_size = 4.0;
thread_length = 30.0;

metric_thread(diameter=thread_size, pitch=0.7, length=thread_length+0.01+wall_thickness);

$fn = 6;
cylinder(h=2.8,r=5.5/2,center=true);   
