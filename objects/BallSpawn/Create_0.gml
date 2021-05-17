event_inherited()
spawn_rate_per_second = 0.25
spawn_rate_dynamic = 0.01
time_increase = room_speed * 10
alarm[0] = time_increase	// every time spawn rate increase

function enable_random_spawner(ball) {
    if ball == undefined {
        ball = choose(SmallBall, MediumBall, BigBall)
    }
    
    var rnum = irandom(instance_number(BallSpawnPoint) - 1)
    var picked_spawner = instance_find(BallSpawnPoint, rnum)
    picked_spawner.spawn(ball)
}