/*
 * @file_name: fn_fobMarkerLoop.sqf
 * @file_author: T. Yobart
 *
 * internal function to track fobs
 *
 * Arguments:
 * 0: an already existing fob <OBJECT>
 * 1: the marker holding the name of said fob <STRING>
 *
 * Return Value:
 * None
 *
 * Examples:
 * [_vhc,_markerFobName] remoteExec ["AC_fnc_fobMarkerLoop",2];
 */

////////////////////////////////////////////////
//                 VARIABLES                  //
////////////////////////////////////////////////

_refreshTime = missionNameSpace getVariable ["refreshRate",1];

////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////

fn_Fobupdate = {
	params["_vhc","_markerFobName"];
	_vhcPos = [getpos _vhc select 0,getpos _vhc select 1];
	_markerFobName setMarkerPos _vhcPos;
	[_vhc,_markerFobName] spawn AC_fnc_fobMarkerLoop
};

fn_FobDead = {
	params["_vhc","_markerFobName"];
	_fobname = _vhc getVariable "fobname";
	//color of markers at FOB destruction
	_atDeathColor = missionNameSpace getVariable "fobDeathColor";
	//name of the FOBNameMarker at FOB destruction
	_atDeathName = missionNameSpace getVariable "fobDeathName";

	_markerFobName setMarkerColor _atDeathColor;
	_markerFobName setMarkerText format["%1%2",_fobname,_atDeathName];
	if(isServer)then{
		_databaseVhc = missionNameSpace getVariable "databaseVhc";
		_index= _databaseVhc find _vhc;
		_databaseVhc deleteAt _index;
		missionNameSpace setVariable ["databaseVhc",_databaseVhc,true];
	};
	sleep 60;
	deleteMarker _markerFobName;
};

fn_hintErrorAdmin = {
	params["_markerFobName"];
	{
		_isAdmin = admin Owner _x;
		if(_isAdmin>0)then{
			_admins pushback _x
		};
	} forEach allPlayers;
	deleteMarker _markerFobName;
	format["%1 has broke out of the marker loop",_markerFobName] remoteExec ["hint",_admins];
};
////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

params["_vhc","_markerFobName"];
sleep _refreshTime;

if(alive _vhc)then{
	[_vhc,_markerFobName] call fn_Fobupdate;
}
else{
	if(!alive _vhc)then{
		[_vhc,_markerFobName] call fn_FobDead;
	}
	else{
		[_markerFobName] call fn_hintErrorAdmin;
	};
};