--v0.1 создан 06.12.2015
--Встеча мамы после ванной комнаты.minutT=59
function kv_m_after_bath()
        local v = kvest('m_after_bath');
        v.dsc = function()
			if (live('ma')._rel>1) and (ma._sost=='vanna') then
				pn(_(' ^{Прилечь} на мамину кровать.'));
			end;
		end;
		v.act = function(s)

				walk('room_m_after_bath');
		end;
        return obj(v)
end

room_m_after_bath = room{
    nam = _('На кровати');
	pic = 'pic/ivents/m_after_bath/1.jpg';
	act = function(s,w)
		if ma._sost~='vanna' then
			walk('r_mab1');
		elseif w=='five' then
			sleep(0,0,5)
			walk(s);
		elseif w=='mobil' then
			sleep(0,0,5)
			walk('r_m_mobil');	
		else
			walk(s);
		end;	
	end,
	dsc = _([[^ Я комфортно расположился на маминой кровати.
	]]),
	obj = { vway('закончить', _('{Встать.}'), 'motherroom'), vobj('continue', _(' ^{Поваляться} ')),
	vobj('mobil', _(' ^{Посмотреть} картинки на оставленной мамой мобиле. ')),
	vobj('five', _(' ^{Поваляться 5 минут} ')),};
};

r_m_mobil = room {
	nam =_( 'Копаюсь в телефоне'),
	pic = function()
		local fot;
		if ma._razvr<4 then 
			fot = 'pic/ivents/m_after_bath/mobil1.jpg.jpg';
		elseif ma._razvr<89 then
			fot = 'pic/ivents/m_after_bath/mobil'..rnd(ma._razvr/8+1)..'.jpg';
		else
			fot = 'pic/ivents/m_after_bath/mobil'..rnd(12)..'.jpg';
		end;	
		return fot;
	end;
	act = function()
		walk('room_m_after_bath');
	end;
	dsc = _([[^
		Мама любит делать селфи.
	]]);
	obj = {
		vobj('continue', dalee),
	},
};

m_after_bath = new('kv_m_after_bath()')
objs(motherroom):add(m_after_bath) --так квест будет сохраняться

r_mab1 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/2.jpg';
	act = function()
		walk('r_mab2');
	end,
	dsc = _([[^
		Тут же как по волшебству раздался звук открывания двери в ванной комнате , мама вошла в своем банном полотенце, который едва прикрывал ее попку.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mab2 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/3.jpg';
	act = function(s,w)
		if ma._razvr<4 then
			walk('r_mab3');
		elseif w=='r_mabs1' then
			walk (w);	
		else
			walk('r_mab4');
		end;	
	end,
	dsc = _([[^
		Мама, заметив меня, прикрылась полотенцами.
	]]),
	obj = { vobj('r_mabs1', _('^- Мам, а ты наследила - {Показать} на пятна воды.')),
		vobj('continue', _('{Продолжать тихо лежать на кровати.}')),
	},
};
r_mab3 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/3b.jpg';
	act = function()
		walk('home');
	end,
	dsc = _([[^
		-Коля, нечего тут валяться, выйди, маме нужно переодеться.
	]]),
	obj = {
		vobj('continue', _('{Встать и выйти из комнаты.}')),
	},
};
r_mab4 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/4.jpg';
	act = function()
			walk('r_mab5');
	end,
	dsc = _([[^
		Я каждый день вижу ее в этом виде и уже как то стал привыкать, но сегодня она двигалась как то иначе. В каждом шаге, в каждом движении она проявляла какую-то пикантность, то попку оттопырит, то волосами встряхнет.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mab5 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/5.jpg';
	act = function(s,w)
		if w=='out' then
			walk('home');
		else
			if ma._razvr<20 then
				if ma._vozb<50 then
					ma.change(0,0,rnd(2)-1);
					s.dsc = _([[^ Мама отстранила полотенце.
								^- Ну что, ещё не насмотрелся? Как насмотришься, вставай и уходи.
							]])
					walk(s);		
				else
					pn (_('Мама не выдержала, накинула себя одежду и вышла из комнаты.'));
					walk('motherroom');
				end;
			else
				ma._vozb = 9;
				walk('r_mab6');
			end;
		end;	
	end,
	dsc = _([[^ Мама отстранила полотенце.
		^- Посмотрел? Маленький извращенец, так вставай и выходи, маме нужно одеться.
		^- Ну мааааам!
		^- Не мамкай тут! Выходи.
	]]),
	obj = {vobj('continue', _('^- Ну мааааааааааам! - {Продолжать} пялиться на неё.')),
	
		vobj('out', _('^{Встать и выйти из комнаты.}')),
	},
};

r_mabs1 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s1.jpg';
	act = function()
			walk('r_mabs2');
	end,
	dsc = _([[^
		- Ой, точно, сейчас все уберу.
     ^После этих слов она медленно опустилась на корточки и встала на колени, выгнув спину, задрала попку в самый верх. Полотенце натянулось на ее ягодицах до предела, казалось сейчас не выдержит и с треском порвется , раскрывая прелести маминых окружностей и изгибов. Обычно дома она носит узенькие трусишки ярких цветов, но на работу одевает всегда строгие, белые или же черные. Домашние трусишки настолько тоненькие что полоска на попе полностью уходит в ее недры и создается впечатление что нижнего белья и вовсе на ней нет.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};

r_mabs2 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s2.jpg';
	act = function()
			walk('r_mabs3');
	end,
	dsc = _([[^
		  Я жадно наблюдал как мама ползает по полу орудуя тряпкой. Когда она добралась до обувных полок, ей пришлось нагнуться так, что полотенце на ее попе совсем задралось, полностью раскрыв ее половую щель и задрав ее вверх.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mabs3 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s3.jpg';
	act = function()
			walk('r_mabs4');
	end,
	dsc = _([[^
		  Он не просто задрался а соскочил с ее упругих ягодиц, что заставило их колыхнуть несколько раз. Соскользнув с ее поясницы он полностью оголил ее узенький задний проход. К моему невероятному удивлению, она даже не попыталась его снова натянуть. Я увидел то самое анальное отверстие, что меня манило. Оно было чуть приоткрыто, словно манило войти в него. В голове звучали мамины стоны и просьбы выебать ее в жопу. 
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mabs4 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s4.jpg';
	act = function()
			walk('r_mabs5');
	end,
	dsc = _([[^
		   - Эй, молодой человек... МОЛОДОЙ ЧЕЛОВЕК! (Окликнула меня она.)
     ^Мама по-прежнему стояла на четвереньках, попкой ко мне, обернувшись, она смотрела на меня с весьма озадаченным взглядом. Эта сучка даже не удосужилась прикрыть свои сладкие дырочки, все так же выставляя их напоказ, она подозвала меня к себе. 
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mabs5 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s5.jpg';
	act = function()
			walk('r_mabs6');
	end,
	dsc = _([[^
		   - Мааа?
     ^Единственное что вырвалось из моего рта, когда я подошел.
     Я старался смотреть ей в глаза, но её задница была направленна прямо в мою сторону, и анальное отверстие было направленно строго вверх. Упругие, округлые ягодицы вибрировали и колыхались от малейшего движения. 
	]]),
	obj = {
		vobj('continue', dalee),
	},
};

r_mabs6 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s6.jpg';
	act = function()
			walk('r_mabs7');
	end,
	dsc = _([[^
		     - Посмотри пожалуйста, там в углу что-то завалялось, а я не могу достать, уж больно ручки коротки... Может у тебя получится?
     ^Я с трудом оторвал взгляд от оголенной жопы мамы, опустился на пол, рядом с ней и начал вглядываться в угол под обувной полкой. Там действительно что-то лежало. Мне пришлось максимально вытянуться, чтобы приблизиться и достать его. 
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mabs7 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s7.jpg';
	act = function()
			walk('r_mabs8');
	end,
	dsc = _([[^
		    Тут же я почувствовал женский аромат, приятный, сладкий, манящий. Подняв голову, чтобы посмотреть что слева от меня я увидел как мама стоит раком как последняя сука, выпятив зад прямо перед моим лицом. Она пыталась координировать меня и говорила:
     ^- Левее, еще чуть-чуть, ты почти достал.
     ^Она совершенно не контролировала свой зад по уши забравшись под полку. В тот момент когда я повернулся на приятный манящий запах женских выделений, ее пизда была в пяти сантиметрах от моего носа.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mabs8 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s8.jpg';
	act = function()
			walk('r_mabs9');
	end,
	dsc = _([[^
		    С широко расставленными ногами и задранным верх очком, она попятилась назад, пытаясь расположиться поудобнее, тем самым насев на мой нос своей расщелиной. Почувствовав что она уперлась задницей в мое лицо, она вовсе не собиралась отдергиваться, отнюдь, она заерзала вверх-вниз, размазывая вязкие выделения по моему лицу. Мой хуй рвал шорты. В Яйцах закипело.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
r_mabs9 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/s9.jpg';
	act = function()
		sleep(0,1,0)
		ma.change(0,0,50);
		walk('motherroom');
	end,
	dsc = _([[^
		   Она вылезла, повернулась, посмотрела на меня с невинной улыбкой и невзначай поправила халат, прикрыв задок сказала: Ой! И весело протерла мне лицо тыльной стороной ладони.
     ^- Ну что, ухватился?
     ^Я уже давно достал этот ныне утерянный предмет, просто держал его в руке и наслаждался промежностями своей любимой мамы. Наконец вытащив его я увидел что это был огромный, черный, сантиметров тридцать наверное, резиновый хуй. Мама быстро выхватила его у меня из рук и с легкой улыбкой упорхала, оставив меня с диким кровоизлиянием в моем хую который рвало на части. 
	]]),
	obj = {
		vobj('continue', dalee),
	},
};

r_mab6 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/5.jpg';
	act = function(s,w)
		if w=='out' then
			s.pic = 'pic/ivents/m_after_bath/5.jpg'; --начальную картинку ставим, так как она меняется в следующей комнате
			s.dsc = _([[^ - Ну что, так и будешь смотреть? Я не могу стоять тут вечно. Уходи.]]),
			walk('home');
		else
			if ma._vozb<10 then
				ma.change(0,0,1);
					s.dsc = _([[^ Мама стоит напротив меня, ожидая пока я уйду.		]])
					walk(s);		
			elseif ma._vozb<20 then
				ma.change(0,0,1);
				s.dsc = _([[^ Ей надоело, она отвернулась и стала понемногу вытираться.]])
				s.pic = 'pic/ivents/m_after_bath/7.jpg';
				walk(s);
			elseif ma._vozb<30 then
				ma.change(0,0,1);
				s.dsc = _([[^ Она повернулась ко мне, вытираясь, чтобы проверить что я ещё смотрю.]])
				s.pic = 'pic/ivents/m_after_bath/8.jpg';
				walk(s);	
			elseif ma._vozb<40 then
				ma.change(0,0,1);
				s.dsc = _([[^ С улыбкой продолжает вытирать ноги.]])
				s.pic = 'pic/ivents/m_after_bath/10.jpg';
				walk(s);
			elseif ma._vozb<50 then
				ma.change(0,0,1);
				s.dsc = _([[^ Закусив губу вытирается уже как-то странно.]])
				s.pic = 'pic/ivents/m_after_bath/9.jpg';
				walk(s);
			elseif ma._vozb<60 then
				ma.change(0,0,1);
				s.dsc = _([[^ Она снова повернулась спиной, но огланулась посмотреть на мою реакцию.]])
				s.pic = 'pic/ivents/m_after_bath/6.jpg';
				walk(s);	
			elseif ma._vozb<70 then
				ma.change(0,0,1);
				s.dsc = _([[^ Ух как она старательно трёт спину.]])
				s.pic = 'pic/ivents/m_after_bath/11.jpg';
				walk(s);
			elseif ma._vozb<80 then
				ma.change(0,0,1);
				s.dsc = _([[^ Закончив вытираться, она принялась вытирать свою киску, забыв что в руках нет полотенца.]])
				s.pic = 'pic/ivents/m_after_bath/13.jpg';
				walk(s);	
			elseif ma._vozb<84 then 
				ma.change(0,0,1);
				s.dsc = _([[- Ой, что-то я замечталась, - Сказала мама, прикрывая свою горячую киску полотенцем.
					^- Ты не мог бы всё-таки выйти, я оденусь.]])
				s.pic = 'pic/ivents/m_after_bath/14.jpg';
				walk(s);
			else
				s.pic = 'pic/ivents/m_after_bath/5.jpg'; --начальную картинку ставим, так как она меняется в следующей комнате
				s.dsc = _([[^ - Ну что, так и будешь смотреть? Я не могу стоять тут вечно. Уходи.]]);
				if ma._razvr<30 then
					walk('r_mab7'); --одевается
				else
					walk('r_mab8'); --секс
				end;	
			end;

		end;	
	end,
	dsc = _([[^ - Ну что, так и будешь смотреть? Я не могу стоять тут вечно. Уходи.
	]]),
	obj = {vobj('continue', _('^{Продолжать} пялиться на неё.')),
		vobj('out', _('^{Встать и выйти из комнаты.}')),
	},
};

r_mab7 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/od1.jpg';
	act = function(s,w)
		if w=='out' then
			s.pic = 'pic/ivents/m_after_bath/od1.jpg'; --начальную картинку ставим, так как она меняется в следующей комнате
			s.dsc = _([[^ - Блин, ладно как хочешь, - Сказала мама и взяла в руки трусики.	]]),
			walk('home');
		else
			if ma._vozb<86 then
				ma.change(0,0,1);
				s.dsc = _([[^ Мама одевает трусики.]])
				s.pic = 'pic/ivents/m_after_bath/od2.jpg';
				walk(s);		
			elseif ma._vozb<88 then
				ma.change(0,0,1);
				s.pic = 'pic/ivents/m_after_bath/od3.jpg';
				walk(s);
			elseif ma._vozb<90 then
				ma.change(0,0,1);
				s.pic = 'pic/ivents/m_after_bath/od4.jpg';
				walk(s);	
			elseif ma._vozb<92 then
				ma.change(0,0,1);
				s.dsc = _([[^ Взяла бюстгалтер.]])
				s.pic = 'pic/ivents/m_after_bath/od5.jpg';
				walk(s);
			elseif ma._vozb<94 then
				ma.change(0,0,1);
				s.pic = 'pic/ivents/m_after_bath/od6.jpg';
				walk(s);
			elseif ma._vozb<96 then
				ma.change(0,0,1);
				s.dsc = _([[^ Поправила бюст.]])
				s.pic = 'pic/ivents/m_after_bath/od7.jpg';
				walk(s);	
			else
				s.pic = 'pic/ivents/m_after_bath/od1.jpg'; --начальную картинку ставим, так как она меняется в следующей комнате
				s.dsc = _([[^ - Блин, ладно как хочешь, - Сказала мама и взяла в руки трусики.	]]),
				pn (_('Мама оделась и пошла по своим делам.'));
					walk('motherroom');
			end;

		end;	
	end,
	dsc = _([[^ - Блин, ладно как хочешь, - Сказала мама и взяла в руки трусики.	]]),
	obj = {vobj('continue', _('^{Продолжать} пялиться на неё.')),
		vobj('out', _('^{Встать и выйти из комнаты.}')),
	},
};


r_mab8 = room {
	nam =_( 'На кровати'),
	pic = 'pic/ivents/m_after_bath/12.jpg';
	act = function(s,w)
		if w=='out' then
			s.pic = 'pic/ivents/m_after_bath/12.jpg'; --начальную картинку ставим, так как она меняется в следующей комнате
			s.dsc = _([[^ - Блин, ты меня возбудил, маленький засранец,  - Сказала мама и нагнулась, чтобы показать свою влажную киску.	]]),
			walk('home');
		else
			if ma._vozb<86 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Интересно, а ты возбудился?  - Мама потянулась ко мне.]])
				s.pic = 'pic/ivents/m_after_bath/15.jpg';
				walk(s);		
			elseif ma._vozb<87 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Да, он у тебя уже давно стоит!]])
				s.pic = 'pic/ivents/m_after_bath/16.jpg';
				walk(s);
			elseif ma._vozb<88 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Ты же не против, если я его немного поласкаю?]])
				s.pic = 'pic/ivents/m_after_bath/17.jpg';
				walk(s);	
			elseif ma._vozb<89 then
				ma.change(0,0,1);
				s.dsc = _([[^ Язычёк коснулся моего возбуждённого грибочка.]])
				s.pic = 'pic/ivents/m_after_bath/18.jpg';
				walk(s);
			elseif ma._vozb<90 then
				ma.change(0,0,1);
				s.dsc = _([[^ Ротик у мамы был горячик, как и всё её тело после душа.]])
				s.pic = 'pic/ivents/m_after_bath/19.jpg';
				walk(s);
			elseif ma._vozb<91 then
				ma.change(0,0,1);
				s.dsc = _([[^ Мама помогает себе рукой.]])
				s.pic = 'pic/ivents/m_after_bath/20.jpg';
				walk(s);	
			elseif ma._vozb<92 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Мама, твои волосы меня щекочат.
					^ - Хорошо, сейчас уберу.]])
				s.pic = 'pic/ivents/m_after_bath/21.jpg';
				walk(s);
			elseif ma._vozb<93 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Давай я буду их придерживать, - Я протянул руку и гладя маму по голове, убирал волосы.]])
				s.pic = 'pic/ivents/m_after_bath/22.jpg';
				walk(s);
			elseif ma._vozb<94 then
				ma.change(0,0,1);
				s.dsc = _([[^ Как бы невзначая, гладя маму по голове, я чуть-чуть придавливал её к члену.]])
				s.pic = 'pic/ivents/m_after_bath/23.jpg';
				walk(s);
			elseif ma._vozb<95 then
				ma.change(0,0,1);
				s.dsc = _([[^ Я сильно надавил на голову, так что мой большой член вошёл почти полностью в её горло.]])
				s.pic = 'pic/ivents/m_after_bath/24.jpg';
				walk(s);	
			elseif ma._vozb<96 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Ты что? Я чуть не подавилась! Я больше не возьму его в рот!
					^- Ну маааам!]])
				s.pic = 'pic/ivents/m_after_bath/25.jpg';
				walk(s);	
			elseif ma._vozb<97 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Вот, почувствуй мои нежные груди
					^- Ну маааам!]])
				s.pic = 'pic/ivents/m_after_bath/26.jpg';
				walk(s);
			elseif ma._vozb<98 then
				ma.change(0,0,1);
				s.dsc = _([[^ - Ладно, можешь подрочить на мою красивую киску, - Мама повернулась ко мне своей попкой.
					]])
				s.pic = 'pic/ivents/m_after_bath/27.jpg';
				walk(s);	
			elseif ma._vozb<99 then
				ma.change(0,0,1);
				s.dsc = _([[^Я принялся лапать её шикарную задницу.]])
				s.pic = 'pic/ivents/m_after_bath/28.jpg';
				walk(s);
			elseif ma._vozb<100 then
				ma.change(0,0,1);
				s.dsc = _([[^Я застонал и кончил, мама повернулась и проверила.
						- Хорошо, теперь я спокойна, что ты не будешь заниматься непотребством сегодня из-за меня, так что одевайся и выходи, маме нужно таки одеться.]])
				s.pic = 'pic/ivents/m_after_bath/29.jpg';
				walk(s);					
			else
				s.pic = 'pic/ivents/m_after_bath/12.jpg'; --начальную картинку ставим, так как она меняется в следующей комнате
				s.dsc = _([[^ - Блин, ты меня возбудил, маленький засранец,  - Сказала мама и нагнулась, чтобы показать свою влажную киску.	]]),
				pn (_('Я оделся и пошёл к себе в комнату.'));
					walk('toroom');
			end;

		end;	
	end,
	dsc = _([[^ - Блин, ты меня возбудил, маленький засранец,  - Сказала мама и нагнулась, чтобы показать свою влажную киску.	]]),
	obj = {vobj('continue', _('^{Продолжать}.')),
		vobj('out', _('^{Встать и выйти из комнаты.}')),
	},
};