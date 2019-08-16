/*
	
*/

if (!isServer) exitwith {};

_objet = "Flag_POWMIA_F" CreateVehicle [Random_Position select 0,Random_Position select 1,0];
if ((CC_p_time in [24,25,26,27,28,5,19,20,21,22,23]) AND (random 100 < 50)) then {CPC_TypeFire = "Campfire_burning_F";} else {CPC_TypeFire = "Land_Campfire_F";};
_objet = CPC_TypeFire CreateVehicle [(Random_Position select 0) - 2,Random_Position select 1,0];

if (cc_is_ins) then {
	_objet = "Land_GarbagePallet_F" CreateVehicle [(Random_Position select 0) - 15,(Random_Position select 1)+3,0];
	_objet = "rhs_uaz_open_MSV_01" CreateVehicle [(Random_Position select 0) - 15,(Random_Position select 1)+15,0];
	typecamp = 1; publicvariable "typecamp";
	_rdir = random 360;
	{
		if (CPC_WorldType == "vanilla") then {type1 = selectRandom ["CamoNet_INDP_F","Land_Cargo_House_V2_F","Land_Unfinished_Building_01_F","Land_i_Stone_Shed_V1_F","Land_House_1W13_F"];};
		if (CPC_WorldType == "desert") then {type1 = selectRandom ["Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_8_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1"];};
		if (CPC_WorldType == "afrique") then {type1 = selectRandom ["Land_Unfinished_Building_01_F","Land_Unfinished_Building_01_F","Land_Slum_House02_F","Land_Slum_House03_F","Land_Slum_House01_F","Land_cargo_house_slum_F","Land_Dum_istan3_pumpa","Land_House_C_5_EP1"];};
		if (CPC_WorldType == "jungle") then {type1 = selectRandom ["Land_Hut02","Land_Hut03","Land_Hut04","Land_Hut06","Land_Slum_House02_F","Land_Slum_House03_F","Land_Slum_House01_F","Land_d_House_Small_01_V1_F","Land_d_House_Small_01_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_Shed_V3_F","Land_i_Stone_Shed_V2_F","Land_Unfinished_Building_01_F","Land_FuelStation_Build_F"];};
		if (CPC_WorldType == "chern") then {type1 = selectRandom ["CamoNet_INDP_F","Land_Cargo_House_V2_F","Land_Unfinished_Building_01_F","Land_i_Stone_Shed_V1_F","Land_House_1W13_F"];};
		if (CPC_WorldType == "fidji") then {type1 = selectRandom ["CamoNet_ghex_F","Land_Cargo_House_V4_F","Land_Unfinished_Building_01_F","Land_PillboxBunker_01_rectangle_F","Land_House_Native_02_F","Land_Mausoleum_01_F"];};
		_objet = type1 CreateVehicle [(Random_Position select 0)+((sin (_rdir + _x))*10),(Random_Position select 1)+((cos (_rdir + _x))*10),1.5];
		_objet setdir (_rdir + _x);
		_objet setvectorUp [0,0,1];

		_type = ["Land_Ancient_Wall_4m_F","Land_CncBarrier_F"] select (floor random 2);
		_objet = _type CreateVehicle [(Random_Position select 0)+((sin (_rdir + (_x +60)))*10),(Random_Position select 1)+((cos (_rdir + (_x +60)))*10),0];
		_objet setdir (_rdir + (_x +60));

		if (random 100 < 25) then {
			_type = getText (missionConfigFile >> "CC_ennemy" >> CC_faction_ia >> cc_IAcamo >> "hmg");
			_objet = _type CreateVehicle [(Random_Position select 0)+((sin (_rdir + (_x +30)))*10),(Random_Position select 1)+((cos (_rdir + (_x +30)))*10),0];
			_objet setdir (_rdir + (_x +30));
		};
	} foreach [0,120,240];
} else {
	typecamp = 3; publicvariable "typecamp";
	[
		Random_Position,
		selectRandom ["OutpostA","OutpostC","OutpostD","OutpostE"]
	] execVM "scripts\create_fob.sqf";
};