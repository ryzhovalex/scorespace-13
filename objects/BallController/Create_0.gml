event_inherited()

function loop() {
    for (var i = 0; i < instance_number(Ball); i++) {
        var ball = instance_find(Ball, i)
        
        if ball != noone {
            ball.check_gate_collision()
            ball.check_wall_collision()
			ball.rotate()
			ball.create_particles()
        }
    }        
}


