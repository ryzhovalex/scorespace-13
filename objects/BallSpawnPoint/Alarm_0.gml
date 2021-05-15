/// @description spawn
    var ball_instance = instance_create_depth(x, y, 0, _final_ball_type)
    ball_instance.speed += spawn_strength 
    ball_instance.direction = _target_direction