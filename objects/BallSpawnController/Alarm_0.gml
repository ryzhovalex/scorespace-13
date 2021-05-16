/// @description spawn status meter accumulation and checking
_alarm0_lock = false
_spawn_status_meter += ball_spawn.spawn_rate_per_second

if _spawn_status_meter >= 1 && !instance_find(Game, 0).is_paused {
    ball_spawn.enable_random_spawner()
    _spawn_status_meter -= 1
}



