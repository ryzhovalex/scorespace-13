function _loop() {
    for (var i =0; i < instance_number(Ball); i++) {
        var ball = instance_find(Ball, i)
        var wall = instance_place(ball.x, ball.y, Wall)
        
        if ball != noone && wall != noone {
            var extra_speed = ball.bounce_extra_speed + wall.bounce_extra_speed
            ball.bounce(wall, extra_speed)
        }
    }        
}