waitUntil{
	missionNameSpace getVariable ["initdone", false] && 
	(missionNamespace getVariable ["loadouts",[]]select{(_x select 0) == "loadoutSpawn"}) isNotEqualTo  [] 
} ;
 
if (side player != sideLogic) then{
player setUnitLoadout ((missionNamespace getVariable ["loadouts",[]]select{(_x select 0) == "loadoutSpawn"})select 0 select 1);
[player, [player, "inventory_var"]] call BIS_fnc_saveInventory;
};
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

if(missionNamespace getVariable 'enableRally')then{
	call AC_fnc_rally;
};
