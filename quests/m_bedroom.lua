--v0.1 создан 14.12.2015

room_m_bedroom = room{
    nam = _('Мама в комнате у сестёр');
	pic = 'pic/ivents/m_bedroom_uborka/2.jpg';
	enter = function (s) 

	end;
	act = function(s)
		if ma._sost=='uborka' then
			walk(m_br1);		
		else
			walk('bedroom');
		end;
	end,
	dsc = _([[^
		Мама делает обычную уборку в комнате у сестёр.
	]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', _('^{Продолжать} смотреть.')),};

};
m_br1 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/3.jpg';
	act = function()
		walk('m_br2');
	end,
	dsc = _([[^
		Вот она убирает разбросанные лифчики.
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};
m_br2 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/4.jpg';
	act = function()
		walk('m_br3');
	end,
	dsc = _([[^
		А может и не убирает, что-то она долго его разглядывает.
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};
m_br3 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/6.jpg';
	act = function()
		walk('m_br4');
	end,
	dsc = _([[^
		Вот уже до трусиков добралась.
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};
m_br4 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/7.jpg';
	act = function()
		walk('m_br5');
	end,
	dsc = _([[^
		Чулочки...
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};
m_br5 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/11.jpg';
	act = function(s,w)
		if w=='grud' then
			walk('m_brg1');
		else
			walk('m_brp1');
		end;	
	end,
	dsc = _([[^
		Да она же раздевается!
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('grud',  _('^Смотреть на {грудь}.')),
		vobj('popka', _('^Смотреть на {попку}.')),
	},
};
m_brg1 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/8.jpg';
	act = function(s,w)
		walk('m_brg2');
	end,
	dsc = _([[^
		Потрясная грудь!
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('grud',  dalee),	},
};
m_brg2 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/12.jpg';
	act = function(s,w)
		walk('m_br6');
	end,
	dsc = _([[^
		Она одевает Анькин бюстгалтер!
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('grud',  dalee),},
};
m_brp1 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/9.jpg';
	act = function(s,w)
		walk('m_brp2');
	end,
	dsc = _([[^
		Шикарная попка!
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('grud',  dalee),},
};
m_brp2 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/10.gif';
	act = function(s,w)
		walk('m_br6');
	end,
	dsc = _([[^
		Она одевает Анькины трусики!
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('grud',  dalee),	},
};
m_br6 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/13.jpg';
	act = function()
		walk('m_br7');
	end,
	dsc = _([[^
		Чулочки...
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee);},
};
m_br7 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/14.jpg';
	act = function()
		if ma._razvr<5 then
			walk('m_br8');
			pn (_('мало разврата'))	;
		else
			walk('m_br9');
		end;	
	end,
	dsc = _([[^
		Теперь второй. Мама облачилась полностью в наряд Ани, он ей сильно жмёт.
		Что же мне делать, войти?
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
		vobj('popka', _('^{Войти}.')),	},
};
m_br8 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/15.jpg';
	act = function()
	end,
	dsc = _([[^
		Вы попытались войти, но мама прикрыла дверь и попросила меня не входить.
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
	},
};
m_br9 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/16.jpg';
	act = function()
		walk('m_br10');
	end,
	dsc = _([[^
		Как только дверь начала приоткрываться, мама испуганно накинула халатик.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br10 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/19.jpg';
	act = function(s,w)
		if w =='v1' then
			ma.change(0,0,1);
			if ma._razvr<10 then
				m_br11.pic = 'pic/ivents/m_bedroom_uborka/20.jpg';
				m_br11.dsc = _([[^Мама смущаясь повернулась ко мне и прикрыла коленку, как смогла.	]]);
			else
				m_br11.pic = 'pic/ivents/m_bedroom_uborka/21.jpg';
				m_br11.dsc = _([[^Мама повернулась ко мне, приподняла халатик, чтобы лучше было видно чулки и сказала, - Спасибо.	]]);
			end;
			walk('m_br11');	
		elseif w=='v2'	then
			if ma._razvr<15 then	
				walk('m_br12');	
				pn 'Мало разврата';
			else
				walk('m_br14');	
			end	
		elseif w=='v3'	then
			if ma._razvr<17 then	
				walk('m_br13');	
				pn 'Мало разврата';
			else
				walk('m_br15');	
			end		
		else 
			if ma._razvr<20 then	
				walk('m_br13');	
				pn 'Мало разврата';
			else
				walk('m_br17');	
			end			
		end;	
	end,
	dsc = _([[^
		Вы вошли в комнату. Что дальше?
	]]),
	obj = {
		 vobj('v1', _('^- Мам, какие красивые {чулочки}.')),
		 vobj('v2', _('^- Мам, а ведь это не твой {халатик}!.')),
		 vobj('v3', _('^- Мам, а ведь это не твой {бюстгалтер}!')),
		 vobj('v4', _('^- Мам, а ведь это не твои {чулки}!')),
		 },
};

m_br11 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/16.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br11_1');
	end,
	dsc = _([[^
		
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br11_1 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/22.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br11_2');
	end,
	dsc = _([[^
		- И бюстгалтер у тебя красивый. 
		^ Мама немного распахнула халатик и ожидала продолжения.
	]]),
	obj = {
		vobj('v4', _('^- Наверно и {трусики} у тебя красивые? ')),	},
};
m_br11_2 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/24.jpg';
	act = function()
		ma.change(0,0,3)
		walk('m_br11_3');
	end,
	dsc = _([[^
		Мама с улыбкой отбросила халатик и показала трусики.
	]]),
	obj = {
		vobj('v4', _('^- А можно я ткань {потрогаю}? ')),	},
};
m_br11_3 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/25.jpg';
	act = function()
		ma.change(0,0,3)
		walk('m_br11_4');
	end,
	dsc = _([[^
		- Ну можно, только осторожно.
		^ Я нежно взялся за бюстгалтер.
	]]),
	obj = {
		vobj('v4', _('^- И чулочки теперь приятные на {ощупь} ')),	},
};
m_br11_4 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/26.jpg';
	act = function()
		ma.change(0,0,3)
		walk('m_br11_5');
	end,
	dsc = _([[^
		Я без разрешения стал гладить мамину ножку.
	]]),
	obj = {
		vobj('v4', _('^- Какие приятные {ножки} ')),	},
};
m_br11_5 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/28.jpg';
	act = function()
		ma.change(0,0,3)
		if (ma._razvr<20) and (ma._vozb<70) then
			walk('m_br_end');
		else
			walk('m_br16');
		end;	
	end,
	dsc = _([[^
		Мама прилегла, а я гладил ножки, мама как бы случайно задевала ступнями мой член.
	]]),
	obj = {
		vobj('v1', _('^Лечь и приблизиться лицом к {груди} ')),	},
};
m_br12 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/17.jpg';
	act = function()
	end,
	dsc = _([[^
		-Как ты можешь, сынко? - Мама взялась за полы халата, - Выйди, я его сниму!
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
	},
};
m_br13 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/18.jpg';
	act = function()
	end,
	dsc = _([[^
		-О господи, - мама прикрыла лицо руками, - выйди, я переоденусь.
	]]),
	obj = {
		 vway('закончить', otoyti, 'bedroom'),
	},
};
m_br14 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/23.jpg';
	act = function()
		walk('m_br15');
	end,
	dsc = _([[^
		- Да господи, я его могу и снять, нужен он мне больно.
	]]),
	obj = {
		 vobj('v4', _('^- Наверное тебе и {бюстгалтер} не нужен? ')),	},
};
m_br15 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/25.jpg';
	act = function()
		walk('m_br16');
	end,
	dsc = _([[^
		- Да не нужен он мне.
		^ - Раз не нужен, тогда я его сниму, с такими словами вы потянулись рукой к маминой груди.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br16 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/29.jpg';
	act = function()
		walk('m_br20');
	end,
	dsc = _([[^
		Я лёг на маму сверху и стал медленно снимать бюстгалтер
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br17 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/26.jpg';
	act = function()
		ma.change(0,0,2)
		walk('m_br18');
	end,
	dsc = _([[^
		- Ну подумаешь не мои, но ведь правда хорошо сидят? Потрогай.
		^ Я конечно не отказался от такого предложения.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br18 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/27.jpg';
	act = function()
		ma.change(0,0,5)
		walk('m_br19');
	end,
	dsc = _([[^
		- Видишь какие приятные?
		^ - Мам, я хочу потрогать ещё кое что.
		^ Мама откинулась назад, раскрыв рот.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br19 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/31.jpg';
	act = function()
		ma.change(0,0,7)
		walk('m_br21');-----------------------
	end,
	dsc = _([[^
		Не теряя ни секунды я развёл её ноги в строны и засунул свои пальцы в её мокрую киску.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br20 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/30.jpg';
	act = function()
		ma.change(0,0,2)
		walk('m_br21');
	end,
	dsc = _([[^
		Я оголил её правую грудь, мама улыбнулась и сказала, - Ну так же тебе неудобно снимать, ложись, отдохни, мама сама снимет его.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br21 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/up.jpg';
	act = function()
		walk('m_br22');
	end,
	dsc = _([[^
		Мама оттолкнула меня и поднялась с кровати
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br22 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/polot.jpg';
	act = function()
		walk('m_br23');
	end,
	dsc = _([[^
		- Мам, а ведь Аня разозлится, если я ей скажу что ты одевала её бельё.
		^- А может она не узнает? - Спросила мама, водя руками вдоль моего тела.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br23 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/32.jpg';
	act = function()
		walk('m_br24');
	end,
	dsc = _([[^
		Сбросив полотенце, она увидела мой напряжённый, торчащий прямо в лицо, член.
		^- Я поводил им около её лица, - Ну если ты поиграешь с этим джойстиком, то ничего не узнает.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br24 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/33.jpg';
	act = function()
		walk('m_br25');
	end,
	dsc = _([[^
		С трудом оторвав взляд от члена, она медленно сняла бюстгалтер.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br25 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/34.jpg';
	act = function()
		ma.change(0,0,2)
		walk('m_br26');
	end,
	dsc = _([[^
		И сразу вернулась к члену, поместив его между грудей.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br26 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/35.jpg';
	act = function()
		ma.change(0,0,3)
		walk('m_br27');
	end,
	dsc = _([[^
		Она просто не могла отвести от него взгляд.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br27 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/prek.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br28');
		else
			walk('m_br34');
		end;	
	end,
	dsc = _([[^
		Наконец она прекратила сие действие, откинувшись назад и взмахнув волосами, разминая шею.
	]]),
	obj = {
			vobj('v1', _('^Остаться {лежать} ')),
			vobj('v2', _('^{Подняться} ')),		 },
};
m_br28 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/36.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br29');
	end,
	dsc = _([[^
		Я остался лежать, а мама продолжала играться с моим членом.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br29 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/37.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br30');
	end,
	dsc = _([[^
		- Тебе хорошо?
		^ - Да, только если ты возьмёшь его в рот, будет ещё лучше.
		^ - Но...
		^ - Но ты ещё не в своих трусиках, давай, бери в рот, и я ничего не замечу, кроме твоего язычка.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br30 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/38.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br31');
	end,
	dsc = _([[^
		Мама аккуратно опустила голову на головку.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br31 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/39.gif';
	act = function()
		ma.change(0,0,1)
		walk('m_br32');
	end,
	dsc = _([[^
		Двигаясь вдоль ствола она всё глубже и глубже захватывала член, я осторожно протянул руку.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br32 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/40.jpg';
	act = function()
		ma.change(0,0,2)
		walk('m_br33');
	end,
	dsc = _([[^
		Положив руки на волосы я стал увеличивать темп, насаживая эту искусственную вагину для мастурбации.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br33 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/41.jpg';
	act = function()
		ma.change(1,0,-40)
		walk('m_br_end2');
	end,
	dsc = _([[^
		- Упф.. Къъъ Кхххх
		^ - Забыв обовсём на свете я кончал маме в рот, не давая ей вырваться.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br_end2 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/end2.jpg';
	act = function()
		walk('toroom');
	end,
	dsc = _([[^
		Мама наконец высвободилась, проглотив всё.
		^ - Ты фто такое делаеф?
		^ Но я не стал дослушивать её восклицания, а быстро смотался к себе в комнату.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br34 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/42.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br35');
	end,
	dsc = _([[^
		Я встал, мама с напряжением смотрела на мой член в своих руках, видимо не особо радуясь возникшей ситуации, когда она голая на коленях стоит перед членом.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br35 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/45.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br36');
	end,
	dsc = _([[^
		С таким же напряжением она принялась его массировать. Мне это не понравилось, я решил немного сменить атмосферу.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br36 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/44.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br37');
	end,
	dsc = _([[^
		- Мама, ты как-то напряжена, отпусти его и просто открой рот, хорошо?
		^ - Хорошо, - мама убрала руки с члена и открыла рот, не спуская с него напряжённого взгляда.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br37 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/48.jpg';
	act = function()
		walk('m_br38');
	end,
	dsc = _([[^
		Пользуясь тем, что она ничего не замечала кроме члена, я осторожно завёл руку за её голову...
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br38 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/47.jpg';
	act = function()
		walk('m_br39');
	end,
	dsc = _([[^
		...И с размаха насадил её открытый рот на свой член. Мне показалась, будто она кукла, ненастоящая, так странно я могу ей управлять.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br39 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/43.jpg';
	act = function()
		walk('m_br40');
	end,
	dsc = _([[^
		Но мама наконец подняла на меня удивлённые глаза.
		^ - Вот, мам, наконец ты немного расслабилась, продолжай в том же духе.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br40 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/46.jpg';
	act = function()
		walk('m_br41');
	end,
	dsc = _([[^
		Мама немного слезла со ствола, но взявшись за него обеими руками, продолжила и сосать и массировать.
		^ - Так гораздо лучше, мам.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br41 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/49.jpg';
	act = function()
		walk('m_br42');
	end,
	dsc = _([[^
		Мама закончила массаж, лизнула и спросила - Ты доволен?
		^ - Нет, ты что, на тебе ещё трусики сестры, а она будет очень недовольна, узнав что ты их пачкала своей киской.
		^ - Так что же мне делать? Снять их?
		^ - Нет, вставай, я сам их сниму.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br42 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/50.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br43');
	end,
	dsc = _([[^
		Мама нехотя поднялась, я погладил ей спинку, добираясь до трусиков.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br43 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/51.jpg';
	act = function()
		ma.change(0,0,3)
		walk('m_br44');
	end,
	dsc = _([[^
		Поглаживая её попку, я принялся снимать трусики. Мама обперлась об стену и немного застонала.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br44 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/52.jpg';
	act = function()
		ma.change(0,0,3)
		walk('m_br45');
	end,
	dsc = _([[^
		Увидев её мокрую киску и нежную попку, я зарылся носом между её полушарий.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br45 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/53.jpg';
	act = function()
		ma.change(0,0,3)
		walk('m_br46');
	end,
	dsc = _([[^
		Спустился ниже и поиграл язычком с её киской, мама закрыв глаза только сучила ручками от удавольствия.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br46 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/54.jpg';
	act = function()
		ma.change(0,0,1)
		walk('m_br47');
	end,
	dsc = _([[^
		Я уже не мог терпеть, встал, прижав член к её попке.
	]]),
	obj = {
		 vobj('continue', dalee);	},
};
m_br47 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/56.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br_t1');
		else
			ma.change(0,0,5)
			walk('m_br48');
		end;	
	end,
	dsc = _([[^
		- Мама испугавшись обернулась, ты что сынок, нельзя его всовывать в маму! Это неправильно!
		^- Ну мааа.. Ну конечно не буду всовывать, я его просто потру, ладно?
	]]),
	obj = {
		 vobj('v1', _('^{Потереться} об маму ')),
		 vobj('v2', _('^{Поговорить} ')),		 },
};
m_br_t1 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/ter2_1.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br_t2');
		else
			ma.change(0,0,5)
			walk('m_br48');
		end;	
	end,
	dsc = _([[^
		Я принялся тереть член между полушарий мамы, а она внимательно следила, чтобы он никуда не проник.
	]]),
	obj = {
		 vobj('v1', _('^{Потереться} об маму ')),
		 vobj('v2', _('^{Поговорить} ')),		 },
};
m_br_t2 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/ter2_2.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br_t3');
		else
			ma.change(0,0,5)
			walk('m_br48');
		end;	
	end,
	dsc = _([[^
		Я принялся тереть член между полушарий мамы, а она внимательно следила, чтобы он никуда не проник.
	]]),
	obj = {
		 vobj('v1', _('^{Потереться} об маму ')),
		 vobj('v2', _('^{Поговорить} ')),		 },
};
m_br_t3 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/ter2_3.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br_t4');
		else
			ma.change(0,0,5)
			walk('m_br48');
		end;	
	end,
	dsc = _([[^
		Я принялся тереть член между полушарий мамы, а она внимательно следила, чтобы он никуда не проник.
	]]),
	obj = {
		 vobj('v1', _('^{Потереться} об маму ')),
		 vobj('v2', _('^{Поговорить} ')),		 },
};
m_br_t4 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/ter2_4.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br_t5');
		else
			ma.change(0,0,5)
			walk('m_br48');
		end;	
	end,
	dsc = _([[^
		Я принялся тереть член между полушарий мамы, а она внимательно следила, чтобы он никуда не проник.
	]]),
	obj = {
		 vobj('v1', _('^{Потереться} об маму ')),
		 vobj('v2', _('^{Поговорить} ')),		 },
};
m_br_t5 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/ter2_3.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br_t6');
		else
			ma.change(0,0,5)
			walk('m_br48');
		end;	
	end,
	dsc = _([[^
		Я принялся тереть член между полушарий мамы, а она внимательно следила, чтобы он никуда не проник.
	]]),
	obj = {
		 vobj('v1', _('^{Потереться} об маму ')),
		 vobj('v2', _('^{Поговорить} ')),		 },
};
m_br_t6 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/ter2_2.jpg';
	act = function(s,w)
		if w=='v1' then
			walk('m_br_t1');
		else
			ma.change(0,0,5)
			walk('m_br48');
		end;	
	end,
	dsc = _([[^
		Я принялся тереть член между полушарий мамы, а она внимательно следила, чтобы он никуда не проник.
	]]),
	obj = {
		 vobj('v1', _('^{Потереться} об маму ')),
		 vobj('v2', _('^{Поговорить} ')),		 },
};
m_br48 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/57.jpg';
	act = function(s,w)
		if w=='v1' then
			ss = 0;
			walk('m_br_tt1');
		else
			ma.change(0,0,5)
			walk('m_br49');
		end;	
	end,
	dsc = _([[^
		- Видишь, я не буду в тебя его засовывать, тебе же нравится, что я просто им вожу?
		^- Даа... - Мамины глаза покрылись туманом. И она сама принялась двигать попкой, приговаривая бессвязные слова.
		
	]]),
	obj = {
		 vobj('v1', _('^{Позволить} ей тереться о член. ')),
		 vobj('v2', _('^{Закончить} ')),		 },
};
m_br_tt1 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = function (s)
		if ss==6 then ss=1
		else ss= ss+1 end;
		return 'pic/ivents/m_bedroom_uborka/ter1_'..ss..'.jpg';
	end;	
	act = function(s,w)
		if w=='v1' then
			walk('m_br_tt1');
		else
			ma.change(0,0,5)
			walk('m_br49');
		end;	
	end,
	dsc = function ()
		local i = 0
		i = rnd(9);
		if i==1 then pn (_('- Люби маму, сынок...')) elseif i==2 then pn (_('- даже голую...'))
			elseif i==3 then pn (_('- трись...')) elseif i==4 then pn (_('- гладь...'))
			elseif i==5 then pn (_('- лижи...')) elseif i==6 then pn (_('- люби...'))
			elseif i==7 then pn (_('- я не шлюха...')) elseif i==8 then pn (_('- я хорошая мама...'))
			else pn (_('- я помогаю...')) end;
	end,	
		
	obj = {
		 vobj('v1', _('^{Позволить} ей тереться о член. ')),
		 vobj('v2', _('^{Закончить} ')),		 },
};
m_br49 = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/58.jpg';
	act = function(s,w)
			walk('toroom');
			ma.change(1,0,-60)
	end,
	dsc = _([[^
		Мам... я кончаю!
		^- Сынок, нельзя пачкать комнату сестёр! Я тут только убрала! Давай всё мне на лицо!
		^ Мама повернулась ко мне лицом, и я выбрызнул моё семя на её светящиеся глаза.
	]]),
	obj = {
		 vobj('v1', _('^{Уйти} ')),  },
};
m_br_end = room {
	nam = 'm_br',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/m_bedroom_uborka/end.jpg';
	act = function(s,w)
			walk('toroom');
	end,
	dsc = _([[^
		Мама отбросила меня, встала и выпроводила из комнаты.
		^- Сынок, я знаю что ты никому не расскажешь, что я одевала Анины вещи, потому что я не расскажу отцу, что ты хотел меня за грудь полапать.
		^ Мне не оставалось ничего, как уйти.
	]]),
	obj = {
		 vobj('v1', _('^{Уйти} ')),  },
};