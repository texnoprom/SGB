-- персонаж аня. создан 27.08.2015
seenanya = room{
    nam = 'Аня';
	pic = 'pic/anya/razvr/1.jpg';
	hideinv = true;
	enter = function(s,f)
		loca = f;
		if seen('iphone',me()) then
			objekt = anna;
			s.obj = foto_iphone.obj;
			s.act = foto_iphone.act;
			s.dsc = foto_iphone.dsc;
		end;
	end;
    dsc = function(s)
		
	end;
	exit = function(s,f)
		objekt ='';
	end;
 	obj = { 'goback' };
};

function p_anya()
	local v = person('anya');
	v.dsc = 'Аня тут.'
	v._name = 'Анна';
	v._room = seenanya;
	v.act = function(s) --в лайфе переписываем, так как от месторасположения меняется картинка, и возможно диалог.
		if s._razvr<100 then
			seenanya.pic = 'pic/anya/razvr/'..math.modf(s._razvr / 3)..'.jpg'
			else
			seenanya.pic = 'pic/anya/razvr/34.jpg'
			end;
		walk(seenanya);
	end;
	v.life = function(s)
	--[[
			--берём перемещения сестры из Э
			--будни
			--с 00 до 7 утра по будням спит, в 7 просыпается и собирается на работу в 8 в ванной, в 9 начинает работу в супермаркете. 
			--в 15-00 она приходит с работы, 15-16 - в ванной, с 16 до 17 - кухня, 17-18 в дк пьёт пиво.
			-- в 18-00 сидит в спальне и читает книгу. (она приходит в 18-00 в спальню, если нет ивентов с Рексом)
			-- в 20-00 заходит в зал, яхз зачем. телик посмотреть или взять что-то, в 21 - возвращается к себе. в 00 ложится спать.
			--выходные
			--с 00 до 9 спит, в 9 встаёт и идёт в ванну. в 10 собирается на прогулку
			-- с 11 до 18 пьёт пиво в дк. (или ещё что-то делает, потом придумаю, контент есть)
			-- в 18 обязательно приводит кого-нибудь, если Света дома, то в квартиру не заводит, а если нет, то заводит.
			-- в 19 этот кто-то уходит, она идёт в ванну. в 20 заходит на кухню, в 21 в зал, в 22 возвращается к себе, в 00 ложится спать.
	]]--
		if s._poved~=1 and hour==6 then s._poved=1; end; --ночью пусть возвращается в стандарт.
		if s._poved~=2 then	
		if day % 7 <5 then 	
			if ((hour == 8) or (hour ==15))  then --пусть моется редко
				s.gotoroom(s,'bath','vanna');	
			elseif (hour == 7) then
				s.gotoroom(s,'bedroomdoor','odev');
			elseif (hour>8) and (hour<15) then
				s.gotoroom(s,'supermarket','work');
			elseif (hour==20) then
				if (s._vozb<90) and (s._sost~='comp') then --если за компом, то не нужно идти смотреть телик.
					s.gotoroom(s,'toroom','tv');	 --с высоким возбуждением она не пойдёт в зал.
				end;
			elseif (hour==16)  then 
				s.gotoroom(s,'kitchen','eat');
			elseif (hour==17) then 
				s.gotoroom(s,'dk','drink');
			elseif (hour==18) or (hour==19)  then 
				s.gotoroom(s,'bedroom','read');
			elseif (hour>21)   then 
				s.gotoroom(s,'bedroom','read');	
			elseif (hour==0)   then 
				s.gotoroom(s,'bedroom','sleep','read');	
			elseif (hour==1)   then 
				s.gotoroom(s,'kitchen','smoke');	
			elseif (hour>1) and (hour<7)   then 
				s.gotoroom(s,'bedroom','sleep');	
			end;
		else ---выходные---------------------------------------------------------------------------
			if ((hour == 9) or (hour ==19)) then --пусть моется редко
				s.gotoroom(s,'bath','vanna');
			elseif (hour == 10)  then 
				s.gotoroom(s,'bedroomdoor','odev');
			elseif (hour>10) and (hour<18)  then 
				s.gotoroom(s,'dk','drink');
			elseif (hour==21) and (s._sost~='comp') then --если за компом, то не нужно идти смотреть телик.
				s.gotoroom(s,'toroom','tv');	 
			elseif (hour==20)  then 
				s.gotoroom(s,'kitchen','eat');
			elseif (hour==18) then 
				s.gotoroom(s,'bedroom','read');
			elseif (hour>21)   then 
				s.gotoroom(s,'bedroom','read');	
			elseif (hour==0)   then 
				s.gotoroom(s,'bedroom','sleep','read');	
			elseif (hour==1)   then 
				s.gotoroom(s,'kitchen','smoke');	-- курит по ночам
			elseif (hour>1) and (hour<8)   then 
				s.gotoroom(s,'bedroom','sleep');	
			end;
		end; --if day	
		end; --poved~=2

		--состояния
		if s._sost=='work' then 	s.dsc =  ' {Аня за работой}. '; end;
			if s._sost=='tv' then 		s.dsc = ' {Аня } смотрит телевизор. ';	end;
			if s._sost=='car' then 		s.dsc = ' {Аня } помогает отчиму. ';	end;
			if s._sost=='tea' then 		s.dsc = ' {Аня } пьёт чай. ';	end;
			if s._sost=='mas' then 		s.dsc = ' {Аня } мастурбирует. ';	end;
			if s._sost=='konchit' then 		s.dsc = ' {Аня } кончает. ';	end;
			if s._sost=='sleep' then 		s.dsc = ' {Аня }  спит. ';	end;
			if s._sost=='read' then 		s.dsc = ' {Аня }  читает. ';	end;
			if s._sost=='vanna' then 		s.dsc = ' {Аня }  моется в ваной. ';	end;
			if s._sost=='eat' then 		s.dsc = ' {Аня }  ходит по кухне. ';	end;
			if s._sost=='walk' then 		s.dsc = ' {Аня }  гуляет. ';	end;
			if s._sost=='work' then 		s.dsc = ' {Аня} работает кассиром';	end;
			if s._sost=='smoke' then 		s.dsc = ' {Аня} курит на подоконнике';	end;
			if s._sost=='comp' then 		s.dsc = ' {Аня} за компьютером';	end;
		--для каждой комнаты свои действия
		fileexist(seenanya,'pic/anya/'..where(s).nam..'/'..s._sost..'.jpg');
		
		if (s._sost=='tv')  or (s._sost=='mas')or (s._sost=='vanna')  then -- состояния с 4мя случайными картинками.
			fileexist(seenanya,'pic/anya/'..where(s).nam..'/'..s._sost..rnd(6)..'.jpg');
			s._vozb = s._vozb+rnd(2)-1; --возбуждается от тв, ванны
		end;
		if seen(s, 'bedroomdoor') then
			s.dsc = ' Собираясь на работу {Аня} туда-сюда носится по квартире, дверь в комнату раскрыта настежь.';
			seenanya.pic = 'pic/anya/bedroom/sobir.jpg';
		end;		
		if seen(s, 'supermarket') then
			if hour==12 then
				s.dsc = _('За кассой стоит Оля');
			end; 
		end;
		
		if seen(s, 'kitchen') then
			if s._sost == 'smoke' then
				if s._razvr<20 then
					seenanya.pic = 'pic/anya/kitchen/S1.jpg';
				elseif s._razvr<50 then
					seenanya.pic = 'pic/anya/kitchen/S2.jpg';
				else
					seenanya.pic = 'pic/anya/kitchen/S3.jpg';
				end;
				if seen ('sigar','kitchen') then -- я подкинул сигареты на кухню.
					s.change(0,0,1); --каждая затяжка увеличивает возбуждение.
					sigar._kolvo =sigar._kolvo-1 ; -- покурила минуту сигарету
					if sigar._kolvo<1 then --сигареты кончились
						move('sigar','bariga','kitchen');
					end;
				end;
		
			end;
		end;
		if seen(s, 'dk') then
			s.dsc = function()
				pn('{Аня} сидит в компании девчонок и парней и пьет пиво');
			end;
			
			if s._razvr<10 then
				seenanya.pic = 'pic/anya/dk/r1.jpg';
			elseif s._razvr<20 then
				seenanya.pic = 'pic/anya/dk/r10.jpg';
			elseif s._razvr<40 then
				seenanya.pic = 'pic/anya/dk/r20.jpg';	
			elseif s._razvr<60 then
				seenanya.pic = 'pic/anya/dk/r40.jpg';	
			elseif s._razvr<80 then
				seenanya.pic = 'pic/anya/dk/r60.jpg';		
			else seenanya.pic = 'pic/anya/dk/r80.jpg';	
			end;
		end;
		
		if seen(s, 'bedroom') then	
		
			if hour<7 then
				s._sost = 'sleep';
				if s._razvr<40 then
					seenanya.pic = 'pic/anya/bedroom/1.jpg';
				else
					seenanya.pic = 'pic/anya/bedroom/2.jpg';
				end;
				s.dsc = function()	
					pn('{Аня} спит');
				end;
			else
			--	pn (s._vozb,s._sost,s._razvr,hour)
				if not seen(sveta, 'bedroom') and (hour>20) then --соло, и нельзя с утра.
					--pn (s._vozb,s._sost,s._razvr)
					if s._vozb<40 then
						if seen('playgirl','bedroom') and (s._razvr<10) then 
							s._sost = 'readmas';
							seenanya.pic = 'pic/anya/bedroom/readsex.jpg';
							s._vozb = s._vozb+rnd(2)-1; 
							s.dsc = function()	
								pn('{Аня} читает что-то интересное.');
							end;
						else	
							s._sost = 'read';
							seenanya.pic = 'pic/anya/bedroom/kniga.jpg';
							s.dsc = function()	
							pn('{Аня} читает');
							end;
						end;
					elseif 	s._razvr<10 then --одна сидит дома
						if	s._vozb<100 then
							s._sost = 'mas';
							seenanya.pic = 'pic/anya/bedroom/r'..math.modf((s._vozb-33) /7)..'.jpg';
							s._vozb = s._vozb+rnd(2)-1; --мастурбирует, независимо от обнаружения
							s.dsc = function()	
							pn('{Аня} мастурбирует');
							end;
						else
							s._sost = 'konchit';
								
							s.dsc = function()	
							pn('Тело {Анны} содрогается в экстазе');
							end;
							seenanya.pic = 'pic/anya/bedroom/r9.jpg';
						end;
					elseif s._razvr<20 then -- начала водить рекса.
						s._sost = 'rex_sex';
						seenanya.pic = 'pic/anya/bedroom/rex_bed.jpg';
						s._vozb = s._vozb+rnd(2)-1; --занимается сексом
						s.dsc = function()	
							pn('{Аня} вместе с Рексом.');
						end;
						if s._vozb>200 then
							s._sost='konchit';
						end;
					elseif s._razvr<30 then -- начала водить других парней.
						s._sost = 'gay_sex';
						seenanya.pic = 'pic/anya/bedroom/p_bed.jpg';
						s._vozb = s._vozb+rnd(2)-1; --занимается сексом
						s.dsc = function()	
							pn('{Аня} вместе с каким-то парнем.');
						end;
						if s._vozb>200 then
							s._sost='konchit';
						end;
					elseif s._razvr<50 then -- начала водить баб.
						s._sost = 'woman_sex';
						seenanya.pic = 'pic/anya/bedroom/g_bed.jpg';
						s._vozb = s._vozb+rnd(2)-1; --занимается сексом
						s.dsc = function()	
							pn('{Аня} вместе с девушкой.');
						end;
						if s._vozb>200 then
							s._sost='konchit';
						end;
					else -- теперь просто приходит и засыпает. но теперь можно её ебать.
						seenanya.pic = 'pic/anya/bedroom/sleep_bed.jpg';
						s._sost = 'sleep_sex';
						s.dsc = function()	
							pn('{Аня} крепко спит.');
						end;
					end;
				else	-- вместе с светой
					--потом добавлю совместных времяпрепровождений, а пока - книга
					s._sost = 'read';
					seenanya.pic = 'pic/anya/bedroom/kniga.jpg';
					s.dsc = function()	
					pn('{Аня} читает');
					end;
				end;	
			end;
		end;		
		if s._sost=='konchit'	then 
				if objekt==s then
					s.change(1,0,0-s._vozb); --если подсматриваем, значит разврат растёт
				else
					s.change(0,0,0-s._vozb);
				end;
			end;	
	end;
	
	return obj(v)
end

--обязательная инициализация каждого персонажа
--objs(vanna):add(p_ma());
anna = new('p_anya()')
lifeon (anna)