--objs(myclass):add(person("юля"))
objs(school):add(shcoolmain)
--objs(school):add(shcoolclass) --лето, не зачем ходить в класс
--инициируем главную улицу
objs(main):add(mainhome)
objs(main):add(mainschool)
objs(main):add(mainrablistovk)
objs(main):add(mainsupermarket) --магазин
objs(main):add(maingarag) --магазин
objs(main):add(mainkafe) --кафэ
objs(main):add(maindk) --дк
objs(main):add(mainokb) --больница
main.enter = function(s) 
	if hour>8 and hour<22 then --супермаркет работает с 9 до 21 --так же как и работа с листовками
		mainsupermarket:enable();
		mainrablistovk:enable();
		else
		mainsupermarket:disable();
		mainrablistovk:disable();
	end;
end;
objs(supermarket):add(homemain) --выход на улицу, стандартный
objs(garag):add(homemain)
objs(kafe):add(homemain)
objs(dk):add(homemain)
objs(okb):add(homemain)
objs(rablistovk):add(workwork)
objs(rablistovk):add(endwork)
objs(home):add(hometoroom)
objs(home):add(homevanna) -- зайти в ванну
objs(home):add(homebedroom) -- зайти к сестрам
objs(home):add(homemotherroom) -- в спальню к родителям
objs(home):add(homekitchen) -- зайти на кухню
objs(home):add(homemain) -- выйти на улицу
objs(toroom):add(toroomhome)
objs(toroom):add(sleepformorning)
objs(vanna):add(toroomhome) --выйти в коридо
objs(kitchen):add(toroomhome) --выйти в коридо
objs(bedroom):add(toroomhome) --выйти в коридо
objs(bedroomdoor):add(toroomhome) --выйти в коридо
objs(motherroom):add(toroomhome) --выйти в коридо
objs(toroom):add(tv) --телевизор
objs(kitchen):add(est) --перекус


