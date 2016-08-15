--v0.1 создан 27.12.2015
-- происходящее с анной в спальне
a_bedroom_rex = room{
	nam = 'a_bedroom_rex',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_1.jpg';
	enter = function (s) 
	end;
	act = function(s)
		a_b_r1.pic = 'pic/ivents/a_bedroom/rex1_2.jpg';
		a_b_r1.dsc = _([[^ Рекс схвaтил ee зa шeю и пoтянул к сeбe, пoслe чeгo oни слились в пoцeлуe.	]]),
		walk('a_b_r1');
	end,
	dsc = _([[^
		Рекс молодец, целует её, любит наверно.
	]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', _('^{Продолжать} смотреть.')),};

};
a_bedroom_gay= room{
	nam = 'a_bedroom_gay',
	disp =_( 'Аня с парнем'),
	pic = function ()
		return 'pic/ivents/a_bedroom/p_'..math.modf((anna._vozb-31) /9)..'.jpg';
	end;
	enter = function (s) 
		if anna._vozb>193 then anna.change(1,0,0-anna._vozb);
			walk('bedroom');		end;
	end;
	act = function(s)
		anna.change(0,0,9);
		walk(s);
	end,
	dsc = _([[^
		Аня с незнакомым мне парнем.
	]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', _('^{Продолжать} смотреть.')),};

};
a_bedroom_woman= room{
	nam = 'a_bedroom_woman',
	disp =_( 'Аня с девкой'),
	pic = function ()
		return 'pic/ivents/a_bedroom/g_'..math.modf((anna._vozb-31) /9)..'.jpg';
	end;
	enter = function (s) 
		if anna._vozb>193 then anna.change(1,0,0-anna._vozb);
			walk('bedroom');		end;
	end;
	act = function(s)
		anna.change(0,0,9);
		walk(s);
	end,
	dsc = _([[^
		Аня с незнакомой девченкой, сильно похожей на неё.
	]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', _('^{Продолжать} смотреть.')),};

};
a_bedroom_fak= room{
	nam = 'a_bedroom_fak',
	disp =_( 'Аня спит'),
	pic = function ()
		return 'pic/ivents/a_bedroom/fak_1.jpg';
	end;
	enter = function (s) 
	end;
	act = function(s)
		a_b_f1.pic = 'pic/ivents/a_bedroom/fak_2.jpg';
		a_b_f1.dsc = _([[^ Глаз спокоен и закрыт, наверно не притворяется.]]);
		anna._vozb = 40; --начинаем с счетчика 40.
		walk('a_b_f1');
	end,
	dsc = _([[^		Аня крепко спит.	]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', _('^{Подойти} ')),};

};

a_b_f1 = room {
	nam = 'a_b_f',
	disp =_( 'Спящая сестра'),
	pic = 'pic/ivents/a_bedroom/fak_2.jpg';
	act = function(s,w)
		if anna._vozb<41 then
			anna.change(0,0,1); 
			s.pic = 'pic/ivents/a_bedroom/fak_4.jpg';
			s.dsc = _([[^ Убедившись что сестра крепко спит, я решил исследовать ее тело.	]])
			walk(s);
		elseif anna._vozb<42 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_5.jpg';
			s.dsc = _([[^ Я аккуратно потянул за одеяло и увидел ее спину. Она спит без лифчика.	]])
			walk(s);
		elseif anna._vozb<43 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_3.jpg';
			s.dsc = _([[^ Я вытащил своего бойца, которому нетерпелось посмотреть на сестру.	]])
			walk(s);
		elseif anna._vozb<44 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_6.jpg';
			s.dsc = _([[^ Потянув ещё немного, я предоставил бойцу вид на попку.	]])
			walk(s);
		elseif anna._vozb<45 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_7.jpg';
			s.dsc = _([[^ На следующем плацдарме боец узрел половые губы.	]])
			walk(s);
		elseif anna._vozb<46 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_8.jpg';
			s.dsc = _([[^ Бойцу нетерпелось ворваться и закрыть грудью амбразуру.	]])
			walk(s);
		elseif anna._vozb<47 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_9.jpg';
			s.dsc = _([[^ Я принялся рассматривать ее киску. Она была гладко выбрита и тянула к себе ароматом.	]])
			walk(s);
		elseif anna._vozb<48 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_10.jpg';
			s.dsc = _([[^ В глазах потемнело, разум затуманился и.....	]])
			walk(s);
		elseif anna._vozb<49 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_11.jpg';
			s.dsc = _([[^ ... в какой то момент я ловлю себя на мысли, что уже не просто стою и любуюсь голым Аниным телом, а во всю вылизываю сестринскую пизду. 	]])
			walk(s);
		elseif anna._razvr<52 then 
			anna.change(1,0,0-anna._vozb);
			pn (_('Испугавшись стона сестры я резко подорвался и убежал к себе в комнату.'))
			walk('toroom');
		elseif anna._razvr<61 then
			anna._vozb = 50 --следующий этап
			a_b_f2.pic = 'pic/ivents/a_bedroom/fak_12.jpg';
			a_b_f2.dsc = _([[^ Испугавшись приглушенного стона я отскочил от Ани, хотел было убежать, но оглянулся. Хм. Вроде спит, но на губах застыла слабая улыбка.]]),
			walk('a_b_f2');
		else
			anna._vozb = 50 --следующий этап
			--a_b_f5.pic = 'pic/ivents/a_bedroom/fak_39.jpg';
			--a_b_f5.dsc = _([[^ Аня проснулась и пригласила меня жестом.]]),
			--walk('a_b_f5');
			walk('a_b_f2'); --временно, пока не дописал ивент.
		end;	
	end,
	dsc = _([[^ Глаз спокоен и закрыт, наверно не притворяется.]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};

a_b_f2 = room {
	nam = 'a_b_f',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/a_bedroom/fak_12.jpg';
	act = function(s,w)
		if anna._vozb<51 then
			anna.change(0,0,1); 
			s.pic = 'pic/ivents/a_bedroom/fak_13.jpg';
			s.dsc = _([[^ Мой боец уже не мог ждать, я принялся его надрачивать, стоя над сестрой.	]])
			walk(s);
		elseif anna._vozb<52 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_14.jpg';
			s.dsc = _([[^ Я возбудился до предела, член так и просился утешить его, а Аня приспокойно спала, лишь только изредка до неё доходили волны наслаждения и она начинала тяжело дышать.	]])
			walk(s);
		elseif anna._vozb<53 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_15.jpg';
			s.dsc = _([[^ Лицо было её совершенно расслабленно, но всё та же полуулыбка блуждала по нему.	]])
			walk(s);
		elseif anna._vozb<54 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_16.jpg';
			s.dsc = _([[^ Соски тоже были... полунапряжены.	]])
			walk(s);
		elseif anna._vozb<55 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_17.jpg';
			s.dsc = _([[^ Подойдя к ее лицу, я заметил, что рот слегка приоткрыт, наверное я в конец потерял голову и положил свой член прямо Ане на лицо, она по прежнему спокойно спала. 	]])
			walk(s);
		elseif anna._vozb<56 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_18.jpg';
			s.dsc = _([[^ Я водил своим членом по Аниному лицу, сперма в яйцах закипела, я не понимал что со мной происходит. Окончательно потеряв голову, я положил член сестре на губы, и начал водить им. Наслаждение было неописуемым. ]])
			walk(s);
		elseif anna._vozb<57 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_19.jpg';
			s.dsc = _([[^ Вдруг неожиданно для меня Аня приоткрыла глаза и сказала: "Миша, ну ты опять за свое!?". От испуга я отошёл назад. Наверно Мишей звали того незнакомого мне парня, который трахал её последнее время.]])
			walk(s);
		elseif anna._vozb<58 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_20.jpg';
			s.dsc = _([[^ Поняв, что сестра меня не узнала, я решил продолжить начатое. 	]])
			walk(s);
		elseif anna._vozb<59 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_21.jpg';
			s.dsc = _([[^ Я повторно положил на губы сестры свой член, на мое удивление она приоткрыла рот, и у меня получилось пропихнуть головку ей в рот. 	]])
			walk(s);
		elseif anna._vozb<60 then
			if anna._razvr<53 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/fak_23.jpg';
				s.dsc = _([[^ Не успев я сделать и двух движений в Анином рту, волна наслаждения накрыла меня и я начал кончать.	]])
				walk(s);
			else
				anna._vozb = 60;
				walk('a_b_f3');
			end;
		else
			anna.change(1,0,0-anna._vozb);
			pn (_('Испугавшись что сестра подавится спермой и таки разглядит меня, я убежал в свою комнату.'))
			walk('toroom');
		end;	
	end,
	dsc = _([[^ Испугавшись приглушенного стона я отскочил от Ани, хотел было убежать, но оглянулся. Хм. Вроде спит, но на губах застыла слабая улыбка.]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};

a_b_f3 = room {
	nam = 'a_b_f',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/a_bedroom/fak_22.jpg';
	act = function(s,w)
		if anna._vozb<61 then
			anna.change(0,0,1); 
			s.pic = 'pic/ivents/a_bedroom/fak_24.jpg';
			s.dsc = _([[^ Полностью погрузил его в рот, Аня стала его сосать.	]])
			walk(s);
		elseif anna._vozb<62 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_25.jpg';
			s.dsc = _([[^ Чтобы спрятать от сестры своё лицо, я перекинул через неё ногу и уселся прямо на грудь, а членом закрыл ей лицо.	]])
			walk(s);
		elseif anna._vozb<63 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_26.jpg';
			s.dsc = _([[^ Она то брала его в рот, то облизывала его как мороженое.	]])
			walk(s);
		elseif anna._vozb<64 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_27.jpg';
			s.dsc = _([[^ Иногда впивалась в дырочку на головке и пыталась использовать его как трубочку.	]])
			walk(s);
		elseif anna._vozb<65 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_28.jpg';
			s.dsc = _([[^ Она совершала все убыстряющиеся движения головой, закрыв глаза, ощущая, как толстый член скользит по губам и языку. Головка упиралась в нёбо.  	]])
			walk(s);
		elseif anna._vozb<66 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_29.jpg';
			s.dsc = _([[^ Я немного откинулся, чтобы посмотреть на её соски, пенис скользнул по ложбинке между грудей. ]])
			walk(s);
		elseif anna._vozb<67 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_30.jpg';
			s.dsc = _([[^ И снова с размаху всадил ей в рот, почти по яйца.]])
			walk(s);
		elseif anna._vozb<68 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_31.jpg';
			s.dsc = _([[^ Чувствуя запах мокрой киски, я левую руку запустил в щёлку сестры.	]])
			walk(s);
		elseif anna._vozb<69 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_32.jpg';
			s.dsc = _([[^ Аня выплюнув член изо-рта громко застонала.	]])
			walk(s);
		elseif anna._vozb<70 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_33.jpg';
			s.dsc = _([[^ Она стонала всё громче и громче, пока я шерудил шаловливой рукой.	]])
			walk(s);	
		elseif anna._vozb<71 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_34.jpg';
			s.dsc = _([[^ Анна зажмурила глаза и её охватил оргазм.	]])
			walk(s);
		elseif anna._vozb<72 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_37.jpg';
			s.dsc = _([[^ Я тоже не выдержал и принялся выстреливать спермой на её оскаленные зубы.	]])
			walk(s);
		elseif anna._vozb<73 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_35.jpg';
			s.dsc = _([[^ Она открыла глаза и усилила движение рукой по стволу.	]])
			walk(s);
		elseif anna._vozb<74 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_36.jpg';
			s.dsc = _([[^ Она даже открыла рот и застонала.	]])
			walk(s);	
		elseif anna._vozb<75 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_38.jpg';
			s.dsc = _([[^ Пока она вытирала сперму с лица, я быстренько слез и направился к выходу.	]])
			walk(s);	
		else
			if anna._razvr<56 then
				anna.change(1,0,0-anna._razvr);
				walk('toroom');
			else
				a_b_f4.pic = 'pic/ivents/a_bedroom/fak_39.jpg';
				a_b_f4.dsc = _([[^ - Продолжай, - вдруг услышал я со стороны кровати.]]),
				walk('a_b_f4');
			end;	
		end;	
	end,
	dsc = _([[^ Аня бросила на меня быстрый взгляд, но всё же приняла головку в свой горячий ротик.]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};
a_b_f4 = room {
	nam = 'a_b_f',
	disp =_( 'На кровати'),
	pic = 'pic/ivents/a_bedroom/fak_39.jpg';
	act = function(s,w)
		if anna._vozb<76 then
			anna.change(0,0,1); 
			s.pic = 'pic/ivents/a_bedroom/fak_40.jpg';
			s.dsc = _([[^ - Коля, ты получил своё, а я нет. Давай, помоги сестрёнке.
				^ Я в шоке, она оказывается уже узнала меня!
				^ - А...я ...это.. хорошо...]])
			walk(s);
		elseif anna._vozb<77 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_41.jpg';
			s.dsc = _([[^ Аня раскинула свои нижние объятия.]])
			walk(s);
		elseif anna._vozb<78 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_42.jpg';
			s.dsc = _([[^ Я впился губами в губы, вылизывая сочащуюся киску.]])
			walk(s);	
		elseif anna._vozb<79 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_43.jpg';
			s.dsc = _([[^ Я оторвался, а Анна застонала, помогая себе пальчиками.]])
			walk(s);
		elseif anna._vozb<80 then
			if anna._razvr<57 then
				anna.change(1,0,0-anna._razvr);
				pn (_('Когда я выходил, я слышал за спиной её вздохи.'));
				walk('toroom');
			else
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/fak_44.jpg';
				s.dsc = _([[^ Я зачарованно стоял и смотрел, как она суёт в себя пальчики.
						^ - Ань, можно я вставлю? Совсем чуточку.
						^ - Ах.. нет, ты что, ты же брат!]])
				walk(s);
			end;
		elseif anna._vozb<81 then
			if anna._razvr<58 then
				anna.change(1,0,0-anna._razvr);
				pn (_(' Я с сожалением покинул спальню'));
				walk('home');
			else
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/fak_44.jpg';
				s.dsc = _([[^ - Ну пожалуйста, тебе же самой хочется!
						^ - Нет и нет!]])
				walk(s);
			end;
		elseif anna._vozb<82 then
			if anna._razvr<59 then
				anna.change(1,0,0-anna._razvr);
				pn (_(' Я с сожалением покинул спальню'));
				walk('home');
			else
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/fak_44.jpg';
				s.dsc = _([[^ - Ну я одену презерватив и не буду касаться твоей вагины, через резинку же не понастоящему!
						^ - Ну... - Она замялась.]])
				walk(s);
			end;
		elseif anna._vozb<83 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_45.jpg';
			s.dsc = _([[^ Я надел презерватив и принялся водить по её половым губам резиновым хвостиком для спермы.]])
			walk(s);
		elseif anna._vozb<84 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_46.jpg';
			s.dsc = _([[^ Затем резко вставил, Аня дёрнулась, потянулась руками чтобы меня оттолкнуть, но смогла только ахнуть.]])
			walk(s);	
		elseif anna._vozb<85 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_47.jpg';
			s.dsc = _([[^ Она была настолько возбуждена, что даже улыбалась, принимая мой член.]])
			walk(s);
		elseif anna._vozb<86 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_48.jpg';
			s.dsc = _([[^ А уж когда я задвигался, то закричала, я испугался что сюда сбежит вся родня.]])
			walk(s);
		elseif anna._vozb<87 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_49.jpg';
			s.dsc = _([[^ - Будь потише! Ты же не хочешь увидеть в комнате свою сестру?
				^ - Хорошо, - Запрокинув голову, отвечала Аня.]])
			walk(s);	
		elseif anna._vozb<88 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_50.jpg';
			s.dsc = _([[^ Но ей так нравилось, что она снова открыла рот и для увеличения эффекта пальцами принялась массировать клитор.]])
			walk(s);
		elseif anna._vozb<89 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_51.jpg';
			s.dsc = _([[^ Стоны всё громче и громче.]])
			walk(s);
		elseif anna._vozb<90 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_52.jpg';
			s.dsc = _([[^ - Ах ты сучка, заткнись, - я влепил ей затрещину.]])
			walk(s);	
		elseif anna._vozb<91 then
			anna.change(0,0,1);
			s.pic = 'pic/ivents/a_bedroom/fak_53.jpg';
			s.dsc = _([[^ Она застонала ещё громче, тогда я схватил её за шею. Анна забилась в конвульсиях и я понял, что она кончила.]])
			walk(s);		
		else
			anna.change(1,0,0-anna._razvr);
			pn (_('Я пошёл выкидывать презерватив в унитаз'));
			walk('vanna');
		end;	
	end,
	dsc = _([[^ - Продолжай, - вдруг услышал я со стороны кровати.]]),
	obj = { vway('закончить', otoyti, 'bedroom'),
		vobj('continue', dalee),	},
};

a_b_r1 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_2.jpg';
	act = function(s,w)
		if w=='skeep' then
			sleep(0,0,20);
			anna._vozb = 77;
			walk('a_b_r2');
		else -- секс начинается от 41 возбуждения
			if anna._vozb<60 then
				anna.change(0,0,5);
				s.pic = 'pic/ivents/a_bedroom/rex1_3.jpg';
				s.dsc = _([[^ Засос Рекса не оставлял сомнений в его опытности.		]])
				walk(s);		
			elseif anna._vozb<65 then
				anna.change(0,0,4);
				s.pic = 'pic/ivents/a_bedroom/rex1_4.jpg';
				s.dsc = _([[^ - Анютка, помоги мне расстегнуть ремень.		]])
				walk(s);	
			elseif anna._vozb<68 then
				anna.change(0,0,3);
				s.pic = 'pic/ivents/a_bedroom/rex1_5.jpg';
				s.dsc = _([[^ Рекс снял штаны, затем сидя на месте притянул к себе Аню, так что ей пришлось опереться рукой на его член.	]])
				walk(s);	
			elseif anna._vozb<71 then
				anna.change(0,0,2);
				s.pic = 'pic/ivents/a_bedroom/rex1_6.jpg';
				s.dsc = _([[^ - Ты меня потрогала за член, значит и я тебя тоже, моя милая, - Рекс беспрепятсвенно задрал юбку и дотянулся до Анькиной киски.	]])
				walk(s);
			elseif anna._vozb<73 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_7.jpg';
				s.dsc = _([[^ Анна совершенно не сопротивлялась, а Рекс гладил её киску пальцами.	]])
				walk(s);	
			elseif anna._vozb<74 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_8.jpg';
				s.dsc = _([[^ Анна благодарственно впилась в губы Рекса	]])
				walk(s);	
			elseif anna._vozb<75 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_9.jpg';
				s.dsc = _([[^ Она сняла с него трусы. Член был уже совсем твёрдый и шевелился. Из отверстия в выделялась пахучая прозрачная жидкость.]])
				walk(s);	
			elseif anna._vozb<76 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_10.jpg';
				s.dsc = _([[^ Она сняла с него трусы. Член был уже совсем твёрдый и шевелился. Из отверстия в выделялась пахучая прозрачная жидкость.]])
				walk(s);	
			else
				anna.change(0,0,1);
				walk('a_b_r2');	
			end;
		end;
	end,
	obj = {
		 vobj('skeep', _('^{Отойти} и вернуться через 20 минут.')),
		vobj('continue', dalee),	},
};

a_b_r2 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_11.jpg';
	act = function(s,w)
		if anna._razvr<21 then -- первая встреча с рексом. 
			anna.change(1,0,0-anna._vozb);
			sleep(0,0,59);
			pn (_(' Рекс засобирался и я отбежал от двери.'));
			walk('toroom');
		else
			if w=='skeep' then
				sleep(0,0,20);
				anna._vozb = 83;
				walk('a_b_r4');
			else -- секс начинается от 77 возбуждения
				a_b_r3.pic = 'pic/ivents/a_bedroom/rex1_12.jpg';
				a_b_r3.dsc = _([[^ Анна не хотела останавливаться, потому когда Рекс захотел закончить всё поцелуем, она всё продолжала мастурбировать ему рукой.	]]),
				walk('a_b_r3');
			end;
		end;	
	end,
	dsc = _([[^ Анна оторвалась от его члена, забыв прикрыть рот.]]),
	obj = {
		 vobj('skeep', _('^{Отойти} и вернуться через 20 минут.')),
		vobj('continue', dalee),	},
};

a_b_r3 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_12.jpg';
	act = function(s,w)
		if w=='skeep' then
			sleep(0,0,20);
			anna._vozb = 83;
			walk('a_b_r4');
		else -- секс начинается от 41 возбуждения
			if anna._vozb<78 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_13.jpg';
				s.dsc = _([[^ Она снова опустилась к члену, на этот раз он глубже входил в её розовы ротик.	]])
				walk(s);		
			elseif anna._vozb<79 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_14.jpg';
				s.dsc = _([[^ При помощи поцелуев и активной стимуляции члена, Аньке удалось привлечь Рекса к своей жаждущей киске.	]])
				walk(s);	
			elseif anna._vozb<80 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_15.jpg';
				s.dsc = _([[^ И снова пошли в ход пальцы.]])
				walk(s);	
			elseif anna._vozb<81 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_16.jpg';
				s.dsc = _([[^ Под стоны девушки, парень не выдержал и впился губами в её... губы.	]])
				walk(s);
			elseif anna._vozb<82 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_17.jpg';
				s.dsc = _([[^ Просовывая уже по 3 пальца в хлюпающую киску Рекс всё больше и больше убеждался, что она уже готова.]])
				walk(s);	
			else
				anna.change(0,0,1);
				walk('a_b_r4');	
			end;
		end;
	end,
	obj = {
		 vobj('skeep', _('^{Отойти} и вернуться через 20 минут.')),
		vobj('continue', dalee),	},
};
a_b_r4 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_19.jpg';
	act = function(s,w)
		if anna._razvr<23 then -- первая встреча с рексом. 
			anna.change(1,0,0-anna._vozb);
			sleep(0,0,59);
			walk('a_b_end1');
		else
			if w=='skeep' then
				sleep(0,0,20);
				anna._vozb = 100;
				walk('a_b_r6');
			else -- секс начинается от 77 возбуждения
				a_b_r5.pic = 'pic/ivents/a_bedroom/rex1_21.jpg';
				a_b_r5.dsc = _([[^ Я выполнил несколько тихих дыхательных упражнений, чтобы меня не заметили как в прошлый раз.	]]),
				walk('a_b_r5');
			end;
		end;	
	end,
	dsc = _([[^ Анна уже лежит на диване, задрав ноги кверху, как шлюха, а Рекс трудится, пытаясь загнать ей в хлюпающую киску поглубже.]]),
	obj = {
		 vobj('skeep', _('^{Отойти} и вернуться через 20 минут.')),
		vobj('continue', dalee),	},
};
a_b_rend1 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_18.jpg';
	act = function(s,w)
		pn (_(' Я очень быстро отбежал от двери, ворвавшись в ванную, чтобы спрятаться от Рекса, если вдруг Аня натравит его на меня.'));
		walk('vanna');
	end,
	dsc = _([[^ Анна услышала как я шумно дышу под дверью и посмотрела прямо в глазок миникамеры.]]),
	obj = {
		 vobj('skeep', _('^{Убежать} ')),
	},
};

a_b_r5 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_21.jpg';
	act = function(s,w)
		if w=='skeep' then
			sleep(0,0,20);
			anna._vozb = 100;
			walk('a_b_r6');
		else -- секс начинается от 41 возбуждения
			if anna._vozb<85 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_20.jpg';
				s.dsc = _([[^ Он схватил её за шею и нагло продолжал всаживаться. Её ножки, не нужные в такой момент. болтались по краям дивана как крылья бабочки.	]])
				walk(s);		
			elseif anna._vozb<86 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_22.jpg';
				s.dsc = _([[^ Рекс подустал, схватился за диван и попробовал передохнуть, но девушка этого не могла позволить, потому яростно стоная она подмахивала своей попкой, насаживаясь в прежнем ритме на член.	]])
				walk(s);	
			elseif anna._vozb<87 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_23.jpg';
				s.dsc = _([[^ Когда Рекс запыхался, Анна толкнула его на диван и стала присаживаться на его член. Я увидел, как его огромный бивень блестел от ее смазки, как он медленно погружается в нее, а она широко расставив ноги, насаживалась на этого монстра все больше и больше. Когда она полностью протолкнула его в себя, ее глаза закрылись, и она стала медленно двигаться.]])
				walk(s);	
			elseif anna._vozb<100 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_'..(rnd(11)+22)..'.jpg';
				s.dsc = _([[^ Его руки придерживали ее за ягодицы, она с упоением и дикими криками прыгала на нем, а когда она стала уставать, он помогал ей.]])
				walk(s);
			else
				anna.change(0,0,1);
				walk('a_b_r6');	
			end;
		end;
	end,
	obj = {
		 vobj('skeep', _('^{Отойти} и вернуться через 20 минут.')),
		vobj('continue', dalee),	},
};
a_b_r6 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_34.jpg';
	act = function(s,w)
		if anna._razvr<25 then 
			anna.change(1,0,0-anna._vozb);
			sleep(0,0,59);
			walk('a_b_end2');
		else
			a_b_r7.pic = 'pic/ivents/a_bedroom/rex1_36.jpg';
			a_b_r7.dsc = _([[^ Рекс сильно засадил ей, и она от наслаждения закрыла глаза, теперь она меня не заметит.	]]),
			walk('a_b_r7');
		end;	
	end,
	dsc = _([[^ Снова Аня оказалась на диване, а Рекс взобрался на неё сверху. Но вот она поворачивается, неужели снова меня как-то заметила?]]),
	obj = {
			vobj('continue', dalee),	},
};
a_b_rend2 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_35.jpg';
	act = function(s,w)
		walk('toroom');
	end,
	dsc = _([[^ Пока её Рекс долбил, она гневно уставилась на видеокамеру и я решил уйти, чтобы её не смущать.]]),
	obj = {
		 vobj('skeep', _('^{Уйти} ')),
	},
};

a_b_r7 = room {
	nam = 'a_b_r',
	disp =_( 'Аня с Рексом'),
	pic = 'pic/ivents/a_bedroom/rex1_36.jpg';
	act = function(s,w)
		if w=='skeep' then
			sleep(0,0,20);
			anna._vozb = 100;
			walk('a_b_r6');
		else -- секс начинается от 41 возбуждения
			if anna._vozb<102 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_37.jpg';
				s.dsc = _([[^ Длинный, изогнутый как лук конец весело нырял в неё снова и снова, повинуясь ритмике бёдер. 	]])
				walk(s);		
			elseif anna._vozb<103 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_38.jpg';
				s.dsc = _([[^  Навалившись на девушку, всем своим телом, он трахал её, а она извиваясь под ним, издавала крики наслаждения.	]])
				walk(s);	
			elseif anna._vozb<104 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_39.jpg';
				s.dsc = _([[^ Глаза закрыты, словно прислушивается к тому, что движется внутри. Через приоткрытые губы вылетают то ли вздохи, то ли молитвы. А Рекс глядел теперь прямо на дверь, трахая её киску.]])
				walk(s);	
			elseif anna._vozb<120 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_'..(rnd(6)+38)..'.jpg';
				s.dsc = _([[^ Мужик, трахавший Аню, стал наращивать темп, и она от этого издавала крики ещё громче.]])
				walk(s);
			elseif anna._vozb<121 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_45.jpg';
				s.dsc = _([[^ она прыгала на члене, сладостно постанывая]])
				walk(s);	
			elseif anna._vozb<122 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_46.jpg';
				s.dsc = _([[^ Мне даже показалось что она меня замечает]])
				walk(s);	
			elseif anna._vozb<123 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_47.jpg';
				s.dsc = _([[^ Анна в истоме извивается на Рексе]])
				walk(s);	
			elseif anna._vozb<124 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_48.jpg';
				s.dsc = _([[^ Боже, он кончил в неё! ]])
				walk(s);
			elseif anna._vozb<125 then
				anna.change(0,0,1);
				s.pic = 'pic/ivents/a_bedroom/rex1_49.jpg';
				s.dsc = _([[^ Пока Аня слазила с парня, я осторожно вынул камеру и пошёл к себе ]])
				walk(s);		
			else
				anna.change(1,0,0-anna_razvr);
				walk('toroom');	
			end;
		end;
	end,
	obj = {
		
		vobj('continue', dalee),	},
};