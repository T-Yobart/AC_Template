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
_uniform = "cdf90_afghanka_ttsko_uniform";
_vest = "cdf90_rhs_6b3_AK";
_backpack = "B_AssaultPack_rgr";
_headgear = "cdf90_ssh68_helmet_cover_ttsko_1";
//Misc
_radio = "TFAR_anprc152";
_gps = "ItemGPS";
_map = "ItemMap";
_compass="ItemCompass";
_watch="ItemWatch";
_nightVision = "";
//Grenades
_smoke="SmokeShell";
_smokeAmount=2;
_handgrenade="HandGrenade";
_handgrenadeAmount=1;
//Main Weapon
_weapon="rhs_weap_ak74";
_weaponMagazine="rhs_30Rnd_545x39_7N6M_AK";
_weaponMagazineAmount=8;
_weaponMuzzle="rhs_acc_dtk1983";
_weaponAccessory="";
_weaponSight="";
//One Use Launcher
_OneUseLauncher="rhs_weap_rpg26";
//Sidearm
_pistol="hgun_Rook40_F";
_pistolMagazine="16Rnd_9x21_Mag";
_pistolMagazineAmount=1;
_pistolMuzzle="";
_pistolAccessory="";
_pistolSight="";
//LMG
_mgWeapon="gm_lmgrpk_brn";
_mgMagazine="rhs_75Rnd_762x39mm_tracer";
_mgMagazineAmount=3;
_mgAccessory="";
//HMG
_hmgWeapon="rhs_weap_pkm";
_hmgMagazine="rhs_100Rnd_762x54mmR_green";
_hmgMagazineAmount=1;
_hmgAccessory="";
//Leader
_backpackLeader = "unv_olive_big_rt1523g";
_headgearLeader = "cdf90_beanie_green";
//Medic
_backpackMedic = "Green_Medicpack";
//AT
_atLauncher="rhs_weap_rpg7";
_atAmmo="rhs_rpg7_PG7V_mag";
_atBackpack="rhs_rpg_2";
//grenadier
_grenadierWeapon = "rhs_weap_ak74_gp25";
_grenadierWeaponMuzzle = "rhs_acc_dtk1983";
_grenadierMagazine = "rhs_30Rnd_545x39_7N6M_AK";
_grenadierMagazineAmount = 8; 
_grenadierGrenade="rhs_VOG25";
_grenadierGrenadeAmount = 10; 
//sniper
_sniperWeapon="rhs_weap_svdp_wd";
_sniperMagazine="rhs_10Rnd_762x54mmR_7N1";
_sniperMagazineAmount=10;
_sniperMuzzle="";
_sniperAccessory="";
_sniperSight="rhs_acc_pso1m2";
//Crewman
_headgearCrewman = "rhs_tsh4_ess"; 
_uniformCrewman = "len_lwp_uniform_soldier_80_blue";
//Pilot
_headgearPilot = "rhs_zsh7a_mike_alt";
_uniformPilot = "gm_pl_airforce_uniform_pilot_80_gry"; 

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
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[["ACE_EntrenchingTool",1],_smokes,_grenades,_weaponMagazineSpares]],
            [_backpack,[[[_OneUseLauncher,"","","",["",1],[],""], 2]]],
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
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [_backpackLeader,[]], 
            _headgearLeader, //helmet
            "", //cosmetic
            ["Binocular","","","",["",0],[],""],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Platoon Leader loadout
    _array pushBack["loadoutPlatoonLeader",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [],
            [_pistol,_pistolMuzzle,_pistolAccessory,_pistolSight,_pistolMagazineArray,[],""],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [_backpackLeader,[]], 
            _headgearLeader, //helmet
            "", //cosmetic
            ["Rangefinder","","","",["",0],[],""],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//AT loadout
    _array pushBack["loadoutAT",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [_atLauncher,"","","",[_atAmmo,1],[],""],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
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
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_mgMagazineSpares]],
            [_backpack,[[_mgMagazineSpares],["ACE_SpareBarrel",1,1]]], 
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
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
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
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_grenadierMagazineSpares]],
            [_Backpack,[_grenadierGrenadesSpares]],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Sniper loadout
    _array pushBack["loadoutSniper",
        [
            [_sniperWeapon,_sniperMuzzle,_sniperAccessory,_sniperSight,_sniperMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_sniperMagazineSpares]],
            [_backpack,[]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Engineer loadout
    _array pushBack["loadoutEngineer",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [_OneUseLauncher,"","","",["",1],[],""],
            [],
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[["ACE_EntrenchingTool",1],_smokes,_grenades,_weaponMagazineSpares]],
            [_backpack,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ToolKit",1],["DemoCharge_Remote_Mag",3,1]]], 
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
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [_backpackMedic,[["ACE_salineIV",8],["ACE_salineIV_500",8],["ACE_morphine",40],["ACE_tourniquet",4],["ACE_epinephrine",20],["ACE_fieldDressing",80],["ACE_splint", 10]]],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Crewman loadout
    _array pushBack["loadoutCrewman",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [],
            [],
            [_uniformCrewman,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [[]],
            _headgearCrewman, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
	
	//Pilot loadout
    _array pushBack["loadoutPilot",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [],
            [],
            [_uniformPilot,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [[]],
            _headgearPilot, //helmet
            "", //cosmetic
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
            [_uniform,[["ACE_morphine",5],["ACE_tourniquet",2],["ACE_epinephrine",5],["ACE_splint", 4],["ACE_fieldDressing",20]]],
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