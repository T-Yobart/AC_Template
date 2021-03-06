/*
 * @file_name: fn_spawnFOB.sqf
 * @file_author: T. Yobart
 *
 * adds an "FOB" behavior to a vehicle
 * meaning it becomes a quasi respawn vehicles with added features
 *
 * Arguments:
 * 0: an already existing vehicle <OBJECT>
 * 1: name of the fob marker <STRING>
 *
 * Return Value:
 * None
 *
 * Examples:
 *
 * [_vhc,"_fobname"] remoteExec ["AC_fnc_spawnFOB",2];
 * [cursorObject,"oui"] remoteExec ["AC_fnc_spawnFOB",2];
 *
 *
 *
 * 		If you want to forecfully "allow" a fob (here Charlie)
 * as a respawn (i.e.from the editor)
 *
 * Charlie setVariable ["fobPacked",false,true];
 * or ["fobPacked",true,true] here Charlie is the vehicle
 *
 * "box fob Charlie_MM" setMarkerType "b_installation";
 * or "b_service" // the markername being (_fobname +"_MM")
 *
 *
 *
 * 		Spawning objects along the FOB setup is possible
 * be aware of the size of your vehicle as spawnObjects
 * will create object regardless of the vehicle size
 *
 * ///////	fob object placement ///////
 * To add your own objects to the FOB spawn sequence
 * go to fn_spawnObjects add the following code block
 * replace the variables
 * 		_x			//object you are going to spawn
 * 		_xPos		//pos of the object you want to spawn
 * 		_yPos		//position var from the object you will use to calculate _xpos
 * 		_yDir		//direction var from the object you will use to calculate _xpos
 * 		"x object classname"		//cfgVehicles classname of the object you want to spawn
 *  
 * _x object relative to y object
 * _xPos =_yPos getpos [4.5,_yDir];
 * _x = createVehicle ["x object classname",_xPos,[],0,""];
 * _x call fn_setSim;
 * _x setPos _xPos;
 * _x setDir (_yDir+180);
 * (_fobObjects select 0) pushback _x;
 * (_fobObjects select 1) pushback _xPos;
 *
 */

////////////////////////////////////////////////
//                 VARIABLES                  //
////////////////////////////////////////////////

_databaseVhc = missionNameSpace getVariable "databaseVhc";
_fobMarker = missionNameSpace getVariable "fobMarkerPacked";
_fobColor = missionNameSpace getVariable "fobColor";	//radius color

////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////
fn_setFobMarkers = {
	params["_vhc","_fobName","_fobMarker","_fobColor"];

	// sets UniqueMarkerNames
	_markerFobName = format["%1_MM",_fobName]; //name of marker (not shown)
	_markerRadiusName = format["%1_RM",_fobName];
	_vhc setVariable ["markerFobName",_markerFobName,true];
	_vhc setVariable ["markerRadiusName",_markerRadiusName,true];

	//sets markers
	_markerFob = createMarker [_markerFobName,_vhc];
	_markerFobName setMarkerText _fobName;
	_markerFobName setMarkerType _fobMarker;

	//markerloop function
	[_vhc,_markerFobName] remoteExec ["AC_fnc_fobMarkerLoop",2];

};

fn_setSim = {
	if(isServer) then {
		_target = param[0];
		_target enableSimulationGlobal false;
	};
};

fn_spawnObjects = {
	fn_setSim = {
		if(isServer) then {
			_target = param[0];
			_target enableSimulationGlobal false;
		};
	};

	params["_vhc"];

	_fobObjects = [[],[]];

	// FOB is packed therefore spawn
	_vhcDir = getDir _vhc;
	_vhcPos = getpos _vhc;

	/* supplycrate / arsenal
	_cratePos = _vhcPos getpos [5,(_vhcDir+180)];
	_crate = ([0,_cratePos] call ZO_fnc_gearBox);
	_crate call fn_setSim;
	[_crate,-1] call ace_cargo_fnc_setSize;
	(_fobObjects select 0) pushback _crate;
	(_fobObjects select 1) pushback _cratePos;*/

	{
		_xIndex = (_fobObjects select 0) find _x;
		_xPos = (_fobObjects select 1) select _xIndex;
		_x setPos _xPos;
	} forEach (_fobObjects select 0);
	_vhc setVariable ["fobObjects",(_fobObjects select 0),true];
};

fn_clearFobObjects = {
	// to clear all spawned objects
	params["_fobObjects"];
	{
		_x remoteExec ["removeAllActions",0,true];
		deleteVehicle _x
	}forEach _fobObjects;
};

fn_addFobAction = {
	//setup
	params["_vhc"];
	[
		_vhc,
		"setup FOB",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
		"(_this distance _target < 10) && (alive _target) && ((count crew _target) == 0)&&(vehicle player == player) && (_target getVariable 'fobPacked')",
		"(_this distance _target < 10) && (alive _target) && ((count crew _target) == 0)&&(vehicle player == player) && (_target getVariable 'fobPacked')",
		{_caller playAction "medic"},
		{},
		{
			fn_spawnObjects = param[3] select 0;
			_caller switchAction "medicStop";
			_target setVariable ["fobPacked",false,true];
			_markerFobName = _target getVariable "markerFobName";
			_markerFobSetup = missionNamespace getVariable "fobMarkerSetup";
			_markerFobName setMarkerType _markerFobSetup;
			[_target, -1] call ace_cargo_fnc_setSize;
			if(!((getPosATL _target)findEmptyPositionReady [0, 10]))then{
				"FOB has no suitable teleport area" remoteExec ["hint", _caller]
			};
			_target lock 2;
			[_target] Call fn_spawnObjects;
		},
		{_caller switchAction "medicStop"},
		[fn_spawnObjects],
		5,
		10,
		false,
		false
	] remoteExec ["BIS_fnc_holdActionAdd",0,true];
	//pack
	[
		_vhc,
		"pack up FOB",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
		"(_this distance _target < 10) && (alive _target) && ((count crew _target) == 0)&&(vehicle player == player) &&!(_target getVariable 'fobPacked')",
		"(_this distance _target < 10) && (alive _target) && ((count crew _target) == 0)&&(vehicle player == player) &&!(_target getVariable 'fobPacked')",
		{_caller playAction "medic"},
		{},
		{
			_fobObjects = _target getVariable "fobObjects";
			_target setVariable ["fobPacked",true,true];
			_caller switchAction "medicStop";
			_markerFobName = _target getVariable "markerFobName";
			_markerFobPacked = missionNamespace getVariable "fobMarkerPacked";
			_markerFobName setMarkerType _markerFobPacked;
			_target lock 0;
			[(_target getVariable "fobObjects")] remoteExecCall ["fn_clearFobObjects",2]
		},
		{_caller switchAction "medicStop"},
		[],
		3,
		10,
		false,
		false
	] remoteExec ["BIS_fnc_holdActionAdd",0,true]
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
if(isServer)then{
	params["_vhc","_fobname"];

	//set vhc varname, set state & push to main DB
	_vhc setVariable ["fobname",_fobname,true];
	_vhc setVariable ["fobPacked",true,true];
	[_vhc, 1] call ace_cargo_fnc_setSize;

	_databaseVhc pushBack _vhc;
	missionNameSpace setVariable ["databaseVhc",_databaseVhc,true];

	[_vhc,_fobName,_fobMarker,_fobColor] call fn_setFobMarkers;
	_vhc call fn_addFobAction;
};