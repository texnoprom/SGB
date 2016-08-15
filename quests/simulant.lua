--Квест про симуляцию болезни, активируется при наличии мамы-уборщицы в комнате сына.
--входные параметры  - развратность матери больше 10.
--v0.1 создан 15.09.2015
dlgsimulant = dlg {
	nam = 'В Сашкиной комнате';
	dsc = ' ';
 	enter = function (s) --инициализация при входе
	    if sch_bath ==day then
			s:poff(2);
			s:pon(3);
			else
			s:poff(3);
		end;	
		s.pic = 'pic/ma/bath/bath1.jpg'
	end;
	phr = {
	    { 1,always = false, 'Да у тебя же тут темень.', 'Угу'};
	   
		
	};
};


roomsimulant = room{
    nam = 'комната сашки';
	--pic = 'pic/ma/bath/bath1.jpg';
	enter = function (s) --инициализация при входе
	
		end;	
	end;

	obj = { vway('закончить', '{закончить}', 'sanyaroom') };
};

function kv_simulant()
        local v = kvest('kvsimulant');
        
        v.dsc = function()
			pn(' {Посмотреть} порнофильмы');
		end;
		v.act = function(s)
		pn '-Давай посмотрим?';
		if hour<16 then
			 walk('roomsimulant');
			else
			pn '-Нет, скоро родители придут';
		end;		
		end;
        return obj(v)
end

--objs(sanyaroom):add(homemain) --выход на улицу, квартира сашки скрыта, без него в неё не попасть.
--objs(toroom):add(new('kv_simulant()')) --так квест будет сохраняться