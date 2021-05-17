/// Prepare animation

if alarm[0] != -1 {
	var _curve_struct = animcurve_get(curve_cannon_prepare)			// get info about animation curve
	var _channel = animcurve_get_channel(_curve_struct, "curve")	// get channel from curve
	var _value = animcurve_channel_evaluate(_channel, curve_pos)	// set value for moving on curve
	
	curve_pos += 0.01 * alarm[0]/spawn_delay
	image_blend = c_red
	
	// Animation
	image_xscale = _value
	image_yscale = _value
}
else
	image_blend = c_white