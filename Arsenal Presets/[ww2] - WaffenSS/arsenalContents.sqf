/*
    @arsenal
*/
//arsenal contents
_availableHeadgear = [
	"H_LIB_ST_Helmet2",
	"H_LIB_GER_Helmet_Medic",
	"H_LIB_ST_Helmet",
	"H_LIB_ST_Helmet2",
	"H_LIB_GER_Fieldcap",
	"H_LIB_GER_Helmet",
	"H_LIB_GER_FSJ_M38_Helmet",
	"H_LIB_GER_FSJ_M44_Helmet_Medic",
	"H_LIB_GER_TankOfficerCap",
	"H_LIB_GER_TankPrivateCap"
	
	
];

_availableGoggles = [
	"EAW_Glasses",
	"fow_g_glasses2",
	"fow_g_watch1",
	"G_Lowprofile",
	"usm_gigloves",
	"usm_giglovesscarf",
	"usm_giglovesscarf2",
	"usm_scarf",
	"usm_scarf2",
	"gm_headgear_foliage_summer_forest_01",
	"gm_headgear_foliage_summer_forest_02",
	"gm_headgear_foliage_summer_forest_03",
	"gm_headgear_foliage_summer_forest_04",
	"rhsusf_shemagh_grn",
	"rhsusf_shemagh2_grn",
	"rhsusf_shemagh_gogg_grn",
	"rhsusf_shemagh2_gogg_grn"
];

_availableUniforms = [
	"U_LIB_ST_Unterofficier_E44",
	"U_LIB_ST_Medic_E44",
	"U_LIB_ST_Soldier_Camo",
	"U_LIB_ST_MGunner_E44",
	"U_LIB_ST_Soldier_E44_Camo",
	"U_LIB_ST_Soldier_E44_Camo2",
	"U_LIB_FSJ_Soldier",
	"U_LIB_FSJ_Soldier_camo",
	"U_LIB_GER_Tank_crew_leutnant",
	"U_LIB_GER_Tank_crew_private"
	
	
];

_availableVests = [
	"V_LIB_GER_VestMP40",
	"V_LIB_GER_VestKar98",
	"V_LIB_GER_VestSTG",
	"V_LIB_GER_VestMG",
	"V_LIB_GER_VestG43",
	"V_LIB_GER_FieldOfficer",
	"V_LIB_GER_OfficerVest",
	"V_LIB_GER_TankPrivateBelt"
];

_availableBackpacks = [
	"B_LIB_GER_MedicBackpack",
	"fow_b_ammoboxes",
	"B_LIB_GER_Radio",
	"B_LIB_GER_A_frame",
	"B_LIB_GER_Panzer"

];

_availableWeapons = [
	"LIB_MP40",
	"LIB_M1908",
	"LIB_K98_Late",
	"LIB_MP44",
	"LIB_MG34",
	"LIB_MG42",
	"LIB_G43",
	"LIB_PzFaust_60m",
	"LIB_RPzB",
	"LIB_MP44_GW",
	"LIB_FG42G",
	"LIB_P38"
];

_availableOptics = [
	"LIB_ACC_GW_SB_Empty",
	"LIB_Optic_Zf4",
	"LIB_ACC_K98_Bayo"
];

_availableMagazines = [
	"LIB_32Rnd_9x19",
	"LIB_8Rnd_9x19_P08",
	"LIB_5Rnd_792x57",
	"LIB_30Rnd_792x33",
	"LIB_50Rnd_792x57",
	"LIB_50Rnd_792x57",
	"LIB_10Rnd_792x57",
	"LIB_Shg24",
	"LIB_ACC_K98_Bayo",
	"LIB_NB39",
	"LIB_M39",
	"LIB_1Rnd_PzFaust_60m",
	"LIB_1Rnd_RPzB",
	"LIB_1Rnd_G_SPRGR_30",
	"LIB_1Rnd_G_PZGR_30",
	"LIB_1Rnd_G_PZGR_40",
	"LIB_20Rnd_792x57",
	"LIB_8Rnd_9x19",
	"german_cigpack",
	"murshun_cigs_lighter"
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
	"ZSN_TrenchWhistle",
	"ToolKit",
	"LIB_Binocular_GER",
	"ItemMap",
	"LIB_GER_ItemCompass_deg",
	"LIB_GER_ItemWatch",
	"ACE_CableTie",
	"LIB_ACC_K98_Bayo"
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
