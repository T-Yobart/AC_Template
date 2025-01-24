/*
 * @file_name: loadout.sqf
 * @file_author: T. Yobart
 *
 * Gives the ability to make and change loadouts for 
 * the arsenal through edition of the file
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Examples:
 * read following
 *
 * Loadouts made in this file and the editor share 
 * the same format from bohemia 
 * https://community.bistudio.com/wiki/Unit_Loadout_Array
 * (template written further down)
 *
 * Simple variables have been setup for quick edition
 * bear in mind the gear will be given 
 * regardless of capacity constraints
 * 
 * feel free to edit the loadout's individual template 
 * especially when mixing weapons as the accessories 
 * will conflict
 *
 * ////////////////////////////////////////////////
 * //              loadout Template              //
 * ////////////////////////////////////////////////
 * [
 *     [
 *         _weapon, //weapon
 *         _weaponMuzzle, //muzzle
 *         _weaponAccessory, //accessory
 *         _weaponSight, //optic
 *         _WeaponMagazineArray, //magazine
 *         [], //grenade
 *         ""//bipod
 *     ],
 *     [
 *         _weaponSingleUse,
 *         "", 
 *         "", 
 *         "", 
 *         [],//ammo
 *         [], 
 *         ""
 *     ],
 *     [
 *         _pistol, 
 *         _pistolMuzzle, 
 *         _pistolAccessory, 
 *         _pistolSight, 
 *         _pistolMagazineArray,
 *         [], 
 *         ""
 *     ],
 *     [
 *         _uniform, 
 *         [
 *             ["ACE_morphine",6],
 *             ["ACE_tourniquet",2],
 *             ["ACE_epinephrine",6],
 *             ["ACE_fieldDressing",23],
 *             ["ACE_splint", 4]
 *         ]
 *     ],
 *     [
 *         _vest, 
 *         [
 *             _smokes,
 *             _grenades,
 *             _weaponMagazineSpares,
 *             _pistolMagazineSpares
 *         ]
 *     ],
 *     [
 *         _backpack,
 *         []
 *     ], 
 *     _headgear, //helmet
 *     "", //cosmetic
 *     [
 *         "Laserdesignator", 
 *         "", 
 *         "", 
 *         "", 
 *         ["Laserbatteries", 1],
 *         [], 
 *         ""
 *     ],
 *     [_map, _gps, _radio, _compass, _watch, _nightVision]
 * ]
 *
 */

////////////////////////////////////////////////
//                 VARIABLES                  //
////////////////////////////////////////////////

//Equipment
_uniform = "U_LIB_ST_Soldier_Camo";
_vest = "V_LIB_GER_VestKar98";
_backpack = "B_LIB_GER_A_frame";
_headgear = "H_LIB_ST_Helmet";
//Misc
_radio = "";
_gps = "";
_map = "ItemMap";
_compass="LIB_GER_ItemCompass_deg";
_watch="LIB_GER_ItemWatch";
_nightVision = "";
//Grenades
_smoke="LIB_M39";
_smokeAmount=2;
_handgrenade="LIB_NB39";
_handgrenadeAmount=1;
//Main Weapon
_weapon="LIB_K98_Late";
_weaponMagazine="LIB_5Rnd_792x57";
_weaponMagazineAmount=8;
_weaponMuzzle="";
_weaponAccessory="";
_weaponSight="";
//One Use Launcher
_OneUseLauncher="LIB_PzFaust_60m";
//Sidearm
_pistol="LIB_M1908";
_pistolMagazine="LIB_8Rnd_9x19_P08";
_pistolMagazineAmount=1;
_pistolMuzzle="";
_pistolAccessory="";
_pistolSight="";
//LMG
_mgWeapon="LIB_MG34";
_mgMagazine="LIB_50Rnd_792x57";
_mgMagazineAmount=4;
_mgAccessory="";
//HMG
_hmgWeapon="LIB_MG42";
_hmgMagazine="LIB_50Rnd_792x57";
_hmgMagazineAmount=1;
_hmgAccessory="";
//Leader
_backpackLeader = "B_LIB_GER_Radio";
_headgearLeader = "H_LIB_ST_Helmet2";
//Medic
_backpackMedic = "B_LIB_GER_MedicBackpack";
//AT
_atLauncher="LIB_RPzB";
_atAmmo="LIB_1Rnd_RPzB";
_atBackpack="B_LIB_GER_Panzer";
//grenadier
_grenadierWeapon = "LIB_MP44_GW";
_grenadierWeaponMuzzle = "LIB_ACC_GW_SB_Empty";
_grenadierMagazine = "LIB_30Rnd_792x33";
_grenadierMagazineAmount = 8; 
_grenadierGrenade="LIB_1Rnd_G_SPRGR_30";
_grenadierGrenadeAmount = 5; 
//sniper
_sniperWeapon="rhs_weap_m14ebrri";
_sniperMagazine="rhsusf_20Rnd_762x51_m118_special_Mag";
_sniperMagazineAmount=10;
_sniperMuzzle="";
_sniperAccessory="rhsusf_acc_harris_bipod";
_sniperSight="rhsusf_acc_su230";

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
if (isServer) then {
    //Main mags
    _weaponMagazineArray=[_weaponMagazine,getNumber (configfile >> "CfgMagazines" >> _weaponMagazine >> "count")];
    _weaponMagazineSpares=[_weaponMagazine , _weaponMagazineAmount, _weaponMagazineArray select 1];
    //LMG mags
    _mgMagazineArray=[_mgMagazine,getNumber (configfile >> "CfgMagazines" >> _mgMagazine >> "count")];
    _mgMagazineSpares=[_mgMagazine , _mgMagazineAmount, _mgMagazineArray select 1];
	//HMG mags
    _hmgMagazineArray=[_hmgMagazine,getNumber (configfile >> "CfgMagazines" >> _hmgMagazine >> "count")];
    _hmgMagazineSpares=[_hmgMagazine , _hmgMagazineAmount, _hmgMagazineArray select 1];
    //pistol mags
    _pistolMagazineArray=[_pistolMagazine,getNumber (configfile >> "CfgMagazines" >> _pistolMagazine >> "count")];
    _pistolMagazineSpares=[_pistolMagazine, _pistolMagazineAmount, _pistolMagazineArray select 1];
    //grenadier mags
    _grenadierMagazineArray=[_grenadierMagazine,getNumber (configfile >> "CfgMagazines" >> _grenadierMagazine >> "count")];
    _grenadierMagazineSpares=[_grenadierMagazine, _grenadierMagazineAmount, _grenadierMagazineArray select 1];
    _grenadierGrenadesSpares=[_grenadierGrenade,_grenadierGrenadeAmount,1];
	//Sniper mags
    _sniperMagazineArray=[_sniperMagazine,getNumber (configfile >> "CfgMagazines" >> _sniperMagazine >> "count")];
    _sniperMagazineSpares=[_sniperMagazine , _sniperMagazineAmount, _sniperMagazineArray select 1];
    //smokes
    _smokes=[_smoke,_smokeAmount,1];
    _grenades=[_handgrenade,_handgrenadeAmount,1];

    _array = missionNamespace getVariable["loadouts", []];
////////////////////////////////////////////////

    //Rifleman loadout
    _array pushBack["loadoutRifleman",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [_OneUseLauncher,"","","",["",1],[],""],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [_vest,[[""],_smokes,_grenades,_weaponMagazineSpares]],
            [_backpack,[[[_OneUseLauncher,"","","",["",1],[],""], 1],["ACE_EntrenchingTool", 1]]],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Team Leader loadout
    _array pushBack["loadoutTeamLeader",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [],
            [_pistol,_pistolMuzzle,_pistolAccessory,_pistolSight,_pistolMagazineArray,[],""],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_grenadierMagazineSpares]],
            [_backpackLeader,[]], 
            _headgearLeader, //helmet
            "", //cosmetic
            ["Binocular","","","",["",0],[],""],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//AT loadout
    _array pushBack["loadoutAT",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [_atLauncher,"","","rhs_optic_maaws",[_atAmmo,1],[],""],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [_atBackpack,[[_atAmmo,3,1]]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//LMG loadout
    _array pushBack["loadoutLMG",
        [
            [_mgWeapon,"",_mgAccessory,"",_mgMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [_vest,[_mgMagazineSpares]],
            [_backpack,[_mgMagazineSpares]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//HMG loadout
    _array pushBack["loadoutHMG",
        [
            [_hmgWeapon,"",_hmgAccessory,"",_hmgMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [_vest,[_hmgMagazineSpares]],
            [_backpack,[_hmgMagazineSpares]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Grenadier loadout
    _array pushBack["loadoutGrenadier",
        [
            [_grenadierWeapon,_grenadierWeaponMuzzle,_weaponAccessory,_weaponSight,_grenadierMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [_vest,[_grenadierMagazineSpares]],
            [_Backpack,[_grenadierGrenadesSpares]],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Medic loadout
    _array pushBack["loadoutMedic",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [_backpackMedic,[["ACE_salineIV",8],["ACE_salineIV_500",8],["ACE_morphine",40],["ACE_tourniquet",4],["ACE_epinephrine",20],["ACE_fieldDressing",80],["ACE_splint", 10]]],
            _headgear, //helmet
            "G_Armband_Med", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
    //spawn loadout
    _array pushBack["loadoutSpawn",
        [
            [],
            [],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 2],["ACE_fieldDressing",20]]],
            [],
            [], 
            "", //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];

    missionNamespace setVariable["loadouts", _array, true];
};