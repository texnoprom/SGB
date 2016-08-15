-- персонаж отчим. создан 06.09.2015
--06.02.2016 изменения в персонаже - как в мейнквестовом теперь.
--23.06 лечение в больничке изменилось.
--Владимир Михайлович Скрябин

seenotchim = room{
    nam = 'Отчим';
	pic = 'pic/otchim/face.jpg';
	hideinv = true;
	enter = function(s,f)
		loca = f;
		if seen('iphone',me()) then
			objekt = otchim;
			s.obj = foto_iphone.obj;
			s.act = foto_iphone.act;
			s.dsc = foto_iphone.dsc;
		end;
	end;
    dsc = function()
	end;
	obj = { 'goback' };
};

function p_otchim()
        local v = person('otchim');
        v.dsc = function(s)
		end;

		v.heart = function(s)-- изменения деятельности сердца в зависимости от многих параметров.
			local HertHP; --если повредили основные хп, то дамаг на сердечную систему не идёт.
			local HertHR; -- дамаг или лечение сердечной системы
			HertHP = 0;
			HertHR = 0;
			--сначала повышательные:
			if v._sost == 'tea' then-- чай с мятой
				HertHR = 10;
			elseif 	(v._sost == 'sleep') and (kv_heart>1) then-- в начале квеста он ничего не регенит.
				HertHR = 1;
			elseif 	v._sost == 'sleepVal' then--
				HertHR = 2;	
			elseif 	v._sost == 'safe' then--
				HertHR = 15;		
			end;
			-- вычисления дамага по хп
			if hr<=0 then HertHP=1;
			elseif hr<=500 then if rnd(3)==1 then HertHP=1; end;
			elseif hr<=1000 then if rnd(4)==1 then HertHP=1; end;
			elseif hr<=2000 then if rnd(10)==1 then HertHP=1; end;
			elseif hr<=3000 then if rnd(20)==1 then HertHP=1; end;
			elseif hr<=4000 then if rnd(40)==1 then HertHP=1; end;
			elseif hr<=5000 then if rnd(50)==1 then HertHP=1; end;
			elseif hr<=7000 then if rnd(100)==1 then HertHP=1; end;
			end;
			-- вычисление дамага на сердце -- это только соло, групповые дамаги обрабатываются в кеше.
			if (HertHP~=0) or (HertHR ~=0) then HertHR = HertHR ;
			elseif v._sost == 'dota' then 	HertHR =-10; --играет в танки
			elseif v._sost == 'porno' then HertHR =-1; --смотрит порно
			elseif v._sost == 'pornoS' then HertHR =-4; --смотрит порно с членами семьи
			elseif v._sost == 'mas' then HertHR =-4; --мастурбирует
			elseif v._sost == 'sex' then HertHR =-1; --здоровый секс
			elseif v._sost == 'konchit' then HertHR =-100; --кончает
			--ещё допишу.
			end;
			if HertHP> 0 then
				if seen(v,here()) then
					p (s1:txt (_('HP -')..tostring(HertHP), 'red', 2));
				end;	
				hp = hp-HertHP;
			end;
			if HertHR> 0 then
				if seen(v,here()) then
					p (s1:txt (_('HR +')..tostring(HertHR), 'blue', 2));
				end;	
				hr = hr+HertHR;
			elseif 	HertHR< 0 then
				if seen(v,here()) then
					p (s1:txt (_('HR ')..tostring(HertHR), 'pink', 2));
				end;	
				hr = hr+HertHR;
			end;
			if (kv_heart==1) and (hr<6000) then --инициализация квеста.
				walk('o_heart_part1');
			end;
		end;
		v._name = 'Отчим';
		v._room = seenotchim;
		v._woman = false;
		v.life = function(s)
			if stoplive >0 then 
				return
				pn '';
			end;	--не обрабатываем лайф в этот такт.
				--будни
				--отчим с 21 до 7 утра спит, в 7 идёт на работу, приходит домой в 15, до 17 сидит в зале смотрит телик, с 17-21 в гараже.
				--работает водителем. так что во время работы не найдём на другой локации.
				--выходные
				--с 21до 7 утра спит, с 7 до 17 смотрит телик, с 17 до 21 в гараже.
			-- poved==2 - в больнице	
			if v._poved==1 then --если стандартное поведение, то
				if (kv_heart>2) and (day % 7 ==0) and (doctors % 2 ==0)then -- понедельник идёт в больницу.
					s.gotoroom(s,'okb','safe');	
				elseif 	(day % 7 ==0) and (doctors % 2 ==1) then --если договорились с доктором, то его будут трахать в больничке
					s.gotoroom(s,'okb','sex');
				elseif ((hour >= 7) and (hour <15)) and (day % 7 <5)  then --работа водителем
					s.gotoroom(s,'allhome','work');	
				end;
				if (hour<7) and (kv_heart<2) then --уходит спать
					s.gotoroom(s,'motherroom','sleep');
				elseif 	hour<2 then	
					if rnd(2)==2 then
						s.gotoroom(s,'toroom','porno');
					else
						s.gotoroom(s,'toroom','pornoS');
					end	
				elseif 	(hour<7) then
					s.gotoroom(s,'motherroom','sleep');
				end;	
				if hour==21 then 
					s.gotoroom(s,'motherroom','sleep');
				end;
				if (hour==22) then
					if (kv_heart<2) then
						s.gotoroom(s,'motherroom','sleep');
					else
						s.gotoroom(s,'kitchen','tea'); -- пьёт чай с мятой
					end;
				end;
				if hour==23 then
					if (kv_heart<1) then
						s.gotoroom(s,'motherroom','sleep');
					else
						s.gotoroom(s,'toroom','dota'); -- играет на компьютере
					end;
				end;	
					
				if (((hour>=15) and (day % 7 <5)) or ((hour>=7) and (day % 7 >4)))  and (hour<17) then 
					s.gotoroom(s,'toroom','tv');
				end;
				if (hour>=17) and (hour<21) then
					s.gotoroom(s,'garag','car');
				end;
			end;	
			
			
			
			if v._partner ~='' then --если персонаж занят с кем-то, значит не стоит обрабатывать дальше.
								-- проверяем сердечко у отчима
				if kv_heart>0 then
					s.heart(s);
				end;
				return
			end;
			-- отчим мастурбирует только в определённых случаях.
			--универсальная картинка, если правильно разложить по папкам, заменит 50% всех стандартных состояний.
			seenotchim.pic = 'pic/otchim/'..where(s).nam..'/'..s._sost..'.jpg';
			--локации
			if s._sost=='work' then 	s.dsc =  ' За рулём {Отчим}. '; end;
			if s._sost=='tv' then 		s.dsc = ' {Отчим } смотрит телевизор. ';	end;
			if s._sost=='car' then 		s.dsc = ' {Отчим } копается в гараже. ';	end;
			if s._sost=='tea' then 		s.dsc = ' {Отчим } пьёт чай. ';	end;
			if s._sost=='dota' then 		s.dsc = ' {Отчим } сидит за компьютером. ';	end;
			if s._sost=='sleep' then 		s.dsc = ' {Отчим } спит. ';	end;
			if s._sost=='sleepVal' then 		s.dsc = ' {Отчим } крепко спит. ';	end;
			if s._sost=='sick' then 		s.dsc = ' {Отчим } выглядит очень больным. ';	end;
			if s._sost=='safe' then 		s.dsc = ' {Отчим } находится под наблюдением. ';	end;
			if s._sost=='porno' then 		s.dsc = ' {Отчим } сидит за компом без наушников. ';	
											s.change(0,0,rnd(2)-1) end;
			if s._sost=='pornoS' then 		s.dsc = ' {Отчим } сидит за компьютером и иногда на меня поглядывает, когда я пошевелюсь. ';	
											s.change(0,0,rnd(3)-1) end;
        			-- проверяем сердечко у отчима
			if kv_heart>0 then
				s.heart(s);
			end;

		end;
		
        return obj(v)
end
--гараж без отчима не используется, так что объекты выхода/входа создадим здесь.
garag.enter = function(s) 
	if exist('otchim', 'garag') then --
		garag.pic = 'pic/otchim/garag/otkrit.jpg';
	else
		garag.pic = 'pic/otchim/garag/zakrit.jpg';
	end;
end;


--обязательная инициализация каждого персонажа
otchim = new('p_otchim()')
lifeon (otchim)