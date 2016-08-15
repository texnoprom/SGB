
 
function takeit(txt)
	return function(s)
		p (txt);
		return true;
	end
end
--[[
room = stead.inherit(room, function(v)
	v.dsc = stead.hook(v.dsc, function(f, s,...)
		if s.dsc1 and not s._first_dsc then
			s._first_dsc = true
			return call(s, 'dsc1');
		end
		return f(s, ...);
	end)
	return v
end)
 ]]--

school = room {
	nam = 'school';
	disp = _('Парк');
	pic = 'pic/school.jpg';
	---hideinv = true;
	dsc = function(s)
		p (_([[ Парк с покинутым зданием.]]));

		
	end;
}
main = room {
	nam = 'main';
	disp = _('Центральная улица');
	pic = 'pic/raion.jpg';
	---hideinv = true;
	dsc = function(s)
		p (_([[ Это моя улица, почти центр города]]));

		
	end;
	
}
rablistovk = room {
	nam = 'rablistovk';
	disp = _('работа с листовками');
	pic = 'pic/rablistovk.jpg';
	--hideinv = true; --скрывает инвентарь
--	dsc = [[Раздаю листовки]];
	
}
home = room {
	nam = 'home';
	disp = _('Коридор');
	pic = 'pic/koridor.jpg';
	--hideinv = true; --скрывает инвентарь
	dsc = _([[В этой квартире я живу]]);
	
}
allhome = room {
	nam = 'allhome';
	disp = _('Скрытая комната');
	pic = 'pic/koridor.jpg';
	--hideinv = true; --скрывает инвентарь
	dsc = _([[это место отдыха всех левых персонажей]]);
	
}

toroom = room {
	nam = 'toroom';
	pic = 'pic/zal.jpg';
	enter = function (s)
		s.pic = 'pic/zal.jpg';
	end;
	disp = _('Моя комната');
	
}
vanna = room {
	nam = 'vanna';
	pic = 'pic/dvervvannu.jpg';
	disp = _('Дверь в ванную');
	dsc = _([[Стеклянная дверь в ванну, через которую почти всё видно]]);
}
bath = room {
	nam = 'bath';
	disp = _('Ванная комната');
	pic = 'pic/vanna.jpg';
	
}
bedroom = room {
	nam = 'bedroom';
	pic = 'pic/bedroom.jpg';
	disp = _('Спальня сестер');
}
bedroomdoor = room {
	nam = 'bedroomdoor';
	pic = 'pic/bedroomdoor.jpg';
	disp = _('Дверь в спальню к сестрам');
}
kitchen = room {
	nam = 'kitchen';
	pic = 'pic/kitchen.jpg';
	disp = _('Кухня');
}
supermarket = room {
	nam = 'supermarket';
	pic = 'pic/supermarket.jpg';
	disp = _('Cупермаркет');
}
dk = room { --01.09.2015
	nam = 'dk';
	pic = 'pic/dk.jpg';
	disp = _('Дом культуры');
}

motherroom = room {
	nam = 'motherroom';
	pic = 'pic/motherroom.jpg';
	disp = _('Спальня родителей');
}
sanyaroom = room { --02.09.2015
	nam = 'sanyaroom';
	pic = 'pic/sanya/room.jpg'; 
	disp = _('Квартира Сашки');
	dsc = _([[Тёмно-красная, занавешенная шторами комната]]);
}
garag = room { --06.09.2015
	nam = 'garag';
	pic = 'pic/otchim/garag/zakrit.jpg'; 
	disp = _('Гараж');
	dsc = _([[Гаражный массив]]);
}
kafe = room { --06.09.2015
	nam = 'kafe';
	pic = 'pic/kafe.jpg'; 
	disp = _('Кафе');
	dsc = _([[Неприглядное кафе, здесь работает моя мама]]);
}
okb = room { --27.02.2016
	nam = 'okb';
	pic = 'pic/okb.jpg'; 
	disp = _('Больница');
	dsc = _([[Местная больница]]);
}

