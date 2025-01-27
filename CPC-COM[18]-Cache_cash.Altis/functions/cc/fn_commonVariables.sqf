/*

*/
if (!isNil "CC_variables_defined") exitWith {};
CC_variables_defined = true;

// définition manuelle des paramètres pour le débug

// Variables liées au paramètres de la mission
CC_p_difficulty = "difficulte" call BIS_fnc_getParamValue;
CC_p_time = "heure" call BIS_fnc_getParamValue;
CC_p_overcast = "meteo" call BIS_fnc_getParamValue;
CC_p_fog = "fog" call BIS_fnc_getParamValue;
CC_p_fullmoon = "fullmoon" call BIS_fnc_getParamValue;
CC_p_insertion = "insertion" call BIS_fnc_getParamValue;
CC_p_extraction = "extraction" call BIS_fnc_getParamValue;
CC_p_loaout = "faction" call BIS_fnc_getParamValue;
CC_p_nvg = "nvg" call BIS_fnc_getParamValue;
CC_p_ammocrate = "ammocrate" call BIS_fnc_getParamValue;
CC_p_vehicle = "vehicule" call BIS_fnc_getParamValue;
CC_p_faction_ia = "faction_ia" call BIS_fnc_getParamValue;
CC_p_menace_at = "menace_at" call BIS_fnc_getParamValue;
CC_p_menace_veh_type = "menace_veh_type" call BIS_fnc_getParamValue;
CC_p_menace_veh_nbr = "menace_veh_nbr" call BIS_fnc_getParamValue;
CC_p_menace_aa = "menace_aa" call BIS_fnc_getParamValue;
CC_p_menace_air = "menace_air" call BIS_fnc_getParamValue;
CC_p_skillia = "skillIA" call BIS_fnc_getParamValue;
CC_P_ssscas = "sss_cas" call BIS_fnc_getParamValue;
CC_P_sssdrone = "sss_drone" call BIS_fnc_getParamValue;

// Loadout
CC_loadout = switch (CC_p_loaout) do {
	case 0 : {"NATO"};
	case 1 : {"CSAT"};
	case 2 : {"AAF"};
	case 3 : {"USArmy"};
	case 4 : {"USMC"};
	case 5 : {"USsf"};
	case 6 : {"RU2000_RHS"};
	case 7 : {"RU2015_RHS"};
	case 8 : {"RUsf"};
	case 9 : {"KSK"};
	case 10 : {"BAF"};
	case 11 : {"RACS"};
	case 12 : {"TAK"};
	case 13 : {"INS"};
	case 14 : {"TAK_INS"};
	case 15 : {"SAF"};
	case 16 : {"CDF"};
	case 17 : {"PMC"};
	case 18 : {"FR"};
	case 19 : {"occident"};
	case 20 : {"US80"};
	case 21 : {"RU1980"};
	case 22 : {"USNAM"};
	default {"occident"};
};

// Faction IA
CC_faction_ia = switch (CC_p_faction_ia) do {
	case 1 : {"fia"};
	case 2 : {"nato"};
	case 3 : {"csat"};
	case 4 : {"aaf"};
	case 5 : {"ldf"};
	case 101 : {"ins_rhs"};
	case 102 : {"ru_rhs"};
	case 103 : {"us_rhs"};
	case 104 : {"saf_rhs"};
	case 105 : {"cdf_rhs"};
	case 106 : {"tak_rhs"};
	case 107 : {"asia_rhs"};
	case 201 : {"napa_cup"};
	case 202 : {"chdkz_cup"};
	case 203 : {"tak_ins_cup"};
	case 204 : {"npfd_cup"};
	case 205 : {"picaros_cup"};
	case 206 : {"racs_cup"};
	case 207 : {"cdf_cup"};
	case 208 : {"us_cup"};
	case 209 : {"baf_cup"};
	case 210 : {"sla_cup"};
	case 211 : {"tak_cup"};
	case 212 : {"acr_cup"};
	case 213 : {"ejercito_cup"};
	case 214 : {"vc_cup"};
	case 215 : {"usnam_cup"};
	case 216 : {"hil_cup"};
	case 217 : {"ger_cup"};
	default {"ins_rhs"};
};

// Nuit
cc_night = if (CC_p_time in [1,2,3,4,20,21,22,23,0]) then {true} else {false};

// Insurgé ou pas 
cc_is_ins = getNumber (missionConfigFile >> "CC_ennemy" >> CC_faction_ia >> "faction_type");
cc_is_ins = if (cc_is_ins == 0) then {false} else {true};

// RHS ou pas
cc_rhsennemy = getNumber (missionConfigFile >> "CC_ennemy" >> CC_faction_ia >> "faction_is_rhs");
cc_rhsennemy = if (cc_rhsennemy == 0) then {false} else {true};

// Nombre de joueurs
cc_playerCount = if (isMultiplayer) then {count playableUnits} else {count switchableUnits};

// Camo en fonction du terrain
cc_IAcamo = "polyvalent";
switch (toLower worldName) do {
	case "altis";
	case "sara" : {cc_IAcamo = "polyvalent"};
	case "enoch"; // Livonia
	case "chernarus";
	case "chernarus_summer";
	case "cup_chernarus_a3";
	case "fdf_isle1_a"; // Podagorsk
	case "woodland_acr"; // Bystrica
	case "noe"; // Nogova
	case "vt7";
	case "wl_rosche";
	case "eden" : {cc_IAcamo = "woodland"}; // Everon
	case "takistan";
	case "pja307"; // dariyah
	case "isladuala3";
	case "tem_kujari";
	case "tem_anizay";
	case "dingor" : {cc_IAcamo = "desert"};
	case "tanoa";
	case "pja305"; // Nazigogo
	case "prei_khmaoch_luong"; //old pkl
	case "lingor3" : {cc_IAcamo = "jungle"};
	case "chernarus_winter" : {cc_IAcamo = "winter"};
	default {cc_IAcamo = "polyvalent"};
};
cc_loadoutcamo = cc_IAcamo;