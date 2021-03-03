////////////////////////////////////////////////
//                 VARIABLES                  */
////////////////////////////////////////////////
/*
    @arsenal
*/
//arsenal contents
_availableHeadgear = [
    "H_Booniehat_khk_hs",
    "H_Booniehat_khk",
    "H_Bandanna_cbr",
    "rhsusf_bowman_cap",
    "rhsusf_Bowman",
    "rhsusf_ach_bare_des_headset_ess",
    "rhsusf_ach_bare_des_headset"

];

_availableGoggles = [
    "UK3CB_G_Neck_Shemag_Tan",
    "UK3CB_G_Neck_Shemag",
    "rhsusf_shemagh_tan",
    "rhsusf_shemagh2_tan",
    "rhsusf_shemagh2_gogg_tan",
    "rhsusf_shemagh_gogg_tan",
    "rhsusf_oakley_goggles_blk",
    "rhs_googles_black"
];

_availableUniforms = [
    "U_BG_Guerilla2_1"
];

_availableVests = [
    "UK3CB_AAF_I_V_Falcon_2_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_3_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_5_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_6_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_9_DIGI_BRN"
];

_availableBackpacks = [
    "B_AssaultPack_cbr",
    "B_Kitbag_cbr",
    "B_Carryall_cbr",
    "TFAR_rt1523g_black"
];

_availableWeapons = [
    "rhs_weap_SCARH_CQC",
    "rhs_weap_mk18_KAC",
    "rhs_weap_mk18_m320",
    "rhs_weap_m249_pip",
    "rhs_weap_M136_hedp",
    "rhsusf_weap_glock17g4"
];

_availableOptics = [
    "rhsusf_acc_compm4",
    "optic_Holosight_blk_F",
    "optic_ACO_grn",
    "optic_Aco"
];

_availableMagazines = [
    "rhs_mag_30Rnd_556x45_M855A1_Stanag",
    "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk",
    "rhs_mag_M441_HE",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_Smoke_Grenade_shell",
    "rhsusf_200rnd_556x45_mixed_box",
    "rhsusf_mag_17Rnd_9x19_JHP",
    "rhs_mag_m67",
    "SmokeShell",
    "SmokeShellGreen",
    "SmokeShellBlue"

];

_availableMisc = [
    "ACE_fieldDressing",
    "ACE_epinephrine",
    "ACE_morphine",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_salineIV",
    "ACE_tourniquet",
    "ACE_EntrenchingTool",
    "ACE_DefusalKit",
    "ToolKit",
    "Binocular",
    "ItemMap",
    "ItemCompass",
    "ItemWatch",
    "ItemGPS",
    "ACE_CableTie",
    "TFAR_anprc152"
];

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
_fobColor = "colorBLUFOR"; //radius color
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
//arsenal contents
missionNameSpace setVariable ["AC_arsenal_availableMisc",_availableMisc,true];
missionNameSpace setVariable ["AC_arsenal_availableMagazines",_availableMagazines,true];
missionNameSpace setVariable ["AC_arsenal_availableOptics",_availableOptics,true];
missionNameSpace setVariable ["AC_arsenal_availableWeapons",_availableWeapons,true];
missionNameSpace setVariable ["AC_arsenal_availableBackpacks",_availableBackpacks,true];
missionNameSpace setVariable ["AC_arsenal_availableVests",_availableVests,true];
missionNameSpace setVariable ["AC_arsenal_availableUniforms",_availableUniforms,true];
missionNameSpace setVariable ["AC_arsenal_availableGoggles",_availableGoggles,true];
missionNameSpace setVariable ["AC_arsenal_availableHeadgear",_availableHeadgear,true];

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
missionNameSpace setVariable ["initdone", true, true];

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
["Initialize"] call BIS_fnc_dynamicGroups; // Initializes the Dynamic Groups framework
[] spawn AC_fnc_showFPS;//server fps marker
[] spawn AC_fnc_unitTracker;