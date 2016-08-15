if not MENU_HOOKS then -- like module

local days = {_('понедельник'), _('вторник'), _('среда'), _('четверг'), _('пятница'), _('суббота'), _('воскресенье')}

inventory = obj {
	nam = true;
	system_type = true;
	make_menu = function(s, t)
		local k,v
		for k,v in ipairs(objs(s)) do
			v.menu_type = t
			for r,w in ipairs(objs(v)) do
				w.menu_type = t
			end
		end
	end
}


dnevnik = room {
	pic = 'pic/items/dnevnik.jpg';
	nam = _('Дневник');
	hideinv = true; 
	act = function()
		
		back();
	end,
	_zapisi = ' пока пусто.  ';
	dsc = function(s)
		s._zapisi = '';
		if seen('fotokamera',me()) then
			s._zapisi = s._zapisi..'^ Откровенных фото мамы: '..ma._fotki
			..'^Откровенных фото Ани: '..anna._fotki
			..'^Откровенных фото Светы: '..sveta._fotki;
		end;
		
		if not seen('iphone',me()) then
			s._zapisi = s._zapisi..'^Нужно достать мобилу, без мобилы даже в ясли не ходят.';
		end;	
		if not seen('minikamera',me()) then
			s._zapisi = s._zapisi..'^Я видел миникамеру в магазине, но стоит дофига, может как-то её стырить?';
		end;
		if not seen('fotokamera',me()) then
			s._zapisi = s._zapisi..'^Мама обещала мне фотокамеру на день рождения.';
		end;
		if kv_heart==0 then
			s._zapisi = s._zapisi..'^Мне нужно готовиться к школе, делать рефераты и читать книги, мне очень поможет нано-комп.';
		elseif kv_heart==1 then
			s._zapisi = s._zapisi..'^Отчиму понравился компьютер, он сказал чтобы я в 11 вечера комп не трогал.';	
		elseif kv_heart==2 then
			s._zapisi = s._zapisi..'^Мне нужно навестить отчима в больничке.';		
		elseif kv_heart==3 then
			s._zapisi = s._zapisi..'^Хм.. у отчима слабое сердце, а денег у него много. Может быть мне этим воспользоваться? Мне нужны помощники.';	
		elseif kv_heart==4 then
			--s._zapisi = s._zapisi..'^Света это хорошо, но мало.';			
		end;	
		if not seen('juk',me()) then
			s._zapisi = s._zapisi..'^Жучки помогли бы мне снимать показания тела сестёр.';
		end;
		if seen('playgirl',me()) then
			s._zapisi = s._zapisi..'^Так, журнал я купил, нужно его положить туда, где Аня его обязательно посмотрит.';
		end;
		if a_sigar==1 then
			s._zapisi = s._zapisi..'^Аня курит по ночам, я слышал что барыга продаёт особенные сигареты.';
		end;
		return _(s._zapisi)
	end;
obj = {
	vobj('continue', _('{Закрыть дневник}')),
	},
}
go_dnevnik = obj{ 
    nam = 'Дневник';
	dsc = '{дневник} ';
    inv = function()
		if here()~=dnevnik then
			walk('dnevnik');
			else
			pn (_('Дневник уже открыт'));
		end;
    end;
}

status = stat { -- stat -- объект "статус"

        nam = 'статус';

	disp = function(s)
	sleep(0,0,1);
	display_minutes = '';

	-- будем выводить минуты с 0, если их меньше 10
	if minutT < 9
	then
		display_minutes = '0' .. tostring(minutT);
	else
		display_minutes = tostring(minutT);
	end
		p (_('Время: '),cat(tostring(hour),':',display_minutes,' ',tostring(day+1),_('д '),tostring(month+1),_('м '),tostring(year),_('г')));
		pn(' ', days[(day % 7)+1]);

		pn (_('Деньги: '),gold);
	end
};
take(status)
take(go_dnevnik)

stead.module_init(function()
	take(inventory);
	inv = function()
		return objs(inventory);
	end

end)

MENU_HOOKS = true
end
