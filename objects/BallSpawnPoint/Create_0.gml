spawn_radius = 180
spawn_strength = random(1) // how much force (in speed) will be added to spawned ball 
spawn_delay = 2 * room_speed // how much time in seconds spawner prepare for the spawn
_target_direction = 0 // real direction where ball will spent 
_final_ball_speed = 0
_final_ball_type = noone

// Animation
curve_pos = 0	// position on curve animation

function spawn(ball) { 
    _final_ball_type = ball
    var rdir = irandom(spawn_radius) // set random spawn direction in vision circle
    var spawn_radius_zero = direction - spawn_radius / 2 // start point of actual vision radius of the spawn point
    _target_direction = spawn_radius_zero + rdir 
    alarm[0] = spawn_delay
}

direction = image_angle