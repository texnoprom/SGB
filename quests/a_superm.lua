--взаимодействие с аней в супермаркете
--v0.1 создан 02.09.2015

superm_room = room{
    nam = _('подсобка в супермаркете');
	--pic = 'pic/ma/bath/bath1.jpg';
	act = function(s,w)
		if w~='supermarket' then
			sleep(0,0,56);
		a_superm:act();
		else
			walk(w);
		end;
	end,
	enter = function (s) --инициализация при входе
			
		end;	
 
	obj = { vobj('supermarket', _('{^Вернуться}')),
	vobj('superm_room', _('{^Спрятаться в шкафу на 1 час}')),	};
};

a_sr1 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d1.jpg';
	act = function()
		walk('a_sr2');
	end,
	dsc = _([[^^
		Видимо кто-то занял подсобку, не только же Ане в ней отдыхать
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr2 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d2.jpg';
	act = function()
		walk('a_sr3');
	end,
	dsc =_( [[^^
		Да они же совсем раздетые! Наверно они тут часто этим занимаются.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr3 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d3.jpg';
	act = function()
		walk('a_sr4');
	end,
	dsc =_( [[^^
		Мужчина нагнул подругу и принялся водить своим членом по ягодицам.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr4 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d4.jpg';
	act = function()
		walk('a_sr5');
	end,
	dsc =_( [[^^
		Он опустил свои руки на бёдра девушки и медленно поглаживал их, успокаивая и расслабляя партнёршу.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr5 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d5.jpg';
	act = function()
		hour=12; 
		minut=0;
		walk('a_sr6');
	end,
	dsc =_( [[^^
		Я засмотрелся на действие, и не замечал как летит время, и тут кто-то появился сбоку.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr6 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d6.jpg';
	act = function()
		walk('a_sr7');
	end,
	dsc =_( [[^^
		Этот тёмный силует стал мешать мне подсматривать, может он уйдёт?
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr7 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d7.jpg';
	act = function()
		walk('a_sr8');
	end,
	dsc =_( [[^^
		Девушка, нагнутая раком, не беспокоится, что кто-то подошёл, наверно... знакомая? Это вроде вторая девушка.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr8 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d8.jpg';
	act = function()
		walk('a_sr9');
	end,
	dsc =_( [[^^
		Мужчина продолжает драть свою подругу, на глазах у второй девушки.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr9 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d9.jpg';
	act = function()
		walk('a_sr10');
	end,
	dsc =_( [[^^
		Девушка скинула полотенец, а под ним ничего не было, наверно только из душа, потому я её не видел.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr10 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d10.jpg';
	act = function()
		walk('a_sr11');
	end,
	dsc =_( [[^^
		Девушка опустилась на колено и я наконец увидел лицо - это же Аня!
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr11 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d11.jpg';
	act = function()
		walk('a_sr12');
	end,
	dsc =_( [[^^
		Аня поцеловала подругу, та ей ответила, вот же развратная сучка.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr12 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d12.jpg';
	act = function()
		walk('a_sr13');
	end,
	dsc =_( [[^^
		Анна оттопырила попку, чистую, гладкую, рука сама потянулась... пощупать её, жаль она далеко.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr13 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d13.jpg';
	act = function()
		walk('a_sr14');
	end,
	dsc =_( [[^^
		Мужчина наконец оторвался от задницы подруги и подошёл поприветсвовать Анну поцелуем, а подруга набросилась на член, нечего отлынивать.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr14 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d14.jpg';
	act = function()
		walk('a_sr15');
	end,
	dsc =_( [[^^
		Член ходил по рукам и по губам.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr15 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d15.jpg';
	act = function()
		walk('a_sr16');
	end,
	dsc =_( [[^^
		Мужчина полез руками к лону Ани, а она и не против.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr16 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d16.jpg';
	act = function()
		walk('a_sr17');
	end,
	dsc =_( [[^^
		Но Аня отстранилась и присела рядом, взгляд её был устремлён на член мужчины, это то что ей нужнее, чем руки.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr17 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d17.jpg';
	act = function()
		walk('a_sr18');
	end,
	dsc =_( [[^^
		Мужчина сел пониже, подруга своим ротиком засасывала головку в космический вакуум, Анна приблизилась к нему и поцеловала.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr18 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d18.jpg';
	act = function()
		walk('a_sr19');
	end,
	dsc =_( [[^^
		Анна перекинула через его шею ногу и воздвиглась над его лицом, чем он и не применул воспользоваться.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr19 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d19.jpg';
	act = function()
		walk('a_sr20');
	end,
	dsc =_( [[^^
		Обильно смазав её слюной, он быстро скинул тело анны на свой мокрый, от ротика подруги, член и насадил с громким хлопком.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr20 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d20.jpg';
	act = function()
		walk('a_sr21');
	end,
	dsc =_( [[^^
		Подруга рада угодить, на продолжала заниматься членом мужчины, даже когда насаженная на него Аня стоная и гладя свои груди, скакала на нём.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr21 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d21.jpg';
	act = function()
		walk('a_sr22');
	end,
	dsc =_( [[^^
		Подруга смотрела на Аню с завистью, но не смела просить мужчину насадить её, вместо Анны.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr22 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d22.jpg';
	act = function()
		walk('a_sr23');
	end,
	dsc =_( [[^^
		Она желала член, жаждала, надеялась, и радовалась что члену так хорошо.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr23 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d23.jpg';
	act = function()
		walk('a_sr24');
	end,
	dsc =_( [[^^
		И тут наконец, мужчина снял Анну и поставив раком подругу всадил в неё свой горячий член, а Аня подставила свои нижние губки для её губ.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr24 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d24.jpg';
	act = function()
		walk('a_sr25');
	end,
	dsc =_( [[^^
		Он уже был ан подходе, потому встал и дал подруге то, что она сильнее всего желала - горячий и сладкий член.
	]]),
	obj = {
		vobj('continue', _('{Далее}')),
	},
};
a_sr25 = room {
	nam = _('Подсобка'),
	pic = 'pic/ivents/a_superm/d25.jpg';
	act = function()
		sleep(0,1,0);
		kv_a_superm()._stat=kv_a_superm()._stat+1;
		walk('supermarket');
	end,
	dsc =_( [[^^
		Он кончил в рот, и она откинулась в наслаждении, закрыв глаза, мечта её исполнилась.
	]]),
	obj = {
		vobj('continue', '{Отбежать от щели}'),
	},
};

function kv_a_superm()
        local v = kvest('kva_superm');
        
        v.dsc = function()
			pn(_(' В {подсобке} иногда отдыхают работники магазина.'));
		end;
		v.act = function(s)
			if hour==12 and exist('anya', 'supermarket') then
				if s._stat==0 then
					superm_room.pic = 'pic/ivents/a_superm/p1.jpg'; 
					superm_room.dsc = _('Так вот где Аня отдыхает в обеденный перерыв');
					s._stat=s._stat+1;
				elseif s._stat<=45 then
					superm_room.pic = 'pic/ivents/a_superm/p'..s._stat..'.jpg'; 
					superm_room.dsc = _('Аня расслабляется в комнате отдыха');
					if s._stat==3 then
						pn (_('Пока никто не видел, я спёр генератор жучков.'));
						move(juk,me(), 'supermarket');
					end;
					if s._stat==6 then
						pn (_('Пока никто не видел, я спёр миникамеру.'));
						move(minikamera,me(),  'supermarket')
					end;
					s._stat=s._stat+1;
				else 
					superm_room.pic = 'pic/ivents/a_superm/p'..rnd(45)..'.jpg'; 
					superm_room.dsc = _('Аня как обычно отдыхает');
					
				end;
				walk('superm_room');	
				sleep(0,0,30);
			elseif hour==11 and s._stat==46 and exist('anya', 'supermarket') then
				walk('a_sr1'); --пошла вторая часть ивента.
			else	
				superm_room.dsc = _('Никого нет');
				superm_room.pic = 'pic/ivents/a_superm/podsobka.jpg';
				sleep(0,0,5);
				walk('superm_room');	
			end;
		
				
		end;
        return obj(v)
end

a_superm = new('kv_a_superm()')
objs(supermarket):add(a_superm) --так квест будет сохраняться