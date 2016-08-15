--барыга у дк
--v0.1 создан 13.09.2015 v0.2 07.12.2015 добафлены фото с айфона.
global {bank_vozb = 0;}

bariga = room {
	nam = 'bariga';
	disp = (_('Барыга'));
	pic = 'pic/me/dktorg.jpg';
	---hideinv = true;
	enter = function(s)
		pn '-Псс, псс, подь сюды, смотри какой красивый телефончег.'
	end;
	dsc = function(s)
		p [[ Мутный поцанчег, который смотрит на тебя через призму йоба-очков.]];
	end;
}
barigadk = obj{
    nam = 'переход';
    dsc = ' {Отойти} от барыги. ';
    act = function()
		walk('dk');
    end;
};
barigatalk = obj{
    nam = 'разговор';
    dsc = ' {Поговорить} с барыгой. ';
    act = function()
		if seen('sigar','bariga') then
			pn (_(' - Говорят у тебя есть сигаретки особые?'));
			pn (_(' - Есть, прекрасные палочки для сосания, внутри вместе с табаком афродизиак, который возбуждает. Но цена на них кусается.'));
		elseif seen('iphone','bariga')	then
		pn '-Что за пластинка?';
		pn '-Айфон, но не смотри на то что у всех уже модели новее, на эту хорошо поставилась программка, при помощи которой ты можешь срубить бабла! ';
		pn '-Нука нука, что за программка? МММ2050 ? Я не хочу звонить голосом Мавроди!';
		p '-Не, тут всё чисто, чисто нелегально. Я что, дурак, законные приблуды типа МММ предлагать? Это утилитка для сбора возбуждения.';
		p ' Наводишь инфракрасник на возбуждённую тёлку, у неё течка прекращается, а приложение заряжается возбуждением, ты приходишь на дк, передаёшь на меня возбуждение (у меня всегда на приём включен) и на твой счет ';
		pn ' получаешь бабло, по 2 монеты за 1 деление, но учти, айфон старый. потому теряется 75% при передаче.';
		pn '- Во как, ну ладно, подумаю.'
		else
			pn (_('- Забыл как получить бабки за возбуждение? Активируй айфон на мне, он соединится с моим и бабки поступят к тебе на счёт.'));
		end;
		
    end;
};
dkbariga = obj{
    nam = 'переход';
    dsc = ' У угла дк крутится {тип} с самодельными видео-очками. ';
    act = function()
		walk('bariga');
    end;
};
objs(bariga):add(barigadk)
objs(bariga):add(barigatalk)
objs(dk):add(dkbariga)

dk.enter = function() --меняем функцию при входе в дк
	if hour>12 then dkbariga:enable() else dkbariga:disable() end;
end;
seen_iphone = room {
	pic = 'pic/items/iphone10s.jpg';
	nam = 'seen_iphone';
	disp = _('Айфон');
	
	hideinv = true; 
	act = function()
		back();
	end,
	dsc = function()
		pn (_(' Старенькая дешёвая мобила.'));
		pn (_(' Накопленный заряд: '..bank_vozb));
		if seen('juk',ma._room) then
			pn (_(' Мама в локации ')..where(ma).disp );
		end;	
		if seen('juk',anna._room) then
			pn (_(' Аня в локации ')..where(anna).disp );
		end;	
		if seen('juk',sveta._room) then
			pn (_(' Света в локации ')..where(sveta).disp );
		end;	
		if seen('juk',otchim._room) then
			pn (_(' Отчим в локации ')..where(otchim).disp );
		end;	
	end,
obj = {
	vobj('continue', '{Вернуться}'),
	},
}

foto_iphone = room {
	pic = function (s)
		return objekt._room.pic..';'..'pic/items/iphone/foto.png';
	end;
	nam = 'Айфон';
	hideinv = true; 
	act = function(s,w)
		if w=='bak' then
			back();
		elseif w=='takevozb' then
			bank_vozb = bank_vozb+objekt._vozb;
			p '^Я забираю всё возбуждение в айфон. ';
			pn ('+'..objekt._vozb);
			if objekt ==live('sveta') then
				if objekt._oper ==1 then
					if gold>=(objekt._vozb/2)/2 then
						pn (_('Cвета получает '..(math.modf((objekt._vozb/2)/2))..' монет'));
						objekt._gold = objekt._gold+math.modf((objekt._vozb/2)/2);
						gold=gold-(objekt._vozb/2)/2;
					else
						pn 'Не хватает денег заплатить Светке';
					end;
				end;
			end;	
			objekt._vozb = 0;
			stead.need_scene();
			
		elseif w=='foto' then
			if (objekt._sost =='mas') then
				if objekt._fotki<0 then objekt._fotki=0; end; 
					objekt._fotki = objekt._fotki+1;
					bank_vozb = bank_vozb+objekt._vozb;
					p '^Я делаю интересную фотку и забираю всё возбуждение. ';
					pn ('+'..objekt._vozb);
					objekt._vozb = 0;
			elseif 	objekt._sost =='sleep' then
				pn (_('фото спящего'));
			else
				pn (_('Обычная фотка'));
			end;	
		end;
		
	end,
	dsc = function()
		if not seen('near','foto_iphone') then 
					objs(foto_iphone):add(near) ;
				end;
		if seen('juk',objekt._room) then
			objekt.status();
			
		else
			pn (_('надо бы повесить датчик, чтобы видеть состояние'));
		end;
	end;
obj = {
	vobj('bak', _('{^Вернуться}')),
	vobj('takevozb', _('^{Забрать возбуждение}')),
	vobj('foto', _('^{Сфотографировать}')),
	--near,
	},
}

iphone = obj{ --айфон
    nam = 'iphone';
	disp = ('iphone10s');
	sto = 500; --цена
	dsc = function(s)
		if seen(s,'bariga') then
			pn('Купить {Мобилку}. -  ',s.sto,'g');
			pn (' (Описание: старый айфончик, 10й, немного потрёпаный, но ещё живой.)');
		else
			s.dsc = 'В кармане {айфон}.';
		end;	
	end;
        inv = function(s)
               if here()~=seen_iphone then
				walk('seen_iphone');
				end;
        end;
        act = function(s)
			if seen(s,'bariga') then
				if gold>=s.sto then
					pn ('Вы купили ',s.nam,'.');
					gold = gold-s.sto;
					take(s);
				else
					pn 'Не хватает денег';
				end;
			else
				pn ('Вы забрали обратно ',s.nam,'.');
				take(s);
			end;		
        end;
		use = function(s, w)
				if live(w) then
					objekt = w;
				--	foto_iphone.pic =w._room.pic..';'..'pic/items/iphone/foto.png';
					walk(foto_iphone);
				elseif w==dkbariga then
					gold = gold+math.modf(bank_vozb/2);
					bank_vozb = 0;
				else	
					pn ('Так не работает.');		return false
				end;				
			
		end
};
objs(bariga):add(iphone)

