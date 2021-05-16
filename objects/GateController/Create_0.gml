function loop() {
    var gate0 = instance_find(Gate, 0)
    // var gate1 = instance_find(Gate, 1)
    
    if gate0 != noone {
        gate0.check_ball_collision()
    }
}