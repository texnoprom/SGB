--v0.1 создан 08.11.2015 --v0.2 06.12.2015 добавлены ивенты сна и мастурбации

--Мама прихорашивается перед работой.
function kv_m_before_work()
        local v = kvest('m_before_work');
        v.dsc = function()
		end;
		v.act = function(s)
			if live('ma')._sost=='odev' then --если она одевается
				walk('room_m_before_work');
			elseif live('ma')._sost=='sleep' then
				walk('m_sleep_near');
			elseif (live('ma')._sost=='mas') and (ma._razvr>40) then
				walk('m_before_sleep1');
			else
			 pn (_('Нет, не буду её отвлекать.'));
			end;
		end;
        return obj(v)
end

m_before_work = new('kv_m_before_work()')
--objs(motherroom):add(m_before_work) --так квест будет сохраняться

m_before_sleep1 = room{
    nam = _('Мама мастурбирует');
	pic = 'pic/ivents/m_before_sleep/1.jpg';
	act = function(s)
		if ma._sost=='mas' then
			ma.change(0,0,1);
			walk('m_before_sleep2');		
		else
			pn (_('Мама убрала руку и закрылась полностью одеялом, я не успел.'));
			walk('motherroom');
		end;
	end,
	dsc = _([[^ Я осторожно вскрыл замок двери и чуть чуть подошёл.
		Вау, мама без лифчика лежит, и судя по движению её руки под одеялом - занимается чем-то интересным.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'motherroom'),
		vobj('continue', _('^Осторожно {подлезть} под одеяло.')),};
};

m_before_sleep2 = room{
    nam = _('Мама мастурбирует');
	pic = 'pic/ivents/m_before_sleep/2.jpg';
	act = function(s)
		ma.change(0,0,4);
		if ma._vozb>60 then
			walk('m_before_sleep3')
		else
			walk(s)
		end;
	end,
	dsc = _([[^
		Я под одеялом добрался до её киски и принялся вылизывать.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'motherroom'),
		vobj('continue', _('^Продолжать её  {лизать} под одеялом.')),};
};
m_before_sleep3 = room{
    nam = _('Мама мастурбирует');
	pic = 'pic/ivents/m_before_sleep/3.jpg';
	act = function(s)
		ma.change(0,0,5);
		if ma._vozb>90 then
			walk('m_before_sleep4')
		else
			walk(s)
		end;
	end,
	dsc = _([[^
		Ох как она течёт, я почти захлёбываюсь, ещё и воздуха мало.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'motherroom'),
		vobj('continue', _('^Продолжать её  {лизать} под одеялом.')),};
};
m_before_sleep4 = room{
    nam = _('Мама мастурбирует');
	pic = 'pic/ivents/m_before_sleep/4.jpg';
	act = function(s)
		ma.change(1,0,0-ma._vozb);
		walk('m_before_sleep5')
	end,
	dsc = _([[^
		Наконец она кончила и я смог выбраться из-под одеяла.
		^ - Мам, понравилось?
		^ - Даа....
		^ - А у меня тоже встал, ты же мне поможешь?
	]]),
	obj = { vobj('continue', _('^{Вылезти} из-под одеяла.')),};
};
m_before_sleep5 = room{
    nam = _('На кровати');
	pic = 'pic/ivents/m_before_sleep/5.jpg';
	act = function(s)
		walk('m_before_sleep6')
	end,
	dsc = _([[^
		Мама уверенно взялась за мой член рукой.
	]]),
	obj = { vobj('continue', dalee),};
};
m_before_sleep6 = room{
    nam = _('На кровати');
	pic = 'pic/ivents/m_before_sleep/6.jpg';
	act = function(s)
		ma.change(0,0,2);
		if ma._vozb<20 then
			s.pic = 'pic/ivents/m_before_sleep/'..(rnd(5)+4)..'.jpg';
			walk(s);
		else
			walk('m_before_sleep7')
		end;
	end,
	dsc = _([[^
		Мама очень старается, но тихо, чтобы не разбудить отчима.
	]]),
	obj = { vobj('continue', dalee),};
};
m_before_sleep7 = room{
    nam = _('На кровати');
	pic = 'pic/ivents/m_before_sleep/7.jpg';
	act = function(s,w)
		if w=='bak' then
			ma.change(0,0,0-10);
			walk('m_before_sleep6')
		else
			walk('m_before_sleep10')
		end;	

	end,
	dsc = _([[^ Вылизывая мои яйца, мама прошептала:
		^- Коля, пофалуста, полифы меня еффо, я еффо хочу.
	]]),
		obj = { vobj('continue', _('^-Хорошо, {ложись} на спину.')),vobj('bak', _('^-{Продолжай} сосать, мам.'))};
};
m_before_sleep10 = room{
    nam = _('На кровати');
	pic = 'pic/ivents/m_before_sleep/10.jpg';
	act = function(s)
		ma.change(0,0,5);
		if ma._vozb<50 then
			walk(s)
		else
			walk('m_before_sleep11')
		end

	end,
	dsc = _([[^ Я положил её на спину и принялся снова лизать, только теперь не под одеялом.
	]]),
	obj = { vobj('continue', dalee),};
};
m_before_sleep11 = room{
    nam = _('На кровати');
	pic = 'pic/ivents/m_before_sleep/11.jpg';
	act = function(s)
		ma.change(0,0,6);
		if ma._razvr<90 then
			walk(s)
		else
			walk('m_before_sleep12')
		end

	end,
	dsc = _([[^ Язык уже стал проваливаться в её распаханное влагалище, так что я принялся использовать пальцы.
	]]),
	obj = { vobj('continue', dalee),};
};
m_before_sleep11 = room{
    nam = _('На кровати');
	pic = 'pic/ivents/m_before_sleep/12.jpg';
	act = function(s)
		ma.change(0,0,0-ma._razvr);
		ma._sost = 'sleep';
		walk('motherroom')
	end,
	dsc = _([[^ Наконец мама закончила, помогая себе тоже, поцеловала меня и улеглась спать.
	]]),
	obj = { vobj('continue', dalee),};
};

m_sleep_near = room{
    nam = _('Мама спит');
	pic = 'pic/ma/motherroom/sleep_near1.jpg';
	act = function(s,w)
		if (w=='tosleep') and seen(otchim,'motherroom') then
			pn (_('Куда я лягу? Тут отчим лежит!'));
		elseif 	w=='tosleep' then
			walk('m_s_n1');
		elseif ma._sost=='sleep' then
			s.pic = 'pic/ma/motherroom/sleep_near'..rnd(3)..'.jpg';
			s.dsc = _([[^
				Моя мама прекрасна, когда спит.
			]])
			walk(s);		
		else
			walk('m_wakeup');
		end;
	end,
	dsc = _([[^
		Я вошёл в спальню и приблизился к маме.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'motherroom'),
	vobj('tosleep', _('^{Прилечь} рядом.')),
		vobj('continue', _('^{Продолжать} смотреть.')),};
};

m_s_n1 = room {
	nam = 'm_s_n';
	disp = _('Я лежу рядом с мамой');
	pic = 'pic/ivents/m_sleep/sleep_near.jpg';
	act = function()
		walk('home');
	end,
	dsc = _([[^
		Я прилёг на половину кровати отчима.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};


m_wakeup = room {
	nam =_( 'Мама проснулась'),
	pic = 'pic/ma/motherroom/wakeup.jpg';
	act = function()
		walk('home');
	end,
	dsc = _([[^
		Блин, она просыпается! Я лучше выйду.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};




maslo = obj{ 
    nam = 'Туба с маслом';
	sto = 20; --цена
	dsc = function(s)
		if seen(s,'bariga') then
			pn('Купить {Масло}. -  ',s.sto,'g');
			pn (' (Описание: Масло для втирания, содержит ингридиент, повышающий либидо и дарящий ощущение молодости.)');
		else
			s.dsc = 'В кармане {масло}.';
		end;	
	end;
        inv = function(s)
              
        end;
        act = function(s)
			if seen(s,'bariga') then
				if gold>=s.sto then
					pn ('Вы купили ',s.nam,'.');
					gold = gold-s.sto;
					remove(s);
					m_before_work._stat = 2;
				else
					pn 'Не хватает денег';
				end;
			end;		
        end;
		use = function(s, w)
				
		end
};




room_m_before_work = room{
    nam = _('Маленькая пристройка в спальне у родителей');
	pic = 'pic/ivents/m_before_work/2.jpg';
	act = function()
		if m_before_work._stat < 1 then
			walk('m_bw1');
		else
			walk('m_bw3');
		end;
	end,
	enter = function (s) --инициализация при входе
		--сначала отключаем все эвенты, а потом уже включаем, если есть причина
		--talkbath:disable(); --пример
	end;
	dsc = _([[^
		Я вошёл в спальню и посмотрел на маму.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'motherroom'),
		vobj('continue', _('^{Продолжать} смотреть.')),};
};
m_bw1 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/3.jpg';
	act = function()
		m_before_work._stat = 1;
		objs(bariga):add(maslo);
		walk('m_bw2');
	end,
	dsc = _([[^
		Мама немножко пригнулась, ища что-то в ящике.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_bw2 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/4.jpg';
	act = function()
		walk('m_bw3');
	end,
	dsc = _([[^
		Теперь она застёгивает свои туфли на высоком каблуке.
	]]),
	obj = { vway('закончить', _('{Убежать.}'), 'motherroom'),
		vobj('continue', _('^{Подойти} ближе.')),
	},
};
m_bw3 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/5.jpg';
	act = function()
		walk('m_bw4');
	end,
	dsc = _([[^
		Я подхожу ближе, она меня заметила.
	]]),
	obj = { vway('закончить', _('{Убежать.}'), 'motherroom'),
		vobj('continue', _('^{Подойти} ближе.')),
	},
};
m_bw4 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/6.jpg';
	act = function()
		walk('m_bw5');
	end,
	dsc = _([[^
		- Что ты тут делаешь? - Спросила мама, поправляя юбку.
		^- Да просто, скучаю.
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw5 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/7.jpg';
	act = function()
		if m_before_work._stat ==1 then
			walk('m_bw6');
		elseif m_before_work._stat ==2 then
			walk('m_bw7');
		elseif m_before_work._stat ==3 then
			walk('m_bw11');	
		elseif m_before_work._stat ==4 then
			walk('m_bw20');	
		elseif m_before_work._stat ==5 then
			walk('m_bw27');		
		elseif m_before_work._stat ==6 then
			walk('m_bw38');	
		elseif (m_before_work._stat ==7) or (m_before_work._stat ==8) then
			walk('m_bw51');		
		else	
			walk('m_bw99');	--эта часть квеста теперь всё время повторяется.
		end;	
	end,
	dsc = _([[^
		- Ну хорошо, ты мне пригодишься, оцени мои туфли, они подходят к платью? - Спросила мама, поставив ножку на стульчик.
		^- Туфли красивые, а ты используешь что-то для нежности кожи?
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw6 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/8.jpg';
	act = function()
		walk('motherroom');
	end,
	dsc = _([[^
		- Старость не радость, я использую разные масла, но никакие не помогают вернуть молодость ног.
		^(Хм, может я найду ей подходящее масло? Мама должна быть красивой).
	]]),
	obj = { 
		vobj('continue', _('{Оставить} маму в покое.')),
	},
};
m_bw7 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/9.jpg';
	act = function()
		walk('m_bw8');
	end,
	dsc = _([[^ - Старость не радость, я использую разные масла, но никакие не помогают вернуть молодость ног.
		^ - Смотри мам, что у меня есть - новое масло для тебя!
		^ - Вот как? - Мама долго читала состав, - выглядит интересно, нужно опробовать!
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw8 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/10.jpg';
	act = function()
		walk('m_bw9');
	end,
	dsc = _([[^
		Нанеся на руки масло, она стала его втирать в ноги.
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw9 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/11.jpg';
	act = function()
		live('ma').change(0,0,1);
		walk('m_bw10');
	end,
	dsc = _([[^
		По всей длине.
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw10 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/12.jpg';
	act = function()
		live('ma').change(0,0,10);
		m_before_work._stat =3;
		sleep(0,0,56);
		walk('motherroom');
	end,
	dsc = _([[^
		Ну всё, мне пора на работу, посмотрим насколько нежной станет моя кожа.
	]]),
	obj = { 
		vobj('continue', _('{Оставить} маму в покое.')),
	},
};
m_bw11 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/13.jpg';
	act = function()
		live('ma').change(0,0,2);
		walk('m_bw12');
	end,
	dsc = _([[^
		- Твоё масло мне понравилось, - сказала мама нанеся масло на верхнюю часть ног.
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw12 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/14.jpg';
	act = function()
		live('ma').change(0,0,1);
		walk('m_bw13');
	end,
	dsc = _([[^
		- Сейчас попробуем на других участках кожи, - тщательно готовя масло, сказала мама.
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw13 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/15.jpg';
	act = function()
		live('ma').change(0,0,5);
		walk('m_bw14');
	end,
	dsc = _([[^
		Она выставила ногу во всю длинну на столик и, нисколько не заботясь, что я вижу её трусики, наносила масло на нижнюю часть ножек.
		^Скорее всего ей даже нравилось что я на неё смотрю, секретный ингридиент её подогревает.
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw14 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/16.jpg';
	act = function()
		live('ma').change(0,0,10);
		walk('m_bw15');
	end,
	dsc = _([[^
		- А ещё нужно смазать ягодицы, они в последнее время у меня жёстковаты.
		^Приподняв юбку мама намазала маслом свою попку.
	]]),
	obj = { 
		vobj('continue', dalee),
	},
};
m_bw15 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/17.jpg';
	act = function(s,w)
		live('ma').change(0,0,1);
		walk(w);
	end,
	dsc = _([[^
		- Попробуй мою кожу, она стала мягче?.
		^Приподняв попку мама требовательно уставилась на меня.
	]]),
	obj = { 
		vobj('m_bw16', _('{Погладить по коже на попке.}')),
		vobj('m_bw17', _('^{Погладить киску через трусики.}')),
	},
};
m_bw16 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/18.jpg';
	act = function()
		live('ma').change(0,0,10);
		walk('m_bw19');
	end,
	dsc = _([[^
		- Да, мам, кожа мягкая.
		^Я осторожно погладил по попке.
	]]),
	obj = { 
		vobj('m_bw16',dalee),
	},
};
m_bw17 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/19.jpg';
	act = function()
		live('ma').change(0,0,20);
		walk('m_bw18');
	end,
	dsc = _([[^
		Я осторожно погладил по ткани трусиков.
	]]),
	obj = { 
		vobj('m_bw16',dalee),
	},
};
m_bw18 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/25.jpg';
	act = function()
		live('ma').change(0,0,20);
		sleep(0,0,55);
		walk('motherroom');
	end,
	dsc = _([[^
		- Там не трогай! Ладно, мне пора на работу.
		^Мама прикрыла трусики юбкой и отстранилась от меня.
	]]),
	obj = { 
		vobj('m_bw16',dalee),
	},
};
m_bw19 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/26.jpg';
	act = function()
		live('ma').change(0,0,20);
		m_before_work._stat =4;
		sleep(0,0,55);
		walk('motherroom');
	end,
	dsc = _([[^
		- Замечательно, значит продолжу использовать масло. Ладно, мне пора на работу.
		^Мама немного прикрыла трусики юбкой и отстранилась от меня.
	]]),
	obj = { 
		vobj('m_bw16',_('{Оставить} маму в покое.')),
	},
};
m_bw20 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/24.jpg';
	act = function()
		walk('m_bw21');
	end,
	dsc = _([[^ - Да, сегодня я продолжку использовать масло, оно мне очень нравится.
		^Мама стала приподнимать юбку.
	]]),
	obj = { 
		vobj('m_bw16',dalee),
	},
};
m_bw21 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/20.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ Нанесла масло на ягодицы.
	]]),
	obj = { 
		vobj('m_bw22',dalee),
	},
};
m_bw22 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/21.jpg';
	act = function(s,w)
		live('ma').change(0,0,5);
		walk(w);
	end,
	dsc = _([[^ Нагнулась, чтобы разгладить кожу на ягодицах.
	]]),
	obj = { 
		vobj('m_bw23',dalee),
	},
};
m_bw23 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/21.jpg';
	act = function(s,w)
		live('ma').change(0,0,6);
		walk(w);
	end,
	dsc = _([[^ Нагнулась, чтобы разгладить кожу на ягодицах.
	]]),
	obj = { 
		vobj('m_bw24',dalee),
	},
};
m_bw24 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/22.jpg';
	act = function(s,w)
		live('ma').change(0,0,7);
		walk(w);
	end,
	dsc = _([[^ Увлеклась массажем.
	]]),
	obj = { 
		vobj('m_bw25',dalee),
	},
};
m_bw25 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/23.jpg';
	act = function(s,w)
		live('ma').change(0,0,8);
		walk(w);
	end,
	dsc = _([[^ Мне кажется, или она специально светит своей дырочкой?
	]]),
	obj = { 
		vobj('m_bw26',dalee),
	},
};
m_bw26 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/27.jpg';
	act = function()
		m_before_work._stat =5;
		sleep(0,0,55);
		walk('motherroom');
	end,
	dsc = _([[^
		- Ладно, я опаздываю, надеюсь кожа разгладилась.
		^Раздался голос по другую сторону огромной маминой задницы.
	]]),
	obj = { 
		vobj('motherroom',_('{Оставить} маму в покое.')),
	},
};
m_bw27 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/28.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ - Коля, а как ты оцениваешь мою грудь? Может мне и её стоит подтянуть?
		^ - Ну она у тебя вполне большая, но мне больше нравится твоя попка.
	]]),
	obj = { 
		vobj('m_bw28',dalee),
	},
};
m_bw28 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/29.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ Я нежно взялся за попку мамы.
		^ - Вот на попке наверно кожа уже нежная и гладкая.
	]]),
	obj = { 
		vobj('m_bw29',dalee),
	},
};
m_bw29 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/30.jpg';
	act = function(s,w)
		live('ma').change(0,0,4);
		walk(w);
	end,
	dsc = _([[^ Мама выпятила свою пятую точку.
		^ - В платье она наверно лучше выглядит?
	]]),
	obj = { 
		vobj('m_bw30',dalee),
	},
};
m_bw30 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/31.jpg';
	act = function(s,w)
		live('ma').change(0,0,5);
		walk(w);
	end,
	dsc = _([[^ Она придвинулась и упёрлась в мой бугорок.
		^ Мой член уже рвал штаны и рвался в атаку.
		^ Почувствовав это, мама стала делать движения вверх-вниз.
	]]),
	obj = { 
		vobj('m_bw31',dalee),
	},
};
m_bw31 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/32.jpg';
	act = function(s,w)
		live('ma').change(0,0,6);
		walk(w);
	end,
	dsc = _([[^ Я осторожно двигаясь, освободил свой член от трусов, мама даже этого не заметила, а продолжила тереться.
		^ - Видишь, какая красивая у меня попка? - Маме было очень хорошо, она была в приподнятом настроении, ингридиент затмил её разум, и ей казалось что масло реально вернуло молодость её ягодицам.
	]]),
	obj = { 
		vobj('m_bw32',dalee),
	},
};
m_bw32 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/33.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Из члена уже стала выделяться жидкость, и мама услышала хлюпающие звуки.
		^ - Что там такое хлюпает? - Маме отстранилась и от члена к её попке протянулась как бы нитка.
	]]),
	obj = { 
		vobj('m_bw33',dalee),
	},
};
m_bw33 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/34.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Она обернулась и, заметив член, нежно взялась за его головку.
		^ - Так вот что ты тут творишь, возбудился от молодой маминой попки, а я её даже не оголяла!
	]]),
	obj = { 
		vobj('m_bw34',dalee),
	},
};
m_bw34 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/35.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама полностью повернулась ко мне и поигралась с уздечкой.
		^- Ты смотри какой возбуждённый, а может мои пальчики слишком старые для него?
		^- Нет мам, продолжай, у тебя правда молодые руки, ты же за ними ухаживаешь!
	]]),
	obj = { 
		vobj('m_bw35',dalee),
	},
};
m_bw35 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/36.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама опустилась на колени перед пенисом.
		^- Хорошо, а губки, посмотри, они все в морщинах, в уголках, вокруг губ.
		^- Ну выглядят не молодыми, а неплохо бы их попробовать тактильными ощущениями.
	]]),
	obj = { 
		vobj('m_bw36',dalee),
	},
};
m_bw36 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/37.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ 
		- Ну ты хитрец, не буду я ими обхватывать твой член!
		^Мама, не удержавшись, лизнула головку.
	]]),
	obj = { 
		vobj('m_bw37',dalee),
	},
};
m_bw37 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/38.jpg';
	act = function()
		m_before_work._stat =6;
		sleep(0,0,55);
		walk('motherroom');
	end,
	dsc = _([[^ Мама встала, повернулась к зеркалу и продолжила накрашиваться.
		^- Мне пора на работу, постарайся позаботиться о своём дружке сам.

	]]),
	obj = { 
		vobj('motherroom',_('{Оставить} маму в покое.')),
	},
};
m_bw38 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/38.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама повернулась к зеркалу.
		^- Как там твой член, ты с ним справился?
		^- Ну почти, твоя попка оказала на него такое очарование, что он передавал приветы.
	]]),
	obj = { 
		vobj('m_bw39',dalee),
	},
};
m_bw39 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/39.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама так выгнулась, что попка оказалась аш в 2 раза больше!
		^- А вот это ему понравится?
		^- Вау....
	]]),
	obj = { 
		vobj('m_bw40',dalee),
	},
};
m_bw40 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/40.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Я срочно достал член, и придвинулся к завораживающей объёмности.
		^- Как ощущения?
		^- Как будто я ... по шёлку.
	]]),
	obj = { 
		vobj('m_bw41',dalee),
	},
};
m_bw41 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/41.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама резко задрала юбку.
		^- Вот, попробуй потереться от мою молодую кожу.
		^- Оу... так ещё приятнее.
	]]),
	obj = { 
		vobj('m_bw42',dalee),
	},
};
m_bw42 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/42.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Она, как в прошлый раз, принялась двигать попкой вверх-вниз, член тёрся между её булок.
		^- Нежная мамина кожа... как в твоём детсве, да?
		^- Да мам, как в детстве.., - (каком нафиг детстве? Я вроде не трогал маму писюньчиком, но может мама вспоминает дни когда она и папа были молоды?)
	]]),
	obj = { 
		vobj('m_bw43',dalee),
	},
};
m_bw43 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/43.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Я схватил её за правое полушарие и принялся менять движения на вперёд-назад.
	]]),
	obj = { 
		vobj('m_bw44',dalee),
	},
};
m_bw44 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/44.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Член стал упираться в анус, немного погружаясь в мягкость вокруг.
		^- Ой, что-то он стал делать мне немного больно.
	]]),
	obj = { 
		vobj('m_bw45',dalee),
	},
};
m_bw45 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/45.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - Мне так не нравится! Я сейчас добавлю немного масла, для скольжения.
		^Она взяла бутылочку и налила немного масла на свою попку.
	]]),
	obj = { 
		vobj('m_bw46',dalee),
	},
};
m_bw46 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/46.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Но мне так нравилось углубление, что я снова в него упёрся.
	]]),
	obj = { 
		vobj('m_bw47',dalee),
	},
};
m_bw47 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/47.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Маме снова это не понравилось, потому она схватила мой член рукой.
	]]),
	obj = { 
		vobj('m_bw48',dalee),
	},
};
m_bw48 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/48.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ И принялась его надрачивать.
	]]),
	obj = { 
		vobj('m_bw49',dalee),
	},
};
m_bw49 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/50.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Я не выдержал и кончил, прямо на её попку.
	^Мама, обнаружив пульсацию члена, накрыла его рукой и прижала к попке.
	]]),
	obj = { 
		vobj('m_bw50',dalee),
	},
};
m_bw50 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/49.jpg';
	act = function()
		m_before_work._stat =7;
		sleep(0,0,55);
		walk('vanna');
	end,
	dsc = _([[^ Мама обернулась и улыбнувшись сказала:
		^- Мне пора на работу, так что иди, помой его, а я тут приведу себя в порядок.
	]]),
	obj = { 
		vobj('motherroom',_('{Оставить} маму в покое.')),
	},
};
m_bw51 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/53.jpg';
	act = function(s,w)
		live('ma').change(0,0,1);
		walk(w);
	end,
	dsc = _([[^ Мама сразу задрала юбку, повернулась задом и сказала:
	^- Помоги мамочке намазаться божественным маслом.
	]]),
	obj = { 
		vobj('m_bw52',dalee),
	},
};
m_bw52 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/54.jpg';
	act = function(s,w)
		live('ma').change(0,0,4);
		walk(w);
	end,
	dsc = _([[^ Мама извивалась, приседала, пока я её намазывал
	^- О да, детка, мажь меня всю, всю мою попочку.
	]]),
	obj = { 
		vobj('m_bw53',dalee),
	},
};
m_bw53 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/52.jpg';
	act = function(s,w)
		live('ma').change(0,0,6);
		walk(w);
	end,
	dsc = _([[^ Я приспустил штаны, и продолжил гладить попку.
	^- Как там твой член? Приветы мне передавал?
	]]),
	obj = { 
		vobj('m_bw54',dalee),
	},
};
m_bw54 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/51.jpg';
	act = function(s,w)
		live('ma').change(0,0,50);
		walk(w);
	end,
	dsc = _([[^ - Конечно, мам, он тебя всегда вспоминает.
	^Она придвинулась и потёрлась своей ложбинкой о ствол члена, даже вскрикнула.
	]]),
	obj = { 
		vobj('m_bw55',dalee),
	},
};
m_bw55 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/55.jpg';
	act = function(s,w)
		live('ma').change(1,0,0-live('ma')._vozb);
		walk(w);
	end,
	dsc = _([[^ Она резко отошла, прикрывая промежность.
	^- Что случилось мам?
	^- Ах... ничего срашного, натёрла просто... ох..
	]]),
	obj = { 
		vobj('m_bw56',dalee),
	},
};
m_bw56 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/56.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - Покажи что там, может я увижу.
	^Мама на секунду раздвинула булки и я увидел колечко ануса.
	^- Ах... нет, ничего, не смотри, я пойду заберусь на кровать, мне нужно немного полежать.
	^Она спрятала анус, но я уже всё увидел, от чего мой стоявший член стал ещё больше.
	]]),
	obj = { 
		vobj('m_bw57',dalee),
	},
};
m_bw57 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/57.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама устало на карачиках забралась на кровать.

	]]),
	obj = { 
		vobj('m_bw58',dalee),
	},
};
m_bw58 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/58.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - Я тут прилягу, отдохну.
	^- Ну мне тоже нужно отдохнуть, ты хотя бы ножки разведи, чтобы мне можно было потереться об тебя.
	^ - Хорошо.
	]]),
	obj = { 
		vobj('m_bw59',dalee),
	},
};
m_bw59 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/59.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама легла головой на подушку, выставив попку вверх, и устало вздохнула.
	]]),
	obj = { 
		vobj('m_bw60',dalee),
	},
};
m_bw60 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/60.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Я приблизился и положил член на её попку, мама взлянула на меня но ничего не произнесла.
	]]),
	obj = { 
		vobj('m_bw61',dalee),
	},
};
m_bw61 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/61.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ Я взял её рукой за ягодицу и начал двигать вперёд-назад, иногда втыкаясь в её дырочку через трусики.
	]]),
	obj = { 
		vobj('m_bw62',dalee),
	},
};
m_bw62 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/62.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ Я продолжил, послышалось напряжённое дыхание мамы.
	]]),
	obj = { 
		vobj('m_bw63',dalee),
	},
};
m_bw63 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/63.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ Я схватился за полоску трусиков и потянул вниз
		^ - Что ты делаешь? - Мама была слишком уставшей, чтобы сопротивляться, но её правая рука исчезла под ней.
	]]),
	obj = { 
		vobj('m_bw64',dalee),
	},
};
m_bw64 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/64.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ Снимая трусики, я заметил что она прикрыла рукой свою киску.
		^ - Перестань, зачем ты их снимаешь?
		^ - Мам, ну ты же мне не помогаешь, так что мне нужно хотя бы видеть тебя лучше, чтобы помочь своему богатырю.
	]]),
	obj = { 
		vobj('m_bw65',dalee),
	},
};
m_bw65 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/65.jpg';
	act = function(s,w)
		live('ma').change(0,0,5);
		walk(w);
	end,
	dsc = _([[^ Я снял с неё трусы.
		^ - Не надо...
	]]),
	obj = { 
		vobj('m_bw66',dalee),
	},
};
m_bw66 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/66.jpg';
	act = function(s,w)
		live('ma').change(0,0,6);
		walk(w);
	end,
	dsc = _([[^ Мама прикрыла своё анальное отверстие, которое было на моём обозрении, второй рукой.
		^ - Не надо...
		^ - Ну маааам, мне же очень нужно. Ну пожалуйста.
	]]),
	obj = { 
		vobj('m_bw67',dalee),
	},
};
m_bw67 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/67.jpg';
	act = function(s,w)
		live('ma').change(0,0,7);
		if m_before_work._stat ==7 then
			walk(w);
		elseif m_before_work._stat ==8 then
			walk('m_bw68');	
		end;	
	end,
	dsc = _([[^ - Ну ладно, посмотри, только чур не трогать и не тыкать всякими штуками!
		^ Мама убрала руки.
		^ - О, какая красота. А почему не трогать?
	]]),
	obj = { 
		vobj('m_bw68',dalee),
	},
};
m_bw68 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/68.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ ^ - Потому что я твоя мать!
		^ - Ну так не интерееесно...
		^ Я отодвинулся и стал сбоку кровати.
	]]),
	obj = { 
		vobj('m_bw82',dalee),
	},
};
m_bw69 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/69.jpg';
	act = function(s,w)
		live('ma').change(0,0,8);
		walk(w);
	end,
	dsc = _([[^ Я подошёл вплотную к её лицу, мама лежала передомной и тяжело дышала, копошась своими ручками где-то там.
	]]),
	obj = { 
		vobj('m_bw70',dalee),
	},
};
m_bw70 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/71.jpg';
	act = function(s,w)
		live('ma').change(0,0,1);
		walk(w);
	end,
	dsc = _([[^ - Мам, мне всё ещё нужна твоя помощь.
			^ - Ну что ты как маленький? Всё тебе помоги, всё тебе приготовь, ты же уже взрослый мальчик!
	]]),
	obj = { 
		vobj('m_bw71',dalee),
	},
};
m_bw71 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/72.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ - Да, я взрослый мальчик, потому моему взрослому члену нужна помощь!
			^ Я придвинул его к её лицу, она его сразу схватила руками.
	]]),
	obj = { 
		vobj('m_bw72',dalee),
	},
};
m_bw72 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/73.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ - Вофтак?
			^ Мама взяла его за щёку.
	]]),
	obj = { 
		vobj('m_bw73',dalee),
	},
};
m_bw73 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/74.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ - Али ваат тааак ?
			^ Мама открыла рот и длинным язычком принялась играть с головкой.
	]]),
	obj = { 
		vobj('m_bw74',dalee),
	},
};
m_bw74 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/75.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ - Так как тебе лучше?
			^ Мама сжала член и в ожидании смотрит на меня.
	]]),
	obj = { 
		vobj('m_bw75',_('Языком')),
		vobj('m_bw76',_('В рот')),
	},
};
m_bw75 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/77.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ - Язычком, пожалуйста.
			^ Мама отпустила член и смотря прямо на головку сосредоточенно ласкала его языком.
	]]),
	obj = { 
		vobj('m_bw77',dalee),
	},
};
m_bw75 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/76.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ - Я хочу чтобы ты его взяла целиком.
			^ Мама заглотила его.
	]]),
	obj = { 
		vobj('m_bw77',dalee),
	},
};
m_bw77 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/78.jpg';
	act = function(s,w)
		live('ma').change(0,0,5);
		walk(w);
	end,
	dsc = _([[^ Разогревшись, мама начала активно работать ртом, так что движения её смазывались.
	]]),
	obj = { 
		vobj('m_bw78',dalee),
	},
};
m_bw78 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/79.jpg';
	act = function(s,w)
		live('ma').change(0,0,6);
		walk(w);
	end,
	dsc = _([[^ Пока мне мама сосала, я наклонился и помял её прекрасную задницу
	]]),
	obj = { 
		vobj('m_bw79',dalee),
	},
};
m_bw79 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/95.jpg';
	act = function(s,w)
		live('ma').change(0,0,6);
		walk(w);
	end,
	dsc = _([[^ Мама меня опрокинула на спину и быстро задвигала рукой по стволу члена.
	]]),
	obj = { 
		vobj('m_bw80',dalee),
	},
};
m_bw80 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/96.jpg';
	act = function(s,w)
		live('ma').change(0,0,10);
		walk(w);
	end,
	dsc = _([[^ - Мам... я сейчас...
		^ - Ты что это удумал, мне кровать запачкать? - Мама резко опустила голову и обхватила головку губами.
		^ Моя сперма вырвалась... и я её даже не увидел, мама очень опытно успевала её сглатывать.
	]]),
	obj = { 
		vobj('m_bw81',dalee),
	},
};
m_bw81 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/116.jpg';
	act = function()
		m_before_work._stat =m_before_work._stat+1;
		sleep(0,0,45);
		walk('vanna');
	end,
	dsc = _([[^ Я встал, мама лёжа на кровати улыбалась.
		^- Эх, опоздаю я сегодня, но зато попка будет намазана маслом.
	]]),
	obj = { 
		vobj('motherroom',_('{Оставить} маму в покое.')),
	},
};
m_bw82 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/80.jpg';
	act = function(s,w)
		live('ma').change(0,0,2);
		walk(w);
	end,
	dsc = _([[^ - Хорошо, не буду трогать.
		^ Я прилёг рядом с ней, на спину, смотря на её дырочки.
	]]),
	obj = { 
		vobj('m_bw83',dalee),
	},
};
m_bw83 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/81.jpg';
	act = function(s,w)
		live('ma').change(0,0,5);
		walk(w);
	end,
	dsc = _([[^ - Хм, он у тебя снова стоит очень крепко.
		^ Мама пристально смотрела на мой член.
	]]),
	obj = { 
		vobj('m_bw84',dalee),
	},
};
m_bw84 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/82.jpg';
	act = function(s,w)
		live('ma').change(0,0,6);
		walk(w);
	end,
	dsc = _([[^ - Давай я его ручкой.
		^ - Ну мааам, я же хоче посмотреть на твою попку.
		^ - Ладно, ладно, я спиной буду к тебе, и ручкой поработаю.
		^ Мама перекинула через меня ногу и уселась на мои ноги, спиной ко мне, взяла в руку член.
	]]),
	obj = { 
		vobj('m_bw85',dalee),
	},
};
m_bw85 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/83.jpg';
	act = function(s,w)
		live('ma').change(0,0,7);
		walk(w);
	end,
	dsc = _([[^ - Нет, так не удобно, я тебе попкой по массирую.
	]]),
	obj = { 
		vobj('m_bw85',dalee),
	},
};
m_bw85 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/84.jpg';
	act = function(s,w)
		live('ma').change(0,0,8);
		walk(w);
	end,
	dsc = _([[^ - И вот так могу.
	]]),
	obj = { 
		vobj('m_bw86',dalee),
	},
};
m_bw86 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/85.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ - А ещё могу сжимать его ягодицами.
	]]),
	obj = { 
		vobj('m_bw87',dalee),
	},
};
m_bw87 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/86.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ - Мааам, он падает.
		^ - Блин, что же делать, вот так лучше?
	]]),
	obj = { 
		vobj('m_bw88',dalee),
	},
};
m_bw88 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/87.jpg';
	act = function(s,w)
		live('ma').change(0,0,3);
		walk(w);
	end,
	dsc = _([[^ - Или вот так лучше.
		^ - О.. да... так приятнее.
		^ - Но я так не могу долго.
	]]),
	obj = { 
		vobj('m_bw89',dalee),
	},
};
m_bw89 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/88.jpg';
	act = function(s,w)
		live('ma').change(0,0,7);
		walk(w);
	end,
	dsc = _([[^ - Всё, устала, не могу в такой позе ещё и член тебе массировать.
	]]),
	obj = { 
		vobj('m_bw90',dalee),
	},
};
m_bw90 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/89.jpg';
	act = function(s,w)
		live('ma').change(0,0,8);
		walk(w);
	end,
	dsc = _([[^ Я взял член и прижал к её половым губкам.
		^ - Ты что это делаешь? Я же сказала, ничем не тыкать! - мама преградила дорогу головке.
	]]),
	obj = { 
		vobj('m_bw91',dalee),
	},
};
m_bw91 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/90.jpg';
	act = function(s,w)
		live('ma').change(0,0,9);
		walk(w);
	end,
	dsc = _([[^ - Ну мам, не могу же я бросить его вот в таком состоянии!
		^ - Ладно, я его немного потру об себя, только ты ничего не трогай, я всё сама!
		^ Она снова положила член на живот и села влагалищем на его ствол. Горячие губки обхватили его нежным поцелуем.
	]]),
	obj = { 
		vobj('m_bw92',dalee),
	},
};
m_bw92 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/91.jpg';
	act = function(s,w)
		live('ma').change(0,0,10);
		walk(w);
	end,
	dsc = _([[^ Она убрала руку и осторожно стала двигать киску вдоль ствола. Всё её нутро предстало перед моими глазами.
	]]),
	obj = { 
		vobj('m_bw93',dalee),
	},
};
m_bw93 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/92.jpg';
	act = function(s,w)
		live('ma').change(0,0,11);
		walk(w);
	end,
	dsc = _([[^ Я услышал стоны.
		^ - Мам, что с тобой, ты стонешь?
		^ - Нет, ...ох.. я просто устала,... ах... ты думаешь это легко, полчаса тут на тебе вертеться? оххх.
	]]),
	obj = { 
		vobj('m_bw94',dalee),
	},
};
m_bw94 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/93.jpg';
	act = function(s,w)
		live('ma').change(0,0,11);
		walk(w);
	end,
	dsc = _([[^ Мама схватила член за основание и принялась уже двигаться вверх-вниз, прижимая головку к влагалищу.
	]]),
	obj = { 
		vobj('m_bw95',dalee),
	},
};
m_bw95 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/94.jpg';
	act = function(s,w)
		live('ma').change(0,0,11);
		walk(w);
	end,
	dsc = _([[^ Горячий член то прикасался, то отодвигался от губок, иногда даже хлопал её.
	]]),
	obj = { 
		vobj('m_bw96',dalee),
	},
};
m_bw96 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/111.jpg';
	act = function(s,w)
		live('ma').change(0,0,1);
		walk(w);
	end,
	dsc = _([[^ - Ладно, я устала, попробуй сам, только не прикасайся к киске.
		^ Хм, как же это сделать, я встал с кровати и воззрился на её растопыренную попку.
	]]),
	obj = { 
		vobj('m_bw97',dalee),
	},
};
m_bw97 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/114.jpg';
	act = function(s,w)
		live('ma').change(0,0,1);
		walk(w);
	end,
	dsc = _([[^ - Хорошо мам, ложись, я сяду сверху, повожу его между булок.
	]]),
	obj = { 
		vobj('m_bw98',dalee),
	},
};
m_bw98 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/115.jpg';
	act = function(s,w)
		live('ma').change(0,0,4);
		walk(w);
	end,
	dsc = _([[^ - Ооо, да..
		^ Я выплеснул всю свою сперму маме на спину.
		^ - Ну ты... молодец, хорошо что не на кровать.
	]]),
	obj = { 
		vobj('m_bw81',dalee),
	},
};

m_bw99 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/27.jpg';
	act = function(s,w)
		live('ma').change(0,0,4);
		walk(w);
	end,
	dsc = _([[^ - Да, использую, твоё масло, смотри.
		^ Мама задрала юбку и продемонстрировала свою попку.
	]]),
	obj = { 
		vobj('m_bw100',dalee),
	},
};
m_bw100 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/34.jpg';
	act = function(s,w)
		live('ma').change(0,0,5);
		walk(w);
	end,
	dsc = _([[^ - Я смотрю у тебя член уже возбудился, на мою молодую попку.
	]]),
	obj = { 
		vobj('m_bw101',dalee),
	},
};
m_bw101 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/56.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - Пошли со мной, я тебе помогу с этой проблемой.
	]]),
	obj = { 
		vobj('m_bw102',dalee),
	},
};
m_bw102 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/109.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Она усадила меня на кровать, повернулась и распахнула передомной свою попку.
		^ - Смотри, смотри, какой молодой анус, в таком возрасте это гордость!
		^ - Да, мам.
	]]),
	obj = { 
		vobj('m_bw103',dalee),
	},
};
m_bw103 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/108.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Я прижал свой член к её молодому анусу.
	]]),
	obj = { 
		vobj('m_bw104',dalee),
	},
};
m_bw104 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/107.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама потёрлась о ствол члена своим анусом.
	^ - Чувствуешь какой он гладкий?
		^ - Да, мам.
	]]),
	obj = { 
		vobj('m_bw105',dalee),
	},
};
m_bw105 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/106.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама слезла с меня.
	]]),
	obj = { 
		vobj('m_bw106',dalee),
	},
};
m_bw106 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/105.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Она начала уползать, как я её окликнул, ну мам, ты же мне ещё не всё показала!
	]]),
	obj = { 
		vobj('m_bw108',dalee),
	},
};

m_bw108 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/104.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Выставив перед ней член, я сказал:
		^ - Ещё и морщинки у твоих губ сократились.
	]]),
	obj = { 
		vobj('m_bw109',dalee),
	},
};
m_bw109 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/98.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Мама автоматически схватилась за член рукой.
		^ - Правда? - ей была приятна лесть.
	]]),
	obj = { 
		vobj('m_bw110',dalee),
	},
};
m_bw110 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/97.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - Да! И язычёк у тебя тоже молодой и юркий!
		^ - Дааа? - она осторожно приоткрыла ротик.
	]]),
	obj = { 
		vobj('m_bw111',dalee),
	},
};
m_bw111 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/101.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - А ещё у тебя губки мягкие и приятные!
		^ - Оуффф? - она нежно открытым ротиком опустилась на головку члена.
	]]),
	obj = { 
		vobj('m_bw112',dalee),
	},
};
m_bw112 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/102.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - А твои соски маленькие и упругие!
		^ - Умффф - она заглотила головку языком, а левой рукой коснулась своего соска.
	]]),
	obj = { 
		vobj('m_bw113',dalee),
	},
};
m_bw113 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/103.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - И глаза у тебя большие!
		^ - Ульк - она двигалась вдоль ствола, будучи насаженной на него и смотря на меня большими глазами.
	]]),
	obj = { 
		vobj('m_bw114',dalee),
	},
};
m_bw114 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/100.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ - Ты вообще очень молодая!
		^ - ммм - движения её убыстрялись, глаза закатывались от наслаждения.
	]]),
	obj = { 
		vobj('m_bw115',dalee),
	},
};
m_bw115 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/99.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^ Я начал кончать без предупреждения
		^ - упк... - Мама с закрытыми глазами принимала всю сперму внутрь, проглатывая и выдавливая её всю.
	]]),
	obj = { 
		vobj('m_bw116',dalee),
	},
};
m_bw116 = room {
	nam =_( 'Пристройка в спальне'),
	pic = 'pic/ivents/m_before_work/110.jpg';
	act = function()
		m_before_work._stat =9;
		sleep(0,0,55);
		walk('vanna');
	end,
	dsc = _([[^ Мама с чпоканьем освободила член от её горячей хватки.
		^- Да, я её очень молода, потому даже у детей легко вызываю возбуждение!
		^- Да, мам, ты очень красива. Но тебе пора на работу, а я побежал в ванну.
	]]),
	obj = { 
		vobj('motherroom',_('{Оставить} маму в покое.')),
	},
};


