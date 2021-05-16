/// @function					draw_text_outline(_x, _y, text, main_color, line_color)
/// @description				Draw text with outline

function draw_text_outline(_x, _y, text, main_color, line_color) {  
	
	// Outline
	draw_set_color(line_color);  
	draw_text(_x+1, _y+1, text);  
	draw_text(_x-1, _y-1, text);  
	draw_text(_x, _y+1, text);  
	draw_text(_x+1, _y, text);  
	draw_text(_x, _y-1, text);  
	draw_text(_x-1, _y, text);  
	draw_text(_x-1, _y+1, text);  
	draw_text(_x+1, _y-1, text);  
  
	// Text  
	draw_set_color(main_color);  
	draw_text(_x, _y, text);
}