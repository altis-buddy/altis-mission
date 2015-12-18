#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])) then {
	if((FETCH_CONST(life_coplevel) == 0) && (FETCH_CONST(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_B_CombatUniform_mcam"};
player setObjectTextureGlobal [0,"textures\uniforme-raid.paa"];
waitUntil {uniform player != "U_B_CombatUniform_mcam"};
};
};

player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

fn_reanimate = {
	hint format ["C'est partie pour le heal frère"];
	sleep 1;
	_target = cursorTarget;
	if(isNull _target) then {
					_target = player;
	};
	_target setDamage 0;
	hint format ["Fini"];
};

fn_nuke_go = {
				{_x setdamage 1} forEach (nearestObjects [(getpos player), [], _this select 0]);
};

fn_tp_vehicle = {
				_pos = _this select 0;
				_vehicle = vehicle player;
				_vehicle SetPos _pos;
};

fn_loadout_1 = {
				_target = cursorTarget;
				if(isNull _target) then {
								_target = player;
				};
				//_target addHeadgear "H_HelmetB_plain_mcamo";
				_target addUniform "U_O_GhillieSuit";
				_target addWeapon "arifle_Katiba_ARCO_F";
				_target addMagazines ["30Rnd_65x39_caseless_green", 10];
};

fn_loadout_2 = {
				_target = cursorTarget;
				if(isNull _target) then {
								_target = player;
				};
				_target addMagazines ["30Rnd_65x39_caseless_green", 10];
};

fn_loadfriend = {
				removeAllActions player;
				player addAction ["Aurelien", ""];
				player addAction ["Romain", ""];
				player addAction ["Nicolas", ""];
				player addAction ["Cedric", ""];
				player addAction ["Chris", ""];
				player addAction ["Clear", "removeAllActions player;"];
};



fn_nuke = {
			removeAllActions player;
			player addAction ["Nuke (400m)", "[400] call fn_nuke_go"];
			player addAction ["Clear", "removeAllActions player;"];
};



fn_tp_to_me = {

};

fn_get_keys = {

};

fn_caise = {
	private["_mags","_weps","_items","_packs","_resupply","_resupply_time","_type","_boxn","_bType","_cfgweapons","_weapons","_magazines","_cur_wep","_classname","_wep_type","_scope","_picture","_items","_backpacks","_bpos","_bdir","_local"];

	_bType = "Box_NATO_Wps_F";

	// What kind of box
	//	0 = Weapons and Mags, Items, Backpacks
	//	1 = Weapons and Mags
	//	2 = Items
	//	3 = Packs
	_type = 0;

	// Make box resupply every X seconds
	//	Default resupplies it every 5 minutes.
	_resupply = true;
	_resupply_time = (60 * 5);

	// Spawn the box local or remote
	//	_local = true; // Spawn local
	//	_local = false; // Spawn normal
	_local = false;

	// How many of each item to spawn
	//	Don't spawn to many, can cause your game to lag if you spawn a ton.
	_mags = 20;
	_weps = 5;
	_items = 5;
	_packs = 5;


	_bdir = getdir player;
	_bpos = getposATL player;
	_bpos = [(_bpos select 0)+1*sin(_bdir),(_bpos select 1)+1*cos(_bdir), (_bpos select 2)];
	if (_local) then {
		_boxn = _bType createVehiclelocal _bpos;
	} else {
		_boxn = _bType createVehicle _bpos;
	};
	_boxn setDir _bdir;
	_boxn setposATL _bpos;

	clearWeaponCargo _boxn;
	clearMagazineCargo _boxn;
	clearItemCargo _boxn;
	clearBackpackCargo _boxn;


	switch (_type) do
	{
		//Master ammo crate (EVERYTHING).
		case 0:
		{
			_cfgweapons = configFile >> "CfgWeapons";
			_weapons = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					_wep_type = getNumber(_cur_wep >> "type");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					if(_scope >= 2 && _wep_type in [1,2,4,4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then
					{
						//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
						_weapons set[count _weapons, _classname];
					};
				};
			};

			_cfgweapons = configFile >> "CfgMagazines";
			_magazines = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					//_wep_type = getNumber(_cur_wep >> "type");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					if(_scope >= 2 && _picture != "" && !(_classname in _magazines)) then
					{
						_magazines set[count _magazines, _classname];
					};
				};
			};

			{ _boxn addWeaponCargo [_x,_weps]; } foreach _weapons;
			{ _boxn addMagazineCargo [_x,_mags]; }foreach _magazines;

			_cfgweapons = configFile >> "CfgWeapons";
			_items = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					_wep_type = getNumber(_cur_wep >> "type");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
					if(_scope >= 2 && _wep_type in [131072,4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then
					{
						//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
						_items set[count _items, _classname];
					};
				};
			};

			{ _boxn addItemCargo [_x,_items]; } foreach _items;

				_cfgweapons = configFile >> "CfgVehicles";
			_backpacks = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					_wep_type = getText(_cur_wep >> "vehicleClass");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					if(_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then
					{
						//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
						_backpacks set[count _backpacks, _classname];
					};
				};
			};

			{ _boxn addBackPackCargo [_x,_packs]; } foreach _backpacks;
		};
		//Fill box with Guns & Ammo only
		case 1:
		{
			_cfgweapons = configFile >> "CfgWeapons";
			_weapons = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					_wep_type = getNumber(_cur_wep >> "type");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					if(_scope >= 2 && _wep_type in [1,2,4,4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then
					{
						//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
						_weapons set[count _weapons, _classname];
					};
				};
			};

			_cfgweapons = configFile >> "CfgMagazines";
			_magazines = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					//_wep_type = getNumber(_cur_wep >> "type");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					if(_scope >= 2 && _picture != "" && !(_classname in _magazines)) then
					{
						_magazines set[count _magazines, _classname];
					};
				};
			};

			{ _boxn addWeaponCargo [_x,_weps]; } foreach _weapons;
			{ _boxn addMagazineCargo [_x,_mags]; }foreach _magazines;
		};

		//Items only
		case 2:
		{
			_cfgweapons = configFile >> "CfgWeapons";
			_items = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					_wep_type = getNumber(_cur_wep >> "type");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
					if(_scope >= 2 && _wep_type in [131072,4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then
					{
						//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
						_items set[count _items, _classname];
					};
				};
			};

			{ _boxn addItemCargo [_x,_items]; } foreach _items;
		};

		case 3:
		{

			_cfgweapons = configFile >> "CfgVehicles";
			_backpacks = [];

			for "_i" from 0 to (count _cfgWeapons)-1 do
			{
				_cur_wep = _cfgweapons select _i;

				if(isClass _cur_wep) then
				{
					_classname = configName _cur_wep;
					_wep_type = getText(_cur_wep >> "vehicleClass");
					_scope = getNumber(_cur_wep >> "scope");
					_picture = getText(_cur_wep >> "picture");
					if(_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then
					{
						//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
						_backpacks set[count _backpacks, _classname];
					};
				};
			};

			{ _boxn addBackPackCargo [_x,_packs]; } foreach _backpacks;
		};
	};
};
fn_test = {
	hint format [FETCH_CONST(life_adminlevel)];
};

fn_init = {
	removeAllActions player;
	OnMapSingleClick "[_pos] call fn_tp_vehicle";
	player addAction ["reanimate", "[] call fn_reanimate"];
	player addAction ["Money Altis Life (5M$)", "life_cash = life_cash + 5000000;"];
	player addAction ["Pop Vehicle", "_tank = ""O_MRAP_02_F"" createVehicle (position player);"];
	player addAction ["Cloth(1)", "[] call fn_loadout_1;"];
	player addAction ["Unlock", "[] call fn_get_keys"];
	player addAction ["Kill", "cursorTarget setDamage 1"];
	player addAction ["Test", "[] call fn_tp_to_me"];
	player addAction ["Nuke", "[] call fn_nuke"];
	player addAction ["chargeur(10)", "[] call fn_loadout_2;"];
	player addAction ["friend", "[] call fn_caise;"];
	player addAction ["Clear", "removeAllActions player;"];
	player addAction ["test", "[] call fn_test;"];
};
removeAllActions player;
player addAction ["Cheat", "[] call fn_init;"];
