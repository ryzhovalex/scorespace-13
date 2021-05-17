/// Animation
if lifes > 0 {
	if keyboard_check(ord("D")) || keyboard_check(ord("W")) {
		sprite_index = sp_character_right
		image_speed = anim_spd
	}

	if keyboard_check(ord("A")) || keyboard_check(ord("S")) {
		sprite_index = sp_character_left
		image_speed = anim_spd
	}
	
	if keyboard_check(ord("S")) && keyboard_check(ord("D")) {
		sprite_index = sp_character_right
		image_speed = anim_spd
	}
}
else
	image_speed = 0

if global.move_x == 0 && global.move_y == 0
	sprite_index = sp_character_stay