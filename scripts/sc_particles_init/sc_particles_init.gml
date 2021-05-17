/// @description Инициализирует частицы

/*
Чтобы создать частицы: part_particles_create(<система>, x, y, <тип частиц>, <кол-во частиц>)
В объекте, который создает частицы, нужно прописать в событии Clean Up: part_system_destroy(<система>)

part_particles_create(global.part_system_ball, x, y, global.part_hitwave, 1)
*/

// Системы
global.part_system_ball = part_system_create()
global.part_system_target = part_system_create()

// Конфигурация систем
part_system_depth(global.part_system_ball, 1)
part_system_depth(global.part_system_target, -1)

#region Trail small
// Для мяча, по которому ударили

var _p0 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p0, pt_shape_disk)
part_type_life(_p0, 12, 12)
part_type_alpha2(_p0, .15, 0)
part_type_size(_p0, .65, .65, -0.05, 0)
part_type_color2(_p0, c_orange, c_white)

// Передаем новый тип
global.part_trail_small = _p0

#endregion

#region Trail medium
// Для мяча, по которому ударили

var _p5 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p5, pt_shape_disk)
part_type_life(_p5, 12, 12)
part_type_alpha2(_p5, .15, 0)
part_type_size(_p5, .85, .85, -0.05, 0)
part_type_color2(_p5, c_orange, c_white)

// Передаем новый тип
global.part_trail_medium = _p5

#endregion

#region Trail big
// Для мяча, по которому ударили

var _p6 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p6, pt_shape_disk)
part_type_life(_p6, 12, 12)
part_type_alpha2(_p6, .15, 0)
part_type_size(_p6, 1.1, 1.1, -0.05, 0)
part_type_color2(_p6, c_orange, c_white)

// Передаем новый тип
global.part_trail_big = _p6

#endregion

#region HitTrail small
// Для мяча, по которому ударили

var _p7 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p7, pt_shape_disk)
part_type_life(_p7, 12, 12)
part_type_alpha2(_p7, .15, 0)
part_type_size(_p7, .65, .65, -0.05, 0)
part_type_color1(_p7, c_red)

// Передаем новый тип
global.part_hittrail_small = _p7

#endregion

#region HitTrail medium
// Для мяча, по которому ударили

var _p8 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p8, pt_shape_disk)
part_type_life(_p8, 12, 12)
part_type_alpha2(_p8, .15, 0)
part_type_size(_p8, .85, .85, -0.05, 0)
part_type_color1(_p8, c_red)

// Передаем новый тип
global.part_hittrail_medium = _p8

#endregion

#region HitTrail big
// Для мяча, по которому ударили

var _p9 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p9, pt_shape_disk)
part_type_life(_p9, 12, 12)
part_type_alpha2(_p9, .15, 0)
part_type_size(_p9, 1.1, 1.1, -0.05, 0)
part_type_color1(_p9, c_red)

// Передаем новый тип
global.part_hittrail_big = _p9

#endregion

#region Hitwave
// Для эффектов удара

var _p1 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p1, pt_shape_spark)
part_type_life(_p1, 10, 10)
part_type_alpha2(_p1, 1, 0)
part_type_size(_p1, 1, 2, 0.25, 0)

// Передаем новый тип
global.part_hitwave = _p1

#endregion

#region Upscore 150
// Для эффекта получения очков

var _p2 = part_type_create()

// Здаем характеристики для типа
part_type_sprite(_p2, sp_upscore_150, 0, 0, 0)
part_type_life(_p2, 35, 35)
part_type_alpha2(_p2, 1, 0)
part_type_gravity(_p2, .2+choose(0, .1, .05, -.1), 90)

// Передаем новый тип
global.part_upscore_150 = _p2

#endregion

#region Upscore 200
// Для эффекта получения очков

var _p3 = part_type_create()

// Здаем характеристики для типа
part_type_sprite(_p3, sp_upscore_200, 0, 0, 0)
part_type_life(_p3, 35, 35)
part_type_alpha2(_p3, 1, 0)
part_type_gravity(_p3, .2+choose(0, .1, .05, -.1), 90)

// Передаем новый тип
global.part_upscore_200 = _p3

#endregion

#region Upscore 350
// Для эффекта получения очков

var _p4 = part_type_create()

// Здаем характеристики для типа
part_type_sprite(_p4, sp_upscore_350, 0, 0, 0)
part_type_life(_p4, 35, 35)
part_type_alpha2(_p4, 1, 0)
part_type_gravity(_p4, .2+choose(0, .1, .05, -.1), 90)

// Передаем новый тип
global.part_upscore_350 = _p4

#endregion

#region Upscore 15
// Для эффекта получения очков

var _pt0 = part_type_create()

// Здаем характеристики для типа
part_type_sprite(_pt0, sp_upscore_15, 0, 0, 0)
part_type_life(_pt0, 25, 25)
part_type_alpha2(_pt0, 1, 0)
part_type_gravity(_pt0, .2+choose(0, .1, .05, -.1), 90)

// Передаем новый тип
global.part_upscore_15 = _pt0

#endregion

#region Upscore 30
// Для эффекта получения очков

var _pt1 = part_type_create()

// Здаем характеристики для типа
part_type_sprite(_pt1, sp_upscore_30, 0, 0, 0)
part_type_life(_pt1, 25, 25)
part_type_alpha2(_pt1, 1, 0)
part_type_gravity(_pt1, .2+choose(0, .1, .05, -.1), 90)

// Передаем новый тип
global.part_upscore_30 = _pt1

#endregion

#region Upscore 50
// Для эффекта получения очков

var _pt2 = part_type_create()

// Здаем характеристики для типа
part_type_sprite(_pt2, sp_upscore_50, 0, 0, 0)
part_type_life(_pt2, 25, 25)
part_type_alpha2(_pt2, 1, 0)
part_type_gravity(_pt2, .2+choose(0, .1, .05, -.1), 90)

// Передаем новый тип
global.part_upscore_50 = _pt2

#endregion