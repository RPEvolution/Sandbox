/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "oil": {0}; //Oil processing license cost
	case "heroin": {0}; //Heroin processing license cost
	case "marijuana": {0}; //Marijuana processing license cost
	case "diamond": {0};
	case "salt": {0};
	case "cocaine": {0};
	case "sand": {0};
	case "iron": {0};
	case "copper": {0};
	case "cement": {0};
};