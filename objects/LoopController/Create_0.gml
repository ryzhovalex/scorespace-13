event_inherited()
_initctrl = instance_find(InitController, 0)

function loop() {
    exit
}

function run_controllers() {
    for (var i = 0; i < array_length(_initctrl.controllers); i++) {
        _initctrl.controllers[i].loop()
    }
}
