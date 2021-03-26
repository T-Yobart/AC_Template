/*
    @arsenal
*/
//arsenal contents
_availableHeadgear = [
	"helmet_ACH_Tropentarn",
	"helmet_ACH_Tropentarn_3",
	"helmet_ACH_Tropentarn_4",
	"helmet_ACH_Tropentarn_2",
	"booniehat_Tropentarn",
	"helmet_lwh_Tropentarn",
	"helmet_lwh_Tropentarn_2",
	"helmet_lwh_Tropentarn_3",
	"cap_Tropentarn"
];

_availableGoggles = [
	"rhsusf_shemagh_gogg_tan",
	"rhsusf_shemagh2_gogg_tan",
	"UK3CB_G_Neck_Shemag_Tan",
	"rhsusf_shemagh2_tan",
	"rhsusf_shemagh_tan",
	"rhs_ess_black",
	"rhs_googles_black"
];

_availableUniforms = [
	"Uniform_Full_Tropentarn",
	"Uniform_Rolled_Tropentarn",
	"Uniform_Tanktop_Tropentarn",
	"Uniform_Coveralls_Tropentarn"
];

_availableVests = [
	"vest_spc_Tropentarn",
	"vest_spc_crewman_Tropentarn",
	"vest_spc_radio_Tropentarn",
	"vest_spc_rifleman_Tropentarn"
];

_availableBackpacks = [
	"Tropentarn_Assaultpack",
	"Tropentarn_Medicpack",
	"clf_Tropentarn_prc117g_co",
	"unv_Tropentarn_big_rt1523g",
	"Tropentarn_B_RadioBag_01"
];

_availableWeapons = [
	"rhs_weap_g36kv",
	"rhs_weap_g36kv_ag36",
	"rhs_weap_m249_pip",
	"rhs_weap_M136",
	"rhs_weap_m72a7",
	"CUP_launch_HCPF3_Loaded",
	"hgun_P07_blk_F"
];

_availableOptics = [
	"optic_Aco",
	"optic_Holosight_blk_F",
	"optic_Hamr",
	"optic_Arco_blk_F",
	"rhsusf_acc_compm4",
	"CUP_optic_AC11704_Black",
	"CUP_optic_MicroT1",
	"CUP_optic_MicroT1_low",
	"CUP_optic_CompM4",
	"CUP_optic_Eotech553_Black"
];

_availableMagazines = [
	"rhssaf_30rnd_556x45_EPR_G36",
	"rhs_mag_M441_HE",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"rhsusf_200rnd_556x45_mixed_box",
	"16Rnd_9x21_Mag",
	"rhs_mag_m67",
	"SmokeShell",
	"SmokeShellGreen",
	"SmokeShellBlue",
	"DemoCharge_Remote_Mag"

];

_availableMisc = [
	"ACE_fieldDressing",
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
	"ACE_salineIV",
	"ACE_splint",
	"ACE_tourniquet",
	"ACE_EntrenchingTool",
	"ACE_DefusalKit",
	"ACE_Clacker",
	"ToolKit",
	"Binocular",
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"ItemGPS",
	"ACE_CableTie",
	"TFAR_anprc152"
];

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
