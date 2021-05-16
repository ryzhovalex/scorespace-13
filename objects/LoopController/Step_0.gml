var game = instance_find(Game, 0)

if game != noone && !game.is_paused {
    run_controllers()
}


