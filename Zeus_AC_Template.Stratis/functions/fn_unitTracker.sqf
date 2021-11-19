/*
 * @file_name: fn_arsenalBox.sqf
 * @file_author: T. Yobart
 *
 * creates markers on group leaders on 
 * each side and hides from the others
 * meant to only be executed once
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Examples:
 * [] spawn AC_fnc_unitTracker;
 */
fn_assetType={
	params["_gname"];
	_type="b_inf";
	if (_gname in (missionNameSpace getVariable "unitTrackerHQ")) then {_type = "b_hq";};
	if (_gname in (missionNameSpace getVariable "unitTrackerAir")) then {_type = "b_air";};
	if (_gname in (missionNameSpace getVariable "unitTrackerArmor")) then {_type = "b_armor";};
	if (_gname in (missionNameSpace getVariable "unitTrackerPlane")) then {_type = "b_plane";};
	if (_gname in (missionNameSpace getVariable "unitTrackerMotorized")) then {_type = "b_motor_inf";};
	if (_gname in (missionNameSpace getVariable "unitTrackerMechanized")) then {_type = "b_mech_inf";};

	_type;
};

fn_tracker={
    params["_tgroup"];
    _groupname= _tgroup getVariable "markername";
    _jip=[[_groupname,_tgroup],{
        params["_groupname","_tgroup"];
        createMarkerLocal [_groupname, position (leader _tgroup)];
        _groupname setMarkerShapeLocal "ICON";
        _groupname setMarkerColorLocal (missionNameSpace getVariable "unitTrackerColor");
    }]remoteExec["bis_fnc_call", 0,true];

    while{_tgroup in allGroups && (count units _tgroup)>0}do{
        //str(_groupname) remoteExec ["systemChat",0];
        _type = (groupID _tgroup) call fn_assetType ;
        _players=[]; //same side as group + zeus
        _targetSide = [(side leader _tgroup),sideLogic];
        {
            if(side _x in _targetSide )then{
                _players pushBack _x;
            };
        } forEach allPlayers;
        _others = allPlayers select {!(_x in _players)};
        //(str(_groupname)+  " : " + str(_players)+  " : " + str(_others)) remoteExec ["systemChat",0];


		//markers updates
        if(!(_players IsEqualTo []))then{
	        [[_groupname,_type,_tgroup],{ //those who see
	            params["_groupname","_type","_tgroup"];
	            _groupname setMarkerTextLocal (groupID _tgroup);
	            _groupname setMarkerPosLocal (position (leader _tgroup));
	            _groupname setMarkerTypeLocal _type;
	            _groupname setMarkerAlphaLocal 1;
	        }]remoteExec["bis_fnc_call", _players];
        };

        if(!(_others IsEqualTo []))then{
            [_groupname,{ //those who dont see
                params["_groupname"];
                _groupname setMarkerAlphaLocal 0;
            }]remoteExec["bis_fnc_call", _others];
        };
        sleep 1;
    };

    [_groupname] remoteExec ["deleteMarkerLocal",0];
    remoteExec ["", _jip];
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
groupiter=0;
while{true}do{
	{
		_isTracked = _x getVariable ["tracked",false];

		if(!_isTracked && (isPlayer leader _x))then{
			_x setVariable ["tracked",true,true];
			_x setVariable ["markername","gr"+str(groupiter)];
			_x spawn fn_tracker ;
			groupiter=groupiter+1;
		};
	}forEach allGroups;
}