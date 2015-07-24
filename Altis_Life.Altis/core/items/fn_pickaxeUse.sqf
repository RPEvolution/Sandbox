/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val","_endsound"];

_endsound = "";

switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;

[player,"mining"] call life_fnc_globalSound;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};	

_chance = round (random 10);
if(_chance < 1) exitWith 	{titleText[format["Du hast daneben geschlagen",_chance],"PLAIN"]};
if(_chance < 2) exitWith 	{titleText[format["Dir ist die Spitzhacke aus der Hand gefallen",_chance],"PLAIN"]};
if(_chance < 3) exitWith 	{titleText[format["Die spitze Seite muss nach vorne",_chance],"PLAIN"];};
if(_chance > 4) then 
	{
	if(([true,_mine,_diff] call life_fnc_handleInv)) then
		{
		_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
		titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
		
		if(_endsound != "") then
			{
			[player,_endsound] call life_fnc_globalSound;
			};
		};
	};

life_action_inUse = false;