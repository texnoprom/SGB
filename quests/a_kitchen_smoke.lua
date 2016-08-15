--v0.1 создан 30.01.2016
podokonnik = obj{ 
	nam = 'podokonnik';
    disp = (_('Подоконник'));
	dsc = function(s)
		pn(_('Окно с широким {подоконником}.'));
	end;
	act = function(s)
		if seen('sigar','kitchen') then
			pn (_('На подоконнике лежат сигареты'));
		elseif seen(anna,'kitchen') and anna._sost=='smoke' then
			pn (_('На подоконнике сидит Аня.'));
		else
			pn (_('На нём ночью сидела Аня.'));
		end;	
	end;
}	

sigar = obj{ 
	nam = 'sigar';
    disp = (_('Сигареты'));
	sto = 1500; --цена
	_kolvo = 0; --количество, 20х60 минут. 1 сигарету можно курить час, так как время поминутное, то умножаем на 60
	dsc = function(s)
		if seen(s,'bariga') then
			pn(_('Купить особые {Сигареты}. -  '),s.sto,'g');
		else
			pn(_(' На подоконнике лежит пачка сигарет. '));
		end	
	end;
        act = function(s)
			if seen(s,'bariga') then
				if gold>=s.sto then
					pn (_('Вы купили '),s.disp,'.');
					gold = gold-s.sto;
					s._kolvo = 1200;
					if a_sigar==1 then
						a_sigar=2;
					end;	
					take(s);
							else
					pn (_('Не хватает денег'));
				end;
			end;	
        end;
	use = function(s, w)
		if w==podokonnik then
			move(s,kitchen, me());
			pn (_(' Я аккуратно положил пачку на подоконник, чтобы из комнаты их не было сильно заметно. '))
		else	
			pn (_(' Так не выйдет '));		return false
		end;				
	end	
};
a_kitchen_smoke = room{
    nam = 'a_kitchen_smoke';
	disp = _('Кухня');
	pic = 'pic/anya/kitchen/S1.jpg';
	enter = function (s) 

	end;
	act = function(s)
		if seen('sigar','kitchen') then --ещё есть сигареты в комнате
			walk('a_k_s1');		
		else
			if a_sigar==0 then
				a_sigar=1; -- я заметил что она курит.
				objs(bariga):add(sigar);
				objs(kitchen):add(podokonnik);
			end;	
			walk('a_kitchen_smoke');
		end;
	end,
	dsc = _([[^
		Аня курит цигарку.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
		vobj('continue', _('^{Продолжать} смотреть.')),};
};

a_k_s1 = room {
	nam ='a_k_s';
	disp = _( 'Аня курит'),
	pic = function(s)
		if anna._vozb<70 then
			return 'pic/anya/kitchen/S'..math.modf(4+(anna._vozb/10))..'.jpg';
		else
			return 'pic/anya/kitchen/S12.jpg';
		end;	
	end;
	act = function(s,w)
		if not seen(anna,'kitchen') then
			pn (_('Аня потушила сигарету в пепельнице, мне пора убегать.'));
			walk('vanna');
		elseif anna._vozb<70 then
			walk(s);
			if rnd(7)==5 then
				pn (_('Пых! Дымок, сладкий, яблочной отдушки, тянется в мои ноздри.'));
			end;
		else
			walk('a_k_s2');
		end;		
	end,
	dsc = _([[^
		Да, ей нравятся мои сигареты.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s2 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S11.jpg';
	end;
	act = function(s,w)
		walk('a_k_s3');
	end,
	dsc = _([[^
		Аня потушила сигарету, но уходить не спешит.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s3 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S12.jpg';
	end;
	act = function(s,w)
		if a_sigar==2 then
			pn (_('Весь красный, как рак, я убегаю к себе в комнату, вау... они работают!'));
			a_sigar=3;
			walk ('toroom');
		else
			walk('a_k_s4');
		end;
	end,
	dsc = _([[^
		Бог мой! Барыга не соврал.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s4 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S13.jpg';
	end;
	act = function(s,w)
		walk('a_k_s5');
	end,
	dsc = _([[^
		Хотел уже выйти... но что-то меня остановило.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s5 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S14.jpg';
	end;
	act = function(s,w)
		walk('a_k_s6');
	end,
	dsc = _([[^
		Наверно эта рука в трусах.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s6 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S15.jpg';
	end;
	act = function(s,w)
		walk('a_k_s7');
	end,
	dsc = _([[^
		Мне захотелось посмотреть на извивающуюся Аньку.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s7 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S16.jpg';
	end;
	act = function(s,w)
		walk('a_k_s8');
	end,
	dsc = _([[^
		Анне уже было невмоготу, она сняла трусы.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s8 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S17.jpg';
	end;
	act = function(s,w)
		walk('a_k_s9');
	end,
	dsc = _([[^
		Она закрыла глаза и принялась мастурбировать прямо у меня на глазах, я достал свой член и задвигал вдоль ствола.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
	vobj('continue', dalee),
	},
};
a_k_s9 = room {
	nam ='a_k_s';
	disp = _( 'Аня '),
	pic = function(s)
		return 'pic/anya/kitchen/S18.jpg';
	end;
	act = function(s,w)
		if not seen('vibrator',kitchen) then
			anna.change(1,0,0-anna._vozb);
			pn (_('Мы кончили одновременно, пока моя сперма сползала по кухонной двери, я уже был в своей комнате.'));
			walk('toroom');
		end;
	end,
	dsc = _([[^
		Когда Аня закричала, я сильнее задвигал рукой, страх что её услышат и увидят меня, онанирующего на сестру, ещё больше возбуждал.
	]]),
	obj = {	vobj('continue', dalee),
	},
};


