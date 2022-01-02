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
_uniform = "UK3CB_BAF_U_CombatUniform_DDPM";
_vest = "UK3CB_BAF_V_Osprey_DDPM3";
_backpack = "B_AssaultPack_cbr";
_headgear = "UK3CB_BAF_H_Mk6_DDPM_A";
_radio = "TFAR_anprc152";
_gps = "ItemGPS";
_map = "ItemMap";
_compass="ItemCompass";
_watch="ItemWatch";
_nightVision = "";
_weaponSingleUse = "rhs_weap_M136";
_smoke="SmokeShell";
_smokeAmount=2;
_handgrenade="HandGrenade";
_handgrenadeAmount=1;
//main weapon
    _weapon="UK3CB_BAF_L85A2_RIS_G";
    _weaponMagazine="rhs_mag_30Rnd_556x45_M855A1_Stanag";
    _weaponMagazineAmount=10;
    _weaponMuzzle="";
    _weaponAccessory="UK3CB_underbarrel_acc_grippod";
    _weaponSight="rhsusf_acc_compm4";
//sidearm
    _pistol="rhsusf_weap_glock17g4";
    _pistolMagazine="rhsusf_mag_17Rnd_9x19_FMJ";
    _pistolMagazineAmount=1;
    _pistolMuzzle="";
    _pistolAccessory="";
    _pistolSight="";

//AR
_arWeapon="rhs_weap_m249_pip";
_arMagazine="rhsusf_200rnd_556x45_mixed_box";
_arMagazineAmount=2;

//Leader
_backpackLeader = "UK3CB_BAF_B_Bergen_DDPM_SL_A";

//Medic
_backpackMedic = "Coyote_Medicpack";

//rifleman
_riflemanSight="optic_Arco_blk_F";

//grenadier
_grenadierWeapon = "UK3CB_BAF_L85A2_UGL";
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
    //grenadier mags
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
                            "rhs_weap_m72a7", 
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
					["rhsusf_200rnd_556x45_mixed_box",1,200]
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