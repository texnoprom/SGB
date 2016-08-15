--v0.1 создан 06.12.2015
--Разговоры и осмотр мамы.



near = obj {
	nam = 'near';
	dsc = function(s)
			if objekt==ma then
				p(_('^{Подойти}'));
			elseif objekt==anna then
				p(_('^{Наблюдать}'));
			elseif objekt==sanya then
				p(_('^{Поговорить}'));
			elseif objekt==sveta then
				p(_('^{Поговорить}'));	
			end;
		end;
	act = function(s)
		if objekt==ma then
			walk('room_m_near');
		elseif objekt==anna then
			walk('room_a_near');
		elseif objekt==sveta then
			walk('room_s_near');	
		elseif objekt==sanya then
			if seen(sanya,'school') then
				walk('dlgssanya');
			else
				pn (_(' Я поболтал с Сашкой'));
			end;
		end;
	end,
};
room_s_near = room{ -- комната, куда нужно прописывать все новые взаимодействия с персонажем.
    nam = 'room_s_near';
	disp =_( 'Света');
	enter = function (s) --инициализация при входе
		objekt = sveta;
		if (where(sveta)==toroom) and (sveta._sost=='tv') then
			walk ('s_toroom_tv');
		elseif (sveta._sost=='sleep') or (sveta._sost=='sleep') then
			pn (_([[^Не буду я ей мешать.	]]));
			walkout();	
		elseif kv_heart ==3 then
			walk ('s_heart_start');	

		else
			pn (_([[^	Я перекинулся парой фраз со Светой.	]]));
			walkout();
			sleep(0,0,5);
		end;	
	end;
};

room_a_near = room{
    nam = 'room_a_near';
	disp =_( 'Аня');
	pic = function ()
		return seenanya.pic
	end;
	enter = function (s) --инициализация при входе
		objekt = anna;
		if (where(anna)==bedroom) and (anna._sost=='rex_sex') then
			walk ('a_bedroom_rex');
		elseif (where(anna)==bedroom) and (anna._sost=='gay_sex') then
			walk ('a_bedroom_gay');	
		elseif (where(anna)==toroom) and (anna._sost=='comp') then
			walk ('a_comp');		
		elseif (where(anna)==bedroom) and (anna._sost=='woman_sex') then
			walk ('a_bedroom_woman');	
		elseif (where(anna)==bedroom) and (anna._sost=='sleep_sex') then
			walk ('a_bedroom_fak');
		elseif (where(anna)==kitchen) and (anna._sost=='smoke') then
			walk ('a_kitchen_smoke');	--
		elseif 	(a_help == 0) and seen('minikamera',me()) and seen('juk',me()) then
			loca=where(anna)
			walk ('a_heart_start');
		elseif (kv_heart>3) and (a_help > 0) then
			loca=where(anna)
			walk('a_heart');
		else
			pn (_([[^	Я понаблюдал 5 минут за Аней.	]]));
			walkout();
			sleep(0,0,5);
		end;	
	end;
	act = function(s)
		sleep(0,0,5);
		walkout();
	end,

	dsc = _([[^
		Я понаблюдал 5 минут за аней.
	]]),
	obj = { vobj('continue', _('^{Продолжить}')) };
};

room_m_near = room{
    nam = 'room_m_near';
	disp =_( 'Мама');
	pic = 'pic/ma/face.jpg';
	enter = function (s) --инициализация при входе
		--тут определяем комнату, в которой находится мама, и состояние, перемещаемся в неё, иначе выход.
		if where(ma)==bath then
			walk ('m_near_bath');
		elseif kv_heart == 6 then
			walk('m_heart_start');
		elseif where(ma)==kitchen then
			walk ('m_near_kitchen');
		elseif (where(ma)==motherroom) then
			m_before_work.act()
		elseif ma._sost=='tv' then
			walk ('m_near_tv');
		elseif (ma._sost=='uborka') and (where(ma)==bedroom) then
			walk ('room_m_bedroom');	
		elseif (ma._sost=='uborka') and (where(ma)==toroom) then
			walk ('room_m_zal_uborka');	
		end;	
	end;
	act = function(s)
		walk(where(ma));
	end,
	dsc = _([[^
		- Маааам.
		^- Что?
	]]),
	obj = { vobj('continue', _('^{- Ничего}')) };
};

m_near_tv = room {
	nam =_( 'Мама на дивание');
	pic = function (s)
		return seenma.pic
	end;
	act = function(s,w)
		if w=='sit' then
			walk('m_ntv1');
		end;
	end,
	dsc = function (s)
		return seenma.dsc
	end;
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
		vobj('sit', _('^{Сесть рядом}')),
	},
};
m_ntv1 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot1.jpg';
	act = function(s,w)
		if ma._razvr<5 then
			walk('m_ntv_no');
		else
			walk('m_ntv2');
		end;	
	end,
	dsc = _([[^
		Вы сели на диван, но мама так далеко выставила ноги, что пришлось их немного подвинуть.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', _('^{Погладить ножки}')),
	},
};
m_ntv_no = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot6.jpg';
	act = function(s,w)

	end,
	dsc = _([[^
		- Коля! Перестань! Я телевизор смотрю!
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),

	},
};
m_ntv2 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot2.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk('m_ntv3');
	end,
	dsc = _([[^
		Вы погладили ножку, мама улыбнулась.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv3 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot3.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		if ma._sost=='tv' then
			if ma._vozb<30 then
				s.pic = 'pic/ma/zal/foot'..(rnd(3)+2)..'.jpg';
				walk('m_ntv3');
			else
				walk('m_ntv4');			
			end;	
		else
			pn (_('Мама перестала смотреть телевизор'));
			walk('toroom');
		end;	
	end,
	dsc = _([[^
		Вы продолжаете массаж ног.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv4 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot7.jpg';
	act = function(s,w)
		ma.change(0,0,2);
		if ma._sost=='tv' then
			walk('m_ntv5');			
		else
			pn (_('Мама перестала смотреть телевизор'));
			walk('toroom');
		end;	
	end,
	dsc = _([[^
		- Коля, ты молодец, так приятно. - Мама радостно хвалит меня.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv5 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot8.jpg';
	act = function(s,w)
		ma.change(0,0,2);
		if ma._sost=='tv' then
			if ma._vozb<50 then
				s.pic = 'pic/ma/zal/foot'..(rnd(3)+5)..'.jpg';
				walk('m_ntv5');
			else
				walk('m_ntv6');			
			end;		
		else
			pn (_('Мама перестала смотреть телевизор'));
			walk('toroom');
		end;	
	end,
	dsc = _([[^
		Обрадовавшись, что мать похвалила вас, вы стали лобызать её чистые пальчики.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv6 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot11.jpg';
	act = function(s,w)
		ma.change(0,0,2); --теперь мама не уйдёт из зала до окончания ивента.
		if ma._vozb<70 then
			s.pic = 'pic/ma/zal/foot'..(rnd(3)+10)..'.jpg';
			walk('m_ntv6');
		else
			walk('m_ntv7');			
		end;		
	end,
	dsc = _([[^
		Теперь она сама стала подавать свои пальчики для поцелуев, иногда гладя меня по голове.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv7 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot14.jpg';
	act = function(s,w)
		ma.change(0,0,3); --теперь мама не уйдёт из зала до окончания ивента.
		walk('m_ntv8');
	end,
	dsc = _([[^
		Вы заметили, как намокли её трусики.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv8 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot15.jpg';
	act = function(s,w)
		ma.change(0,0,4); --теперь мама не уйдёт из зала до окончания ивента.
		walk('m_ntv9');
	end,
	dsc = _([[^
		Её рука сама потянулась к киске.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv9 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot16.jpg';
	act = function(s,w)
		ma.change(0,0,5); --теперь мама не уйдёт из зала до окончания ивента.
		walk('m_ntv10');
	end,
	dsc = _([[^
		Играясь со мной ножками, глаза её, смотрящие на меня, как будто были подёрнуты туманом.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv10 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot17.jpg';
	act = function(s,w)
		ma.change(0,0,6); --теперь мама не уйдёт из зала до окончания ивента.
		walk('m_ntv11');
	end,
	dsc = _([[^
		Я целовал всё чаще и чаще ножки, моя голова тянулась к её киске.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'toroom'),
	vobj('sit', dalee),
	},
};
m_ntv11 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot18.jpg';
	act = function(s,w)
		ma.change(0,0,6); --теперь мама не уйдёт из зала до окончания ивента.
		walk('m_ntv12');
	end,
	dsc = _([[^
		Мама принялась поглаживать свою попку, как будто приглашая меня.
	]]),
	obj = { 
	vobj('sit', dalee),
	},
};
m_ntv12 = room {
	nam =_( 'Мама на дивание'),
	pic = 'pic/ma/zal/foot19.jpg';
	act = function(s,w)
		ma.change(1,0,0-ma._vozb); --теперь мама не уйдёт из зала до окончания ивента.
		walk('toroom');
	end,
	dsc = _([[^
		Я дотянулся и поцеловал её в попку. Она отбросила меня, содрогаясь в экстазе, прикрылась и сказала - Спасибо за массаж, он был великолепен.
	
	]]),

	obj = { vobj('sit', dalee),
	},
};


m_near_bath = room {
	nam =_( 'Мама');
	pic = function (s)
		return seenma.pic
	end;
	act = function(s,w)
		if w=='talk' then
			if ma._sost == 'bvanna' then
				walk('m_nb1');
			elseif 	ma._sost == 'vanna' then
				if ma._razvr<10 then 
					m_nb2.pic = 'pic/ma/bath/vanna_wat1.jpg';
					m_nb2.dsc = _([[^	- Мааам, - я заглянул в ванну.
											^- Что тебе? Не видишь, мама занята, выйди.
										]]),
					walk('m_nb2');
				elseif 	ma._razvr<20 then 
					m_nb2.pic = 'pic/ma/bath/vanna_wat2.jpg';
					m_nb2.dsc = _([[^	- Мааам, - я зашёл в ванну.
											^- Что тебе? Не видишь, мама занята, выйди.
										]]),
					walk('m_nb2');					
				else
					walk('m_nb3');					
				end;
			elseif ma._sost == 'mas' then
				walk('m_nb6');
			else
				pn (_('Мама слишком занята, чтобы со мной говорить.'));
				walk('vanna');
			end;
		elseif w=='see'	 then
			if where(ma)==bath then
				
				walk('seenma');
			else
				pn (_('Мама вышла'));
				walk('bath');
			end;
		end;	
				
	end,
	dsc = function (s)
		return seenma.dsc
	end;
	obj = { vway('закончить', _('{Отойти.}'), 'bath'),
		vobj('talk', _('^{Поговорить}')),
		vobj('see', _('^{Посмотреть}')),
	},
};
m_nb1 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/bvanna_wat.jpg';
	act = function(s,w)
	
	end,
	dsc = _([[^
		- Что тебе? Не видишь, мама занята, выйди.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'vanna'),

	},
};
m_nb2 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/vanna_wat1.jpg';
	act = function(s,w)
	
	end,
	dsc = _([[^
		- Что тебе? Не видишь, мама занята, выйди.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'vanna'),

	},
};
m_nb3 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/vanna_wat3.jpg';
	act = function(s,w)
		if ma._sost=='vanna' then
			walk(w);
		else
			pn (_('Мама закончила мыться и вышла'));
			walk('bath');
		end;
	end,
	dsc = _([[^	Я зашёл в ванну.
			^- Что ты хотел?
										]]),	
	obj = { vway('закончить', _('{- Ничего.}'), 'vanna'),
	vobj('m_nb4', _('^- У тебя там что-то в воде {плавает}.')),
		vobj('m_nb5', _('^- Да я так, руки {помыть}.')),
	},
};
m_nb4 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/vvode.jpg';
	act = function(s,w)
		if ma._sost=='vanna' then
			walk(w);
		else
			pn (_('Мама закончила мыться и вышла'));
			walk('bath');
		end;
	end,
	dsc = _([[^	Мама вскочила и помотрела вниз.
	^- Что там? Ничего не вижу. Перестань.	]]),	
	obj = { vway('закончить', _('{Отойти.}'), 'vanna'),
	vobj('m_nb3', _('^- Ну да, {показалось}.')),
		vobj('m_nb4_v', _('^- А у тебя красивое {тело}.')),
	},
};
m_nb4_v = room {
	nam =_( 'Мама'),
	pic = function()
		if ma._razvr<30 then 
			return 'pic/ma/bath/telo1.jpg';
		elseif 	ma._razvr<40 then
			return 'pic/ma/bath/telo2.jpg';
		else
			return 'pic/ma/bath/telo3.jpg';
		end;	
	end;
	
	act = function(s,w)
		if ma._sost=='vanna' then
			ma.change(0,0,1);
			walk(w);
		else
			pn (_('Мама закончила мыться и вышла'));
			walk('bath');
		end;
	end,
	dsc = function()
		if ma._razvr<30 then 
			return _([[^	- Спасибо, - сказала мама потупив взор.]]);
		elseif 	ma._razvr<40 then
			return _([[^	- Спасибо, - сказала мама.]]);
		else
			return _([[^	- Не подлизывайся.]]);
		end;	
	end;	
	obj = { vway('закончить', _('{Отойти.}'), 'vanna'),
		vobj('m_nb5', _('^- Я вообще зашёл руки {помыть}.')),
	},
};
m_nb5 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/popka1.jpg';
	act = function(s,w)
		if ma._sost=='vanna' then
			s.pic = 'pic/ma/bath/popka'..rnd(3)..'.jpg';
			walk(w);
		else
			pn (_('Мама закончила мыться и вышла'));
			walk('bath');
		end;
	end,
	dsc = _([[^	Мама спрятала от меня свои груди, но выставила попку, так что пока я мыл руки, я мог на неё смореть.	]]),	
	obj = { vway('закончить', _('{Отойти.}'), 'vanna'),
	vobj('m_nb5', _('^- Продолжать {мыть} руки.')),
	},
};
m_nb6 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/mas_talk.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	Мама резко убрала руки, расплескав воду в ванной.
		^- Сына, ты зачем так подкрадываешься? Маму испугал.]]),	
	obj = { vway('закончить', _('{Отойти.}'), 'vanna'),
	vobj('m_nb5', _('^- Да я просто, руки {помыть}.')),
	vobj('m_nb7', _('^- А я видел чем ты тут {занималась}.')),
	},
};
m_nb7 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/mas_talk1.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk(w);
		
	end,
	dsc = _([[^	- Идика сюда, и расскажи чем я тут занималась?
		^- Ну...ты грудь свою трогала.]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb8', _('^{Продолжать}.')),
	},
};
m_nb8 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/mas_talk2.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk(w);
	end,
	dsc = _([[^	- Это не хорошо, что я лежу тут без одежды, а ты одетый стоишь, а ну раздевайся! И рассказывай дальше.
		^- Ну...ты ниже ещё себя трогала.]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb9', _('^{Продолжать}.')),
	},
};
m_nb9 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/mas_talk3.jpg';
	act = function(s,w)
		ma.change(0,0,1);
		walk(w);
	end,
	dsc = _([[^	- Аяяй, ты видел как я себя трогала, ну теперь я посмотрю - трогай себя!
		^- Ну мааааам.]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb10', _('^{Продолжать}.')),
	},
};
m_nb10 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/mas_talk4.jpg';
	act = function(s,w)
		if where(ma)==bath then
			if (ma._fotki>0) and (w=='m_nb11') then
				walk(w);
			elseif (w=='m_nb11') then
				pn (_('У меня нет ни одной фото, где она мастурбирует '));
			else
				ma._vozb = 50; -- счетчик ивента.
				walk(w);
			end;	
		else
			pn (_('Я не успел, мама домылась и пошла по своим делам'));
			walk('bath');
		end;
	end,
	dsc = _([[^	- Ну вот и молодец, видишь каково это, когда кто-то за тобой наблюдает?]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb11', _('^{Угрожать фотками}.')),
	vobj('m_nb16', _('^{Продолжать дрочить}.')),
	},
};

m_nb11 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/mas_talk5.jpg';
	act = function(s,w)
		walk(w)
	end,
	dsc = _([[^	- А я сделал фото, на котором видно как ты с собой играешься!
		^ Мама изумлённо на меня посмотрела, а я продолжал надрачивать член перед её лицом.]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb12', _('^{Продолжать угрожать фотками}.')),
	},
};
m_nb12 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/mas_talk6.jpg';
	act = function(s,w)
		walk(w)
	end,
	dsc = _([[^	- Удали их, - тихо сказала мама.
		^ - Ну только если ты немного поиграешься с моим.]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb13', _('^{Продолжать угрожать фотками}.')),
	},
};
m_nb13 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/hj.gif';

	act = function(s,w)
		if ma.zastav(20,30)==1 then
			walk(w);
		else
			pn (_('Мне нечем угрожать. '));
		end;
	end,
	dsc = _([[^	- Хорошо, - тихо сказала мама. И взяв его рукой, принялась двигать шкурку.]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb14', _('^{Продолжать угрожать фотками}.')),
	},
};
m_nb14 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/bj.jpg';

	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	- Мама, у меня есть ещё фотка - теперь тебе нужно будет поработать ротиком!
		^Мама обречённо смотрела снизу вверх.]]),	
	obj = { vway('закончить', _('{Убежать.}'), 'vanna'),
	vobj('m_nb15', _('^{Продолжать угрожать фотками}.')),
	},
};
m_nb15 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/bj.gif';

	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	- Хорошо, - тихо сказала мама. И натянулась на мой ствол.]]),	
	obj = { 
		vobj('vanna', _('^{закончить}.')),
	--vobj('m_nb14', _('^{Продолжать угрожать фотками}.')), --продолжение может быть потом будет.
	},
};
m_nb16 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/25.jpg';

	act = function(s,w)
		if ma._vozb<70 then
			ma.change(0,0,1);
			s.pic = 'pic/ma/bath/'..math.modf(25+((ma._vozb-50)/4))..'.jpg';
			walk(w);
		elseif ma._razvr<20 then
			pn (_('- Hу хватит, мне нужно домыться, выходи.'));
			walk('vanna');
		else
			walk('m_nb17');
		end;	
			
	end,
	dsc = _([[^	Я стоял и дрочил, а мама смотрела.]]),	
	obj = { 
		vobj('vanna', _('^{закончить}.')),
	vobj('m_nb16', _('^{Продолжать дрочить}.')),
	},
};
m_nb17 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/31.jpg';

	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	Мамина рука приподнялась, засветив её левую грудь
		^ - Ты же хочешь, чтобы мамочка тебе помогла?.]]),	
	obj = { 
		vobj('vanna', _('^{закончить}.')),
	vobj('m_nb18', _('^{Согласиться}.')),
	},
};
m_nb18 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/32.jpg';

	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	Мама осторожно поднесла раскрытую ладонь к головке, стараясь не смотреть на него.]]),	
	obj = { 
		vobj('vanna', _('^{закончить}.')),
	vobj('m_nb19', _('^{Согласиться}.')),
	},
};
m_nb19 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/33.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	- Тебе так приятно? Маленький вуайерист.]]),	
	obj = { 
		vobj('m_nb20', dalee),
	},
};
m_nb20 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/34.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	- Ты ведь так себе всё и представлял, когда за мной подсматривал, извращенец?]]),	
	obj = { 
		vobj('m_nb21', dalee),
	},
};
m_nb21 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/35.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	- Думал что мамочка будет вот так облизывать твою головку?]]),	
	obj = { 
		vobj('m_nb22', dalee),
	},
};
m_nb22 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/36.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	- Фто мамин фотик захлофит тфою голофку???]]),	
	obj = { 
		vobj('m_nb23', dalee),
	},
};
m_nb23 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/37.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	Мама наконец опустила глаза на ствол члена, чтобы посмотреть насколько он погрузится в её рот.]]),	
	obj = { 
		vobj('m_nb24', dalee),
	},
};
m_nb24 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/38.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	Мама не отрываясь то сосала, то лизала головку.]]),	
	obj = { 
		vobj('m_nb25', dalee),
	},
};
m_nb25 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/39.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	- Нрафится? Нрафится как мама сосёт?]]),	
	obj = { 
		vobj('m_nb26', dalee),
	},
};
m_nb26 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/40.jpg';
	act = function(s,w)
		walk(w);
	end,
	dsc = _([[^	Я почуствовал коничком головки её гланды, её нёбный язычёк, и мама закашлилась.]]),	
	obj = { 
		vobj('m_nb27', dalee),
	},
};
m_nb27 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/bath/41.jpg';
	act = function(s,w)
		ma.change(1,1,0-ma._vozb);
		walk(w);
	end,
	dsc = _([[^	- Всё, иди отсюда, твоим фантазиям не суждено сбыться! - Мама махнула рукой и выгнала меня из ванной.]]),	
	obj = { 
		vobj('vanna', dalee),
	},
};
m_near_kitchen = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/kitchen/talk/1.jpg';
	act = function(s)
		walk('m_nk1');
	end,
	dsc = _([[^
		Мама занята кухонными делами.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
		vobj('continue', _('^{Осмотреть}.')),
	},
};
m_nk1 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/kitchen/talk/moet.jpg';
	act = function(s,w)
		if w=='g' then
			walk('m_nk2');
		else
			walk('m_nk3');
		end;	
	end,
	dsc = _([[^
		Мама не обращает на меня внимание.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
		vobj('g', _('^Посмотреть на {грудь}.')),
		vobj('n', _('^Посмотреть на {ноги}.')),
	},
};
m_nk2 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/kitchen/talk/moet_g.jpg';
	act = function(s,w)
		if w=='g' then
			walk('m_nk2');
		else
			walk('m_nk3');
		end;	
	end,
	dsc = _([[^
		Грудь туго обтянута платьем.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
		vobj('g', _('^Посмотреть на {грудь}.')),
		vobj('n', _('^Посмотреть на {ноги}.')),
	},
};
m_nk3 = room {
	nam =_( 'Мама'),
	pic = 'pic/ma/kitchen/talk/moet_n.jpg';
	act = function(s,w)
		if w=='g' then
			walk('m_nk2');
		else
			walk('m_nk3');
		end;	
	end,
	dsc = _([[^
		Ножки как ножки.
	]]),
	obj = { vway('закончить', _('{Отойти.}'), 'kitchen'),
		vobj('g', _('^Посмотреть на {грудь}.')),
		vobj('n', _('^Посмотреть на {ноги}.')),
	},
};