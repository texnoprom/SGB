require "sound" 
require "sprites"
require "theme"
require "para"
require "quotes"
require "dash"
require "hideinv"
require "snapshots"
require "timer"
require 'modules/fonts' --решил его перенести в проект тестовый модуль, не включен в обычный инстеад http://instead.syscall.ru/wiki/ru/gamedev/modules/fonts

--все комнаты
dofile "rooms.lua"

-- основные локации
dofile "game.lua"

--меню с инвентарём
dofile "menu.lua"
--инициализируем вещи по местам
dofile "init.lua"
--персонажи
--персонаж мать
dofile "characters/ma.lua"
--персонаж коля
dofile "characters/sanya.lua"
--персонаж аня
dofile "characters/anya.lua"
--персонаж отчим
dofile "characters/otchim.lua"
--персонаж Света
dofile "characters/sveta.lua"
--попугай
dofile "characters/kesha.lua"

--итемы
dofile "items/inshop.lua"
dofile "items/bariga.lua"
--квесты
--ивент с фотосессией --должен стоять раньше чем в ванной, чтобы квест в ванной имел доступ к переменной кв_фото
dofile "quests/fotosesia.lua"
--подгружаем квест в ванной
dofile "quests/bathroom.lua"
--квест с матерью (ссончс)
dofile "quests/mother1.lua"
--ивент просмотр порнофильмов с сашкой 
dofile "quests/videoporn.lua"
--ивент фотосессия мамы
dofile "quests/Per1.lua"
--ивенты с анной в супермаркете
dofile "quests/a_superm.lua"
--ивенты с мамой в кафе
dofile "quests/m_kafe.lua"
--задания на заработок для светы
dofile "quests/s_toroom.lua"
--перед работой
dofile "quests/m_before_work.lua"
--после ванной
dofile "quests/m_after_bath.lua"
--взаимодействие с мамой
dofile "quests/m_near.lua"
--уборка в спальне
dofile "quests/m_bedroom.lua"
--уборка в зале
dofile "quests/m_zal_uborka.lua"
--ивенты с анной в спальне
dofile "quests/a_bedroom.lua"
-- ивент с анной и сигаретой
dofile "quests/a_kitchen_smoke.lua"
-- ивент с сердцем
dofile "quests/o_heart.lua"
-- действия светы для ивента с сердцем
dofile "quests/s_heart.lua"
-- действия Ани для ивента с сердцем
dofile "quests/a_heart.lua"
-- действия Мамы для ивента с сердцем
dofile "quests/m_heart.lua"
-- ивенты светы в гараже
dofile "quests/s_garag.lua"

walk(main)
-- vim:ts=4
