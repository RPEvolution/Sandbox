/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","fiber_1","fiber_2","fiber_3","fiber_4","fiber_5"];
_zone = "";

if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["fiber_1","fiber_2","fiber_3","fiber_4","fiber_5"]): {_gather = "fiber"; _val = 2;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	[player,"harvest"] call life_fnc_globalSound;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

_chance = round (random 10);
if(_chance < 1) exitWith 	{titleText[format["Du hast daneben gegriffen",_chance],"PLAIN"];};
if(_chance < 2) exitWith 	{titleText[format["Du hast es fallen gelassen",_chance],"PLAIN"]};
if(_chance < 3) exitWith 	{titleText[format["Du hast in Scheiße gegriffen",_chance],"PLAIN"]};
if(_chance > 4) then 
	{
	if(([true,_gather,_diff] call life_fnc_handleInv)) then
		{
		_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
		titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
		};
	};

life_action_inUse = false;
