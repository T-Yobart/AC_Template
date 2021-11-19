/*
    @arsenal
*/
//arsenal contents
_availableHeadgear = [
	"rhsusf_lwh_helmet_marpatd",
	"rhsusf_lwh_helmet_marpatd_ess",
	"rhsusf_lwh_helmet_marpatd_headset",
	"rhs_booniehat2_marpatd"
];

_availableGoggles = [
	"UK3CB_G_Neck_Shemag_Tan",
	"UK3CB_G_Neck_Shemag",
	"rhsusf_shemagh_tan",
	"rhsusf_shemagh2_tan",
	"rhsusf_shemagh2_gogg_tan",
	"rhsusf_shemagh_gogg_tan",
	"rhsusf_oakley_goggles_blk",
	"rhs_googles_black",
	"G_Lowprofile"
];

_availableUniforms = [
	"rhs_uniform_FROG01_d"
];

_availableVests = [
	"rhsusf_spc",
	"rhsusf_spc_corpsman",
	"rhsusf_spc_crewman",
	"rhsusf_spc_iar",
	"rhsusf_spc_light",
	"rhsusf_spc_mg",
	"rhsusf_spc_patchless",
	"rhsusf_spc_patchless_radio",
	"rhsusf_spc_rifleman",
	"rhsusf_spc_squadleader",
	"rhsusf_spc_teamleader"
];

_availableBackpacks = [
	"B_AssaultPack_cbr",
	"Coyote_Medicpack",
	"clf_MARPAT_D_prc117g_co",
	"unv_MARPAT_D_big_rt1523g"
];

_availableWeapons = [
	"UK3CB_M16A3",
	"rhs_weap_m4a1_carryhandle_m203",
	"rhs_weap_m249_pip",
	"rhs_weap_m72a7",
	"rhs_weap_M136",
	"rhsusf_weap_m9"
];

_availableOptics = [
	"optic_Aco",
	"optic_Holosight_blk_F",
	"rhsusf_acc_eotech_xps3",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
	"rhsusf_acc_T1_high",
	"optic_Hamr",
	"optic_Arco_blk_F"
];

_availableMagazines = [
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_M441_HE",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"rhsusf_200rnd_556x45_mixed_box",
	"rhsusf_mag_15Rnd_9x19_FMJ",
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
	"TFAR_anprc152",
	"rhsusf_ANPVS_14"
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
