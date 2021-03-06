/*
    @arsenal
*/
//arsenal contents
_availableHeadgear = [
	"helmet_ACH_CCE",
	"helmet_ACH_CCE_3",
	"helmet_ACH_CCE_4",
	"helmet_ACH_CCE_2",
	"booniehat_CCE",
	"helmet_lwh_CCE",
	"helmet_lwh_CCE_2",
	"helmet_lwh_CCE_3",
	"cap_CCE"
];

_availableGoggles = [
	"rhsusf_shemagh_gogg_grn",
	"rhsusf_shemagh2_gogg_grn",
	"UK3CB_G_Neck_Shemag_oli",
	"rhsusf_shemagh2_grn",
	"rhsusf_shemagh_grn",
	"rhs_ess_black",
	"rhs_googles_black"
];

_availableUniforms = [
	"Uniform_Full_CCE",
	"Uniform_Rolled_CCE",
	"Uniform_Tanktop_CCE",
	"Uniform_Coveralls_CCE"
];

_availableVests = [
	"vest_spc_CCE",
	"vest_spc_crewman_CCE",
	"vest_spc_radio_CCE",
	"vest_spc_rifleman_CCE"
];

_availableBackpacks = [
	"CCE_Assaultpack",
	"CCE_Medicpack",
	"clf_CCE_prc117g_co",
	"unv_CCE_big_rt1523g",
	"CCE_B_RadioBag_01"
];

_availableWeapons = [
	"CUP_Famas_F1_Rail",
	"CUP_arifle_HK416_Black",
	"CUP_arifle_HK416_CQB_M203_Black",
	"rhs_weap_m249_pip",
	"rhs_weap_M136",
	"rhs_weap_m72a7",
	"rhsusf_weap_glock17g4"
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
	"CUP_25Rnd_556x45_Famas",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_M441_HE",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"rhsusf_200rnd_556x45_mixed_box",
	"rhsusf_mag_15Rnd_9x19_JHP",
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
