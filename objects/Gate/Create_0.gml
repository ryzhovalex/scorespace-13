// only if sprite middle centered -> find x coord to define gate' line to catch balls
line_x0 = floor(x + sprite_height / 2) 
line_y0 = floor(y - sprite_width / 2)
line_y1 = floor(y + sprite_width / 2)
// line_x1 = floor(x + sprite_height / 2)

function catch_ball(ball) {
    instance_destroy(ball)
} 



