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
 *             ["ACE_morphine",5],
               ["ACE_tourniquet",2],
               ["ACE_epinephrine",5],
               ["ACE_fieldDressing",20],
			   ["ACE_splint", 4]
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

//commons
_uniform = "rhs_uniform_emr_des_patchless";
_vest = "rhs_6b45_rifleman";
_backpack = "OLIVE_Assaultpack";
_headgear = "rhs_6b47";
_radio = "TFAR_anprc152";
_gps = "ItemGPS";
_map = "ItemMap";
_compass="ItemCompass";
_watch="ItemWatch";
_nightVision = "";
_weaponSingleUse = "rhs_weap_rpg26";
_smoke="SmokeShell";
_smokeAmount=2;
_handgrenade="rhs_mag_rgd5";
_handgrenadeAmount=1;
//main weapon
    _weapon="rhs_weap_ak74mr";
    _weaponMagazine="rhs_30Rnd_545x39_7N10_AK";
    _weaponMagazineAmount=10;
    _weaponMuzzle="rhs_acc_dtk3";
    _weaponAccessory="";
    _weaponSight="optic_ACO_grn";
//sidearm
    _pistol="rhs_weap_pya";
    _pistolMagazine="rhs_mag_9x19_17";
    _pistolMagazineAmount=1;
    _pistolMuzzle="";
    _pistolAccessory="";
    _pistolSight="";

//AR
_arWeapon="rhs_weap_pkp";
_arMagazine="rhs_100Rnd_762x54mmR";
_arMagazineAmount=2;

//Leader
_backpackLeader = "unv_olive_big_rt1523g";

//Medic
_backpackMedic = "OLIVE_Medicpack";

//rifleman
_riflemanSight="optic_Arco_blk_F";

//grenadier
_grenadierWeapon = "rhs_weap_ak74mr_gp25";
_grenadierMagazine = _weaponMagazine;
_grenadierMagazineAmount = 8; 
_grenadierGrenade="rhs_VOG25";
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
    //grenadier mags
    _grenadierMagazineArray=[_grenadierMagazine,getNumber (configfile >> "CfgMagazines" >> _grenadierMagazine >> "count")];
    _grenadierMagazineSpares=[_grenadierMagazine, _grenadierMagazineAmount, _grenadierMagazineArray select 1];
    _grenadierGrenadesSpares=[_grenadierGrenade,_grenadierGrenadeAmount,1];
    //smokes
    _smokes=[_smoke,_smokeAmount,1];
    _grenades=[_handgrenade,_handgrenadeAmount,1];

    _array = missionNamespace getVariable["loadouts", []];

    //AT loadout
    _array pushBack["loadoutAT",
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
                "RPG32_Olive",
                "", 
                "", 
                "", 
                ["RPG32_F",4],//ammo
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
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
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
                            "", 
                            "", 
                            "", 
                            "", 
                            [],
                            [], 
                            ""
                        ], 
						1
                    ],
					[],
					["RPG32_F",2,1]
                ]
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //AR loadout
    _array pushBack["loadoutHMG",
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
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
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
                [
                    _arMagazineSpares
                ]
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //leader loadout
    _array pushBack["loadoutSquadLeader",
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
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
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
            [
            	"Binocular",
            	"",
            	"",
            	"",
            	[],
            	[],
            	""
            ],
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
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
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
                            "", 
                            "", 
                            "", 
                            "", 
                            [],
                            [], 
                            ""
                        ], 
						1
                    ],
					["ACE_EntrenchingTool", 1],
					["RPG32_F",1,1],
					["rhs_100Rnd_762x54mmR",1,100]
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
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
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
                _backpackMedic,
                [
                    ["ACE_salineIV",8],
					["ACE_salineIV_500",8],
                    ["ACE_morphine",40],
                    ["ACE_tourniquet",4],
                    ["ACE_epinephrine",20],
                    ["ACE_fieldDressing",80],
					["ACE_splint", 10]
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
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
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
                    ["MineDetector", 1],
					["DemoCharge_Remote_Mag", 2],
					["ACE_Clacker", 1]
                ]
            ],
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];
    //grenadier loadout
    _array pushBack["loadoutTeamLeader",
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
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
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
                [
                    ["ACE_morphine",5],
                    ["ACE_tourniquet",2],
                    ["ACE_epinephrine",5],
                    ["ACE_fieldDressing",20],
					["ACE_splint", 4]
                ]
            ],
            [_vest,[]],
            [], 
            _headgear, //helmet
            "", //cosmetic
            [],
            [_map, _gps, _radio, _compass, _watch, _nightVision]
        ]
    ];

    missionNamespace setVariable["loadouts", _array, true];
};