/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_Rangemaster";
player addVest "V_Rangemaster_belt";

player addWeapon "arifle_Mk20_MRCO_pointer_F";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Red";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_saveGear;
