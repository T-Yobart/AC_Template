//give loadout
[player, [player, "inventory_var"]] call BIS_fnc_loadInventory;

if(missionNamespace getVariable 'enableRally')then{
	call AC_fnc_rally;
};