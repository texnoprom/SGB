--взаимодействие с мамой в кафе
--v0.1 создан 10.10.2015 v0.2 29.10.2015 корректировки.


kafe_room = room{
    nam = _('кафе');
	--pic = 'pic/ma/bath/bath1.jpg';
	act = function()
		walk('kafe');
	end,
	enter = function (s) --инициализация при входе
		
		end;	
 
	obj = { vobj('continue', _('{Вернуться}')), };
};

m_kr0 = room {
	nam = _('Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/c17.jpg';
	act = function()
		walk('m_kr1');
	end,
	dsc = _([[^
		А вот и мама поймала... стоп, почему она облизывается, смотря на член?
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr1 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang1.jpg';
	act = function()
		walk('m_kr2');
	end,
	dsc = _([[^
		Она, не отпуская член, провела мальчика к креслу и посадила.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr2 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang2.jpg';
	act = function()
		walk('m_kr3');
	end,
	dsc = _([[^^
		Встала перед ним и начала распинать:
		^^- Что же ты вытворяешь? Ты уже который раз здесь засовываешь свою штуку в мою официантку!
		^^Смотря парню в глаза, надрачивая член, выговаривала мамка.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr3 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang3.jpg';
	act = function()
		walk('m_kr4');
	end,
	dsc = _([[^^
		-Я просто...
		^^Он не успел ответить, как мама высунув язык вонзила его в рот парнишке.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr4 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang4.jpg';
	act = function()
		walk('m_kr5');
	end,
	dsc = _([[^^
		-Не смей мне тут оправдываться! Я тебе покажу как правильно удовлетворять свою страсть. А ты -, обратилась мама к официантке, - Смотри и учись!
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr5 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang5.jpg';
	act = function()
		walk('m_kr6');
	end,
	dsc = _([[^^
		Мама обхватила головку ртом.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr6 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang6.jpg';
	act = function()
		walk('m_kr7');
	end,
	dsc = _([[^^
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr7 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang7.jpg';
	act = function()
		walk('m_kr8');
	end,
	dsc = _([[^^
		Официантка с негодованием смотрела как рот работает на большом члене.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr8 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang8.jpg';
	act = function()
		walk('m_kr9');
	end,
	dsc = _([[^^
		Язычком она описывала восьмёрку, девушка всё больше и больше интересовалась происходящим.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr9 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang9.jpg';
	act = function()
		walk('m_kr10');
	end,
	dsc = _([[^^
		Наконец она оторвалась от головки члена.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr10 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang10.jpg';
	act = function()
		walk('m_kr11');
	end,
	dsc = _([[^^
		-Видишь, как профессионалы это делают?
		^^Поглаживая яйца, спросила мама.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr11 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang11.jpg';
	act = function()
		walk('m_kr12');
	end,
	dsc = _([[^^
		-Да, это было великолепно.
		^^Мама улыбнулась, сжав яйца сильнее.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr12 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang12.jpg';
	act = function()
		live('ma').change(0,0,50);
		sleep(0,2,0);
		walk('kafe');
	end,
	dsc = _([[^^
		Парень немного офигел от такого, мама сжала член обоими руками и сказала:
		^^-Ну, урок вы получили, теперь брысь за работу, клиенты ждут. За дополнительными занятиями обращайтесь завтра, в конце работы.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr13 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang13.jpg';
	act = function()
		walk('m_kr14');
	end,
	dsc = _([[^^
		Зная, что предстоит сегодня, я спрятался в туалете и подождал, пока вся троица не соберётся на кухне, и тогда я осторожно пошёл посмотреть на них.
		^^Парень сел на кресло, взял член в руки и ждёт, но мама не обратила на него внимания.
		^^-Сегодня мы займёмся женским полом, - Сказала мама и погладила официантку по щеке.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr14 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang14.jpg';
	act = function()
		walk('m_kr15');
	end,
	dsc = _([[^^
		Резким движением она оголила правую грудь у девушки
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr15 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang15.jpg';
	act = function()
		walk('m_kr16');
	end,
	dsc = _([[^^
		Потянув за майку, мама приблизила свои губы к губам девушки и вцепилась в них поцелуем
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr16 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang16.jpg';
	act = function()
		walk('m_kr17');
	end,
	dsc = _([[^^
		Затем задрав юбку улеглась на столешницу, девушка поняла что нужно делать. У парня, наблюдавшего за всем этим, сама собой задвигалась рука, державшая член.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr17 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang17.jpg';
	act = function()
		walk('m_kr18');
	end,
	dsc = _([[^^
		Девчушка аккуратно работала язычком.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr18 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang18.jpg';
	act = function()
		walk('m_kr19');
	end,
	dsc = _([[^^
		-Смелее.
		Сказала мама и с улыбкой, взяв за голову девушку, натянула свой зад прямо на её лицо.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr19 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang19.jpg';
	act = function()
		walk('m_kr20');
	end,
	dsc = _([[^^
		Девушке пришолсь поработать и над колечком ануса мамы.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr20 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang20.jpg';
	act = function()
		live('ma').change(0,0,60);
		sleep(0,2,0);
		walk('kafe');
	end,
	dsc = _([[^^
		Парень устал наблюдать, как проходит обучение, потому мама сказала:
		^^-Ну всё, урок окончен, приходите завтра, а сейчас можно и по домам.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr21 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang21.jpg';
	act = function()
		walk('m_kr22');
	end,
	dsc = _([[^^
		Выходя из своего укрытия я уже слышал стоны матери, что-то урок далеко зашёл.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr22 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang22.jpg';
	act = function()
		walk('m_kr23');
	end,
	dsc = _([[^^
		Да, парень её драл схади, сжимая зад в своих сильных руках, а она смотрела и направляла:
		-Правильно, сожми сильнее, двигайся ритмично.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr23 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang23.jpg';
	act = function()
		walk('m_kr24');
	end,
	dsc = _([[^^
		Мама стонала, а официантка, обделённая членом, сидела на столешнице и мастурбировала.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr24 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang24.jpg';
	act = function()
		walk('m_kr25');
	end,
	dsc = _([[^^
		Парень сжал с силой зад мамы, скорее всего останется синяк, но она закрыла глаза и улыбнулась.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr25 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang25.jpg';
	act = function()
		walk('m_kr26');
	end,
	dsc = _([[^^
		Наконец мама занялась киской девушки.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr26 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang26.jpg';
	act = function()
		walk('m_kr27');
	end,
	dsc = _([[^^
		Увлажнив киску девушки, мама опустила парня на пол и дала указание официантке сесть на него.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr27 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang27.jpg';
	act = function()
		walk('m_kr28');
	end,
	dsc = _([[^^
		Я первый раз вижу анус девчушки, мой член был готов запрыгнуть в комнату без меня.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr28 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang28.jpg';
	act = function()
		walk('m_kr29');
	end,
	dsc = _([[^^
		Теперь мама оседлала его, она великолепна!
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr29 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang29.jpg';
	act = function()
		walk('m_kr30');
	end,
	dsc = _([[^^
		Девушке очень хотелось занять чем-то рот, потому она схватила пальцы парня и начала их обсасывать, хотя, в каких-то 5 метрах её ждал горячий член... эх...
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr30 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang30.jpg';
	act = function()
		walk('m_kr31');
	end,
	dsc = _([[^^
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr31 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang31.jpg';
	act = function()
		walk('m_kr32');
	end,
	dsc = _([[^^
		Она целует её...
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr32 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang32.jpg';
	act = function()
		walk('m_kr33');
	end,
	dsc = _([[^^
		Мама встала с члена, девчушка надрочила его рукой и мама села, выпятив попку ко мне. Официантка стала обизывать руку, которой надрачивала член, ей понравился сок моей мамы. 
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr33 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang33.jpg';
	act = function()
		walk('m_kr34');
	end,
	dsc = _([[^^
		Да и попка моей мамы самая лучшая, даже парень пытался приподняться, чтобы видеть её лучше.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr34 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang34.jpg';
	act = function()
		walk('m_kr35');
	end,
	dsc = _([[^^
		Я сделал пару фоток, это шикарная позиция.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr35 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang35.jpg';
	act = function()
		walk('m_kr36');
	end,
	dsc = _([[^^
		Мама слезла с члена
		^^-Возьми его в руку и надрачивай, быстрее, приготовь ротик для спермы!
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr36 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang36.jpg';
	act = function()
		walk('m_kr37');
	end,
	dsc = _([[^^
		Парень застонал, сперма брызнула в лицо неопытной девушке, по усам текло а в рот не попало.
		
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
m_kr37 = room {
	nam =_( 'Кухня в кафе'),
	pic = 'pic/ivents/m_kafe/bang37.jpg';
	act = function()
		live('ma').change(0,0,70);
		sleep(0,2,0);
		walk('kafe');
	end,
	dsc = _([[^^
		-Ну вот и всё, урок закончен, - сказала мама, слизывая с девушки сперму, - Надеюсь вы научились правильно работать с органами, и не будете тратить рабочее время на свои игры.
	]]),
	obj = {
		vobj('continue', dalee),
	},
};
function kv_m_kafe()
        local v = kvest('kvm_kafe');
        
        v.dsc = function()
			if seen('ma', 'kafe') then
			pn(_(' Пройти на {кухню}.'));
			end;
		end;
		v.act = function(s)
			if s._stat<16 then
				if s._stat<11 then
					kafe_room.dsc = _('Сын владельца кафе пытается приставать к официантке.');
				else
					kafe_room.dsc = _('У него наконец получилось её уболтать, походу он даже её трахает!');
				end;
				kafe_room.pic = 'pic/ivents/m_kafe/p'..s._stat..'.jpg';
				s._stat = s._stat+1;
				sleep(0,1,0); --по часу занимает подглядывание
				walk('kafe_room');
			elseif s._stat==16 then	
				if live('ma')._razvr<32 then
					kafe_room.pic = 'pic/ivents/m_kafe/c'..(math.modf(live('ma')._razvr/2)+1)..'.jpg';
					kafe_room.dsc = _('А вот и мама, поймала их на горяченьком, отругает поди официанточку.');	
					s._stat = 10; --сбрасываем прогресс, так как разврата не хватает
					sleep(0,1,0); --по часу занимает подглядывание
					live('ma').change(0,0,30);
					walk('kafe_room');
				else
					s._stat = 17;
					walk('m_kr0'); --вторая часть ивента	
				end;
			elseif s._stat==17 then
				if hour==14 or hour==15 then
					s._stat = 18;
					walk('m_kr13'); --третья часть ивента
				else
					kafe_room.pic = 'pic/ivents/m_kafe/p'..rnd(6)..'.jpg';
					kafe_room.dsc = _('Эти двое мило болтают, больше попыток заняться сексом я не замечаю');
					sleep(0,0,15); 
					walk('kafe_room');					
				end;
			elseif s._stat==18 then
				if hour==14 or hour==15 then
					s._stat = 19;
					walk('m_kr21'); --четвёртая, последняя часть ивента
				else
					kafe_room.pic = 'pic/ivents/m_kafe/p'..rnd(6)..'.jpg';
					kafe_room.dsc = _('Ребятишки готовятся к новому уроку.');
					sleep(0,0,15); 
					walk('kafe_room');					
				end;
			else
				kafe_room.pic = 'pic/ivents/m_kafe/p'..rnd(6)..'.jpg';
				kafe_room.dsc = _('Парнишка с официанткой работают в поте лица');
				sleep(0,0,15); 
				walk('kafe_room');	
			end;	
				
		end;
        return obj(v)
end
m_kafe = new('kv_m_kafe()')

objs(kafe):add(m_kafe) --так квест будет сохраняться