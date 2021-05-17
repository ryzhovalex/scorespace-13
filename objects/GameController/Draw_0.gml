if game.is_paused && !game.is_paused_no_draw {
    draw_set_font(font_komika)
	draw_set_color(c_white)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_text_outline(318, 120, c_white, c_black, "Pause", 74, 1200)
	draw_text_outline(318, 120, c_white, c_black, "\n\nPress ESC to resume\nPress Q to exit", 74, 1200)
}
    
    
    
    
    
    
    
    
    
    
    
    