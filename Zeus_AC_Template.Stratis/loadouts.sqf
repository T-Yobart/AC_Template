/*
 * @file_name: loadout.sqf
 * @file_author: T. Yobart
 *
 * give the ability to make and change loadouts for 
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
 * loadouts made in this file and the editor share 
 * the same format (template written further down)
 * simple variables have been setup for quick edition
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
 *             ["ACE_morphine",4],
 *             ["ACE_tourniquet",2],
 *             ["ACE_epinephrine",4],
 *             ["ACE_fieldDressing",20]
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
//switch to enable the override of editor bound loadouts
_override = true;

//commons
_uniform = "rhs_uniform_cu_ocp";
_vest = "rhsusf_spcs_ocp_rifleman_alt";
_backpack = "B_Kitbag_tan";
_headgear = "rhsusf_ach_helmet_ocp";
_radio = "TFAR_anprc152";
_gps = "ItemGPS";
_map = "ItemMap";
_compass="ItemCompass";
_watch="ItemWatch";
_nightVision = "rhsusf_ANPVS_14";
_weaponSingleUse = "rhs_weap_m136";
_smoke="SmokeShell";
_smokeAmount=1;
_handgrenade="HandGrenade";
_handgrenadeAmount=1;
//main weapon
    _weapon="rhs_weap_mk18_KAC";
    _weaponMagazine="rhs_mag_30Rnd_556x45_M855A1_Stanag";
    _weaponMagazineAmount=10;
    _weaponMuzzle="";
    _weaponAccessory="acc_pointer_IR";
    _weaponSight="optic_Holosight";
//sidearm
    _pistol="rhsusf_weap_glock17g4";
    _pistolMagazine="rhsusf_mag_17Rnd_9x19_JHP";
    _pistolMagazineAmount=1;
    _pistolMuzzle="";
    _pistolAccessory="";
    _pistolSight="";

//AR
_arWeapon="rhs_weap_m249_pip";
_arMagazine="rhsusf_200Rnd_556x45_box";
_arMagazineAmount=5;

//Leader
_backpackLeader = "TFAR_rt1523g_big_rhs";

//rifleman
_riflemanSight="optic_Hamr";

//grenadier
_grenadierWeapon = "rhs_weap_mk18_m320";
_grenadierMagazine = _weaponMagazine;
_grenadierMagazineAmount = 8; 
_grenadierGrenade="rhs_mag_M441_HE";
_grenadierGrenadeAmount = 20; 

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////
if (isServer) then {
    //mags reformat
    //common mags
    _weaponMagazineArray=[_weaponMagazine,getNumber (configfile >> "CfgMagazines" >> _weaponMagazine >> "count")];
    _weaponMagazineSpares=[_weaponMagazine , _weaponMagazineAmount, _weaponMagazineArray select 1];
    //ar mags
    _arMagazineArray=[_arMagazine,getNumber (configfile >> "CfgMagazines" >> _arMagazine >> "count")];
    _arMagazineSpares=[_arMagazine , _arMagazineAmount, _arMagazineArray select 1];
    //pistol mags
    _pistolMagazineArray=[_pistolMagazine,getNumber (configfile >> "CfgMagazines" >> _pistolMagazine >> "count")];
    _pistolMagazineSpares=[_pistolMagazine, _pistolMagazineAmount, _pistolMagazineArray select 1];
    //gren mags
    _grenadierMagazineArray=[_grenadierMagazine,getNumber (configfile >> "CfgMagazines" >> _grenadierMagazine >> "count")];
    _grenadierMagazineSpares=[_grenadierMagazine, _grenadierMagazineAmount, _grenadierMagazineArray select 1];
    _grenadierGrenadesSpares=[_grenadierGrenade,_grenadierGrenadeAmount,1];
    //smokes
    _smokes=[_smoke,_smokeAmount,1];
    _grenades=[_handgrenade,_handgrenadeAmount,1];

    _array = missionNamespace getVariable["loadouts", []];


    //AR loadout
    _array pushBack["loadoutAutomaticRifleman",
        [
            [
                _arWeapon, //weapon
                "", //muzzle
                _weaponAccessory, //accessory
                _weaponSight, //optic
                _arMagazineArray, //magazine
                [], //grenade
                ""//bipod
            ],
            [
                _weaponSingleUse,
                "", 
                "", 
                "", 
                [],//ammo
                [], 
                ""
            ],
            [
                _pistol, 
                _pistolMuzzle, 
                _pistolAccessory, 
                _pistolSight, 
                _pistolMagazineArray,
                [], 
                ""
            ],
            [
                _uniform,
                [
                    ["ACE_morphine",4],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",4],
                    ["ACE_fieldDressing",20]
                ]
            ],
            [
                _vest,
                [
                    _arMagazineSpares,
                    _smokes,
                    _grenades,
                    _pistolMagazineSpares
                ]
            ],
            [
                _backpack,
                []
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //leader loadout
    _array pushBack["loadoutTeamLeader",
        [
            [
                _weapon, //weapon
                _weaponMuzzle, //muzzle
                _weaponAccessory, //accessory
                _weaponSight, //optic
                _WeaponMagazineArray, //magazine
                [], //grenade
                ""//bipod
            ],
            [],
            [
                _pistol, 
                _pistolMuzzle, 
                _pistolAccessory, 
                _pistolSight, 
                _pistolMagazineArray,
                [], 
                ""
            ],
            [
                _uniform, 
                [
                    ["ACE_morphine",4],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",4],
                    ["ACE_fieldDressing",20]
                ]
            ],
            [
                _vest, 
                [
                    _smokes,
                    _grenades,
                    _weaponMagazineSpares,
                    _pistolMagazineSpares
                ]
            ],
            [
                _backpackLeader,
                []
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //rifleman loadout
    _array pushBack["loadoutRifleman",
        [
            [
                _weapon, //weapon
                _weaponMuzzle, //muzzle
                _weaponAccessory, //accessory
                _riflemanSight, //optic
                _WeaponMagazineArray, //magazine
                [], //grenade
                ""//bipod
            ],
            [
                _weaponSingleUse,
                "", 
                "", 
                "", 
                [],//ammo
                [], 
                ""
            ],
            [
                _pistol, 
                _pistolMuzzle, 
                _pistolAccessory, 
                _pistolSight, 
                _pistolMagazineArray,
                [], 
                ""
            ],
            [
                _uniform, 
                [
                    ["ACE_morphine",4],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",4],
                    ["ACE_fieldDressing",20]
                ]
            ],
            [
                _vest, 
                [
                    _smokes,
                    _grenades,
                    _weaponMagazineSpares,
                    _pistolMagazineSpares
                ]
            ],
            [
                _backpack,
                [        
                    [
                        [
                            _weaponSingleUse, 
                            "", 
                            "", 
                            "", 
                            [],
                            [], 
                            ""
                        ], 
                        2
                    ]
                ]
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //medic loadout
    _array pushBack["loadoutMedic",
        [
            [
                _weapon, //weapon
                _weaponMuzzle, //muzzle
                _weaponAccessory, //accessory
                _weaponSight, //optic
                _WeaponMagazineArray, //magazine
                [], //grenade
                ""//bipod
            ],
            [],
            [
                _pistol, 
                _pistolMuzzle, 
                _pistolAccessory, 
                _pistolSight, 
                _pistolMagazineArray,
                [], 
                ""
            ],
            [
                _uniform, 
                [
                    ["ACE_morphine",4],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",4],
                    ["ACE_fieldDressing",20]
                ]
            ],
            [
                _vest, 
                [
                    _smokes,
                    _grenades,
                    _weaponMagazineSpares,
                    _pistolMagazineSpares
                ]
            ],
            [
                _backpack,
                [
                    ["ACE_salineIV",8],
                    ["ACE_morphine",10],
                    ["ACE_tourniquet",6],
                    ["ACE_epinephrine",10],
                    ["ACE_fieldDressing",40]
                ]
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //engineer loadout
    _array pushBack["loadoutEngineer",
        [
            [
                _weapon, //weapon
                _weaponMuzzle, //muzzle
                _weaponAccessory, //accessory
                _weaponSight, //optic
                _WeaponMagazineArray, //magazine
                [], //grenade
                ""//bipod
            ],
            [
                _weaponSingleUse,
                "", 
                "", 
                "", 
                [],//ammo
                [], 
                ""
            ],
            [
                _pistol, 
                _pistolMuzzle, 
                _pistolAccessory, 
                _pistolSight, 
                _pistolMagazineArray,
                [], 
                ""
            ],
            [
                _uniform, 
                [
                    ["ACE_morphine",4],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",4],
                    ["ACE_fieldDressing",20]
                ]
            ],
            [
                _vest, 
                [
                    _smokes,
                    _grenades,
                    _weaponMagazineSpares,
                    _pistolMagazineSpares
                ]
            ],
            [
                _backpack,
                [
                    ["ToolKit", 1],
                    ["MineDetector", 1]
                ]
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //grenadier loadout
    _array pushBack["loadoutGrenadier",
        [
            [
                _grenadierWeapon, //weapon
                _weaponMuzzle, //muzzle
                _weaponAccessory, //accessory
                _weaponSight, //optic
                _grenadierMagazineArray, //magazine
                [], //grenade
                ""//bipod
            ],
            [],
            [
                _pistol, 
                _pistolMuzzle, 
                _pistolAccessory, 
                _pistolSight, 
                _pistolMagazineArray,
                [], 
                ""
            ],
            [
                _uniform, 
                [
                    ["ACE_morphine",4],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",4],
                    ["ACE_fieldDressing",20]
                ]
            ],
            [
                _vest, 
                [
                    _smokes,
                    _grenades,
                    _grenadierMagazineSpares,
                    _pistolMagazineSpares
                ]
            ],
            [
                _backpack,
                [
                    _grenadierGrenadesSpares
                ]
            ], 
            _headgear, //helmet
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
            [
                _uniform,
                []
            ],
            [],
            [], 
            "", //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];

    missionNamespace setVariable["loadoutoverride", _override, true];
    if (_override) then {
        missionNamespace setVariable["loadouts", _array, true];
    }
};