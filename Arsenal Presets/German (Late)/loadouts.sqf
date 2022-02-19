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
_uniform = "U_LIB_GER_Soldier_camo3";
_vest = "V_LIB_GER_VestG43";
_backpack = "";
_headgear = "H_LIB_GER_HelmetCamo";
//Misc
_map = "ItemMap";
_compass="ItemCompass";
_watch="ItemWatch";
//Grenades
_smoke="LIB_NB39";
_smokeAmount=1;
_handgrenade="LIB_Shg24";
_handgrenadeAmount=1;
//Main Weapon
_weapon="LIB_G41";
_weaponMagazine="LIB_10Rnd_792x57_clip";
_weaponMagazineAmount=5;
_weaponMuzzle="";
_weaponAccessory="";
_weaponSight="";
//Sidearm
_pistol="LIB_P38";
_pistolMagazine="LIB_8Rnd_9x19";
_pistolMagazineAmount=1;
_pistolMuzzle="";
_pistolAccessory="";
_pistolSight="";
//Assault Weapon
_assaultweapon="LIB_MP44";
_assaultweaponMagazine="LIB_30Rnd_792x33";
_assaultweaponMagazineAmount=4;
_assaultweaponMuzzle="";
_assaultweaponAccessory="";
_assaultweaponSight="";
//MG
_mgWeapon="LIB_MG34";
_mgMagazine="LIB_50Rnd_792x57";
_mgMagazineAmount=4;
_mgbackpack="B_LIB_GER_A_frame";
//Leader
_backpackLeader = "B_LIB_GER_Radio";
_headgearLeader = "H_LIB_GER_OfficerCap";
//Medic
_backpackMedic = "B_LIB_SOV_RA_MedicalBag_Empty";
//Engineer
_backpackEngineer ="B_LIB_GER_A_frame";
//AT
_atLauncher="LIB_RPzB";
_atAmmo="LIB_1Rnd_RPzB";
_atBackpack="B_LIB_GER_Panzer_Empty";
//grenadier
_grenadierWeapon = "LIB_K98_Late";
_grenadierWeaponMuzzle = "LIB_ACC_GW_SB_Empty";
_grenadierMagazine = "LIB_5Rnd_792x57";
_grenadierMagazineAmount = 10; 
_grenadierGrenade="LIB_1Rnd_G_SPRGR_30";
_grenadierGrenadeAmount = 6; 
//sniper
_sniperWeapon="LIB_K98ZF39";
_sniperMagazine="LIB_5Rnd_792x57";
_sniperMagazineAmount=10;
_sniperMuzzle="";
_sniperAccessory="";
_sniperSight="";

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
if (isServer) then {
    //Main mags
    _weaponMagazineArray=[_weaponMagazine,getNumber (configfile >> "CfgMagazines" >> _weaponMagazine >> "count")];
    _weaponMagazineSpares=[_weaponMagazine , _weaponMagazineAmount, _weaponMagazineArray select 1];
	//Assault mags
    _assaultweaponMagazineArray=[_assaultweaponMagazine,getNumber (configfile >> "CfgMagazines" >> _assaultweaponMagazine >> "count")];
    _assaultweaponMagazineSpares=[_assaultweaponMagazine , _assaultweaponMagazineAmount, _assaultweaponMagazineArray select 1];
    //MG mags
    _mgMagazineArray=[_mgMagazine,getNumber (configfile >> "CfgMagazines" >> _mgMagazine >> "count")];
    _mgMagazineSpares=[_mgMagazine , _mgMagazineAmount, _mgMagazineArray select 1];
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
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[["ACE_EntrenchingTool",1],_smokes,_grenades,_weaponMagazineSpares]],
            [_backpack,[]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//Assault loadout
    _array pushBack["loadoutAssault",
        [
            [_assaultweapon,_assaultweaponMuzzle,_assaultweaponAccessory,_assaultweaponSight,_assaultWeaponMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_smokes,_grenades,_assaultweaponMagazineSpares]],
            [_backpack,[]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//Squad Leader loadout
    _array pushBack["loadoutSquadLeader",
        [
            [_assaultweapon,_assaultweaponMuzzle,_assaultweaponAccessory,_assaultweaponSight,_assaultWeaponMagazineArray,[],""],
            [],
            [_pistol,_pistolMuzzle,_pistolAccessory,_pistolSight,_pistolMagazineArray,[],""],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_smokes,_grenades,_assaultweaponMagazineSpares]],
            [_backpack,[]], 
            _headgearLeader, //helmet
            "", //cosmetic
            ["Binocular","","","",["",0],[],""],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//Team Leader loadout
    _array pushBack["loadoutTeamLeader",
        [
            [_assaultweapon,_assaultweaponMuzzle,_assaultweaponAccessory,_assaultweaponSight,_assaultWeaponMagazineArray,[],""],
            [],
            [_pistol,_pistolMuzzle,_pistolAccessory,_pistolSight,_pistolMagazineArray,[],""],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_smokes,_grenades,_assaultweaponMagazineSpares]],
            [_backpackLeader,[]], 
            _headgear, //helmet
            "", //cosmetic
            ["Binocular","","","",["",0],[],""],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//AT loadout
    _array pushBack["loadoutAT",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [_atLauncher,"","","",[_atAmmo,1],[],""],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [_atBackpack,[[_atAmmo,1,1]]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//MG loadout
    _array pushBack["loadoutMG",
        [
            [_mgWeapon,"","","",_mgMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_mgMagazineSpares]],
            [_mgbackpack,[_mgMagazineSpares]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//Grenadier loadout
    _array pushBack["loadoutGrenadier",
        [
            [_grenadierWeapon,_grenadierWeaponMuzzle,_weaponAccessory,_weaponSight,_grenadierMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_grenadierGrenadesSpares,_grenadierMagazineSpares]],
            [_backpack,[]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//Sniper loadout
    _array pushBack["loadoutSniper",
        [
            [_sniperWeapon,_sniperMuzzle,_sniperAccessory,_sniperSight,_sniperMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_smokes,_grenades,_sniperMagazineSpares]],
            [_backpack,[]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//Engineer loadout
    _array pushBack["loadoutEngineer",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[["ACE_EntrenchingTool",1],_smokes,_grenades,_weaponMagazineSpares]],
            [_backpackEngineer,[["ACE_LIB_LadungPM",1],["ACE_DefusalKit",1],["LIB_Ladung_Big_MINE_mag",2,1]]], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
	//Medic loadout
    _array pushBack["loadoutMedic",
        [
            [_weapon,_weaponMuzzle,_weaponAccessory,_weaponSight,_WeaponMagazineArray,[],""],
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [_vest,[_smokes,_grenades,_weaponMagazineSpares]],
            [_backpackMedic,[["ACE_salineIV",8],["ACE_salineIV_500",8],["ACE_morphine",40],["ACE_tourniquet",4],["ACE_epinephrine",20],["ACE_fieldDressing",80],["ACE_splint", 10]]],
            _headgear, //helmet
            "G_Armband_Med", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];
	
    //spawn loadout
    _array pushBack["loadoutSpawn",
        [
            [],
            [],
            [],
            [_uniform,[["ACE_morphine",4],["ACE_tourniquet",1],["ACE_epinephrine",4],["ACE_splint", 2],["ACE_fieldDressing",16]]],
            [],
            [], 
            "", //helmet
            "", //cosmetic
            [],
            [_map, "", "", _compass, _watch, ""]
        ]
    ];

    missionNamespace setVariable["loadouts", _array, true];
};