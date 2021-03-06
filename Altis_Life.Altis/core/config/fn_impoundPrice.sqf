/*
	File: fn_impoundPrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sort of a config for the price of unimpounding a vehicle based on damage states.
	Will be whiped on new system.
*/
private["_veh","_price"];
_veh = _this select 0;
if(isNull _veh) exitWith {};

switch (true) do
{
	case (_veh isKindOf "Car") :
	{
		switch(true) do
		{
			case (damage _veh > 0.07) : {_price = 0;};
			case (damage _veh > 0.04) : {_price = 0;};
			case (damage _veh > 0.03) : {_price = 0;};
			default {_price = 0;};
		};
		
		switch (true) do
		{
			case (fuel _veh < 0.2) : {_price = _price + 0;};
			case (fuel _veh < 0.5) : {_price = _price + 0;};
			case (fuel _veh < 0.8) : {_price = _price + 0;};
			default { _price = _price + 0;};
		};
	};
	
	case (_veh isKindOf "Air") :
	{
		switch(true) do
		{
			case (damage _veh > 0.15) : {_price = 0;};
			case (damage _veh > 0.06) : {_price = 0;};
			case (damage _veh > 0.03) : {_price = 0;};
			default {_price = 0;};
		};
		
		switch (true) do
		{
			case (fuel _veh < 0.2) : {_price = _price + 0;};
			case (fuel _veh < 0.5) : {_price = _price + 0;};
			case (fuel _veh < 0.8) : {_price = _price + 0;};
			default { _price = _price + 0;};
		};
	};

	case (_veh isKindOf "Ship") :
	{
		switch(true) do
		{
			case (damage _veh > 0.07) : {_price = 0;};
			case (damage _veh > 0.04) : {_price = 0;};
			case (damage _veh > 0.03) : {_price = 5;};
			default {_price = 0;};
		};
		
		switch (true) do
		{
			case (fuel _veh < 0.2) : {_price = _price + 0;};
			case (fuel _veh < 0.5) : {_price = _price + 0;};
			case (fuel _veh < 0.8) : {_price = _price + 0;};
			default { _price = _price + 0;};
		};
	};
};

_price;