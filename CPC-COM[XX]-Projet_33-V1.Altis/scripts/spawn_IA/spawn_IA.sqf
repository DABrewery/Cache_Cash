if (MODE_HC or MODE_EDITEUR) then {

// Attente de la cr�ation des marqueurs pour d�signer la zone de mission (est-ce vraiment utile ?)
waitUntil {CPC_MarkersCreated};

// Lancement de l'init de GAIA (pour les param�tres de GAIA)
null = [] execVM "scripts\spawn_IA\InitGaia.sqf";

waituntil {time > 30};

// A compl�ter
private ["_group","_fois"];

_group = createGroup opfor;
_fois = 0;

//D�finition des factions ennemies
switch (paramsArray select 2) do {

	case 0 : { // NATO
		_compo_group = [
			["","",""],
			["","",""],
			["","",""],
			["","","","",""],
			["",""]
		];
		
		_binome = ["",""];
		_large_group = ["","","","",""];
		
		_veh_heavy = ["",""];
		_veh_medium = ["",""];
		_veh_technical = ["",""];
		_veh_truck = ["",""];
		_veh_helico = ["",""];
		_veh_helico_attack = ["",""];
	};
	
	case 1 : { // AAF
		_compo_group = [
			["","",""],
			["","",""],
			["","",""],
			["","","","",""],
			["",""]
		];
		
		_binome = ["",""];
		_large_group = ["","","","",""];
		
		_veh_heavy = ["",""];
		_veh_medium = ["",""];
		_veh_technical = ["",""];
		_veh_truck = ["",""];
		_veh_helico = ["",""];
		_veh_helico_attack = ["",""];
	};

	case 2 : { // CSAT
		_compo_group = [
			["","",""],
			["","",""],
			["","",""],
			["","","","",""],
			["",""]
		];
		
		_binome = ["",""];
		_large_group = ["","","","",""];
		
		_veh_heavy = ["",""];
		_veh_medium = ["",""];
		_veh_technical = ["",""];
		_veh_truck = ["",""];
		_veh_helico = ["",""];
		_veh_helico_attack = ["",""];
	};

	case 100 : { // FIA
		_compo_group = [
			["","",""],
			["","",""],
			["","",""],
			["","","","",""],
			["",""]
		];
		
		_binome = ["",""];
		_large_group = ["","","","",""];
		
		_veh_heavy = ["",""];
		_veh_medium = ["",""];
		_veh_technical = ["",""];
		_veh_truck = ["",""];
		_veh_helico = ["",""];
		_veh_helico_attack = ["",""];
	};
};

// L� on commence vraiment � spawner les IA
// Va surement d�pendre de la mission s�lectionn�e
// Appel de sqf externes








};