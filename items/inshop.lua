--это итемы, которые можно купить в магазине, отдельно на каждый итем делать файл - не вижу смысла.
--v0.1 создан 02.09.2015 --v0.2 11.09.2015 --v0.3 29.10.2015

bedroomdoorbedroom = obj{ --создали вход с дверью
    nam = 'В спальню';
    dsc = function(s)
		pn(_(' {Дверь} ведущая в спальню к сёстрам.'));
	end;
};
objs(bedroomdoor):add(bedroomdoorbedroom) --добавили в подход к двери

bedroomdoor.enter = function() --меняем функцию при подходе к двери в спальню
		if seen(live('anya'),'bedroomdoor') then --если аня тут, значит дверь открыта нараспашку.
			bedroomdoorbedroom.act =  function()
				walk('bedroom');
			end;
		else
			bedroomdoorbedroom.act = function()
				pn 'Заперта';
			end;
			if seen(live('sveta'),'bedroom') then
				pn (_('За дверью слышны шорохи'));
			elseif 	seen(live('anya'),'bedroom') then
				pn (_('Кто-то там ходит'));
			elseif 	seen(ma,'bedroom') then
				pn (_('Я слышу как кто-то там возится.'));	
			else
				pn (_('Тихо. Там никого нет?'))
			end;	
		end;	
	end;
seen_minikamera = room {
	pic = 'pic/items/minikamera.jpg';
	nam = (_('Миникамера'));
	
	hideinv = true; 
	act = function()
		back();
	end,
	dsc = function()
		pn (_(' Очень маленькая камера, которую можно просунуть в любую щель.'))
	end,
obj = {
	vobj('continue', _('{Вернуться}')),
	},
}
	
minikamera = obj{ --мини видеокамера, из двух предметов тонкий маленький объектив и приёмник - небольшой планшет с приёмом видео с объектива
    nam = 'minikamera';
	disp = _('Миникамера');
	sto = 1000000; --цена
	dsc = function(s)
		pn(_('Купить {Миникамера}. -  '),s.sto,'g');
		pn (_(' (Описание: эта камера просто необходима сантехникам, чтобы увидеть засор!'));
		pn (_(' Зубному врачу тоже пригодится, а уж проктолог будет на седьмом небе от счастья!)'));
	end;
        inv = function(s)
              if here()~=seen_minikamera then
				walk('seen_minikamera');
			end;
        end;
        act = function(s)
			if gold>=s.sto then
				pn ('Вы купили ',s.nam,'.');
				gold = gold-s.sto;
                take(s);
						else
				pn (_('Не хватает денег'));
			end;	
        end;
		use = function(s, w)
				if w == bedroomdoorbedroom then
					pn (_('Я заглянул в спальню через скважину.'));
					hidding = 1;
					walk(bedroom);
				elseif w==kv_bath then
					pn (_('Я приставил к щели миникамеру'));
					hidding = 1;
					walk('bath');
				elseif w==homemotherroom then
					pn (_('Я приставил к щели миникамеру'));
					hidding = 1;
					walk('motherroom');	
				elseif w==homekitchen then
					pn (_('Я приставил к щели миникамеру'));
					hidding = 1;
					walk('kitchen');
				elseif w==hometoroom then
					pn (_('Я приставил к щели миникамеру'));
					hidding = 1;
					walk('toroom');	
				
				else	
					pn (_('Так не работает.'));		return false
				end;				
			
		end
};
seen_fotokamera = room {
	pic = 'pic/items/fotokamera.jpg'; --подобрать фотку
	nam = (_('Фотокамера'));
	hideinv = true; 
	act = function()
		back();
	end,
	dsc = function()
		pn (_(' матрица 18.7 GП (3MPGS-C)! съемка видео Full 7DHD'))
	end,
obj = {
	vobj('continue', _('{Вернуться}')),
	},
}

fotoroom = room {
	pic = 'pic/items/fotokamera.jpg'; --подобрать фотку
	nam='fotoroom';
	disp = (_('Фотокамера'));
	hideinv = true; 
	act = function(s,w)
		if w=='back' then
			walk(loca);
		else
			ss = ss+1;
			--pn (ss..' '..'pic/items/foto/'..objekt.nam..'/'..loca.nam..'.txt')
			if ss==2 then
				ff = stead.io.open('pic/items/foto/'..objekt.nam..'/'..loca.nam..'.txt',"r");
			end;
			
			if fileexist(s,'pic/items/foto/'..objekt.nam..'/'..loca.nam..ss..'.jpg')==1 then
				if ff==nil then
					pn (_('- '..objekt._name..', давай ещё фотку.'));	
				end;	
				if objekt._razvr<ss  then
					pn (_('- Нет, достаточно.'));
					remarka(_('Нужен разврат повыше.'));
					walk(loca);
				elseif where(objekt)~=loca then
					pn (_('- Нет, мне пора.'));
					remarka(_('модель покинула комнату.'));
					walk(loca);
				else
						objekt.change(0,0,1);
						if ff~=nil then
								s.dsc =ff:lines()
								if s.dsc==nil then
									s.dsc = _('- Хорошо. - '..objekt._name..' приняла подобающую позу.');
								end
							else
								s.dsc = _('- Хорошо. - '..objekt._name..' приняла подобающую позу.');
						end	
						
						
						walk(s)
				end	
			else
					pn (_('- Больше не буду, это слишком.'));
					remarka(_('это полная сессия.'));
					walk(loca);
			end			
		end;	
	end,
	dsc = function()
		pn (_(' матрица 18.7 GП (3MPGS-C)! съемка видео Full 7DHD'))
	end,
obj = {
		vobj('back', _('{Вернуться}')),
		vobj('continue', _('^{Сделать} ещё фото')),
	},
}
fotokamera = obj{ --небольшая фотокамера
    nam = 'Фотокамера';
	--raz = 10; --на сколько увеличивают развратность
	sto = 2; --цена
	dsc = function(s)
		pn(_('Купить {Фотокамера}. -  '),s.sto,'g');
		pn (_(' (Описание: матрица 18.7 GП (3MPGS-C)! съемка видео Full 7DHD'));
	end;
        inv = function(s)
               if here()~=seen_fotokamera then
				walk('seen_fotokamera');
			end;
        end;
        act = function(s)
			if gold>=s.sto then
				pn (_('Вы купили '),s.nam,'.');
				gold = gold-s.sto;
                take(s);
						else
				pn (_('Не хватает денег'));
			end;	
        end;
		use = function(s, w)
				if w==anna then
					if kv_heart<5 then
						pn (_(' Отстань со своей зеркалкой.'));
					else
						if fileexist(fotoroom,'pic/items/foto/'..w.nam..'/'..where(w).nam..'1.jpg')==1 then
							fotoroom.dsc = _('- '..w._name..', давай я тебя немного пофоткаю? ^- Ну давай.');
							ss= 1;
							objekt =w;
							loca=where(w);
							walk('fotoroom');
						else
							pn (w._name,_(' неплохо получилась'));
						end	
					end	
				elseif w._woman  then
					
					if fileexist(fotoroom,'pic/items/foto/'..w.nam..'/'..where(w).nam..'1.jpg')==1 then
						fotoroom.dsc = _('- '..w._name..', давай я тебя немного пофоткаю? ^- Ну давай.');
						ss= 1;
						objekt =w;
						loca=where(w);
						walk('fotoroom');
					else
						pn (w._name,_(' неплохо получилась'));
					end	
				elseif w==live('sveta') then
					pn (_('Я щёлкнул Свету'));
				else	
					pn (_('Неплохая фотка получилась.'));		return false
				end;				
		end
};
playgirl = obj{ 
	nam = 'playgirl';
    disp = (_('PlayGirl'));
	sto = 50; --цена
	dsc = function(s)
		if seen(s,'supermarket') then
			pn(_('Купить {PlayGirl}. -  '),s.sto,'g');
		else
			pn(_(' На тумбочке лежит PlayGirl. '));
		end	
	end;
        act = function(s)
			if seen(s,'supermarket') then
				if gold>=s.sto then
					pn (_('Вы купили '),s.nam,'.');
					gold = gold-s.sto;
					take(s);
							else
					pn (_('Не хватает денег'));
				end;
			else
				pn (_(' Журнальчик. '))
			end;	
        end;
	use = function(s, w)
		if w==bedroomdoorbedroom  then
			if (not seen(anna,'bedroom')) and (not seen(sveta,'bedroom')) then
				pn (_(' Я подкинул журнал в комнату к сёстрам'))
				move(s,bedroom,where(s));
			else
				pn (_(' Я не могу войти в комнату пока там девченки'));
			end;	
		else	
			pn (_(' Так не выйдет. '));		return false
		end;				
	end	
};
komputer = obj{ --стационарный компьютер
    nam = 'Компьютер';
	sto = 4; --цена
	dsc = function(s)
		if seen(s,'supermarket') then
			pn(_('Купить {Компьютер}. -  '),s.sto,'g');
			pn (_(' (Описание: Процессор интел, 64 ядра, 1Ггц, 120gb MSD 2gb SSD 4tb QDR6 GT440'));
		else
			pn(_(' В другом углу на маленьком столике ютится {нано-комп}..'));
		end	
	end;
        act = function(s)
			if seen(s,'supermarket') then
				if gold>=s.sto then
					pn (_('Вы купили '),s.nam,'.');
					gold = gold-s.sto;
					move(s,toroom, where(s));
							else
					pn (_('Не хватает денег'));
				end;
			else
				if 	seen(live('otchim'),'toroom') and (kv_heart==0) then
					walk('start_o_heart');
				else	
					pn (_(' Я поскачивал рефераты, посмотрел ролики доты.'))
					sleep(0,0,30);
				end;
			end;	
        end;
		
};

seen_juk = room {
	pic = 'pic/items/juk1.jpg';
	nam = _('Жучок');
	hideinv = true; 
	act = function()
		back();
	end,
	dsc = function()
		pn (_(' Это генератор жучков с искуственным ИИ, которые цепляются за одежду и прячутся в складках.'))
	end,
obj = {
	vobj('continue', _('{Вернуться}')),
	},
}

juk = obj{ --жучок, датчик, индикатор
	nam = 'juk';
    disp = _('Жучок');
	sto = 1000000; --цена
	dsc = function(s)
		if seen(s,'supermarket') then
			pn(_('Купить генератор {Жучков}. - за каждый выстрел - '),s.sto,'g');
			pn (_(' (Описание: Вы хотите знать, чего желает ваш питомец? Может он хочет случки? Или не доволен хозяином?'));
			pn (_(' Датчик состояния питомца просто необходим вашему пёсику или кошечке!)'));
		else
			--s.dsc = _(' {ж} ');
		end;	
	end;
        inv = function(s)
            if here()~=seen_juk then
				walk('seen_juk');
			end;
        end;
        act = function(s)
			if seen(s,'supermarket') then
				if gold>=s.sto then
					pn ('Вы купили ',s.nam,'.');
					gold = gold-s.sto;
					take(s);
				else
					pn (_('Не хватает денег'));
				end;
			else
				here().dsc();
				--pn ('Вы настроили приёмник на датчик, если не отключаться, то вы можете проследить за этим персонажем. (нажимать Enter)');
				--take(s);
			end;		
        end;
		use = function(s, w)
			--теперь жуки бесплатно выстреливают
				p (_('Я выстреливаю жучок ' ));
				if w == live('anya') then
					pn (_('в Аню.'));
					move(s,seenanya, me());
					
				elseif w == live('ma') then
					pn (_('в маму.'));
					move(s,seenma, me());
				elseif w == live('sanya') then
					pn (_('в Саню.'));
					move(s,seensanya, me());
				elseif w == live('otchim') then
					pn (_('в Отчима.'));
					move(s,seenotchim, me());
				elseif w == live('sveta') then
					pn (_('в Свету.'));
					move(s,seensveta, me());		
				else
					pn (_('... и жучок не цепляется.'));		return false
				end;				
			objs(me()):add(s) --бесконечные жуки
	
		end
};
objs(supermarket):add(juk)

objs(supermarket):add(komputer)
objs(supermarket):add(minikamera)
--objs(supermarket):add(confrazvr) --продаются в супермаркете
