/// Init
image_speed = 0

if global.music
	image_index = 0
else
	image_index = 1
	
	
if global.music && global.music_repeator {
	audio_play_sound(music_stickball_theme, 1, true)
	global.music_repeator = 0
}