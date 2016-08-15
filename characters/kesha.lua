-- персонаж попугай кеша. создан 25.10.2015
seen_kesha = room{
    nam = 'Кеша';
	pic = 'pic/items/kesha.jpg';
	hideinv = true; 
    dsc = function()
		pn(' Кеша');
	--	live('sveta').status();
	end;
	obj = { 'goback' };
};
function p_kesha()
        local v = person('p_kesha');
        v.dsc = function(s)
		end;
		v.counter = 0; --счетчик, через какое время запускать проверку. Не сохраняется в файле, а зачем?
		v.act = function(s)
		end;
		v.life = function(s)
			s.counter = s.counter+1;
			if stoplive >0 then 
				if stoplive>2 then
					stoplive=2;
				end;	
				stoplive =stoplive-1;
				
			end;
			if here()==foto_iphone then --кеша контролирует, если инвентарь скрыт, то время всё равно будет идти.
				sleep(0,0,1);
			end;	
			local h;
			local hpic;
			
			--кеша контролирует взаимодействия персонажей.
			-- оценивая присутствие персонажей и вещей в комнатах, он выдаёт возможные взаимодействия и картинки связанные с этими вещами
			-- так как параметры персонажей должны меняться и без ГГ, то и все взаимодействия будут происходить одновременно.
			--вначале будем обрабатывать зал.
			-- попробую настроить свету и отчима тут.
			if where(live('otchim'))==where(live('sveta')) and (kv_heart>3) then

				otchim._sost='show';
				hpic = 'pic/join/'..where(live('otchim')).nam..'/os/'..otchim._sost..'1.jpg';
				h = stead.io.open(hpic,"r");
				if h and (rnd(3)==1) then
					otchim._poved = 2;
					sveta._poved = 2;
					otchim.dsc = '';
					otchim._partner= 'sveta';
					
					sveta._partner= 'otchim';
					sveta._sost='talk';
					sveta.dsc = ' {Света } крутится перед отчимом. '
					seensveta.pic = hpic;
					otchim.change(0,0,1);
				else
					if otchim._partner== 'sveta' then
						otchim._poved = 1; --когда вернём поведение к нормальному значению, функция перехода по локациям расставит верные состояния.
						otchim._partner='';
					end	;
					if sveta._partner== 'otchim' then
						sveta._poved = 1;
						sveta._partner= '';
					end;	
				end;
			else
				if otchim._partner== 'sveta' then
					otchim._poved = 1; --когда вернём поведение к нормальному значению, функция перехода по локациям расставит верные состояния.
					otchim._partner='';
				end	;
				if sveta._partner== 'otchim' then
					sveta._poved = 1;
					sveta._partner= '';
				end;	
			end;	
			-- взаимодействие отчима и матери.
			if (where(live('otchim'))==where(live('ma')))  then
				--взаимодействия бывают разные.
				if (where(live('otchim'))~=where(anna)) and (where(live('otchim'))~=where(sveta)) and (otchim._vozb>40) then
					otchim._sost='sex';
				elseif rnd(4)==1 then
					otchim._sost='talk';
				else 
					otchim._sost='no';
				end;	
					
			
				-- otchim._sanya -- так как отношений у отчима с саней не будет, то используем эту переменную для разогрева секса.
				hpic = 'pic/join/'..where(live('otchim')).nam..'/om/'..otchim._sost..'1.jpg';
				h = stead.io.open(hpic,"r");
				if h and (otchim._sost=='sex') then
					otchim._sanya = otchim._sanya+1;
					otchim._poved = 2;
					ma._poved = 2;
					otchim._partner= 'ma';
					
					ma._partner= 'otchim';
					ma.dsc = ' ';
					if ma._vozb<100 then
						ma._vozb = ma._vozb+1;
						ma._sost='sex';
					else
						ma._sost='konchit';
						if ma.seens==2 then -- если 2, то это происходит вне внимания гг
							ma.change(0,0,0-100);
						else
							ma.change(1,0,0-100);
						end;	
					end;	
					
					if (otchim._sanya>10) and (otchim._vozb>100) then
						otchim.dsc = '{Отчим } кончает на грудь маме.';
						seenotchim.pic = 'pic/join/'..where(live('otchim')).nam..'/om/konchit.jpg';
						otchim._sost='konchit';
						if otchim.seens==2 then
							otchim.change(0,0,0-100);
						else
							otchim.change(1,0,0-100);
						end;	
						otchim._sanya = 1;
					else
						otchim.dsc = '{Отчим } трахает мать.';
						otchim._sost='sex';
						seenotchim.pic = hpic;
						otchim._vozb = otchim._vozb+1;
					end
				elseif 	h and (otchim._sost=='talk') then
					otchim._poved = 2;
					ma._poved = 2;
					otchim._partner= 'ma';
					ma._partner= 'otchim';
					ma.dsc = ' ';
					ma._sost='talk';
					seenotchim.pic = hpic;
					otchim.dsc = '{Отчим } и мама разговаривают.'
				else
					if otchim._partner== 'ma' then
						otchim._poved = 1; --когда вернём поведение к нормальному значению, функция перехода по локациям расставит верные состояния.
						otchim._partner=''
					end;	
					if ma._partner=='otchim' then
						ma._poved = 1;
						ma._partner=''
					end;	
				end;
			else
				if otchim._partner== 'ma' then
					otchim._poved = 1; --когда вернём поведение к нормальному значению, функция перехода по локациям расставит верные состояния.
					otchim._partner=''
				end;	
				if ma._partner=='otchim' then
					ma._poved = 1;
					ma._partner=''
				end;	
			end;	
				
			
			
			if s.counter >11 then --каждые 10 минут
				if gold > 100000 then
					seen_kesha.dsc = 'Не надо читерить, плиииззззз.';
					walk('seen_kesha');
					gold = 1;
				end;
				-- здесь пишется код для поддержки старых сейвов, его можно удалять в версии, которая не поддерживает сейвы.
				if m_zal_kv==nil then
					global {m_zal_kv = 1;} 
				end;
				s.counter = 0;	
			end;
        end;
		
        return obj(v)
end

--обязательная инициализация каждого персонажа
kesha = new('p_kesha()')
lifeon (kesha)