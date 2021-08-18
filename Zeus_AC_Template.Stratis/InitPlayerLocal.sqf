waitUntil{
	missionNameSpace getVariable ["initdone", false] && 
	(missionNamespace getVariable ["loadouts",[]]select{(_x select 0) == "loadoutSpawn"}) isNotEqualTo  [] 
} ;
 
if (side player != sideLogic) then{
player setUnitLoadout ((missionNamespace getVariable ["loadouts",[]]select{(_x select 0) == "loadoutSpawn"})select 0 select 1);
[player, [player, "inventory_var"]] call BIS_fnc_saveInventory;
};
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

{
	missionNamespace setVariable [_x, true];
} forEach [
	"BIS_respSpecAllow3PPCamera",		// Allow 3rd person camera
	"BIS_respSpecShowFocus",			// Show info about the selected unit (dissapears behind the respawn UI)
	"BIS_respSpecShowHeader",			// Top bar of the spectator UI including mission time
	"BIS_respSpecLists"					// Show list of available units and locations on the left hand side
];

if(missionNamespace getVariable 'enableRally')then{
	call AC_fnc_rally;
};
