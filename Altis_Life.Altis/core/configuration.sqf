#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,0); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,2); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,0); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,0); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,1); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 70; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,250); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,0);
__CONST__(life_impound_boat,0);
__CONST__(life_impound_air,0);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 0; //Starting Bank Money
		life_paycheck = 0; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 0; //Starting Bank Money
		life_paycheck = 0; //Paycheck Amount
	};
	
	case independent: 
	{
		life_atmcash = 0;
		life_paycheck = 0;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_fiber",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["turtle",3000],["blastingcharge",10000],["boltcutter",500]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",0],
	["heroinu",0],
	["fiber",0],
	["heroinp",0],
	["salema",0],
	["ornate",0],
	["mackerel",0],
	["tuna",0],
	["mullet",0],
	["catshark",0],
	["rabbit",0],
	["oilp",0],
	["turtle",0],
	["water",0],
	["coffee",0],
	["turtlesoup",0],
	["donuts",0],
	["marijuana",0],
	["tbacon",0],
	["lockpick",0],
	["pickaxe",0],
	["redgull",0],
	["peach",0],
	["cocaine",0],
	["cocainep",0],
	["diamond",0],
	["diamondc",0],
	["iron_r",0],
	["copper_r",0],
	["salt_r",0],
	["glass",0],
	["fuelF",0],
	["spikeStrip",0],
	["cement",0],
	["goldbar",0]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",0],
	["fiber",0],
	["rabbit",0],
	["salema",0],
	["ornate",0],
	["mackerel",0],
	["tuna",0],
	["mullet",0],
	["catshark",0],
	["water",0],
	["turtle",0],
	["turtlesoup",0],
	["donuts",0],
	["coffee",0],
	["tbacon",0],
	["lockpick",0],
	["pickaxe",0],
	["redgull",0],
	["fuelF",0],
	["peach",0],
	["spikeStrip",0],
	["blastingcharge",0],
	["boltcutter",0],
	["defusekit",0],
	["storagesmall",0],
	["storagebig",0]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",0],
	["C_Hatchback_01_F",0],
	["C_Offroad_01_F", 0],
	["B_G_Offroad_01_F",0],
	["C_SUV_01_F",0],
	["C_Van_01_transport_F",0],
	["C_Hatchback_01_sport_F",0],
	["C_Van_01_fuel_F",0],
	["I_Heli_Transport_02_F",0],
	["C_Van_01_box_F",0],
	["I_Truck_02_transport_F",0],
	["I_Truck_02_covered_F",0],
	["B_Truck_01_transport_F",0],
	["B_Truck_01_box_F", 0],
	["O_MRAP_02_F",0],
	["B_Heli_Light_01_F",0],
	["O_Heli_Light_02_unarmed_F",0],
	["C_Rubberboat",0],
	["C_Boat_Civil_01_F",0],
	["B_Boat_Transport_01_F",0],
	["C_Boat_Civil_01_police_F",0],
	["B_Boat_Armed_01_minigun_F",0],
	["B_SDV_01_F",0],
	["B_MRAP_01_F",0]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",0],
	["C_Hatchback_01_F",0],
	["C_Offroad_01_F", 0],
	["B_G_Offroad_01_F",0],
	["C_SUV_01_F",0],
	["C_Van_01_transport_F",0],
	["C_Hatchback_01_sport_F",0],
	["C_Van_01_fuel_F",0],
	["I_Heli_Transport_02_F",0],
	["C_Van_01_box_F",0],
	["I_Truck_02_transport_F",0],
	["I_Truck_02_covered_F",0],
	["B_Truck_01_transport_F",0],
	["B_Truck_01_box_F", 0],
	["O_MRAP_02_F",0],
	["B_Heli_Light_01_F",0],
	["O_Heli_Light_02_unarmed_F",0],
	["C_Rubberboat",0],
	["C_Boat_Civil_01_F",0],
	["B_Boat_Transport_01_F",0],
	["C_Boat_Civil_01_police_F",0],
	["B_Boat_Armed_01_minigun_F",0],
	["B_SDV_01_F",0],
	["B_MRAP_01_F",0]
];
__CONST__(life_garage_sell,life_garage_sell);