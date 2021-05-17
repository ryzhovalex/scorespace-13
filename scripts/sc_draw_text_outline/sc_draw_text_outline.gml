/// @function					draw_text_outline(_x, _y, main_color, line_color, text, _sep, _w)
/// @description				Draw text with outline

function draw_text_outline(_x, _y, main_color, line_color, text, _sep, _w) {  
	
	// Outline
	draw_set_color(line_color)
	draw_text_ext(_x+1, _y+1, text, _sep, _w)  
	draw_text_ext(_x-1, _y-1, text, _sep, _w)
	draw_text_ext(_x, _y+1, text, _sep, _w)
	draw_text_ext(_x+1, _y, text, _sep, _w)
	draw_text_ext(_x, _y-1, text, _sep, _w)
	draw_text_ext(_x-1, _y, text, _sep, _w)
	draw_text_ext(_x-1, _y+1, text, _sep, _w)
	draw_text_ext(_x+1, _y-1, text, _sep, _w)
  
	// Text  
	draw_set_color(main_color)
	draw_text_ext(_x, _y, text, _sep, _w)
}