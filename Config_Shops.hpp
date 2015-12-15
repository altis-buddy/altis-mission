class WeaponShops {
    //Armory Shops
    class gun {
        name = "Vendeur d'arme";
        side = "civ";
        license = "gun";
        level = -1;
        msg = "";
        items[] = {
            { "hgun_Rook40_F", "", 6500 },
            { "hgun_Pistol_heavy_02_F", "", 9850 },
            { "hgun_ACPC2_F", "", 11500 },
            { "hgun_PDW2000_F", "", 20000 },
            { "optic_ACO_grn_smg", "", 2500 },
            { "V_Rangemaster_belt", "", 4900 },
            { "16Rnd_9x21_Mag", "", 25 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
    };
    class rebel {
        name = "Vendeur Rebelle";
        side = "civ";
        license = "rebel";
        level = -1;
        msg = "";
        items[] = {
            { "arifle_TRG20_F", "", 25000 },
            { "arifle_Katiba_F", "", 30000 },
            { "srifle_DMR_01_F", "", 50000 },
            { "arifle_SDAR_F", "", 20000 },
            { "optic_ACO_grn", "", 3500 },
            { "optic_Holosight", "", 3600 },
            { "acc_flashlight", "", 1000 },
            { "optic_Hamr", "", 7500 },
            { "30Rnd_9x21_Mag", "", 200 },
            { "20Rnd_556x45_UW_mag", "", 125 },
            { "30Rnd_556x45_Stanag", "", 300 },
            { "10Rnd_762x51_Mag", "", 500 },
            { "30Rnd_65x39_caseless_green", "", 275 }
        };
    };
    class gang {
        name = "Armement du Marché Noir";
        side = "civ";
        license = "";
        level = -1;
        msg = "";
        items[] = {
            { "hgun_Rook40_F", "", 1500 },
            { "hgun_Pistol_heavy_02_F", "", 2500 },
            { "hgun_ACPC2_F", "", 4500 },
            { "hgun_PDW2000_F", "", 9500 },
            { "optic_ACO_grn_smg", "", 950 },
            { "V_Rangemaster_belt", "", 1900 },
            { "16Rnd_9x21_Mag", "", 25 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
    };
    //Basic Shops
    class genstore {
        name = "Marchand Général";
        side = "civ";
        license = "";
        level = -1;
        msg = "";
        items[] = {
        	{ "Binocular", "", 150 },
			{ "ItemGPS", "", 100 },
			{ "ToolKit", "", 250 },
			{ "FirstAidKit", "", 150 },
			{ "NVGoggles", "", 2000 },
			{ "Chemlight_red", "", 300 },
			{ "Chemlight_yellow", "", 300 },
			{ "Chemlight_green", "", 300 },
			{ "Chemlight_blue", "", 300 }
        };
    };
    //Cop Shops
    class cop_basic {
        name = "Recrue";
        side = "cop";
        license = "";
        level = 1;
        msg = "";
        items[] = {
        	{ "arifle_sdar_F", "Taser Rifle", 20000 },
			{ "hgun_P07_snds_F", "Stun Pistol", 2000 },
			{ "hgun_P07_F", "", 7500 },
			{ "HandGrenade_Stone", "Flashbang", 1700 },
			{ "Binocular", "", 150 },
			{ "ItemGPS", "", 100 },
			{ "ToolKit", "", 250 },
			{ "muzzle_snds_L", "", 650 },
			{ "FirstAidKit", "", 150 },
			{ "Medikit", "", 1000 },
			{ "NVGoggles", "", 2000 },
			{ "16Rnd_9x21_Mag", "", 50 },
			{ "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 125 }
        };
    };
    class cop_patrol {
        name = "Officier";
        side = "cop";
        license = "";
        level = 2;
        msg = "Tu dois être Officier !";
        items[] = {
        	{ "arifle_MX_F", "", 35000 },
			{ "SMG_02_ACO_F", "", 30000 },
			{ "HandGrenade_Stone", "Flashbang", 1700 },
			{ "MineDetector", "", 1000 },
			{ "acc_flashlight", "", 750 },
			{ "optic_Holosight", "", 1200 },
			{ "optic_Arco", "", 2500 },
			{ "muzzle_snds_H", "", 2750 },
			{ "30Rnd_65x39_caseless_mag", "", 130 },
			{ "30Rnd_9x21_Mag", "", 250 }
        };
    };
    class cop_sergeant {
        name = "Sergent";
        side = "cop";
        license = "";
        level = 3;
        msg = "Tu dois être Sergent !";
        items[] = {
            { "SMG_02_ACO_F", "", 15000 },
			{ "hgun_ACPC2_F", "", 17500 },
			{ "HandGrenade_Stone", "Flashbang", 1700 },
			{ "arifle_MXC_F", "", 30000 },
			{ "optic_Arco", "", 2500 },
			{ "muzzle_snds_H", "", 2750 },
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "30Rnd_9x21_Mag", "", 60 },
			{ "9Rnd_45ACP_Mag", "", 200 }
        };
    };
    class admin {
      name = "Admin";
      side = "cop";
      license = "";
      level = 6;
      msg = "Tu dois être admin !";
      items[] = {
          { "SMG_02_ACO_F", "", 0 },
    { "hgun_ACPC2_F", "", 0 },
    { "HandGrenade_Stone", "Flashbang", 0 },
    { "arifle_MXC_F", "", 0 },
    { "optic_Arco", "", 0 },
    { "muzzle_snds_H", "", 0 },
    { "30Rnd_65x39_caseless_mag", "", 0 },
    { "30Rnd_9x21_Mag", "", 0 },
    { "9Rnd_45ACP_Mag", "", 0 },
    { "srifle_LRR_LRPS_F", "", 0},
    { "7Rnd_408_Mag", "", 0},
    { "arifle_Mk20_MRCO_pointer_F", "", 0},
    { "30Rnd_556x45_Stanag_Tracer_Red", "", 0},
    { "optic_LRPS", "", 0},
    {"V_PlateCarrier1_blk", "", 0},
    {"V_TacVest_blk_POLICE", "", 0},
    { "U_B_CombatUniform_mcam", "", 0},
    { "H_Beret_ocamo", "", 0},
      };
    };
    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level = -1;
        items[] = {
            { "ItemGPS", "", 100 },
			{ "Binocular", "", 150 },
			{ "ToolKit", "", 250 },
			{ "FirstAidKit", "", 150 },
			{ "Medikit", "", 500 },
			{ "NVGoggles", "", 1200 },
			{ "B_FieldPack_ocamo", "", 3000 }
        };
    };
};
