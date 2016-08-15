-- персонаж мать. создан 01.08.2015


seenma = room{
    nam = 'Мать';
	pic = 'pic/ma/razvr/1.jpg';
	hideinv = true;
	enter = function(s,f)
		loca = f;
		if s.pic == 'pic/ma/motherroom/sex2.gif' then
			ss= sound.load('mus/mapa.ogg');
			sound.play(ss, 1, 0);
		end;
		if seen('iphone',me()) then
			objekt = ma;
			s.obj = foto_iphone.obj;
			s.act = foto_iphone.act;
			s.dsc = foto_iphone.dsc;
		end;
	end;
    dsc = function()
		
	end;
	exit = function(s, t)
		if sound.playing(1) then 
			sound.stop();
		end
	end;
	obj = { 'goback' };
};

function p_ma()
        local v = person('ma');
        
        v.dsc = function(s)
		--		
		end;

		v._room = seenma;
		v._name = 'Мама';
		v._rel = 2;
		v.change = stead.hook(v.change, function(f, s, ...)
                if v._rel>1 then --если прошли квест с фимозом, включается набор разврата матери
					return f(s, ...)
				else
					v._vozb = 0; --обнуляем возбуждение матери, чтобы она не кончала вечно.
				end;	
        end)
		v.life = function(s)
			if stoplive >0 then 
				return
				pn '';
			end;
				--где же ходит-бродит мама
				--будни
				--с 21 часа до 6 утра мать спит в 7 идёт в ванну в 8 на кухню с 9 до 16 работает. 
				--в 16 приходит домой,в зал. для квеста с приставкой.
				--в 17 идёт в ванну. 18-21 на кухне
				--выходные
				--с 21 до 7 утра спит, 8 в ванну, 9-12 на кухню, в 12 часов делает уборку в своей спальне, в 13 в спальне сестёр, 
				--14-17 на кухне, в 17 убирается в зале в 18 в ванну, 19-21 отдыхает, смотрит телевизор в зале.		
			if (day % 7 <5) then
				if (hour==21) then --в 21 могут заниматься сексом
					s.gotoroom(s,'motherroom','sleep');
				elseif (hour>=22) or (hour<7) then --в это время она точно хочет спать
					s.gotoroom(s,'motherroom','sleep','sex');	
				elseif hour==9 then	
					s.gotoroom(s,'motherroom','odev','sleep');
				elseif (hour >9 ) and (hour <16)  then
					s.gotoroom(s,'kafe','work');
				elseif (hour ==7 ) or (hour ==17)  then
					s.gotoroom(s,'bath','vanna');
				elseif (hour==16)  then 
					s.gotoroom(s,'toroom','tv');
				elseif ((hour>=18) and (hour<21)) or (hour ==8) then 
					s.gotoroom(s,'kitchen','work');
				end;	
			else
				if (hour==21) then 
					s.gotoroom(s,'motherroom','sleep');
				elseif (hour>=22) or (hour<8) then 
					s.gotoroom(s,'motherroom','sleep','sex');	
				elseif (hour ==12 ) then
					s.gotoroom(s,'motherroom','uborka');
				elseif (hour ==8 ) or (hour ==18)  then
					s.gotoroom(s,'bath','vanna');
				elseif (hour ==13)  then
					s.gotoroom(s,'bedroom','uborka');
				elseif (hour==19) or (hour==20) or (hour==17) then 
					s.gotoroom(s,'toroom','uborka');
				elseif ((hour>=9) and (hour<12)) or ((hour>=14) and (hour<17))  then 
					s.gotoroom(s,'kitchen','work');
				end;	
			end;	
			if seen(s, 'motherroom') then
				if hour==12 then --день, делает уборку
					if s._sost=='uborka' then
						s.dsc = '{Мама} в наушниках убирается, меня не замечает.';
						seenma.pic = 'pic/ma/motherroom/uborka.jpg';
					end;
				elseif hour==21 then
					if live('otchim')._vozb>40 then --отчим трахает мать, вне зависимости от её желания.
						s._sost='sex';
						if 	(s._vozb<=40)  then
							s.dsc = '{Мамка} лежит под ним.';
							seenma.pic = 'pic/ma/motherroom/sex1.jpg';
							s._vozb = s._vozb+1;
						elseif s._vozb<100 then
							s.dsc = '{Мамка} сидит на нём.';
							seenma.pic = 'pic/ma/motherroom/sex2.gif';
							s._vozb = s._vozb+1;
						else --кончает
							s.dsc = '{Мать} крича, содрогается в оргазме.';
							seenma.pic = 'pic/ma/motherroom/sex1.jpg';
							s.change(1,0,0-s._vozb); --c отчимом будет повышать развратность.
							s._sost='sleep';
						end;
					elseif (s._vozb>40) and (s._vozb<100) then --если мать возбуждена, и хочет самоудовлетвориться.
						--здесь можно прописать ветку зависящую от развратности и возбуждения, плюс при высокой развратности 
							--и обязательно высокой дружбе можно было бы присоединиться.
							s.dsc = '{Мама} мастурбирует';
							s._sost='mas';							
							seenma.pic = 'pic/ma/motherroom/mas1.jpg';
							s._vozb = s._vozb+1;
					else
						if s._vozb>100 then
							s.dsc = '{Мать} зажав во рту простыню содрогается в оргазме.';
							seenma.pic = 'pic/ma/motherroom/mas1.jpg';
							s.change(0,0,0-s._vozb);
							s._sost='sleep';
						else
							if s._sost=='sleep' then
								s.dsc = '{Мама} спит';
								if s._razvr<100 then
									seenma.pic = 'pic/ma/motherroom/sleep'..math.modf((s._razvr/10)+1)..'.jpg'
									else --Здесь потом будет картинка без трусов.
									seenma.pic = 'pic/ma/motherroom/sleep'..rnd(11)..'.jpg'
								end;
							elseif 	s._sost=='sex' then
								s.dsc = '{Мама} смотрит на засыпающего отца';
								seenma.pic = 'pic/ma/motherroom/after_sex.jpg';
								s._sost='sleep';
							end;		
						end;
					end;	
				elseif hour==9 then
					--собирается на работу.
					s.dsc = '{Мама} собирается на работу'; 
					seenma.pic = 'pic/ma/motherroom/beforework.jpg';
				else
					if s._sost=='sleep' then
								s.dsc = '{Мама} спит';
								if s._razvr<100 then
									seenma.pic = 'pic/ma/motherroom/sleep'..math.modf((s._razvr/10)+1)..'.jpg'
									else --Здесь потом будет картинка без трусов.
									seenma.pic = 'pic/ma/motherroom/sleep'..rnd(11)..'.jpg'
								end;
							end;	
				end;

			end;		
			if seen(s, 'bath') then
				if here()==vanna then pn 'я слышу голос мамы из ванной'; end;
				 
				if minutT<22 then
					s.dsc = '{Мама} готовится принять ванну';
					seenma.pic = 'pic/ma/bath/'..math.modf((minutT/3)+1)..'.jpg';
					s._sost = 'bvanna';
				else
					if s._vozb<40 then
						s.dsc = '{Мама} принимает ванну';
						seenma.pic = 'pic/ma/bath/9.jpg';
						s._sost= 'vanna';
					elseif s._vozb<60 then
						s.change(0,0,1);
						s.dsc = '{Мама} играет со своими сосками';
						seenma.pic = 'pic/ma/bath/mas1.jpg';
						s._sost= 'mas';
					elseif s._vozb<80 then
						s.change(0,0,2);
						s.dsc = '{Мама} играет с киской';
						seenma.pic = 'pic/ma/bath/mas2.jpg';
						s._sost= 'mas';	
					elseif s._vozb<100 then
						s.change(0,0,3);
						s.dsc = '{Мама} использует обе руки';
						seenma.pic = 'pic/ma/bath/mas3.jpg';
						s._sost= 'mas';		
					else
						if s.seens==2 then
							s.change(0,0,0-100);
						else
							s.change(1,0,0-100);
						end;	
							
						s.dsc = '{Мама} содрогается, вцепившись в край ванны.';
						seenma.pic = 'pic/ma/bath/mas4.jpg';
						s._sost= 'vanna';	
					end;
				end;
			end;
			if seen(s, 'toroom') then
				if hour==17 then --убирается в зале в это время
					s._sost = 'uborka';
					s.dsc = '{Мать} в наушниках возится в комнате с тряпкой, мешается.'; 
					seenma.pic = 'pic/ma/zal/uborka.jpg';
				else
					s._sost = 'tv';
					s.dsc = '{мать} смотрит телевизор'; 
					seenma.pic = 'pic/ma/zal/tv.jpg'
				end;
			end;		
			if seen(s, 'kitchen') then
				s.dsc = '{Мать} готовит';
				if s._razvr<20 then
					seenma.pic = 'pic/ma/kitchen/r1.jpg'
				elseif s._razvr<40 then
					seenma.pic = 'pic/ma/kitchen/r20.jpg'
				elseif s._razvr<60 then
					seenma.pic = 'pic/ma/kitchen/r40.jpg'
				else
					seenma.pic = 'pic/ma/kitchen/r60.jpg'	
				end;
			end;	
			if seen(s, 'kafe') then
				s.dsc = '{Мама} меня заметила.';
				if s._razvr<80 then	
					seenma.pic = 'pic/ma/kafe/'..(math.modf(s._razvr/10)+1)..'.jpg';
				else
					seenma.pic = 'pic/ma/kafe/9.jpg';
				end;	
			end;		
			if seen(s, 'bedroom') then
				s.dsc = 'Дверь приоткрыта, {Мамка} убирается в комнате сестёр.'; 
				seenma.pic = 'pic/ma/bedroom/uborka.jpg';
			end;	
		end;
		
        return obj(v)
end

--обязательная инициализация каждого персонажа
--objs(vanna):add(p_ma());
ma = new('p_ma()')
lifeon (ma);