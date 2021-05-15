ball_spawn = instance_create_depth(x, y, 0, BallSpawn)
_spawn_status_meter = 0 // if reaches 1, ball spawns
_alarm0_lock = false

function _loop() {
    // adds ball spawn rate to spawn status meter each second
    if !_alarm0_lock {
        _alarm0_lock = true
        alarm[0] = room_speed 
    }
}
