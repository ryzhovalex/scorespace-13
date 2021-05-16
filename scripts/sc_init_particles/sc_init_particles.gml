/// @description Инициализирует частицы

/*
Чтобы создать частицы: part_particles_create(<система>, x, y, <тип частиц>, <кол-во частиц>)
В объекте, который создает частицы, нужно прописать в событии Clean Up: part_system_destroy(<система>)
*/

// Системы
global.part_system_ball = part_system_create()

// Конфигурация систем
part_system_depth(global.part_system_ball, 1)

#region Trail
// Для мяча, по которому ударили

var _p = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p, pt_shape_disk)
part_type_life(_p, 12, 12)
part_type_alpha2(_p, .15, 0)
part_type_size(_p, 1, 1, -0.05, 0)

// Передаем новый тип
global.part_trail = _p

#endregion

#region Hitwave
// Для эффектов удара

var _p1 = part_type_create()

// Здаем характеристики для типа
part_type_shape(_p1, pt_shape_spark)
part_type_life(_p1, 10, 10)
part_type_alpha2(_p1, 1, 0)
part_type_size(_p1, 0.5, 1.2, 0.25, 0)

// Передаем новый тип
global.part_hitwave = _p1

#endregion