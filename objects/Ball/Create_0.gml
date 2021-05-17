event_inherited()
initial_speed = 2
bounce_extra_speed = 1 // how much speed ball will gain after bouncing of a wall
max_speed = 10 
prize_points = 150
hitprize_points = 30
is_hitted = false // true if hitted by character, sets to false if ball reaches wall instead of gate

// Visual effects
image_speed = 0
image_index = 0
rotate_dir = choose(1, -1)
rotate_spd_modifier = 3
part_type_score = global.part_upscore_200
part_type_trail = global.part_trail_medium
part_normal_trail = global.part_trail_medium
part_hit_trail = global.part_hittrail_medium
part_hitscore = global.part_upscore_30

function create_particles() {
	part_particles_create(global.part_system_ball, x, y, part_type_trail, 1)	
}

function rotate() {
	image_angle += rotate_dir * rotate_spd_modifier * speed
}

function add_speed(ms) {
    if speed + ms > max_speed {
        speed = max_speed
    }
    
    speed += ms 
}

function bounce(position) {
    change_hitted_condition(false)
    add_speed(bounce_extra_speed)
    
    switch position {
        case "top":
            direction = 360 - direction 
            break
        case "left":
            direction = 180 - direction        
            break
        case "bot":
            direction = 360 - direction 
            break
        case "right":
            direction = 180 - direction        
            break
    }
	
	//if global.sfx
		//audio_play_sound(choose(sn_bounce_0, sn_bounce_1, sn_bounce_2, sn_bounce_3, sn_bounce_4, sn_bounce_5, sn_bounce_6), 1, false)
}

function charge(force, dir) {
    change_hitted_condition(true)
    add_speed(force)
    direction = dir
	
	part_particles_create(global.part_system_ball, x, y, global.part_hitwave, 1)
	part_particles_create(global.part_system_ball, x, y, part_hitscore, 1)	
	
	Score.survival_score += hitprize_points
	
	var _sounds = [sn_hit_ball_0, sn_hit_ball_1, sn_hit_ball_2, sn_hit_ball_3, sn_hit_ball_4, sn_hit_ball_5, sn_hit_ball_6]
	
	if global.sfx == 1
		audio_play_sound(_sounds[irandom(array_length(_sounds)-1)], 1, false)
}

function change_hitted_condition(mode_enabled) {
    if !is_undefined(mode_enabled) {
        is_hitted = mode_enabled
    } 
    
    if is_hitted {
        image_index = 1
		part_type_trail = part_hit_trail
    } else {
        image_index = 0
		part_type_trail = part_normal_trail
    }
}

function check_wall_collision() {
    // TODO: unhardcode court vars
    var court_width = room_width - 64
    var court_height = room_height - 64 
    var sp_width_divided = sprite_width / 2
    
    // top
    if floor(y - sp_width_divided) <= 64 {
        y = 64 + sp_width_divided
        bounce("top")
    }
    
    // left
    if floor(x - sp_width_divided) <= 64 {
        x = 64 + sp_width_divided
        bounce("left")
    }
    
    // bot
    if floor(y + sp_width_divided) >= court_height {
        y = court_height - sp_width_divided
        bounce("bot")
    }
    
    // right
    if floor(x + sp_width_divided) >= court_width {
        x = court_width - sp_width_divided
        bounce("right")
    }
}

function check_gate_collision() {
    var sp_width_divided = floor(sprite_width / 2)
    var gate0 = instance_find(Gate, 0)
    var y_is_in_range = y >= gate0.line_y0 && y <= gate0.line_y1
    
    // left
    if x - sp_width_divided - 1 <= gate0.line_x0 && y_is_in_range && is_hitted {
        gate0.catch_ball(self)
		part_particles_create(global.part_system_ball, x, y, part_type_score, 1)
		
		if global.sfx == 1
			audio_play_sound(sn_goal, 1, false)
    }
}

speed += initial_speed






