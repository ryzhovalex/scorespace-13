draw_pie_value = 100

function test_alarm() {
    /*
        Output:
        => before alarm
        => after alarm
        => within alarm
        
        Resume: alarm is asynchronous!
    */
    show_message("before alarm")
    alarm[0] = 5 * room_speed    
    show_message("after alarm")
}

function test_text_draw() {
    draw_set_colour(c_red)
    draw_text(500, 500, "HEY!!!!!!")
}

function test_draw_pie(value) {
    draw_pie(500, 500, value, 100, c_red, 20, 1)
}
