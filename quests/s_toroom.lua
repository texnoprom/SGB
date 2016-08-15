--задания для светы. v 0.1 создан 18.10.2015
--v 0.2 03.11.2015
global {s_zad1 = 0;
s_zadprogress = 0;}

s_toroom_tv = room {
	nam = 's_toroom_tv';
	disp = _( 'Света на диване');
	pic = 'pic/ivents/s_zadanie/1_1.jpg';
	enter = function (s)
		if s_zad1>2 then
			exist 'talk':enable();
			else
			exist 'talk':disable();
		end;	
	end;
	--pic = function (s)		return seensveta.pic	end; -- не катит, даже подрочить не сможет.
	act = function(s,w)
		if w=='say' then
			walk('dlgoper');
		elseif w=='talk' then
			walk('s_z2_1');	
		end;
	end,
	dsc = function (s)
		return seenma.dsc
	end;
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
		vobj('say', _('^ {Поболтать}')),
		vobj('talk', _('^ {Продолжить} давать задания.')):disable(),
	},
};
--второй этап заданий.
s_z2_1 = room{
	nam = 's_z2';
    disp = _('Задание 2');
	pic = 'pic/ivents/s_zadanie/1_1.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(2) == 1 then
			live('sveta').change(0,0,1);
			walk('s_z2_2');
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	- Свет, покажи ножки ]]), 		
	obj = {		vobj('далее', dalee), 	},
};
s_z2_end = room{
	nam = 's_z2';
    disp = _('Облом');
	pic = 'pic/ivents/s_zadanie/1_7.jpg';
	act = function(s,w)
			pn (_('^- Хорошо, - я с понурым видом отстал от Светы. '));
			sleep(0,0,15);
			walk('toroom');
	end,
    dsc =_(	[[^	- Хорошо, - я с понурым видом отстал от Светы. ]]), 		
	obj = {		vobj('далее', dalee), 	},
};
s_z2_2 = room{
	nam = 's_z2';
    disp = _('Задание 2');
	pic = 'pic/ivents/s_zadanie/1_7.jpg';
	act = function(s,w)
		stoplive =1;
		if seen(live('ma'),'toroom') and kv_heart < 5 then
			s_z2_end.pic = 'pic/ma/face.jpg';
			s_z2_end.disp =_(	[[^	- Коля! Отстань от Светланы! ]]);
			walk ('s_z2_end');
		elseif 	seen(live('anya'),'toroom') and kv_heart<4 then
			s_z2_end.pic = 'pic/anya/face.jpg';
			s_z2_end.disp =_(	[[^	- Хаха, Света светит задницей )))) ]]);
			walk ('s_z2_end');
		elseif 	seen(live('sanya'),'toroom') then
			s_z2_end.pic = 'pic/sanya/face.jpg';
			s_z2_end.disp =_(	[[^	Саня с улыбкой смотрел на Свету, так что она засмущалась. ]]);
			walk ('s_z2_end');	
		elseif 	otchim._sost=='dota' then
			walk ('s_z2_3');		
		elseif 	seen(live('otchim'),'toroom') then
			s_z2_end.pic = 'pic/sanya/face.jpg';
			s_z2_end.disp =_(	[[^	- А что это вы тут делаете? Свет, может совсем разденешься? ^ Света испугалась и опустила ножки, прикрывшись. ]]);
			walk ('s_z2_end');	
		elseif live('sveta').plati(2) == 1 then
			live('sveta').change(0,0,1);
			walk('s_z1_9'); -- в обычных ситуациях продолжаем 1е задание.
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	- Прекрасно, только убери пальцы. ]]), 		
	obj = {		vobj('далее', dalee), 	},
};
s_z2_3 = room{
	nam = 's_z2';
    disp = _('Задание 2');
	pic = 'pic/ivents/s_zadanie/2_1.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(5) == 1 then
			live('sveta').change(0,0,4);
			walk('s_z2_4');
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	- Ты что? - Шепотом прошипела Света, - Тут же отец!!! ^ - Да он сильно занят и в наушниках, ничего не заметит!
			^ - Ну я попробую, только следи за ним!]]), 		
	obj = {		vobj('далее', dalee), 	},
};
s_z2_4 = room{
	nam = 's_z2';
    disp = _('Задание 2');
	pic = 'pic/ivents/s_zadanie/2_1.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(5) == 1 then
			live('sveta').change(0,0,4);
			walk('s_z2_5');
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	- Ты что? - Шепотом прошипела Света, - Тут же отец!!! ^ - Да он сильно занят и в наушниках, ничего не заметит!
			^ - Ну я попробую, только следи за ним!]]), 		
	obj = {		vobj('далее', dalee), 	},
};
s_z2_5 = room{
	nam = 's_z2';
    disp = _('Задание 2');
	pic = 'pic/ivents/s_zadanie/2_2.jpg';
	act = function(s,w)
		stoplive =1;
		if w=='turn' then
			if live('sveta').plati(10) == 1 then
				walk('s_z2_6');
			else
				walk('toroom');
			end;	
		elseif live('sveta').plati(5) == 1 then
			live('sveta').change(0,0,5);
			s.pic = 'pic/ivents/s_zadanie/2_'..rnd(2,5)..'.jpg';
			sveta.here('toroom','s_z2_5',' Света сказала что ей пора спать и убежала');
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	- Вот так, проведи рукой, теперь погладь.
			^ Я давал задания Свете, платя по 5 монет, а она со всем соглашалась, хотя у неё был такой вид, будто она готова убежать, 
				как только отчим на неё обернётся. ]]), 		
	obj = {		vobj('далее', dalee), vobj('turn',_('^ {Повернись}, я хочу видеть твою попку.')),	},
};
s_z2_6 = room{
	nam = 's_z2';
    disp = _('Задание 2');
	pic = 'pic/ivents/s_zadanie/2_6.jpg';
	act = function(s,w)
		stoplive =1;
			if live('sveta').plati(10) == 1 then
				live('sveta').change(0,0,3);
				s_z2_7.pic = 'pic/ivents/s_zadanie/2_7.jpg';
				walk('s_z2_7');
			else
				walk('toroom');
			end;	
	end,
    dsc =_(	[[^	Света приподнялась, повернулась ко мне спиной и продемонстрировала свою небольшую попку. ]]), 		
	obj = {		vobj('далее', dalee), 	},
};
s_z2_7 = room{
	nam = 's_z2';
    disp = _('Задание 2');
	pic = 'pic/ivents/s_zadanie/2_7.jpg';
	act = function(s,w)
		stoplive =1;
		if w=='turn' then
			pn (_('Я решил закончить на сегодня.'));
			walk('toroom');
		elseif live('sveta').plati(10) == 1 then
			live('sveta').change(0,0,7);
			live('otchim').change(0,0,3);
			s.pic = 'pic/ivents/s_zadanie/2_'..rnd(7,9)..'.jpg';
			sveta.here('toroom','s_z2_7',' Света сказала что ей пора спать и убежала');
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	Краем глаза я заметил, что отчим заметил наши передвижения, вернее Светы. Она же не могла видеть его реакцию,
			потому старательно демонстрировала оба полушария нижнего мозга, но иногда порывалась прикрыть эластичной вязью, как бы на коже ощущая взгляд не одного мужчины.]]), 		
	obj = {		vobj('далее', dalee), 	vobj('turn',_('^ {Поберечь} деньги.')),},
};

	--диалог в зале, когда света захочет собрать денег на операцию
dlgoper = dlg {
	nam = _('Диалог в зале');
	dsc = ' ';
	pic = function ()
		p'pic/sveta/toorom/ozab1.jpg';
	end;
	hideinv = true;
	enter = function (s) --инициализация при входе
		if live('sveta')._oper == 0 then pon(2); --Озабоченная
			s.pic = 'pic/sveta/toroom/ozab2.jpg';
		elseif (live('sveta')._oper == 1) and  (s_zadprogress == 0 ) then 
			pon(3); --Возбуждённая
			s.pic = 'pic/sveta/toroom/ozab3.jpg';
		elseif s_zadprogress > 0 	then
			pon(4); --Возбуждённая
			s.pic = 'pic/sveta/toroom/ozab3.jpg';
		end;
		pn ('Возбуждение: ',live('sveta')._vozb);
	end;
	phr = {
		{ 1,always = true, 'Отойти'	,'Я вернулся к просмотру фильма',[[back()]]};
		{ 2,always = false, 'Спросить Светку, чем она озабочена'	
			, code [[
				pn '- Свет, что с тобой? У тебя неприятности?';
				pn '- Нет, просто я не слишком красива.';
				pn '- Да ну, ну подумаешь грудь мала.';
				pn '- Фу, как ты можешь! Я о красоте в целом! Я вот недавно заходила в поликлинику, там есть прайс-лист, пластическая операция всего 2000 стоит, а у меня нет столько денег.';
				pn '- А тебе отчим не даёт? Он же богач';
				pn '- Нет, я пыталась... но он всё время какой-то уставший.';
				if seen('iphone',me()) then
					pn '- У меня есть предложение, есть такая приблуда на мобилу - снятие возбуждения с девушек, и есть барыга, который покупает это возбуждение, если ты постараешься возбуждаться, то я возьму тебя в долю.';
					pn '- Я что-то слышала такое по новостям, а сколько денег я за это получу?';
					pn '- Ну... есл 50/50, то за то возбуждение, при котором бы ты кончила - тебе выйдет примерно 25 монет';
					pn '- Так это самый минимум, постарайся сдерживать себя, и накопишь гораздо больше';
					pn '- Ну хорошо, давай поробуем';
					pn '- Я... это.. могу тебе помочь с возбуждением..';
					pn '- Да ну, ты же брат, ты как мужчина меня совсем не интересуешь, я уж как-нибудь без тебя обойдусь';
					live('sveta')._oper = 1;
				else
					pn '- Ну у мамки попроси... не знаю';
					pn 'Нужно поискать способы помочь сестре, у матери спросить денег? Или ещё у кого?';
				end;	
				]]
			,[[back()]]};
		{ 3,false,always = false, '- Ну что, Свет, сильно возбудилась?'	
			,_([[- Нормально, но ты мало платишь за возбуждение.
					^- Это не я, это барыга мало платит, я  всего лишь посредник, но у меня есть идея.
					^- Какая?
					^- Ты можешь убить сразу двух зайцев, и возбуждаться больше и я тебе буду ещё денег давать, что накопились на карманные расходы.
					]])
					,[[pon(4)]]};	
		{ 4,false,always = false, ' Предлагать варианты.'	
			,code [[ pn ' ';	]],[[walk('s_zadanie')]]};			
	}
}	
--задания, которые может выполнять света ради денег
s_zadanie = room{
    nam = _('Диалог');
	pic = 'pic/sveta/face.jpg';
	act = function(s,w)
		stoplive =1;
		if (seen(live('ma'),'toroom') or seen(live('anya'),'toroom') or seen(live('sanya'),'toroom')) then
			walk('s_z1_end');
		elseif seen(live('otchim'),'toroom') and otchim._sost ~='dota' then
			walk('s_z1_end');
		elseif seen(live('otchim'),'toroom') then
			walk('s_z1_dota');
		elseif live('sveta').plati(1) == 1 then
			walk(w);
		else
			walk('toroom');
		end;	
	end,
    dsc = 	[[^	Света посмотрела мне в глаза.
		^ - Какие варианты?
	]], 		

	obj = {
	
		vobj('s_z1_1', code [[ 
		if s_zadprogress==0 then
			pn (_('{Ну.. например сядь ровно на диване, дам 1 монету.}'))
			s_zadprogress=1;
		elseif s_zadprogress<3 then
			pn (_('{Давай начнём сначала, сядь на диване за 1 монету.}'))
			end;]]),
	-- vobj('s_z2',	'^^{Покрасуйся как обычно перед отчимом, но без трусиков.}'),
	},
		
	
};
s_z1_dota = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_no.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(2) == 1 then
			live('sveta').change(0,0,1);
			walk('s_z1_1');
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	- Ты что, тут отец! - прошептала Света.
		^- Ну и что? У него катка, он минут сорок весь в себе, да ещё в наушниках. Ничего он не заметит!
		Ну так что, начинаем? Садись, даю монетку.
		
	]]), 		

	obj = {
		vobj('далее', dalee), 
	},
};

s_z1_1 = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_1.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(2) == 1 then
			live('sveta').change(0,0,1);
			walk('s_z1_2');
		else
			walk('toroom');
		end;	
	end,
    dsc =_(	[[^	- Легко, но что-то мало возбуждает.
		^- Хорошо, тогда по-труднее, погладь себя по левому плечу. (2 монеты)
	]]), 		

	obj = {
		vobj('далее', dalee), 
	},
};
s_z1_2 = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_2.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(3) == 1 then
			live('sveta').change(0,0,1);
			walk('s_z1_3');
		else
			walk('toroom');
		end;	
	end,
    dsc = _([[^- Ну чуть-чуть есть, что-то ещё?
		^ - Теперь высвободи левое плечо. (3 монеты)
	]]), 		
	obj = {
		vobj('далее', dalee), 
	},
};
s_z1_3 = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_3.jpg';
	act = function(s,w)
		sleep(0,0,5);
		if seen(live('sveta'), 'toroom') then
			if live('sveta').plati(4) == 1 then
				live('sveta').change(0,0,3);
				walk('s_z1_4');
			else
				walk('toroom');
			end;
		else
			walk('s_z1_end');
		end;	
		
	end,
    dsc = _([[^	- Стало теплее, но всё равно мелочи.
		^ - Тогда помассируй себе груди. (4 монеты)
	]]), 		
	obj = {
		vobj('далее', dalee), 
	},
};
s_z1_4 = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_4.jpg';
	act = function(s,w)
		stoplive =1;
		if s_zadprogress<2 then
			walk(w);
		elseif live('sveta')._vozb>60 then
			--remarka('Хопа, получилось');
			if live('sveta').plati(5) == 1 then
				walk('s_z1_5');
			else
				walk('toroom');
			end;	
		else
			pn (_('- Нет, я так не могу.'));
			remarka('Нужно возбуждение >60');
			walk(w);
		end;	
	end,
    dsc = _([[^- Это уже интереснее.
		^ - А теперь покажи мне одну грудь. (5 монет)
	]]), 		
	obj = {
		vobj('s_z1_no', dalee), 
	},
};
s_z1_no = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_no.jpg';
	act = function(s,w)
		stoplive =1;
		live('sveta').change(0,0,-1);
		sleep(0,0,15);
		s_zadprogress=2;
		walk(w);
	end,
    dsc = _([[^ - Ты что? Совсем? Не буду я тебе ничего показывать.
	]]), 		
	obj = {
		vobj('toroom', dalee), 
	},
};
s_z1_5 = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_5.jpg';
	act = function(s,w)
		stoplive =1;
			if live('sveta').plati(5) == 1 then
				walk(w);
				live('sveta').change(0,0,3);
			else
				walk('toroom');
			end;	
			
	end,
    dsc = _([[^- Ну они у меня не большие, видишь?
		^ - Да,но ровненькие, покажи вторую. (ещё 5)
	]]), 		
	obj = {
		vobj('s_z1_6', dalee), 
	},
};
s_z1_6 = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_6.jpg';
	act = function(s,w)
		sleep(0,0,10);
		if seen(live('sveta'), 'toroom') then
			if live('sveta').plati(10) == 1 then
				walk(w);
				live('sveta').change(0,0,3);
			else
				walk('toroom');
			end;	
		else
			walk('s_z1_end');
		end;	
		
	end,
    dsc = _([[^Света сжала груди руками, чтобы они казались больше и закрыла глаза, чтобы не видеть мою реакцию.
		^ - Какие они красивые, подними ножки.
		^ - Но я без трусиков!
		^ - Мне без разницы, зато я тебе дам 10 монет!
	]]), 		
	obj = {
		vobj('s_z1_7', dalee), 
	},
};
s_z1_7 = room{
	--задания, которые может выполнять света ради денег.
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_7.jpg';
	act = function(s,w)
		stoplive =1;
		if s_zad1==0 then
			walk(w);
		elseif s_zad1==1 then
			if live('sveta').plati(5) == 1 then
				walk('s_z1_12');
				live('sveta').change(0,0,3);
			else
				walk('toroom');
			end;
		else
			if live('sveta').plati(30) == 1 then
				walk('s_z1_9');
			else
				walk('toroom');
			end;
		end;	
			
	end,
    dsc = _([[^Света подняла ножки, но закрыла промежность ручкой.
		^ - Вот тебе.
		^ - Хм. Ну тогда выбирай, 30 монет и ты убираешь руку в сторону, или 5 монет и показываешь мне ножки на боку.
	]]), 		
	obj = {
		vobj('s_z1_8', dalee), 
	},
};
s_z1_8 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_8.jpg';
	act = function(s,w)
		sleep(0,2,0);
		s_zad1=1;		
		walk(w);
	end,
    dsc = _([[^Света возмущённо села прямо и прикрылась платьем.
		^ - У тебя как-то мало вариантов, я выбираю - пойти к себе.
	]]), 		
	obj = {
		vobj('toroom', dalee), 
	},
};
s_z1_9 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_9.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(20) == 1 then
				walk(w);
				live('sveta').change(0,0,3);
			else
				walk('toroom');
			end;
	end,
    dsc = _([[^Света закрыла глаза и убрала руку.
		^ - Какая красивая бритая киска! Добавлю ещё 20, если чуть сдвинешь платье вниз.
	]]), 		
	obj = {
		vobj('s_z1_10', dalee), 
	},
};
s_z1_10 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_10.jpg';
	act = function(s,w)
		stoplive =1;
		walk(w);
		live('sveta').change(0,0,3);
	end,
    dsc = _([[^Света улыбнулась и правой рукой чуть сдвинула вниз платье.
		^ - Ну а теперь можешь положить ноги на бок.
	]]), 		
	obj = {
		vobj('s_z1_11', dalee), 
	},
};
s_z1_11 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_11.jpg';
	act = function(s,w)
		stoplive =1;
		walk(w);
		live('sveta').change(0,0,3);
	end,
    dsc = _([[^Света отрешённённо смотрела себе на руку, когда выравнивала ноги.
		^ - Вот умничка, а теперь чуть приподними ногу, только одну.
		^ - А платить кто будет? Не увидишь ничего, пока не я не получу монет!
	]]), 		
	obj = {
		vobj('s_z1_12', dalee), 
	},
};
s_z1_12 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_12.jpg';
	act = function(s,w)
		stoplive =1;
		if s_zad1==1 then
			if live('sveta').plati(5) == 1 then
				walk(w);
				live('sveta').change(0,0,3);
			else
				walk('toroom');
			end;
		else
			if live('sveta').plati(30) == 1 then
				walk('s_z1_13');
				live('sveta').change(0,0,3);
			else
				walk('toroom');
			end;
		end;	
			
	end,
    dsc = _([[^Света приподняла, лёжа на боку, ногу и прикрыла киску рукой.
		^ - Вот как, а 30 монет за то что уберёшь руку? Ну или можешь за 5 повернуться ко мне попкой.
	]]), 		
	obj = {
		vobj('s_z1_16', dalee), 
	},
};
s_z1_13 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_13.jpg';
	act = function(s,w)
		stoplive =1;
		walk(w);
		live('sveta').change(0,0,3);
	end,
    dsc = _([[^Света снова опустила ногу, но убрала руку.
		^ - Ты что это? А ну поднимай, не устала наверное.
		^ - Хорошо, хорошо.
	]]), 		
	obj = {
		vobj('s_z1_14', dalee), 
	},
};
s_z1_14 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_14.jpg';
	act = function(s,w)
		stoplive =1;
		if live('sveta').plati(10) == 1 then
				walk(w);
				live('sveta').change(0,0,3);
			else
				walk('toroom');
			end;
	end,
    dsc = _([[^Света подняла ножку, помогая себе рукой.
		^ - Прекрасно, теперь повернись спиной, дам 10 монет
		^ - Хорошо.
	]]), 		
	obj = {
		vobj('s_z1_15', dalee), 
	},
};
s_z1_15 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_15.jpg';
	act = function(s,w)
		stoplive =1;
		walk(w);
	end,
    dsc = _([[^
		^ - Наклонись.
		^ - Но я не хочу светить перед тобой своей попкой! Потому прикроюсь.
	]]), 		
	obj = {
		vobj('s_z1_16', dalee), 
	},
};
s_z1_16 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_16.jpg';
	act = function(s,w)
		stoplive =1;
		if s_zad1==1 then
			pn (_('- Нет, я ухожу. '));
				s_zad1=2;
				sleep(0,2,0);
				walk('toroom');
				
		else
			if live('sveta').plati(50) == 1 then
				
				walk(w);
			else
				walk('toroom');
			end;
		end;	
	end,
    dsc = _([[^
		^ - Красота, но будет лучше если ты покажешь мне обе дырочки.
		^ - Ты что?
		^ - 50 монет тебе помогут в этом?
	]]), 		
	obj = {
		vobj('s_z1_17', dalee), 
	},
};
s_z1_17 = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_17.jpg';
	act = function(s,w)
		stoplive =1;
		sleep(0,1,0);
		walk(w);
		live('sveta').change(0,0,30);
	end,
    dsc = _([[^
		^ - Хорошо, но это последнее, что я тебе покажу, мне просто нужны деньги.
	]]), 		
	obj = {
		vobj('toroom', dalee), 
	},
};

s_z1_end = room{
    nam = _('Задание 1');
	pic = 'pic/ivents/s_zadanie/1_no.jpg';
	act = function(s,w)
		walk('toroom');
	end,
    dsc = _([[^- Ох и шутник же ты, - оглядываясь на присутствующих людей в комнате, сказала Света.
	]]), 		
	obj = {
		vobj('далее', dalee), 
	},
};