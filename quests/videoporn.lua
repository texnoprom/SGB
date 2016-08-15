--это квест с просмотром порнофильмов у Сашки дома, запускается после игры в футбол.
--В самом начале развивает развращённость у Сашки, в последствии будет выполнять те же функции, что и в игре ЭТО
--В Э очень быстро промотан сюжет с "ну подрочи мне" до "3 члена в глотку", фактически в 3 дня и 4 фотки. Я расширю этот ивент.
--Количество просмотров порнушки в ЭТО не ограничен, потому и мы не будем ограничивать
--v0.1 создан 02.09.2015--v0.2 10.09.2015--v0.3 30.12.2015

----удалить


function kv_videoporn()
		local v = kvest('kvvideoporn');
		v.dsc = '' ;
		     
		v.act = function(s)
			if seen(live('sanya'),'school') then
				walk('dlgssanya');
			else
				pn ' -СААААШААААА... а никто не откликнулся';
			end;	
		end;
        return obj(v)
end
objs(school):add(new('kv_videoporn()')) --так квест будет сохраняться
----



global {seeporn = 0; --если больше нуля, значит столько тактов включен порнофильм. (ну или просто абы какой счетчик)
}
dlgvideoporn = dlg {
	nam = 'В Сашкиной комнате';
 	enter = function (s) --инициализация при входе
		
		if live('sveta')._vozb<15 then
			pn 'Света сосредоточенно смотрит фильм.';
			s.pic = 'pic/sanya/roomporn1.jpg'; --ко всем вариантам нужно подобрать картинки.
		elseif 	live('sveta')._vozb<30 then
			pn 'Света с интересом смотрит фильм';
		elseif 	live('sveta')._vozb<45 then
			if live('sveta')._razvr<5 then
				pn 'Света гладит себя по коленке';
			elseif live('sveta')._razvr<7 then
				pn 'Света поглаживает бёдра';
			elseif live('sveta')._razvr<10 then
				pn 'Света массирует себе груди';
			elseif live('sveta')._razvr<15 then
				pn 'Света выпустила груди наружу и дёргает соски.';	
			else	
				pn 'Света достала из сумки дилдо, одну руку на грудь - второй держит дилдо и лижет его.'
			end;		
		elseif 	live('sveta')._vozb<60 then
			if live('sveta')._razvr<5 then
				pn 'Света сжала ноги вместе, и между ними зажала руку.';
			elseif live('sveta')._razvr<7 then
				pn 'Света сжала ноги, а сжатые между ними руки находятся в движении.';
			elseif live('sveta')._razvr<10 then
				pn 'Света сжала одну руку между ног, а вторую опустила себе на грудь.';
			elseif live('sveta')._razvr<15 then
				pn 'Света легла на бок, и опустила руку себе на промежность.';	
			else	
				pn 'Света легла на бок, и опустила руку себе на промежность, призывно глядя на нас.';
			end;		
		elseif live('sveta')._vozb<90 then
			if live('sveta')._razvr<5 then
				pn 'Света ёрзает на месте';
			elseif live('sveta')._razvr<7 then
				pn 'Света развела ноги в стороны и гладит пальцами трусы';
			elseif live('sveta')._razvr<10 then
				pn 'Света развела ноги в стороны, отодвинула ткань трусов и мастурбирует, не стесняясь нас.';
			elseif live('sveta')._razvr<15 then
				pn 'Света встала раком, положила голову на диван и засовывает 3 пальца себе в киску, постанывая.';	
			else	
				pn 'Света достала из сумки дилдо, засунула себе в киску, а второй рукой массирует клитор'
			end;
		else
			if live('sveta')._razvr<10 then
				pn 'Света говорит:';
				pn '-Я пойду, я маме обещала прибраться.';
				move( live('sveta'),'vanna',where(live('sveta')));	--света уходит в ванну, мастурбировать.
				pn 'Света резво выскакивает из квартиры.';
				pn 'Мы разочарованно переглядываемся.';
			elseif live('sveta')._razvr<20 then
				pn 'Света убегает в туалет.';
				pn 'Через 5 минут возвращается, с блуждающей улыбкой на лице.';
				live('sveta').change(1,0,0-live('sveta')._vozb)
				sleep(0,0,5);
				
			elseif live('sveta')._razvr<30 then
				pn 'Света резко сводит ноги и её тело содрогается.';
				live('sveta').change(1,0,0-live('sveta')._vozb)
				sleep(0,0,5);
				live('sanya')._vozb = live('sanya')._vozb+40;
				
			elseif live('sveta')._razvr<40 then
				pn 'Света запускает руку в трусы и с громким криком кончает.';
				live('sveta').change(1,0,0-live('sveta')._vozb)
				sleep(0,0,5);
				live('sanya')._vozb = live('sanya')._vozb+60;
				
				back();					
			else	
				pn 'Света быстро спускает трусы, быстро теребит клитор, горячая струя вырывается из её влагалища. ';
				pn 'Света кричит, Саня кричит, мы все кричим, а она заливает всё вокруг. ';
				pn '-Ну ты вообще обнаглела, Светка (говорит Саня) - Что я родителям скажу? Давай прибираться.';
				pn 'Мы выключили порно, и стали прибираться в квартире.';
				live('sveta').change(1,0,0-live('sveta')._vozb)
				sleep(0,0,5);
				minut = minut+50;	
				back();	
			end;	
		end;
		
	
	end;	
	phr = {
	    { 1,always = true, 'Продолжать смотреть фильм'
			,code [[
				live('sveta').change(0,0,1);
				live('sanya').change(0,0,1);
				]]
			,[[back()]]};
		{ 2,always = false, ' - Свет, а ты так можешь?'
		, code [[
			if live('sveta')._vozb<20 then --нельзя о таком спрашивать, при малом возбуждении.
				pn '-Да пошёл ты';
				live('sveta').change(0,-1,-1);
				
			elseif 	live('sveta')._vozb<30 then--всё ещё не достаточное возбуждение
				if live('sveta')._razvr<15 then
					pn 'Света покраснела и ничего не ответила';
					live('sveta').change(0,0,1);
				elseif 	live('sveta')._razvr<17 then
					pn 'Света ничего не ответила';
					live('sveta').change(0,0,1);
				else
					pn '-Тебя это не касается, не мешай смотреть';
				end;
			elseif 	live('sveta')._vozb<40 then--вот уже почти
				if live('sveta')._razvr<18 then
					pn 'Света покраснела и ничего не ответила';
					live('sveta').change(0,0,1);
				elseif 	live('sveta')._razvr<19 then
					pn 'Света ничего не ответила, только сильнее сжала ноги';
					live('sveta').change(0,0,1);
				else
					pn '-Может быть, не мешай.';
				end;
			else --вот теперь можно получить прямой ответ
				if live('sveta')._razvr<15 then
					pn 'Света покраснела и сказала "-Нет! Это же пошло!"';
					live('sveta').change(0,0,5);
				elseif 	live('sveta')._razvr<17 then
					pn '-Нет, я таким не занимаюсь!';
					live('sveta').change(0,0,6);
				elseif 	live('sveta')._razvr<18 then
					pn '-Нет ещё, но когда-нибудь попробую.';
					live('sveta').change(0,0,5);
				elseif 	live('sveta')._razvr<19 then
					pn '-Конечно, я же не маленькая.';
					live('sveta').change(0,0,3);
				elseif 	live('sveta')._razvr<20 then
					pn '-Конечно, хочешь проверить?';
					if 	live('sveta')._rel<50 then
						pn '-Давай проверим. (говорю я)';
						pn '-Ха, так я тебе и показала';
					else	
						pn '-Ну покажи что ты можешь';
						pn '-А что показать?';
						--здесь активация диалогов с сексом.
					end;	
				else
					pn '-Как будто ты не знаешь, не отвлекай, мы тут морально разлагаемся!';
				end;
			end; ]]
		};
		{ 3,always = false, ' Достать член и начать дрочить.'
		, code [[
			if live('sveta')._razvr<10 then
				pn '-Ты что? опупел? я ухожу остюда!'
				pn 'Света покидает нас.'
				move( live('sveta'),'school',where(live('sveta')));
				live('sveta')._poved=1;
				live('sveta').change(-1,-5,-5);--все параметры уменьшаются, нефиг доставать член при неразвратной.
				back();
			end;	
			if live('sveta')._vozb<12 then
				pn '-Фу, убери его, смотреть тошно.'
				pn 'Вы прячете член обратно';
			elseif 	live('sveta')._vozb<30 then
				pn 'Света как будто не замечает ваш член, продолжает смотреть в экран';
			elseif 	live('sveta')._vozb<45 then
				if live('sveta')._razvr<15 then
					pn 'Света старается не замечать член, хотя изредка оглядывается.';	
				elseif	live('sveta')._razvr<17 then
					pn 'Света бросает косые взгляды на мой член.';
				elseif	live('sveta')._razvr<20 then
					pn 'Когда Света оглядывается на мой член, я вижу как между губок мелькает её язычок.';
				elseif	live('sveta')._razvr<25 then
					pn '-Может дашь побаловаться с твоей палочкой?';	
					pn 'Света игриво подмигивает мне.';
					--активировать фразу с сосанием.
				else
					pn '-Ну вот ты уже готов, давай его сюда!'
					--активировать фразу с сосанием.
				end;
			else	
			--elseif 	live('sveta')._vozb<60 then --здесь можно ещё добавить вариативности.
				if live('sveta')._razvr<20 then
					pn 'Света старается не замечать член, хотя изредка оглядывается.';	
				elseif	live('sveta')._razvr<25 then
					pn 'Света пододвигается и осторожно помогает мне своей рукой.';
					--активировать фразу хенджоба
				elseif	live('sveta')._razvr<35 then
					pn 'Света пододвигается, хватает горячей ладошкой мой член, а второй рукой продолжает себя ласкать.';
					--активировать фразу хенджоба
				elseif	live('sveta')._razvr<45 then
					pn 'Света смотрит на меня и призывно открывает рот.';	
					--активировать фразу с сосанием.
				else
					pn 'Света без вопросов подсаживается ко мне и обхватывает горячими губками головку члена';
					--активировать фразу с сосанием.
				end;		
			end;]]
		};
		{4,always = false, '-Света, помоги пожалуйста, вот как в фильме'
		, code [[
			if (live('sveta')._rel<40) and (live('sveta')._sanya<40) then
				pn '-Сами себя удовлетворяйте, дибилы.';
			elseif 	(live('sveta')._rel<40) and (live('sveta')._sanya>=40) then
				pn '-Ну, тебе, Саша, я попробую помочь.';
				pn '--процесс с саней начинается в будущей версии'
			elseif 	(live('sveta')._rel>=40) and (live('sveta')._sanya<40) then
				pn '-Ну ладно, Коля, я попробую тебе помочь.';
				pn ' --процесс с Колей начинается	в будущей версии'
			else
				pn '-Хорошо, садитесь рядом.';
				pn '--процесс с двумя начинается в будущей версии';
			end;]]	
		};
	};
};


roomvideoporn = room{
    nam = 'комната сашки';
	--pic = 'pic/ma/bath/bath1.jpg';
	enter = function (s) --инициализация при входе
		
		hour = hour+1; 
	end;
	obj = { vway('закончить', '{закончить}', 'sanyaroom') };
};

posmotretvideo = obj{
    nam = 'Посмотреть видео';
    dsc = function(s)
		pn ' {Посмотреть} фильмы';
	end;	
    act = function()
		if seeporn ==0 then
			pn '-Давай посмотрим?';
			sveta.change(0,1,0); -- повышаем дружбу на 1
		end;
		if hour<18 then
			
			if seen(live('sveta'),'sanyaroom') then 
				--вот и самый объемный кусок текста, где все варианты зависят от параметров светы.
				if sveta._sanya >20 then --только при норм дружбе можно смотреть порно
					pn ' Саня вставил диск с порнофильмом.';
					seeporn=seeporn+1;
					live('sveta').change(0,0,rnd(5));
					if seeporn<4 then
						pn 'Cвета достала мобильник и смущённо игралась с ним, иногда зыркая в экран телевизора';
						pn 'Она делала вид, что ей нет дела до происходящего на экране';
						pn 'Мы сидели тихо, с опаской оглядываясь на неё.';
						roomvideoporn.pic = 'pic/sanya/roomon.jpg';
						live('sanya').change(0,rnd(2)-1,5);
					elseif 	seeporn<6 then
						pn 'Света всё чаще и чаще смотрела на экран.';
						pn ' Мы же, привыкли к ней, потому стали обсуждать происходящее';
						roomvideoporn.pic = 'pic/sanya/roomporn.jpg';
						live('sanya').change(0,0,6);
					elseif 	seeporn<8 then
						pn 'Света смотрит порнофильм. Иногда дотрагивается до себя, возможно немного возбудилась.';
						pn 'Мы обсуждая происходящее, иногда поглядываем на неё.';
						roomvideoporn.pic = 'pic/sanya/roomporn.jpg';
						live('sanya').change(0,0,7);
					elseif 	seeporn<10 then
						pn 'Света смотрит порнофильм';
						pn 'Мы обсуждая происходящее, чаще зыркаем на неё.';
						roomvideoporn.pic = 'pic/sanya/roomporn.jpg';
						live('sanya').change(0,0,8);
						if live('sveta')._vozb>60 then
							pn 'Света осторожно поглаживает свою ногу, рука так и тянется "туда".';
							roomvideoporn.pic = 'pic/sveta/kolenka.jpg';
						end;
					elseif 	seeporn<12 then
						pn 'Света смотрит порнофильм';
						pn '-Свет, а тебе нравится?.';
						live('sanya').change(0,0,9);
						if live('sveta')._vozb>100 then
							pn 'Света тихо говорит: "- Да..."';
							roomvideoporn.pic = 'pic/sveta/r0/sanyaroom/kolenka.jpg';
						else
							pn 'Света покраснела и ничего не ответила';
							roomvideoporn.pic = 'pic/sveta/r0/sanyaroom/redface.jpg';
						end;	
					
					elseif sveta._vozb>100 then
						pn (_('- Света, забывшись, гладит себя через ткань.'));
						roomvideoporn.pic = 'pic/sveta/r0/sanyaroom/12.jpg';
					else
						pn (_('- Света с увлечением смотрит фильм.'));
						roomvideoporn.pic = 'pic/sveta/r0/sanyaroom/13.jpg';
						--walk('dlgvideoporn');						return ;
					end;
				else
					pn ' Мы сели на диван смотрели боевик и оживлённо болтали.';
					roomvideoporn.pic = 'pic/sanya/roomboevik.jpg';
					sveta._sanya = math.random(2)-1+sveta._sanya;
					live('sanya').change(0,math.random(2)-1,1);
					
				end;	
			else
				live('sanya').change(1,math.random(2)-1,0);
				pn ' Мы сели на диван и сосредоточенно уставились на титры.';
				roomvideoporn.pic = 'pic/sanya/roomon.jpg';
				--live('sanya').change(0,math.random(2)-1,40);
			end;
			walk('roomvideoporn');
		else
			pn '-Нет, скоро родители придут';
		end;		
    end;
};

seenvideo = room{
    nam = 'Поле';
	pic = 'pic/sanya/sanya1.jpg';
	enter = function(s)
		if not seen(live('sanya'),'school') then
			pn 'Сашка ушёл';
			walk('school');
		end;	
	end;
    dsc = function()
		--pn(' Это мой друг Саша');
		--live('sanya').status();
	end;
	obj = { 'goback' };
};

dlgssanya = dlg {
	nam = 'Диалог с Сашей';
	enter = function (s) --инициализация при входе
		
	    s.pic = 'pic/sanya/sanya1.jpg'; --можно поменять на другую, но зачем?
		pn 'Саня посмотрел на меня';
		if live('sanya')._rel>10 then
		s:pon(2); else s:poff(2); end;
		if live('sanya')._rel>15 then
			if seen(live('sveta'),'school') then 
				if live('sveta')._razvr>1 then
					s:pon(6); -- пригласить светку посмотреть видео
					s:pon(5); -- пригласить светку присоединиться в футбол
				else
					s:pon(5); -- пригласить светку присоединиться в футбол
				end;
			else
				s:poff(5,6);
			end;	
		s:pon(3); else s:poff(3); end;
		
	end;
	phr = {
	    { 1,always = true, 'Отойти', '',[[ back() ]]};
		{ 2,always = false, '-Пойдём ко мне, в приставку поиграем?',' -Пойдём',code [[ 
		walk(toroom);
		live('sanya')._poved=2;
		move(live('sanya'),'toroom',where(live('sanya')));
		live('sanya').dsc = '{Саша} сидит рядом на диване.';
		]]};
		{ 3,always = false, '-Пойдём фильмы посмотрим?', '-Пошли'
		,[[walk(sanyaroom)]]};
		{ 4,always = true, 'Играть в футбол с Саней', 'Вы гоняли мяч по полю целый час',code[[
			live('sanya').change(0,1,0);
			hour = hour+1;
			seenvideo.pic = 'pic/sanya/foot1.jpg';
			walk(seenvideo); ]]};
		{ 5,always = false, '-Свет, пойдём фильмы посмотрим?'
		
		, code [[
			if math.random(10)>5 then 
				pn '-А пойдём.';
				live('sveta')._poved=2;
				move(live('sveta'),'sanyaroom',where(live('sveta')));
				live('sveta').dsc = '{Света} сидит рядом на диване';
				walk(sanyaroom);
			else
				pn '-Нет, мне сегодня не хочется';
				sleep(0,0,15);
				pn ' Вы с Саней долго пытались уговорить Свету, но она не сломалась.';
				seenvideo.pic = 'pic/sveta/r0/school/bolt1.jpg';
				walk(seenvideo);
			end;	]]};
		
		{ 6,always = false, '-Свет, будешь с нами?'
		, code [[
			if math.random(10)>5 then 
				pn '-Да, буду.';
				pn ' Света к нам присоединилась и мы час гоняли мяч по полю.'
				live('sanya').change(0,1,0);
				live('sveta').change(0,1,0);
				sleep(0,1,0);
				seenvideo.pic = 'pic/sveta/r0/school/foot.jpg';
				walk(seenvideo);
			else
				pn '-Нет, я лучше посмотрю.';
				pn 'Мы с Саней играли в футбол, а Света смотрела.'
				sleep(0,1,0)
				live('sanya').change(0,1,0);
				seenvideo.pic = 'pic/sanya/foot1.jpg';
				walk(seenvideo);
			end;	]]};
		}
}




sanyaroommain = obj{
	nam = 'Выход';
    dsc = function(s)
		pn ' Попрощаться с Сашкой и пойти на {улицу}.';
	end;
    act = function(s)
		if seen(live('sanya'),'sanyaroom') then --отпускаем персонажей по своим делам.
			live('sanya')._poved = 1;
		end;	
		if seen(live('sveta'),'sanyaroom') then
			live('sveta')._poved = 1;
		end;
		seeporn=0; --отключаем телик.
		walkin('main');
    end;
};

objs(sanyaroom):add(posmotretvideo) 
objs(sanyaroom):add(sanyaroommain) --выход на улицу, квартира сашки скрыта, без него в неё не попасть.
