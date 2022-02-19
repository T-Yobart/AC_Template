/*
 * @file_name: fn_rally.sqf
 * @file_author: T. Yobart
 *
 * adds actions & handlers to move the rally point
 *
 * Arguments:
 * 0: an object or position <OBJECT>
 * 1: request code  <NUMBER>
 * 
 *
 * Return Value:
 * None
 *
 * Examples:
 * [] call AC_fnc_rally;
 */
////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////
fn_timeHandler={
    params["_actionIdRally"];
	player setVariable ["processIdRally",false];
	[_actionIdRally,player] spawn {
		params["_actionIdRally","_player"];
		while{true}do{
			waitUntil{(_player == leader _player)};
			_text="";
			_time=300-(serverTime - (missionNamespace getVariable ['lastRallyTime',-300]));
			if(_time>=0)then{
				_text =" <t color='#ff0000'>("+str(ceil (_time/60))+"min)</t>";
			};
			_player setUserActionText [_actionIdRally,"Set rally"+_text];
			sleep 15;
		}
	}
};

fn_addActionRally ={
    _actionIdRally=player addAction  
    [  
        "Set rally", // title  
        {  
            params ["_target", "_caller", "_actionId", "_arguments"]; // script  
            if(	isNull objectParent _target &&  
                300<(serverTime - (missionNamespace getVariable ['lastRallyTime',-300]))
            )then{
                rally_fob setVehiclePosition [_target, [], 1, ""];
                missionNamespace setVariable ['lastRallyTime',serverTime];  
                missionNamespace setVariable ['groupRallycount',(missionNamespace getVariable 'groupRallycount')+1,true];
                _rally = missionNamespace getVariable ['lastRally',[]];  
                if(_rally isEqualTo [])then{  
                    _rally remoteExec["BIS_fnc_removeRespawnPosition",2,true]; 
                };  
                [player,{
                    params["_caller"]; 
                    _rally= [side _caller,rally_fob,"Rally point"] call BIS_fnc_addRespawnPosition; 
                    missionNamespace setVariable ['lastRally',_rally,true];  
                }]remoteExec["bis_fnc_call", 2]; 
            }
        },  
        nil,  // arguments  
        1.5,  // priority  
        true,  // showWindow  
        true,  // hideOnUse  
        "",   // shortcut  
        "(missionNamespace getVariable 'groupRallycount')<(missionNamespace getVariable 'groupRallymax') &&
        groupID group _target == (missionNamespace getVariable 'groupRally') && 
        _target == leader _target &&
        (missionNamespace getVariable 'enableRally')  
        "  // condition  
    ]; 
	_actionIdRally
};
////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

_actionIdRally=call fn_addActionRally;
if(player getVariable ["processIdRally",true])then{
    _actionIdRally call fn_timeHandler;
};
