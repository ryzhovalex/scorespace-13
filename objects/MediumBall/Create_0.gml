event_inherited()

initial_speed = 2
bounce_extra_speed = 1 // how much speed ball will gain after bouncing of a wall
max_speed = 10 
prize_points = 150
is_hitted = false // true if hitted by character, sets to false if ball reaches wall instead of gate
rotate_dir = choose(1, -1)
rotate_spd_modifier = 3
part_type = global.part_upscore_150