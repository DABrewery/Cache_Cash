
// We need tones of variables
[] call STDR_fnc_commonVariables;

// Variables pour les loadouts
playerUnit = _this select 0;	// unité du joueur (sélectionnée dans l'écran des slots)
playerIsJIP = _this select 1;	// boolean (true ou false). True = le joueur se connecte en cours de partie.

waitUntil {!isnil "cc_MarkersCreated"};
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	2) CALL / COMPILE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

switch (CC_p_loaout) do {
	case 0 : {call compile preprocessFileLineNumbers "loadout\loadout_NATO.sqf";};
	case 1 : {call compile preprocessFileLineNumbers "loadout\loadout_CSAT.sqf";};
	case 2 : {call compile preprocessFileLineNumbers "loadout\loadout_AAF.sqf";};
	case 3 : {call compile preprocessFileLineNumbers "loadout\loadout_USArmy.sqf";};
	case 4 : {call compile preprocessFileLineNumbers "loadout\loadout_USMC.sqf";};
	case 5 : {call compile preprocessFileLineNumbers "loadout\loadout_USsf.sqf";};
	case 6 : {call compile preprocessFileLineNumbers "loadout\loadout_RU2000_RHS.sqf";};
	case 7 : {call compile preprocessFileLineNumbers "loadout\loadout_RU2015_RHS.sqf";};
	case 8 : {call compile preprocessFileLineNumbers "loadout\loadout_RUsf.sqf";};
	case 9 : {call compile preprocessFileLineNumbers "loadout\loadout_KSK.sqf";};
	case 10 : {call compile preprocessFileLineNumbers "loadout\loadout_BAF.sqf";};
	case 11 : {call compile preprocessFileLineNumbers "loadout\loadout_RACS.sqf";};
	case 12 : {call compile preprocessFileLineNumbers "loadout\loadout_TAK.sqf";};
	case 13 : {call compile preprocessFileLineNumbers "loadout\loadout_INS2.sqf";};
	case 14 : {call compile preprocessFileLineNumbers "loadout\loadout_TAK_INS.sqf";};
	case 15 : {call compile preprocessFileLineNumbers "loadout\loadout_SAF.sqf";};
	case 16 : {call compile preprocessFileLineNumbers "loadout\loadout_CDF.sqf";};
	case 17 : {call compile preprocessFileLineNumbers "loadout\loadout_PMC.sqf";};
	case 18 : {call compile preprocessFileLineNumbers "loadout\loadout_FR.sqf";};
	case 19 : {call compile preprocessFileLineNumbers "loadout\loadout_occident.sqf";};
	case 20 : {call compile preprocessFileLineNumbers "loadout\loadout_US80.sqf";};
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	3) LOADOUT
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if !(isNil {playerUnit getVariable "loadout"}) then // La variable loadout doit être placer dans l'éditeur [init de l'unité] => this setVariable ["loadout", "aaf_sl"];
{
	if (isNil {playerUnit getVariable "loadout_done"}) then // loadout_done inexistant, on lance la function loadout
	{
		[playerUnit] call hard_setLoadout;
		playerUnit setVariable ["loadout_done", true, true]; // loadout_done permet de vérifier si le loadout a été fait afin d'éviter les doublons en cas de déco / reco.
	};
};

playerUnit action ["WeaponOnBack", playerUnit]; // pour que le joueur ait l'arme baissée


if !(isMultiplayer) then
{
	{
		if !(isNil {_x getVariable "loadout"}) then 
		{
			if (isNil {_x getVariable "loadout_done"}) then 
			{
				[_x] call hard_setLoadout;
				_x setVariable ["loadout_done", true, true];
			};
		};
	} foreach allUnits;
};


execVM "briefing.sqf";
[] call GDC_fnc_inventoryBriefing; // lancement du script qui affiche le loadout lors du briefing.
[] call GDC_fnc_rosterBriefing; // lancement du script qui affiche le roster lors du briefing.

player allowdamage false;

waitUntil {time > 1};
if ((uniform playerUnit) == "") then {
[playerUnit] call hard_setLoadout;
playerUnit setVariable ["loadout_done", true, true];
playerUnit action ["WeaponOnBack", playerUnit];
};

waitUntil {time > 10};
player allowdamage true;