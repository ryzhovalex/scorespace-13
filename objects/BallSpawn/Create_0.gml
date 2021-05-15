event_inherited()
spawn_rate_per_second = 0.3

function enable_random_spawner(ball) {
    if ball == undefined {
        ball = Ball
    }
    
    var rnum = irandom(instance_number(BallSpawnPoint) - 1)
    var picked_spawner = instance_find(BallSpawnPoint, rnum)
    picked_spawner.spawn(ball)
}