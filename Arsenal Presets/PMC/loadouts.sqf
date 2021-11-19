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
_uniform = "UK3CB_ADM_B_U_Shirt_Pants_01_BLU_WDL_ALT";
_vest = "V_PlateCarrier1_blk";
_backpack = "B_AssaultPack_blk";
_headgear = "H_Cap_blk_ION";
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
    _weapon="arifle_TRG21_F";
    _weaponMagazine="rhs_mag_30Rnd_556x45_M855A1_Stanag";
    _weaponMagazineAmount=10;
    _weaponMuzzle="";
    _weaponAccessory="";
    _weaponSight="rhsusf_acc_compm4";
//sidearm
    _pistol="rhsusf_weap_m9";
    _pistolMagazine="rhsusf_mag_15Rnd_9x19_FMJ";
    _pistolMagazineAmount=1;
    _pistolMuzzle="";
    _pistolAccessory="";
    _pistolSight="";

//AR
_arWeapon="rhs_weap_m249_pip";
_arMagazine="rhsusf_200rnd_556x45_mixed_box";
_arMagazineAmount=2;

//Marksman
_marksMagazine="rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
_marksMagazineAmount=10;
_marksmanSight="UK3CB_BAF_TA648";

//Leader
_backpackLeader = "unv_black_big_rt1523g";

//Medic
_backpackMedic = "Black_Medicpack";

//rifleman
_riflemanSight="optic_Hamr";

//grenadier
_grenadierWeapon = "arifle_TRG21_GL_F";
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
	//marksman mags
    _marksMagazineArray=[_marksMagazine,getNumber (configfile >> "CfgMagazines" >> _marksMagazine >> "count")];
    _marksMagazineSpares=[_marksMagazine , _marksMagazineAmount, _marksMagazineArray select 1];
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
	//marksman loadout
    _array pushBack["loadoutMarksman",
        [
            [
                "rhs_weap_sr25", //weapon
                _weaponMuzzle, //muzzle
                _weaponAccessory, //accessory
				_marksMagazineArray, //magazine
                _marksmanSight, //optic
                [], //grenade
                "bipod_01_F_blk"//bipod
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
                    _marksMagazineSpares,
                    _pistolMagazineSpares
                ]
            ],
            [
                _backpack,
                [        
                ]
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