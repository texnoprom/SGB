global { 
krasota = 0;
dominant = 0;
gold = 1000;
minut = 0;
minutT = 0;
hour = 9;
day = 0;
month = 0;
year = 2050;
oldtime = 0;
stoplive = 0; --если >0 то останавливаем лайф на столько тактов.
modelsveta = 0; --для светы будем использовать несколько моделей, для перехода с одной модели на другую - нужно развращённость+деньги.
hidding = 0; --если 0 то просто вошёл в комнату, если 1 - то с миникамерой.
ss= 0; -- счетчик локальный, можно использовать во всех квестах, главное инициилизировать на 0.
dalee = _('^{Далее}'); --чтобы этот текст не мешался везде.
otoyti = _('^{Отойти}'); --чтобы этот текст не мешался везде.
sost = {'sleep','uborka','tv','gotovka','vanna','work','odev','legit','talk','mas','sex','konchit'}; -- список стандартных состояний, в которые могут переходить персонажи.
 };
 global {kv_foto = 1;} --переменная определяющая, на каком этапе находится квест с фотосессией
 global {a_sigar = 0;} --переменная определяющая, на каком этапе находится квест с сигаретами у анны

global {objekt = '';} --текущий объект, на который коля обратил внимание. например objekt==ma
global {loca = 'toroom';} --текущая комната, где мы начали использовать айфон и т.д. короче куда нужно вернуться. 
global {hp = 1000; --количество жизней у отца
hr = 10000; -- сила сердца.
kv_heart = 0; -- мейн ивент с сердцем. 1-start 2-okb 3-do 4-sv 5-an 6-справка 7-ма
s_help = 0; --переменная определяющая, этап помощи от светы
a_help = 0; --переменная определяющая, этап помощи от ани
m_help = 0; --переменная определяющая, этап помощи от мамы
}
global {doctors = 0;} --переменная определяющая, этап отношений отчима с докторами в окб.
--1-10 -- марина, с 11 начинается другой доктор.


--удалить
fotosesia_room = room{
nam = 'удалить';
}

---


 function init()
    s1 = font('fonts/times.ttf', 20); -- шрифт, который будет маштабироваться
	s2 = font('fonts/times.ttf', 10); -- шрифт, для ремарок
	end;	--пример: pn (s1:txt ("Привет, мир!", 'gray', 2)); 
 -- 1: жирный. 2: курсив, 4: подчеркивание, 8: зачеркнуто
-- комбинации:
-- жирный курсив:  3 (1 + 2)
-- подчеркнутый курсив: 6 (2 + 4)

 --функция возврата из любой комнаты (просмотра персонажа)
 goback = obj {
	nam = 'вернуться обратно';
	dsc = function ()
		pn (_(txtc('{вернуться}')));
	end;	
	act = function()
		walk(loca);
		--walkback()
	end;
	};

fileexist = function (room,fpic) -- смысл этой функции в том, что если файла не существует, то картинку мы оставляем прошлую, чтобы не менять на пустоту.
	local h;
--	pn (fpic);
	h = stead.io.open(fpic,"r");
	if h then
		h:close();
		--	pn 'нашли картинку';
		room.pic = fpic;
		return 1;
	else
		return 0;
	end
end;	

	
--функция промотки времени, (день,час,минуты) проматывается время в минутах.
sleep = function(d,h,m)
	local tim  =0;
	tim = d*1440+h*60+m-1; -- -1, вычитаем сам акт перемотки.
	for i=1,tim do--попробуем 60 минут промотать
		game:life();
	end;
	
	--теперь формирование времени полностью в этой функции
	local m=0;
	m = (minut+(time()-oldtime))+tim;
	minutT = m % 60;
	hour = math.modf(m / 60)+hour;
	day =  math.modf(hour / 24)+day;
	month =  math.modf(day / 28) +month;
	year =  math.modf(month / 12) + year;
	minut = minutT;
	hour = hour % 24;
	day = day % 28; --28 дней в месяце
	month  = month % 12;
	oldtime = time();
end;	
	
--переопределяем стандартную функцию вывода
iface.fmt = function(self, cmd, st, moved, r, av, objs, pv) 
-- st -- changed state (main win), move -- loc changed
	local l, vv
	if st then
		av = txtem(av); -- вывод "важных" life 
		pv = txtem(pv); -- вывод обычных life
		r = txtem(r) -- реакция на действие
		if isForcedsc(stead.here()) or NEED_SCENE then
			l = stead.here():scene(); -- статическая часть сцены
		end
	end
	if moved then -- компонуем вывод для случая, 
                      -- когда игрок перешел в новую комнату
		vv = stead.fmt(stead.cat(
                     stead.par(stead.scene_delim, objs,r, l, av,  pv), '^'));
	else -- компонуем вывод, когда игрок не делал перехода
		vv = stead.fmt(stead.cat(
                     stead.par(stead.scene_delim, objs,l, r, av,  pv), '^'));
	end
	return vv
end 

remarka = function(text)
	pn (s2:txt (_(text, 'blue', 4)));
end


 
--опишем здесь класс персонажей
person = function(nam)
        local v = {}
		if nam==nil then
        v.nam = 'человек';
			else
		v.nam=nam;
		end;
		v._room = ''; --ссылка на комнату, которая служит описанием данного персонажа.
		v.act = function(s)
			stoplive = stoplive+2;
			walk(s._room);
		end;
		v._name = 'Человек';
		--v._name = name;

		v._partner = ''; --ссылка на персонажа, с которым болтает, трогает, занимается сексом. если пустое - значит свободен.
		v._dress = ''; -- одежда, в 0.32 не используется, но чтобы была такая переменная, для сейвов.
		v._fotki = 0; --количество развратных фоток, которые есть у коли для этого персонажа.
        v.person = true
		v._gold = 100;
        v._rel = 1			--отношение
		v._razvr = 1 		--развращённость
		v._poved = 1 --поведение, если 1 - то ходит по стандартному маршруту, остальные значения - для вариантов передвижения.
		v._sost = 'work' --состояние. 
		v._vozb = 1 -- возбуждение, развращённость апается через возбудение. если возбуждение высокое, то персонаж что-то делает и поднимает развращённость на 1.
		v._sveta = 1; --отношение с светой
		v._anya = 1; --отношение с аней.
		v._otchim = 1; 
		v._ma = 1;
		v._sanya = 1; --отношения с саней влияют на просмотр порно.
		v._woman = true; -- пол
		v.plati = function(skoka)
			if skoka<gold then
				v._gold = v._gold+skoka;
				gold = gold-skoka;
				return 1;
			else
				pn (_('не хватает денег'));
				return 0;
			end;
		end; 
		-- функция проверяющая персонажа, если в этой локе, то идём в pwhere иначе идём в покинутую локацию, отписав pdsc
		v.here = function(phere,pwhere,pdsc) 
			if seen(v,phere) then
				walk(pwhere)
			else
				walk(phere)
				pn (pdsc)
			end;
		end; 
		v.seens = function(s) --функция определяющая, как коля видит персонажа, скрытно или вообще не видит, или в той же комнате.
			--pn (where(v).nam..' '..here().nam..hidding)
			if ((here()==foto_iphone) or (here()==objekt._room)) and (objekt==v) then --если смотрим при помощи айфона.
				if hidding==1 then return 1; -- возвращаем признак скрытости
				else return 0; -- колю видно
				end;
			elseif here()==where(v)	and hidding==1 then return 1; -- скрытно
			elseif here()==where(v) then return 0; --колю видно
			else 	return 2 ; -- коля вообще в другом месте и не может видеть персонажа.
			end;
				
		end;
		
		v.zastav = function(rel,raz) --функция, принуждения персонажа к чему-либо, rel - граничное значение дружбы, при котором персонаж поддастся на уговоры. при наличии компрометирующих фоток персонаж поддаётся при разврате более raz иначе ответ = 0. Персонаж не поддался на уговоры. При удалении фотки дружба растёт.
			if v._rel>rel then
				v._rel = v._rel-1;
				return 1;
			elseif (v._razvr>raz) and (v._fotki>0) then
				v._fotki = v._fotki-1;
				v._rel = v._rel+1;
				return 1;
			else
				remarka('нужен разврат '..(raz+1)..' или дружба '..(rel+1));
				return 0;
			end;
		end; 
		v.gotoroom = function (s,kuda,sostV,sostIshod) --если есть sostIshod, то персонаж остаётся в той же комнате, но нужно поменять состояние.
					if not seen(s,kuda) then
						move(s,kuda,where(s));
						s._poved = 1; --поведение при смене комнаты меняется на по умолчанию.
						s._sost=sostV;
						--тут же определим выкидывание игрока из просмотра персонажа, если он это делает.
						if ((here()==foto_iphone) or (here()==objekt._room)) and (objekt==s) then --если следим за объектом, а он переместился, то:
							pn (_('Объект покинул зону действия айфона')); --но это не работает, так как мы скрываем инвентарь, а значит и объект не вкурсах про изменения времени.
							back();
						end;	
					end;
					if type(sostIshod) == "string" then
						if s._sost==sostIshod then
							s._sost=sostV;
						end;	
					end;
			if s._poved==1 	and s._sost~=sostV then s._sost=sostV end; --если поведение стабильное, то состояние должно соответствовать состоянию комнаты.
		end;
		
		v.change = function(razvr,rel,vozb)
			v._razvr = v._razvr+razvr;
			v._rel = v._rel+rel;
			v._vozb = v._vozb+vozb;
			if (objekt == v) or (where(v)==here()) then --выводим сообщения о изменениях только при наблюдении за объектом
				p (v._name,': ');
				if razvr> 0 then
				p (s1:txt (_('Р +')..tostring(razvr), 'red', 2));
				end;
				if razvr< 0 then
				p (s1:txt (_('Р ')..tostring(razvr), 'red', 2));
				end;
				if rel>0 then
				p (s1:txt (_('O +')..tostring(rel), 'blue', 2));
				end;
				if rel<0 then
				p (s1:txt (_('O ')..tostring(rel), 'blue', 2));
				end;
				if vozb>0 then
				p (s1:txt (_('В +')..tostring(vozb), 'pink', 2));
				end;
				if vozb<0 then
				p (s1:txt (_('В ')..tostring(vozb), 'pink', 2));
				end;
				pn ' ';
			end;	
			
		end;
				
		v.status = function()
			pn (_('Развращённость: '),v._razvr); 	--для отображения параметров можно установить датчик (датчики будут продаваться в магазине
			pn (_('Дружба: '),v._rel);				--радиотехники, их можно будет апгрейдить, для апгрейда нужны особые условия:
			pn (_('Возбуждение: '),v._vozb);		--деньги, высасываемое возбуждение. Когда персонаж снимает возбуждение - его кол-во всасывается
												--датчиком, для 2го уровня например требуется 100 едениц всосанного возбуждения.
												--датчики высокого уровня позволят впрыскивать накопленные еденицы возбуждения.
												--так же датчики будут отображать в ноутбуке информацию о носителе.
		end;
        v.dsc = function(s)
                p (_('Здесь ошивается {', stead.dispof(s), '}. отношение:'),tostring(s._rel));
		end;
		
		
        return obj(v)
end

--опишем здесь класс квестов
kvest = function(nam)
        local v = {}
		if nam==nil then
        v.nam = 'квест';
			else
		v.nam=nam;
		end;
        v.kvest = true
        v._stat = 0 --статус выполнения
        v.dsc = function(s)
                p ('это квест {', stead.dispof(s), '}. статус:',tostring(s._stat));
		end;
		v.act = function(s)
		 p 'будут срабатывать события';
		end;
        return obj(v)
end


shcoolmain = obj{
    nam = 'переход';
    dsc = _('{Выйти} из парка.');
    act = function()
    walk('main');
    end;
};

mainhome = obj{
    nam = 'переход';
    dsc = _('{Домой}. ');
    act = function()
    walk('home');
    end;
};
mainsupermarket = obj{
    nam = 'переход';
    dsc = _('{В супермаркет}. ');
    act = function()
    walk('supermarket');
    end;
};
maingarag = obj{
    nam = 'переход';
    dsc = _('{К гаражному} массиву. ');
    act = function()
    walk('garag');
    end;
};
mainkafe = obj{
    nam = 'переход';
    dsc = _(' Вдалеке у вокзала виднеется {кафе}. ');
    act = function()
		walk('kafe');
    end;
};
maindk = obj{
    nam = 'переход';
    dsc = _(' Значимое здание в городке, {ДК}. ');
    act = function()
		walk('dk');
    end;
};
mainokb = obj{
    nam = 'переход';
    dsc = _(' Новомодная {больница}. ');
    act = function()
		walk('okb');
    end;
};

----------------------------------сюда добавлять
mainrablistovk = obj{
    nam = 'переход';
    dsc = _(' Могу пойти {разносить} листовки. ');
    act = function()
    walk('rablistovk');
    end;
};
workwork = obj{
    nam = 'работаю';
    dsc = _('{Работаю}. ');
    act = function()
		sleep(0,1,0);
		gold = gold+10;
		walk('rablistovk');
    end;
};
endwork = obj{
    nam = _('окончание работы');
    dsc = _('Пойду {на центральную улицу}. ');
    act = function()
    walk('main');
    end;
};
mainschool = obj{
    nam = 'переход';
    dsc = _('Пойти в {парк}. ');
    act = function()
    walk('school');
    end;
};
hometoroom = obj{
    nam = 'переход';
    dsc = function()
	pn (_(' {В зал}.'));
	end;
    act = function()
    walk('toroom');
    end;
};
homemain = obj{
    nam = 'переход';
    dsc = function()
	pn (_(' {На центральную улицу}.'));
	end;
    act = function()
    walk('main');
    end;
};
toroomhome = obj{
    nam = 'переход';
    dsc = (_(' {Выйти} в коридор.'));
    act = function()
		hidding=0; -- мы вроде только из корридора подсматриваем за всеми.
		walk('home');
    end;
};
sleepformorning = obj{
    nam = 'сон';
    dsc = _(' {Поспать} (6 часов).');
    act = function()
		live('sanya')._poved = 1;
		sleep(0,6,0);
		walk('toroom');
    end;
};
homevanna = obj{
    nam = 'вванну';
    dsc = function()
	pn (_(' {В ванну}.'));
	end;
    act = function()
    walk('vanna');
    end;
};
homebedroom = obj{
    nam = 'переход';
    dsc = function()
	pn (_(' {К спальне сестер}.'));
	end; 
    act = function()
    walk('bedroomdoor');
    end;
};
homekitchen = obj{
    nam = 'переход';
    dsc = function()
	pn (_(' {На кухню}.'));
	end;
    act = function()
    walk('kitchen');
    end;
};
homemotherroom = obj{
    nam = 'переход';
    dsc = function()
	pn (_(' {Спальня родителей}.'));
	end;
    act = function()
		if hour==21 then
			pn (_('Закрыто'));
		else	
			walk('motherroom');
		end;
    end;
};
tv = obj{
    nam = 'телевизор';
    dsc = function()
	pn (_(' На стене висит телевизор, {посмотреть} (1час). '));
	end; 
    act = function()
		p (_('Я посмотрел телевизор.'));
		sleep(0,1,0);
		walk('toroom');
    end;
};
est = obj{
    nam = 'есть';
    dsc = function()
	pn (_(' Можно {перекусить 15м}. '));
	end; 
    act = function()
		p (_('Я перекусил'));
		sleep(0,0,15);
		walk('kitchen');
    end;
};


-- vim:ts=4
