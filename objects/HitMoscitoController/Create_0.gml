function loop() {
    for (var i = 0; i < instance_number(HitMoscito); i++) {
        var moscito = instance_find(HitMoscito, i)
        
        if moscito != noone {
            moscito.period()
        }
    }
}