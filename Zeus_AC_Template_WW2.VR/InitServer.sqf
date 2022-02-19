////////////////////////////////////////////////
//                 VARIABLES                  */
////////////////////////////////////////////////

/*
    @loadouts
    @author: T. Yobart
*/

//loadouts override 
// false means the editor's loadouts are used
_override=true;


/*
    @rally
    @author: T. Yobart
*/
//rallies
_enableRally=true; //hides the action of moving rallies
_groupRally="HQ1PLT"; // which group leader has the rally
_groupRallymax=7; //amount of times you can place the rally

/*
    @unitracker
    @author: T. Yobart
*/
//unitracker color
_unitTrackerColor = "ColorBlufor"; // All colors: https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3


/*
    @fob revision
    @author: T. Yobart
*/
//markerloops variable
_refreshTime =1;

//flag classname
_flagClassName= "Flag_BI_F"; //cfgVehicle classname of the object you want to spawn as a "flag"

//fob marker variables
_fobColor = "colorBLUFOR"; //marker & radius color
_markerFobSetup = "b_installation"; //when FOB is static/setup
_markerFobPacked = "b_service";     //when FOB is moving/packed
_atDeathFobColor = "ColorGrey";     //color of markers at FOB destruction
_atDeathFobName = "_DESTROYED";     //string added to the FOBNameMarker at FOB destruction

//movable teleport database [_vhc]
//_vhc is short for _vehicle
_databaseVhc =  [];

////////////////////////////////////////////////
/*        DO NOT EDIT BELOW THIS LINE         */
////////////////////////////////////////////////

//loadouts override
missionNamespace setVariable["loadoutoverride", _override, true];

//markerloops variable
missionNameSpace setVariable ["refreshRate",_refreshTime,true];

//flag classname
//missionNameSpace setVariable ["flagClassName",_flagClassName,true]; //unused

//fob variables
missionNameSpace setVariable ["fobColor",_fobColor,true];
missionNameSpace setVariable ["fobMarkerSetup",_markerFobSetup,true];
missionNameSpace setVariable ["fobMarkerPacked",_markerFobPacked,true];
missionNameSpace setVariable ["fobDeathColor",_atDeathFobColor,true];
missionNameSpace setVariable ["fobDeathName",_atDeathFobName,true];

//vhc database
missionNameSpace setVariable ["databaseVhc",_databaseVhc,true];

missionNameSpace setVariable ["unitTrackerColor", _unitTrackerColor, true];
missionNameSpace setVariable ["unitTrackerInterval", 0.1, true];
missionNameSpace setVariable ["unitTrackerInfantry", ["A","B","C","D","E","F","G","H"], true];
missionNameSpace setVariable ["unitTrackerHQ", ["HQCO","HQ1PLT","HQ2PLT"], true];
missionNameSpace setVariable ["unitTrackerAir", ["Z1","Z2","Z3","Z4","Z5","Z6","Z7","Z8","Z9","Z10"], true];
missionNameSpace setVariable ["unitTrackerArmor", ["Y1","Y2","Y3","Y4","Y5","Y6","Y7","Y8","Y9","Y10"], true];
missionNameSpace setVariable ["unitTrackerPlane", ["W1","W2","W3","W4","W5","W6","W7","W8","W9","W10"], true];
missionNameSpace setVariable ["unitTrackerMotorized", ["V1","V2","V3","V4","V5","V6","V7","V8","V9","V10"], true];
missionNameSpace setVariable ["unitTrackerMechanized", ["X1","X2","X3","X4","X5","X6","X7","X8","X9","X10"], true];

//rallies
missionNamespace setVariable ["enableRally", _enableRally, true]; //hides the action of moving rallies
missionNamespace setVariable ["groupRally", _groupRally, true];
missionNamespace setVariable ["groupRallymax", _groupRallymax, true];
missionNamespace setVariable ["groupRallycount", 0, true];

// XEH_preinit for the poor
missionNameSpace setVariable ["initdone", true, true];

if(_override)then{
    execVM "loadouts.sqf";
}
execVM "arsenalContents.sqf";
////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
["Initialize"] call BIS_fnc_dynamicGroups; // Initializes the Dynamic Groups framework
[] spawn AC_fnc_showFPS;//server fps marker
[] spawn AC_fnc_unitTracker;
