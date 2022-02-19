/*
 * @file_name: fn_flagAdd.sqf
 * @file_author: T. Yobart
 *
 * adds action to teleport to fobs on an object
 *
 * Arguments:
 * 0: an already existing vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Examples:
 * _vhc remoteExec ["AC_fnc_flagAdd",2,true];
 */
////////////////////////////////////////////////
//                 VARIABLES                  //
////////////////////////////////////////////////

_flagClassName = missionNameSpace getVariable "flagClassName";			//cfgVehicle classname of the object you want to spawn as a "flag"

////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////

fn_addAction ={
	params["_flag"];
	[_flag, // action host
	["teleport", //action name
	{	//script
		fn_markerset = {
			params["_markerRadiusName","_vhc"];
			_fobColor = missionNameSpace getVariable "fobColor";	//radius color
			createMarkerLocal [_markerRadiusName,_vhc];
			_markerRadiusName setMarkerShapeLocal "ELLIPSE";
			_markerRadiusName setMarkerBrushLocal "SolidBorder";
			_markerRadiusName setMarkerSizeLocal [10,10];
			_markerRadiusName setMarkerAlphaLocal 0.5;
			_markerRadiusName setMarkerColorLocal _fobColor;
		};
		params ["_target", "_caller"];
		_markerdb =[];

		if(count (missionNamespace getVariable "databaseVhc")>0)then{
			if (!visibleMap) then {openMap true};
			_databaseVhc = missionNameSpace getVariable "databaseVhc";
			//set radius markers alpha and size
			{
				_packed =_x getVariable "fobPacked";
				if (! _packed && alive _x)then{
					_marker = _x getVariable "markerRadiusName";
					[_marker,_x] call fn_markerset;
					_markerdb pushBack _marker;
				};
			} forEach _databaseVhc;

			//eventhandler creation && trigger
			player setVariable ["pos",0];
			_EH =addMissionEventHandler ["MapSingleClick", {
				params ["_units", "_pos", "_alt", "_shift"];
				player setVariable ["pos",_pos];
				openMap false;
			}];

			//eventhandler deletion
			waitUntil {sleep(1);!visibleMap || (typeName (player getVariable "pos"))=="ARRAY" };
			_pos = player getVariable "pos";
			player setVariable ["pos",0];
			removeMissionEventHandler ["MapSingleClick",_EH];


			if((typeName (_pos))=="ARRAY" )then{
				_target = 0;
				{
					_vhc = _x;
					_vhcmarker = _vhc getVariable "markerRadiusName";
					if(
						!(_vhc getVariable "fobPacked")
						&& (_pos inArea _vhcmarker)
						&& alive _vhc
					)then{
						_target = _vhc;
					};
				} forEach _databaseVhc;

				_vhc = _target;
				//checks if _index is valid
				if(typename (_target) !="SCALAR")then{
					_telpos =((position _vhc) findEmptyPosition [0, 10] );
					if((count _telpos)!= 0)then{
						_caller setPos _telpos;
					}else{
						"FOB has no suitable teleport area" remoteExec ["hint", _caller]
					};
				}else{
					"select a marker with radius" remoteExec ["hint", _caller]
				};

			}else{
				//"succesful failure" remoteExec ["hint", _caller]
			};
			//cleanup
			{
				deleteMarkerLocal _x;
			} forEach _markerdb;
		}else{
			"no destination available" remoteExec ["hint", _caller]
		};
	},
	[], // script args
	1.5,
	true,
	true,
	"",
	"(_this distance _target < 10) && (alive _target) &&(vehicle player == player)"
	]] remoteExec ["addAction",0,true];
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if(isServer) then{
	// adds Flag pole and teleports players on FOB's location
	params["_flag"];
	//_pos = player;

	//_flag = createVehicle [_flagClassName,_pos,[],3];

	[_flag] call fn_addAction;
};