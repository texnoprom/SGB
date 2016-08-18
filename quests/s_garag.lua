--v0.1 создан 09.07.2016


s_garag = room{
	nam = 'room';
    disp = _('Света');
	hideinv = true;
	pic = function ()
		return seensveta.pic
	end;
	enter = function (s) 

	end;
	act = function(s)
		walk('garag');		

	end,
	dsc = _([[ - Света помогает отчиму
		
	]]),
	obj = { 
		vobj('continue', dalee),};

};
