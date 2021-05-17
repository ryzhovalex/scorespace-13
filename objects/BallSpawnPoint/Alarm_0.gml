/// @description spawn
var ball_instance = instance_create_depth(x, y, 0, _final_ball_type)
ball_instance.speed += spawn_strength 
ball_instance.direction = _target_direction
	
if global.sfx == 1
	audio_play_sound(choose(sn_cannon_0, sn_cannon_1, sn_cannon_2, sn_cannon_3), 1, false)

curve_pos = 0	// for animtaion	