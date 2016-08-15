-- персонаж саня. создан 25.08.2015


seensanya = room{
    nam = 'Саша';
	pic = 'pic/sanya/sanya1.jpg';
	hideinv = true;
	enter = function(s,f)
		loca = f;
		if seen('iphone',me()) then
			objekt = sanya;
			s.obj = foto_iphone.obj;
			s.act = foto_iphone.act;
			s.dsc = foto_iphone.dsc;
		end;
	end;
    dsc = function()
	end;
   
	obj = { 'goback' };
};

function p_sanya()
        local v = person('sanya');
        
        v.dsc = function(s)
		end;
		v.act = function(s)
			--sanya - вторичный персонаж, потому меньше его картинок
			--здесь будет диалог выбора играть в футбол/пригласить к себе/пойти смотреть порнуху
			walk(seensanya);
		end;
		v._name = 'Саша';
		v._room = seensanya;
		v._woman = false;
		v.life = function(s)
				if v._poved==1 then --если стандартное поведение, то
					if ((hour >= 13) and (hour <17)) and not seen(s, 'school')  then --в это время sanya играет в футбол, если его никуда не приглашали
						move(s,'school',where(s));
						s.dsc = function(s)
						pn '{Саня} играет в футбол.'; 
						end;
					end;
					if (hour>=22) and not seen(s, 'sanyaroom') then --уходит спать
						move(s,'sanyaroom',where(s));
						if s._vozb>100 then
							s.change(1,0,-99);
						end;	
						s.dsc = function(s)
							pn '{Александр} спит.'; 
						end;
						v._poved=1;
					end;	
					if (hour<22) and (hour>=17) and not seen(s, 'rablistovk') then --уходит спать
						move(s,'rablistovk',where(s)); --пусть работает в остальное время
						s.dsc = function(s)
						pn '{Саня} разносит листовки.'; 
						end;
					end;
					
					
				else
					if (hour>22) and not seen(s, 'sanyaroom') then
						pn 'Слышу Сашку: ';
						pn '-Ладно, мне домой пора. ';
						pn 'Он уходит. ';
						move(s,'sanyaroom',where(s));
						v._poved=1;
					end;
				end;
        end;
		
        return obj(v)
end

--обязательная инициализация каждого персонажа
sanya = new('p_sanya()')
lifeon (sanya)