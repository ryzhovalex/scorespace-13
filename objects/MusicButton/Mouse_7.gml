/// On/off music

if global.music == 1 {
	// off
	global.music = 0
	audio_pause_sound(music_stickball_theme)
	image_index = 1
}
else {
	// on
	global.music = 1
	audio_resume_sound(music_stickball_theme)
	image_index = 0
}