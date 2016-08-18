-- персонаж света. создан 06.09.2015
global {deb = 0;
s_zad = 0;	}

seensveta = room{
    nam = 'Света';
	pic = 'pic/sveta/face.jpg';
	hideinv = true;
	enter = function(s,f)
		loca = f;
		if seen('iphone',me()) then
			objekt = sveta;
			s.obj = foto_iphone.obj;
			s.act = foto_iphone.act;
			s.dsc = foto_iphone.dsc;
		end;
	end;
    dsc = function()
		
	end;
	obj = { 'goback' };
};


		
function p_sveta()
        local v = person('sveta');

        v.dsc = function(s)
		end;

		v.status = function()
			pn ('Развращённость: ',v._razvr); 	--для отображения параметров можно установить датчик (датчики будут продаваться в магазине
			pn ('Дружба: ',v._rel);				--радиотехники, их можно будет апгрейдить, для апгрейда нужны особые условия:
			pn ('Возбуждение: ',v._vozb);
			pn ('Деньги: ',v._gold);
			pn ('от. с Аней: ',v._anya);
		end;	
		v._name = 'Света';
		v._room = seensveta;
		--у светы дофига дополнительных параметров, она же ГГ, с огромной вариативностью.
		--возбуждение, которое меняется от просмотра порно, кривляний перед отчимом и т.д. от него зависит игривость поведения.
		v._gold = 100; --деньги Светы, она может приобретать себе новые штуки, когда будет денег достаточно. Список последовательный.
		--беременность и презервативы я решил не делать, с этим оче много заморочек. Она типа сидит на таблетках.
		v._razvr = 19; --временно повысил развращённость.
		v._oper = 0; --этап пластических операций. 1 - когда согласилась зарабатывать возбуждением.
		--вообще отношения с каким-то персонажем - это прямая зависимость на продвижение квестов с этим персонажам.
		v.change = function(razvr,rel,vozb) --переписываем функцию, чисто для светы.
			--при 19 развращённости запустится квест, в котором Света попросит денег, а Коля предложит заработать.
			--суть - Света должна возбуждаться, Коля забирать возбуждение айфоном, выручка пополам.
			--при возбуждении 19 и более она будет в 22 часа приходить в зал, для снятия возбуждения.
			if ((v._razvr ==19) or (v._razvr ==39) or (v._razvr ==59) or (v._razvr ==79) or (v._razvr ==99)) and (razvr>0)  then --переделать.
				if v._gold<2000 then
					v.dsc = _('Свете нужна операция, для повышения развращённости.');
					razvr = 0;
				else
					pn 'Света сделала себе пластическую операцию';
					v._gold = v._gold-2000;
				end;
			end;
			v._razvr = v._razvr+razvr;
			v._rel = v._rel+rel;
			v._vozb = v._vozb+vozb;
			p (v._name,': ');
			if razvr> 0 then
			p (s1:txt ('Р +'..tostring(razvr), 'red', 2));
			end;
			if razvr< 0 then
			p (s1:txt ('Р '..tostring(razvr), 'red', 2));
			end;
			if rel>0 then
			p (s1:txt ('O +'..tostring(rel), 'blue', 2));
			end;
			if rel<0 then
			p (s1:txt ('O '..tostring(rel), 'blue', 2));
			end;
			if vozb>0 then
			p (s1:txt ('В +'..tostring(vozb), 'pink', 2));
			end;
			if vozb<0 then
			p (s1:txt ('В '..tostring(vozb), 'pink', 2));
			end;
			pn ' ';
			
		end;

		v.life = function(s)
			local rand = 0; --число рандома, которым будем переопределять действия светы.
			if stoplive >0 then 
				return
				pn '';
			end;	--не обрабатываем лайф в этот такт.

			-- персонажи теперь будут мастурбировать в случае если никого нет рядом, в определённых локациях
			--изменение состояния лучше накладывать до перехода.
			if (s._vozb>40) and ((s._poved==6) or (s._poved==1)) then
				-- для этих комнат нужно прописать папки для картинок, чтобы они автоматом подтягивались.
				if  (seen(s,'bedroom') or seen(s, 'bedroomdoor') or exist(s, 'bath') or seen(s, 'kitchen') or seen(s, 'toroom') )
					and (not seen(live('otchim'),where(s)) and not seen(live('ma'),where(s)) and not seen(live('anya'),where(s)) and not seen(live('sanya'),where(s)) and (s.seens()>0) and (minut>1))
					--на первой минуте всегда норм поведение, чтобы 
					then
						s._poved=6 -- поведение 6 - акт мастурбации
						if s._vozb<100 then
							s._sost = 'mas';
							s._vozb = s._vozb+1;
						elseif s._razvr>18 then
							s._sost = 'mas';
							s.dsc = '{Света} еле сдерживается, чтобы не кончить.';
							s._vozb = s._vozb+1;
						else
							s._sost = 'konchit';
							s.dsc =  '{Света} кончает';
							s.change(1,0,0-s._vozb);
						end;
					else
						s._poved=1;
					end;	
			elseif s._poved==6 then
				s._poved=1;
			end;	
			
			
			-- У Светы всё время поведение меняется, так что приготовимся к огромному количеству перемещений. (только бы не запутаться)
			-- Стандартное поведение  - в своей комнате с 22 до 8 утра, в 9 идёт в ванну, в 10 на кухню, 
			-- Тут сделаю тестовый пример вольного поведения - с 11 до 15 ошиваясь у школы, играя в футбол с поцанами, а с 
			-- 15 до 17 Света начнёт приставать к отцу, с 17-21 ходить в гараж, помогать. затем в 21 в ванну, 
			-- 22-23 - болтание с Анной (повышает отношение с ней) 0-8 спать.
			-- Как повысит дружеские отношения с Анной или Отчимом до 20, начнёт иногда заигрывать, а тут уже рандом - 
			-- или а/о обижаются и -1 к отношению и разврату, или а/о норм реагируют, тогда +1 к возбуждению Светы и +1 к разврату а/о.
			-- чем выше разврат и отношение, тем меньше рандом, тем удачнее заигрывание.
			-- в школу пойдёт потом, после летних каникул.
				if (v._poved==2 or v._poved==6) and hour==1 then
					v._poved=1; --нефиг ночью ей где-то шляца
				end;	
				if (v._poved==1) or (v._poved==2) then --если 2, значит светку пригласили, и сами сделают 1.
					if v._razvr<19 then
						if ((hour >= 22) or (hour <9)) then --спит
							s.gotoroom(s,'bedroom','sleep');
						end;
					elseif hour <9 then --спит
							s.gotoroom(s,'bedroom','sleep');
					end;
					if (hour==9) or (hour==23) then
						s.gotoroom(s,'bath','vanna');
					end;
					if (hour==10) or (hour==21) then 
						s.gotoroom(s,'kitchen','eat');
					end;
					if (hour>10) and (hour<15) then 
						s.gotoroom(s,'school','walk');
					end;
					if (hour==15) or (hour==16) or ((hour>21) and (v._razvr>=19)) then --при большом разврате будет постоянно зависать в зале до 23 ночи.
						s.gotoroom(s,'toroom','tv');
					end;
					if (hour>=17) and (hour<21) then 
						s.gotoroom(s,'garag','work');
					end;
					
				elseif 	v._poved==3 then --3 - значит аня попросила в 18 часов не мешать, но света обожает подсматривать.
						if (hour==17) or (hour==19) or (hour==20) then 
							s.gotoroom(s,'garag','work');
							if (hour==19) then v._poved=1 end; --типа назначенный час прошёл.
						elseif (hour==18) then
							s.gotoroom(s,'bedroomdoor','mast');
						end;	

				end;	
			
			-- полная переделка причин для выбора, раньше до 06.02.2016 работало на основе комнаты, теперь на основе состояния, комната - всего лишь один из параметров выбора.
			if v._partner ~='' then --если персонаж занят с кем-то, значит не стоит обрабатывать дальше.
				return
			end;	
			--картинка по умолчанию, упрощаем контент.
			fileexist(seensveta,'pic/sveta/'..where(s).nam..'/'..s._sost..'.jpg');			
			--seensveta.pic = 'pic/sveta/'..where(s).nam..'/'..s._sost..'.jpg';
			--описание по умолчанию
			if s._sost=='work' then 	s.dsc =  ' {Света } у машины. '; end;
			if s._sost=='tv' then 		s.dsc = ' {Света } смотрит телевизор. ';	end;
			if s._sost=='car' then 		s.dsc = ' {Света } помогает отчиму. ';	end;
			if s._sost=='tea' then 		s.dsc = ' {Света } пьёт чай. ';	end;
			if s._sost=='mas' then 		s.dsc = ' {Света } мастурбирует. ';	end;
			if s._sost=='konchit' then 		s.dsc = ' {Света } кончает. ';	end;
			if s._sost=='sleep' then 		s.dsc = ' {Света }  спит. ';	end;
			if s._sost=='read' then 		s.dsc = ' {Света }  читает. ';	end;
			if s._sost=='vanna' then 		s.dsc = ' {Света }  моется в ваной. ';	end;
			if s._sost=='eat' then 		s.dsc = ' {Света }  ходит по кухне. ';	end;
			if s._sost=='walk' then 		s.dsc = ' {Света }  гуляет. ';	end;
			
			
			if  seen(s, 'bedroomdoor') then --тут главное проверить, квест это или нет.
				if v._poved==3 then --если мы торчим тут по квесту
					v._sost = 'spy';
					v._vozb = v._vozb+1;
					if s._vozb<10 then
						s.dsc = 'Я осторожно заглянул, вижу кусочек {Светы}, она одела шикарное бельё, для кого?.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/1.jpg';
					elseif 	s._vozb<20 then
						s.dsc = 'Я ещё раз заглянул, вроде {Света} на меня не смотрит, к чему-то прислушивается.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/2.jpg';
					elseif 	s._vozb<30 then
						s.dsc = 'Я расслышал какие-то звуки, которые доносились из спальной, {Света} тоже услышала и схватилась за грудь.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/3.jpg';	
					elseif 	s._vozb<40 then
						s.dsc = '{Света} повернулась, приоткрыла дверь и заглянула, а я смог насладиться видом глубоко врезавшихся трусиков.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/4.jpg';
					elseif 	s._vozb<50 then
						s.dsc = '{Света} прикрыла дверь и спустила ливчик, видимо происходящее за дверьми её возбудило.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/5.jpg';	
					elseif 	s._vozb<60 then
						s.dsc = 'Да {она} же мастурбирует, прямо в холле? А вдруг родители зайдут?.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/6.jpg';
					elseif 	s._vozb<70 then
						s.dsc = '{Света} сидела на полу напротив меня, широко расставив свои стройные ноги, и мастурбировала, засунув два пальца себе во влагалище.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/7.jpg';
					else
						s.dsc = '{Света} издала дикий, но приглушённый стон, заелозила по блестящему полу и..видимо.. закончила.'; 
						seensveta.pic = 'pic/sveta/bedroomdoor/8.jpg';
						s.change(1,0,-71);
					end;		
						
				end;
			end;
			pn ('квест'..s_help..s._sost)
			if (s._sost=='sleep')  or (s._sost=='mas') or ((s._sost=='work') and (s_help >0)) then -- состояния с 4мя случайными картинками.
				fileexist(seensveta,'pic/sveta/'..where(s).nam..'/'..s._sost..rnd(4)..'.jpg');
			--	seensveta.pic = 'pic/sveta/'..where(s).nam..'/'..s._sost..rnd(4)..'.jpg';
			end;		
			
	
			if  exist(s, 'bath') then
				if here()==vanna then pn 'кто-то принимает душ'; end;
			end;
			
			if  seen(s, 'sanyaroom') then
				if s._vozb<10 then
					seensveta.pic = 'pic/sveta/sanyaroom/1.jpg';
				elseif 	s._vozb<30 then
					seensveta.pic = 'pic/sveta/sanyaroom/2.jpg';
				elseif 	s._vozb<50 then
					seensveta.pic = 'pic/sveta/sanyaroom/3.jpg';	
				else
					seensveta.pic = 'pic/sveta/sanyaroom/4.jpg';	
				end;
			end;
			--------вставляем новые
        end;
        return obj(v)
end

--обязательная инициализация каждого персонажа
sveta = new('p_sveta()')
lifeon (sveta)