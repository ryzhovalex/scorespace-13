randomize()
game_ctrl = instance_create_depth(x, y, 0, GameController)
character_ctrl = instance_create_depth(x, y, 0, CharacterController)
ball_spawn_ctrl = instance_create_depth(x, y, 0, BallSpawnController)
bounce_ctrl = instance_create_depth(x, y, 0, BallBounceController)


