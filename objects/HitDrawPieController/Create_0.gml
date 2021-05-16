function loop() {
    var pie = instance_find(HitDrawPie, 0)    
    
    if pie != noone {
        pie.period()
    }
}
