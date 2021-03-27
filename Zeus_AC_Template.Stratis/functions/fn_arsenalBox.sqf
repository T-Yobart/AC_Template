/*
 * @file_name: fn_arsenalBox.sqf
 * @file_author: T. Yobart
 *
 * meant to spawn arsenal & other boxes
 *
 * Arguments:
 * 0: an object or position <OBJECT>
 * 1: request code  <NUMBER>
 * 
 *
 * request numbers:
 * 0 = create a box with arsenal
 * 1 = add arsenal to box
 * 2 = create a box with loadout action (rearm)
 * 3 = add loadout action (rearm) to box
 *
 * Return Value:
 * None
 *
 * Examples:
 * [player,0] remoteExec ["AC_fnc_arsenalBox",2];
 */
////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////
fn_initArsenal={
    //Init stuff
    params["_box"];
    [_box,{
        params["_box"];
        //getvars from initserver
        _availableMisc=         missionNameSpace getVariable ["AC_arsenal_availableMisc",[]];
        _availableMagazines=    missionNameSpace getVariable ["AC_arsenal_availableMagazines",[]];
        _availableOptics=       missionNameSpace getVariable ["AC_arsenal_availableOptics",[]];
        _availableWeapons=      missionNameSpace getVariable ["AC_arsenal_availableWeapons",[]];
        _availableBackpacks=    missionNameSpace getVariable ["AC_arsenal_availableBackpacks",[]];
        _availableVests=        missionNameSpace getVariable ["AC_arsenal_availableVests",[]];
        _availableUniforms=     missionNameSpace getVariable ["AC_arsenal_availableUniforms",[]];
        _availableGoggles=      missionNameSpace getVariable ["AC_arsenal_availableGoggles",[]];
        _availableHeadgear=     missionNameSpace getVariable ["AC_arsenal_availableHeadgear",[]];
        ["AmmoboxInit",[_box,false,{true}]] spawn BIS_fnc_arsenal;
        //Populate with predefined items and whatever is already in the crate
        [_box,((backpackCargo _box) + _availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
        [_box,((itemCargo _box) + _availableHeadgear + _availableGoggles + _availableUniforms + _availableVests + _availableMisc + _availableOptics)] call BIS_fnc_addVirtualItemCargo;
        [_box,(magazineCargo _box) + _availableMagazines] call BIS_fnc_addVirtualMagazineCargo;
        [_box,(weaponCargo _box) + _availableWeapons] call BIS_fnc_addVirtualWeaponCargo;
    }]remoteExec["bis_fnc_call", 0,true];
};

fn_setActions_loadLoadout={
    params["_box"];
    //action to load saved loadout
    [
        _box,
        "<t color='#0ff000'>Load Loadout</t>",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "(_this distance _target < 3)",
        "(_caller distance _target < 3)",
        {},
        {},
        {
        [_caller, [_caller, "inventory_var"]] call BIS_fnc_loadInventory;
        ["ace_medical_treatment_fullHealLocal", player, player] call CBA_fnc_targetEvent;

        },
        {},
        [],
        1,
        9,
        false,
        false
    ] remoteExec ["BIS_fnc_holdActionAdd",0,true];
};

fn_setActions_saveLoadout={
    params["_box"];
    //action to save loadout
    [
        _box,
        "<t color='#0ff000'>Save Loadout</t>",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
        "(_this distance _target < 3)",
        "(_caller distance _target < 3)",
        {},
        {},
        {
        [_caller, [_caller, "inventory_var"]] call BIS_fnc_saveInventory;

        },
        {},
        [],
        1,
        10,
        false,
        false
    ] remoteExec ["BIS_fnc_holdActionAdd",0,true];
};

fn_setActions_roles={
    params["_box"];
    //action to set caller as medic
    [
        _box,
        "<t color='#ff9500'>Become a Medic</t>",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "(_this distance _target < 3)",
        "(_caller distance _target < 3)",
        {},
        {},
        {
        _caller setVariable ["Ace_medical_medicClass", 1, true];
        _caller setVariable ["Ace_IsEngineer", 0, true];

        },
        {},
        [],
        1,
        8,
        false,
        false
    ] remoteExec ["BIS_fnc_holdActionAdd",0,true];

    //action to set caller as advanced engi
    [
        _box,
        "<t color='#ff9500'>Become an Engineer</t>",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "(_this distance _target < 3)",
        "(_caller distance _target < 3)",
        {},
        {},
        {
        _caller setVariable ["Ace_medical_medicClass", 0, true];
        _caller setVariable ["Ace_IsEngineer", 2, true];

        },
        {},
        [],
        1,
        8,
        false,
        false
    ] remoteExec ["BIS_fnc_holdActionAdd",0,true];

    //action to reset infantry roles
    [
        _box,
        "<t color='#ff9500'>Reset Medic/Engineer Role</t>",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
        "(_this distance _target < 3)",
        "(_caller distance _target < 3)",
        {},
        {},
        {
        _caller setVariable ["Ace_medical_medicClass", 0, true];
        _caller setVariable ["Ace_IsEngineer", 0, true];

        },
        {},
        [],
        1,
        8,
        false,
        false
    ] remoteExec ["BIS_fnc_holdActionAdd",0,true];
};

fn_setActions_Loadouts={
    params["_box"];
        //action to save loadout
    {
        _x params["_name","_loadout"];
        [
            _box,
            format["<t color='#ff0000'>%1</t>",_name select [7]],
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
            "(_this distance _target < 3)",
            "(_caller distance _target < 3)",
            {},
            {},
            {
            _loadout=param[3]select 0;_loadout;
            _caller setUnitLoadout _loadout;
            },
            {},
            [_loadout],
            1,
            5,
            false,
            false
        ] remoteExec ["BIS_fnc_holdActionAdd",0,true];
    } forEach (missionNamespace getVariable ["loadouts",[]])
};

fn_createBox = {
    _position = _this;

    // Spawn ammobox
    _object = createVehicle ["B_supplyCrate_F", _position, [], 0, "CAN_COLLIDE"];
    _object setDir (round random 360);
    [_object, 4] call ace_cargo_fnc_setSize;

    // Empty ammobox
    clearWeaponCargoGlobal _object;
    clearMagazineCargoGlobal _object;
    clearItemCargoGlobal _object;
    clearBackpackCargoGlobal _object;

    // Allow zeuses to move the ammobox
    {
        _x addCuratorEditableObjects [[_object],true];
    } foreach allCurators;

    _object;
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
if(isServer) then{
    params ["_object","_opt"];
    switch (_opt) do
    {
        case 0:
        { //spawn arsenal
            _object = _object call fn_createBox;
            _object call fn_setActions_saveLoadout;
            _object call fn_setActions_loadLoadout;
            _object call fn_setActions_Loadouts;
            _object call fn_setActions_roles;
            _object call fn_initArsenal;
        };
        case 1:
        { //set box to an arsenal
            _object call fn_setActions_saveLoadout;
            _object call fn_setActions_loadLoadout;
            _object call fn_setActions_Loadouts;
            _object call fn_setActions_roles;
            _object call fn_initArsenal;
        };
        case 2:
        { //spawn rearm
            _object = _object call fn_createBox;
            _object call fn_setActions_loadLoadout;
        };
        case 3:
        { //set rearm actions to a box
            _object call fn_setActions_loadLoadout;
        };
    };
};