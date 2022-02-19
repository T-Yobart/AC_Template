/*
    @arsenal
*/
//arsenal contents
_availableHeadgear = [
	"H_LIB_GER_HelmetCamo2",
	"H_LIB_GER_HelmetCamo",
	"H_LIB_GER_HelmetCamo4",
	"H_LIB_GER_Cap",
	"H_LIB_GER_OfficerCap"
];

_availableGoggles = [
	"G_Armband_Med"
];

_availableUniforms = [
	"U_LIB_GER_Soldier_camo2",
	"U_LIB_GER_Funker",
	"U_LIB_GER_Soldier_camo3"
];

_availableVests = [
	"V_LIB_GER_VestG43",
	"V_LIB_GER_VestMP40",
	"V_LIB_GER_VestSTG",
	"V_LIB_GER_FieldOfficer",
	"V_LIB_GER_VestMG"
];

_availableBackpacks = [
	"B_LIB_GER_MedicBackpack_Empty",
	"B_LIB_GER_A_frame",
	"B_LIB_GER_Radio",
	"B_LIB_GER_Panzer_Empty"
];

_availableWeapons = [
	"LIB_G41",
	"LIB_MG34",
	"LIB_K98_Late",
	"LIB_K98ZF39",
	"LIB_MP44",
	"LIB_MP40",
	"LIB_RPzB",
	"LIB_P38"
];

_availableOptics = [
	"LIB_ACC_K98_Bayo",
	"LIB_ACC_GW_SB_Empty"
];

_availableMagazines = [
	"LIB_10Rnd_792x57_clip",
	"LIB_50Rnd_792x57",
	"LIB_5Rnd_792x57",
	"LIB_30Rnd_792x33",
	"LIB_32Rnd_9x19",
	"LIB_Shg24",
	"LIB_NB39",
	"LIB_1Rnd_RPzB",
	"LIB_8Rnd_9x19",
	"LIB_1Rnd_G_SPRGR_30"
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
	"ACE_LIB_LadungPM",
	"ToolKit",
	"Binocular",
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"ACE_CableTie",
	"LIB_Ladung_Big_MINE_mag"
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
