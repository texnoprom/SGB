--v0.1 создан 20.12.2015 --v0.2 13.03.2016 добавлен хелп
global {m_zal_kv = 1;} --этап квеста с уборкой.

room_m_zal_uborka = room{
    nam = _('Мама в зале');
	pic = 'pic/ivents/m_zal_uborka/1.jpg';
	enter = function (s) 

	end;
	act = function(s)
		walk('m_zu1');
	end,
	dsc = _([[^
		Мама оторвалась от мытья пола, присела на ступени и спросила:
		^ - Ты что-то хотел?
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
		vobj('continue', _('^{Комплимент}.')),};

};
m_zu1 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/2.jpg';
	act = function(s,w)
		if w=='g' then
			walk('m_zu2');		------------------	
		elseif w=='p' then
			walk('m_zu9');		------------------		
		elseif w=='help' then
			walk('m_zuh');		------------------		
		else
			pn (_('Мама продолжила уборку'));
			walk('toroom');
		end;	
	end,
	dsc = _([[^
		- Мам, ты красива даже в своей повседневной одежде.
		^ - У, спасибо, Коля.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', _('^Похвалить {грудь}.')),
	vobj('p', _('^Похвалить {попку}.')),
	vobj('help', _('^Предложить {помочь}.')),
	},
};
m_zuh = room {
	nam =_( 'Помощь маме'),
	pic = 'pic/ivents/m_zal_uborka/helpstart.jpg';
	act = function(s,w)
		if m_zal_kv<29 then 
			m_zuh1.pic = 'pic/ivents/m_zal_uborka/help'..m_zal_kv..'.jpg';
			else
			m_zuh1.pic = 'pic/ivents/m_zal_uborka/help'..rnd(28)..'.jpg';
		end;
		if 	m_zal_kv==1 then
			m_zuh1.dsc = _([[^- Да как ты... Ну в принципе ты уже их видел, но требовать... Хорошо, немного покажу.
							^ Мама немного приподняла футболку.						]]);
		elseif 	m_zal_kv==2 then
			m_zuh1.dsc = _([[^- Опять? Ну смотри, больше не увидишь.
							^ Мама немного приподняла футболку.						]]);
		elseif 	m_zal_kv==3 then
			m_zuh1.dsc = _([[^- Ты прошлый раз хорошо убрался, увидь их полностью!						]]);			
		elseif 	m_zal_kv<7 then
			m_zuh1.dsc = _([[^Мама с готовностью подняла футболку				]]);	
		elseif 	m_zal_kv<12 then
			m_zuh1.dsc = _([[^Мама с готовностью подняла футболку и даже стала позировать.			]]);	
		elseif 	m_zal_kv<17 then
			m_zuh1.dsc = _([[^Мама подняла футболку и немного расстегнула джинсы.			]]);
		elseif 	m_zal_kv<19 then
			m_zuh1.dsc = _([[^Маме нравится когда я смотрю на её сиськи, пальчик тянет ко рту.			]]);
		elseif 	m_zal_kv==19 then
			m_zuh1.dsc = _([[^Маме сняла футболку и потянулась языком к соску. ^- Ох мам, ты у меня лучшая!			]]);
		elseif 	m_zal_kv<27 then
			m_zuh1.dsc = _([[^Маме сняла футболку приспустила штаны и нагнулась. ^- Коля, я знаю, что ты убираешь тем лучше, чем сильнее возбуждаешься, вот, смотри какая у мамы попка красивая.			]]);
		else
			m_zuh1.dsc = _([[^Мама привычно сняла футболку, спустила джинсы и стала позировать. ]]);
		end;
		walk('m_zuh1');		------------------	
	end,
	dsc = _([[^
		- Мам, отдохни, я могу тебе помочь. Но...
		^ Мама присела на диван, - Что но? Хочешь что-то за это? Я не замечала чтобы ты рвался мыть полы.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('help', _('^- Просто так не буду мыть. Только если покажешь... {СИСЬКИ!}.')),
	},
};

m_zuh1 = room {
	nam =_( 'Помощь маме'),
	pic = 'pic/ivents/m_zal_uborka/uborka.jpg';
	act = function(s,w)
		ma.change(0,0,3);
			walk('m_zuh2');		------------------	
	end,
	dsc = _([[^
		- У тебя очень красивые груди. Мне очень нравятся такие: большие и тяжелые, но твердые и скругленные по бокам.
		^ Мама выровняла спинку, - правда? 
	]]),
	obj = { vobj('g', dalee),
	},
};
m_zuh2 = room {
	nam =_( 'Помощь маме'),
	pic = 'pic/ivents/m_zal_uborka/uborka.jpg';
	act = function(s,w)
		sleep(0,1,0);
			walk('m_zuhend');		------------------	
	end,
	dsc = _([[^
		Я работал изо всех сил, пылесосыил, убирал пыль, а мама лежала на диване и любовалась на меня. 
	]]),
	obj = { vobj('g', dalee),
	},
};
m_zuhend = room {
	nam =_( 'Помощь маме'),
	pic = 'pic/ivents/m_zal_uborka/helpend.jpg';
	act = function(s,w)
			walk('toroom');		------------------	
	end,
	dsc = _([[^
		Молодец, мой робот, теперь могу пойти дальше убираться, - Мама чмокнула меня в щёчку и ушла.
	]]),
	obj = { vobj('g', dalee),
	},
};

m_zu2 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/3.jpg';
	act = function(s,w)
			walk('m_zu3');		------------------	
	end,
	dsc = _([[^
		- У тебя очень красивые груди. Мне очень нравятся такие: большие и тяжелые, но твердые и скругленные по бокам.
		^ Мама выровняла спинку, - правда? 
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu3 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/7.jpg';
	act = function(s,w)
			walk('m_zu4');		------------------	
	end,
	dsc = _([[^
		- Наверно и на ощупь мягкие, но упругие.
		^ - Не надо их щупать, остановись, Коля!
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu4 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/17.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu5');		
	end,
	dsc = _([[^
		- Да нет, ты сама пощупай, как они.
		^ Мама стала сосредоточенно руками трогать груди.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu5 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/18.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		if ma.zastav(10,10)==1 then
			walk('m_zu6');	
		else
			walk('m_zu_no');	
		end;	
	end,
	dsc = _([[^
		- Ну да, очень упругие, для моего возраста они лучшие.
		^ - А может ты мне их покажешь? Какие они  тебя в твоём возрасте?
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu_no = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/15.jpg';
	act = function(s,w)
		ma.change(0,0,-2);
		sleep(0,0,15);
		walk('kitchen');	
	end,
	dsc = _([[^
		- Конечно, может тебе ещё и раком встать? Выйди из комнаты, ты мне будешь мешать убираться.
		^ И мне пришлось покинуть зал, я пошёл на кухню немного перекусить.
	]]),
	obj = {
	vobj('g', dalee),
	},
};
m_zu6 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/19.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu7');	
	end,
	dsc = _([[^
		- Я так не могу, я же убираюсь.
		^ - Да ладно, мам, ты уже почти всё прибрала. Показывай.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu7 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/25.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu8');	
	end,
	dsc = _([[^
		Мама встала и приподняла майку
		^ - Смотри.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu8 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/5.jpg';
	act = function(s,w)
		ma.change(0,0,2);
		walk('m_zu9');	
	end,
	dsc = _([[^
		- А у тебя ещё и попка ничего.
		^ Мама засмеялась, - Ну хитрец, сиськи увидел, и тебе мало?
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu9 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/10.jpg';
	act = function(s,w)
		ma.change(0,0,rnd(3));
		if seen(otchim,'toroom') then
			walk ('toroom');
			pn (_(' - Ой, твой отец пришёл, хватит меня отвлекать '));
		elseif ma._vozb<60 then
			s.pic = 'pic/ivents/m_zal_uborka/1'..(rnd(3)-1)..'.jpg'; 
			walk('m_zu9');	
		else
			walk('m_zu10');
		end;	
	end,
	dsc = _([[^
		- Правда, у тебя красивая попка.
		^ Мама засмеялась, ей комплимент понравился.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('help', _('^{Продолжать} делать комплименты.')),
	},
};
m_zu10 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/13.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu11');	
	end,
	dsc = _([[^
		Мамина рука перешла из расслабленного состояния в состояние поглаживания джинсов.
		^ - Мам, а может покажешь свою попку?
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu11 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/14.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu12');	
	end,
	dsc = _([[^
		- Ну не знаю, может она и вправду красива, но показывать тебе?
		^ - Ну давай, она хорошо обтянута джинсами, форму будет хорошо видно.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu12 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/20.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu13');	--------------
	end,
	dsc = _([[^
		- Ну хорошо, смотри.
		^ Мама привстала и повернулась ко мне задом.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu13 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/21.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu14');	--------------
	end,
	dsc = _([[^
		- Тут не промокло? Я с тобой так долго тут болтаю, что могла вспотеть.
		^ Мама провела рукой по промежности.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu14 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/22.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu15');	--------------
	end,
	dsc = _([[^
		- Встань пожалуйста, лучше видно будет
		^ Мама встала, прислонилась к стене.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu15 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/23.jpg';
	act = function(s,w)
		ma.change(0,0,2);
		walk('m_zu16');	--------------
	end,
	dsc = _([[^
		- У тебя похоже там пятно.
		^ Где? - Мама снова рукой стала пробовать между булок.
	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu16 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/24.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		if ma.zastav(15,15)==1 then
			walk('m_zu17');	
		else
			walk('m_zu_no2');	
		end;	
	end,
	dsc = _([[^
		- Вроде я ничего не чувствую, посмотри получше.
		^ Мама выгнулась, предоставляя мне великолепный вид.
		]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', _('^- Какая красивая попка. {Сними} пожалуйста майку и джинсы, я хочу оценить их в комбинации..')),
	},
};
m_zu_no2 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/8.jpg';
	act = function(s,w)
		ma.change(0,0,-2);
		walk('toroom');	
	end,
	dsc = _([[^
		- Воу воу, полегче, маленький развратник, не покажу я тебе ничего, и вообще мне пора.
		^ Мама вышла.
	]]),
	obj = {	vobj('g', dalee),	},
};
m_zu17 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/26.jpg';
	act = function(s,w)
		ma.change(0,0,3);
		walk('m_zu18');	
	end,
	dsc = _([[^
		Мама сбросила майку и приспустила джинсы.
		^ - Ну как тебе?
		^ - Восхитительный зад!		]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu18 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/29.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu19');	
	end,
	dsc = _([[^
		 - Мам, ты лучшая, в твоём возрасте у тебя такая потрясающая попка!
		^ Мама продолжала медленно снимать джинсы	]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu19 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/30.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu20');	
	end,
	dsc = _([[^
		 - Ты просто потрясающая!
		^ Пока мама не видела, я снял штаны и улёгся на диван, и принялся надрачивать член на попку мамы.]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', dalee),
	},
};
m_zu20 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/31.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		if ma.zastav(15,20)==1 then
			walk('m_zu21');	
		else
			walk('m_zu_no3');	
		end;
	end,
	dsc = _([[^ Мама обернулась и увидела мой член, её рот непроизвольно раскрылся.
		^ - Ты чем это тут занимаешься, пока мама светит своей задницей?
		^ - Ну я мам... это естественая реакция на твою красоту!]]),
	obj = { vway('закончить', otoyti, 'toroom'),
	vobj('g', _('^- Может быть ты предпримешь что-то чтобы {погасить} эту реакцию?')),
	},
};
m_zu21 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/32.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu22');	
	end,
	dsc = _([[^
		- Ну хорошо, пока никто не видит, я тебе помогу.
		]]),
	obj = {		vobj('g', dalee),
	},
};
m_zu22 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/33.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu23');	
	end,
	dsc = _([[^
		Мама опустилась к моему члену и лизнула его.
		]]),
	obj = {		vobj('g', dalee),
	},
};
m_zu23 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/34.gif';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_zu24');	
	end,
	dsc = _([[^
		Я получал огромное удовольствие.
		]]),
	obj = {		vobj('g', dalee),
	},
};
m_zu24 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/end.jpg';
	act = function(s,w)
		ma.change(1,0,-100);
		walk('toroom');	
	end,
	dsc = _([[^
		Наконец я закончил.
		]]),
	obj = {		vobj('g', _('^{Одеться}.')),
	},
};
m_zu_no3 = room {
	nam =_( 'Мама в зале'),
	pic = 'pic/ivents/m_zal_uborka/end3.jpg';
	act = function(s,w)
		ma.change(0,0,-2);
		walk('toroom');	
	end,
	dsc = _([[^
		- Нет нет, я одеваюсь, посмотрел и хватит, сам решай свои животные проблемы.
		^ Мама вышла.
	]]),
	obj = {	vobj('g', dalee),	},
};