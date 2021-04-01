private["_worldName"];
 _worldName = tolower(worldName);
 ["SETTING UP MAP: panthera3"] call ALiVE_fnc_dump;
 ALIVE_Indexing_Blacklist = [];
 ALIVE_airBuildingTypes = [];
 ALIVE_militaryParkingBuildingTypes = [];
 ALIVE_militarySupplyBuildingTypes = [];
 ALIVE_militaryHQBuildingTypes = [];
 ALIVE_militaryAirBuildingTypes = [];
 ALIVE_civilianAirBuildingTypes = [];
 ALiVE_HeliBuildingTypes = [];
 ALIVE_militaryHeliBuildingTypes = [];
 ALIVE_civilianHeliBuildingTypes = [];
 ALIVE_militaryBuildingTypes = [];
 ALIVE_civilianPopulationBuildingTypes = [];
 ALIVE_civilianHQBuildingTypes = [];
 ALIVE_civilianPowerBuildingTypes = [];
 ALIVE_civilianCommsBuildingTypes = [];
 ALIVE_civilianMarineBuildingTypes = [];
 ALIVE_civilianRailBuildingTypes = [];
 ALIVE_civilianFuelBuildingTypes = [];
 ALIVE_civilianConstructionBuildingTypes = [];
 ALIVE_civilianSettlementBuildingTypes = [];

 ALiVE_mapCompositionType = "Woodland";

 if(tolower(_worldName) == "panthera3") then {
ALIVE_Indexing_Blacklist = ALIVE_Indexing_Blacklist + ["ca\air2\uh1y\uh1y_crashed.p3d","ibr\panthera_objects\jablon.p3d","a3\structures_f\households\house_small02\d_house_small_02_v1_f.p3d","a3\structures_f\mil\bunker\bunker_f.p3d","ca\buildings2\a_generalstore_01\a_generalstore_01.p3d","ca\misc\mi8_crashed.p3d","ca\buildings2\misc_cargo\seacrate.p3d","ca\air2\uh1y\uh1ywreck.p3d","ca\buildings\dum_zboreny_lidice.p3d","a3\structures_f\civ\lamps\lampsolar_off_f.p3d","ibr\panthera_objects\ibr_most_bez_lamp.p3d","ibr\panthera_objects\conslab.p3d","ibr\panthera_objects\ibr_most_stred30.p3d","ca\buildings2\houseruins\r_housev2_01a.p3d","ca\buildings\dum_istan4_zidka.p3d","ca\structures\wall\wall_woodvil_pole.p3d","ca\buildings2\shed_small\shed_m02.p3d","ca\structures_e\ind\ind_coltan_mine\ind_coltan_tunnel_ep1.p3d","ibr\ibr_dinopark\ibr_zoofence.p3d","ibr\ibr_dinopark\ibr_zoodoor.p3d","ibr\ibr_dinopark\ibr_zoogate.p3d"];
ALIVE_militaryBuildingTypes = ALIVE_militaryBuildingTypes + ["ca\buildings\hlidac_budka.p3d","ca\buildings\fuelstation_army.p3d","ca\buildings\posed.p3d","a3\structures_f\mil\barracks\i_barracks_v2_f.p3d","ca\buildings\telek1.p3d","ca\buildings\hangar_2.p3d","a3\structures_f\ind\airport\airport_tower_f.p3d","ca\buildings2\ind_workshop01\ind_workshop01_l.p3d","ca\buildings2\ind_workshop01\ind_workshop01_03.p3d","a3\structures_f\mil\offices\miloffices_v1_f.p3d","a3\structures_f\mil\barracks\u_barracks_v2_f.p3d","ca\structures\mil\mil_controltower.p3d","ca\buildings\tents\camo_box.p3d","ca\structures\mil\mil_barracks_i.p3d","ca\buildings\hospital.p3d","a3\structures_f\research\research_house_v1_f.p3d","a3\structures_f\research\research_hq_f.p3d","a3\structures_f\ind\airport\hangar_f.p3d","a3\structures_f\mil\tenthangar\tenthangar_v1_f.p3d","ca\structures\mil\mil_house.p3d","a3\structures_f\research\dome_small_plates_f.p3d","a3\structures_f\research\dome_small_f.p3d","a3\structures_f\mil\cargo\cargo_patrol_v2_f.p3d","a3\structures_f\mil\cargo\cargo_patrol_v1_f.p3d","a3\structures_f\walls\mil_wallbig_gate_f.p3d","a3\structures_f\mil\cargo\cargo_hq_v1_f.p3d","ca\structures\mil\mil_guardhouse.p3d","a3\structures_f\mil\cargo\medevac_house_v1_f.p3d"];
ALIVE_militaryParkingBuildingTypes = ALIVE_militaryParkingBuildingTypes + ["a3\structures_f\ind\airport\hangar_f.p3d","a3\structures_f\mil\tenthangar\tenthangar_v1_f.p3d","a3\structures_f\research\dome_small_f.p3d"];
ALIVE_militarySupplyBuildingTypes = ALIVE_militarySupplyBuildingTypes + ["ca\buildings\hlidac_budka.p3d","ca\buildings\hangar_2.p3d","a3\structures_f\mil\offices\miloffices_v1_f.p3d","a3\structures_f\mil\barracks\u_barracks_v2_f.p3d","ca\structures\mil\mil_barracks_i.p3d","a3\structures_f\research\research_hq_f.p3d","a3\structures_f\ind\airport\hangar_f.p3d","a3\structures_f\mil\tenthangar\tenthangar_v1_f.p3d","ca\structures\mil\mil_house.p3d","a3\structures_f\research\dome_small_f.p3d","a3\structures_f\mil\cargo\cargo_patrol_v1_f.p3d","a3\structures_f\mil\cargo\cargo_hq_v1_f.p3d","a3\structures_f\mil\cargo\medevac_house_v1_f.p3d"];
ALIVE_militaryHQBuildingTypes = ALIVE_militaryHQBuildingTypes + ["a3\structures_f\mil\offices\miloffices_v1_f.p3d","a3\structures_f\mil\barracks\u_barracks_v2_f.p3d","ca\structures\mil\mil_barracks_i.p3d","a3\structures_f\research\research_hq_f.p3d","a3\structures_f\ind\airport\hangar_f.p3d","ca\structures\mil\mil_house.p3d","a3\structures_f\research\dome_small_f.p3d","a3\structures_f\mil\cargo\cargo_hq_v1_f.p3d"];
ALIVE_airBuildingTypes = ALIVE_airBuildingTypes + ["ca\roads2\runway_main.p3d","ibr\panthera_objects\runway_end9_reverse.p3d","ca\roads2\runway_poj_t_2.p3d","ibr\panthera_objects\runway_end27.p3d","ca\roads2\runway_poj_l_1_end.p3d","ca\roads\runway_end128.p3d","ibr\panthera_objects\runway_end32.p3d","ibr\panthera_objects\runway_end14.p3d","ca\roads\runway_end9.p3d","ibr\panthera_objects\runway_end36.p3d","ibr\panthera_objects\runway_end18.p3d"];
ALIVE_militaryAirBuildingTypes = ALIVE_militaryAirBuildingTypes + ["ca\roads2\runway_main.p3d","ibr\panthera_objects\runway_end9_reverse.p3d","ca\roads2\runway_poj_t_2.p3d","ibr\panthera_objects\runway_end27.p3d","ca\roads2\runway_poj_l_1_end.p3d","ca\roads\runway_end128.p3d","ibr\panthera_objects\runway_end32.p3d","ibr\panthera_objects\runway_end14.p3d","ca\roads\runway_end9.p3d","ibr\panthera_objects\runway_end36.p3d","ibr\panthera_objects\runway_end18.p3d"];
ALIVE_civilianAirBuildingTypes = ALIVE_civilianAirBuildingTypes + [];
ALIVE_heliBuildingTypes = ALIVE_heliBuildingTypes + ["ca\misc\heli_h_civil.p3d"];
ALIVE_militaryHeliBuildingTypes = ALIVE_militaryHeliBuildingTypes + ["ca\misc\heli_h_civil.p3d"];
ALIVE_civilianHeliBuildingTypes = ALIVE_civilianHeliBuildingTypes + [];
ALIVE_civilianPopulationBuildingTypes = ALIVE_civilianPopulationBuildingTypes + ["ca\buildings\sara_domek_sedy.p3d","a3\structures_f\households\house_shop01\i_shop_01_v3_f.p3d","a3\structures_f\households\house_small01\i_house_small_01_v3_f.p3d","a3\structures_f\households\slum\slum_house03_f.p3d","a3\structures_f\households\slum\slum_house02_f.p3d","ca\structures_e\housec\house_c_2_ep1.p3d","a3\structures_f\households\house_shop01\u_shop_01_v1_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v2_f.p3d","a3\structures_f\households\house_small01\u_house_small_01_v1_f.p3d","a3\structures_f\households\house_big01\i_house_big_01_v1_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v1_f.p3d","a3\structures_f\households\house_big01\u_house_big_01_v1_f.p3d","ca\structures_e\housec\house_c_4_ep1.p3d","a3\structures_f\households\house_small01\i_house_small_01_v2_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v3_f.p3d","a3\structures_f\households\house_small02\i_house_small_02_v1_f.p3d","a3\structures_f\households\house_small02\u_house_small_02_v1_f.p3d","ca\structures_e\housek\house_k_7_ep1.p3d","a3\structures_f\households\house_big01\i_house_big_01_v3_f.p3d","a3\structures_f\households\house_small01\i_house_small_01_v1_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v1_f.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v2_f.p3d","a3\structures_f\households\stone_small\i_stone_housesmall_v1_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v2_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v3_f.p3d","a3\structures_f\households\house_big02\u_house_big_02_v1_f.p3d","ca\structures_e\housec\house_c_5_v1_ep1.p3d","a3\structures_f\civ\offices\offices_01_v1_f.p3d","ca\buildings\dum_istan3_hromada2.p3d","ca\buildings\deutshe_mini.p3d","ca\structures_e\housec\house_c_1_v2_ep1.p3d","ca\structures_e\housec\house_c_1_ep1.p3d","ca\structures_e\housea\a_office01\a_office01_ep1.p3d","ca\buildings\dum_rasovna.p3d","ca\buildings\sara_domek_zluty.p3d","a3\structures_f\households\house_small03\i_house_small_03_v1_f.p3d","ca\structures\house\a_office01\a_office01.p3d","ca\structures_e\housek\house_k_6_ep1.p3d","a3\structures_f\ind\shed\i_shed_ind_f.p3d","ca\structures_e\housec\house_c_12_ep1.p3d","ca\structures_e\housec\house_c_5_v3_ep1.p3d","a3\structures_f\civ\chapels\chapel_v1_f.p3d","ca\structures_e\housec\house_c_3_ep1.p3d","ca\structures_e\housec\house_c_10_ep1.p3d","ca\structures_e\housec\house_c_5_ep1.p3d","a3\structures_f\households\house_big01\i_house_big_01_v2_f.p3d","a3\structures_f\households\house_shop01\i_shop_01_v1_f.p3d","a3\structures_f\households\house_small02\i_house_small_02_v3_f.p3d","a3\structures_f\households\house_shop01\i_shop_01_v2_f.p3d","ca\structures_e\housec\house_c_11_ep1.p3d","ca\structures_e\housec\house_c_5_v2_ep1.p3d","ca\buildings\dum_mesto_in.p3d","ca\buildings\hut04.p3d","ca\buildings\hut02.p3d","ca\buildings\hut01.p3d","ca\buildings\hut06.p3d","ca\buildings\sara_stodola.p3d","ca\buildings2\a_pub\a_pub_01.p3d","ca\buildings2\barn_metal\barn_metal.p3d","a3\structures_f\civ\chapels\chapel_v2_f.p3d","a3\structures_f\households\house_shop02\u_shop_02_v1_f.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v1_f.p3d","ca\structures_e\housek\house_k_8_ep1.p3d","ca\structures_e\housek\house_k_5_ep1.p3d","ca\structures\barn_w\barn_w_01.p3d","ca\structures_e\housek\house_k_3_ep1.p3d","ca\structures_e\housea\a_villa\a_villa_ep1.p3d","a3\structures_f\households\stone_small\i_stone_housesmall_v2_f.p3d","a3\structures_f\households\house_small03\i_house_small_03_v1_dam_f.p3d","a3\structures_f\households\stone_shed\i_stone_shed_v2_f.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v3_f.p3d"];
ALIVE_civilianHQBuildingTypes = ALIVE_civilianHQBuildingTypes + ["ca\buildings\sara_domek_sedy.p3d","a3\structures_f\households\house_shop01\i_shop_01_v3_f.p3d","a3\structures_f\households\house_small01\i_house_small_01_v3_f.p3d","ca\structures_e\housec\house_c_2_ep1.p3d","a3\structures_f\households\house_shop01\u_shop_01_v1_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v2_f.p3d","a3\structures_f\households\house_small01\u_house_small_01_v1_f.p3d","a3\structures_f\households\house_big01\i_house_big_01_v1_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v1_f.p3d","a3\structures_f\households\house_big01\u_house_big_01_v1_f.p3d","ca\structures_e\housec\house_c_4_ep1.p3d","a3\structures_f\households\house_small01\i_house_small_01_v2_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v3_f.p3d","a3\structures_f\households\house_small02\i_house_small_02_v1_f.p3d","a3\structures_f\households\house_small02\u_house_small_02_v1_f.p3d","ca\structures_e\housek\house_k_7_ep1.p3d","a3\structures_f\households\house_big01\i_house_big_01_v3_f.p3d","a3\structures_f\households\house_small01\i_house_small_01_v1_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v1_f.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v2_f.p3d","a3\structures_f\households\stone_small\i_stone_housesmall_v1_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v2_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v3_f.p3d","a3\structures_f\households\house_big02\u_house_big_02_v1_f.p3d","ca\structures_e\housec\house_c_5_v1_ep1.p3d","a3\structures_f\civ\offices\offices_01_v1_f.p3d","ca\structures_e\housea\a_office01\a_office01_ep1.p3d","a3\structures_f\households\house_small03\i_house_small_03_v1_f.p3d","ca\structures\house\a_office01\a_office01.p3d","ca\structures_e\housek\house_k_6_ep1.p3d","a3\structures_f\ind\shed\i_shed_ind_f.p3d","ca\structures_e\housec\house_c_12_ep1.p3d","ca\structures\house\a_stationhouse\a_stationhouse.p3d","ca\structures_e\housec\house_c_5_v3_ep1.p3d","ca\structures_e\housec\house_c_10_ep1.p3d","ca\structures_e\housec\house_c_5_ep1.p3d","a3\structures_f\households\house_big01\i_house_big_01_v2_f.p3d","a3\structures_f\households\house_shop01\i_shop_01_v1_f.p3d","a3\structures_f\households\house_small02\i_house_small_02_v3_f.p3d","a3\structures_f\households\house_shop01\i_shop_01_v2_f.p3d","ca\structures_e\housec\house_c_11_ep1.p3d","ca\structures_e\housec\house_c_5_v2_ep1.p3d","a3\structures_f\households\house_shop02\u_shop_02_v1_f.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v1_f.p3d","ca\structures_e\housek\house_k_8_ep1.p3d","ca\structures_e\housek\house_k_3_ep1.p3d","ca\structures_e\housea\a_villa\a_villa_ep1.p3d","a3\structures_f\households\stone_small\i_stone_housesmall_v2_f.p3d","a3\structures_f\households\house_small03\i_house_small_03_v1_dam_f.p3d"];
ALIVE_civilianSettlementBuildingTypes = ALIVE_civilianSettlementBuildingTypes + ["ca\buildings\sara_domek_sedy.p3d","ca\structures\nav_boathouse\nav_boathouse.p3d","ca\structures\nav_boathouse\nav_boathouse_piert.p3d","a3\structures_f\households\house_shop01\i_shop_01_v3_f.p3d","a3\structures_f\households\house_small01\i_house_small_01_v3_f.p3d","a3\structures_f\households\slum\slum_house03_f.p3d","a3\structures_f\households\slum\slum_house02_f.p3d","ca\structures_e\housec\house_c_2_ep1.p3d","a3\structures_f\households\house_shop01\u_shop_01_v1_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v2_f.p3d","a3\structures_f\households\house_small01\u_house_small_01_v1_f.p3d","a3\structures_f\households\house_big01\i_house_big_01_v1_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v1_f.p3d","a3\structures_f\households\house_big01\u_house_big_01_v1_f.p3d","ca\structures_e\housec\house_c_4_ep1.p3d","a3\structures_f\households\house_small01\i_house_small_01_v2_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v3_f.p3d","a3\structures_f\households\house_small02\i_house_small_02_v1_f.p3d","a3\structures_f\households\house_small02\u_house_small_02_v1_f.p3d","a3\structures_f\households\addons\i_garage_v2_f.p3d","ca\roads_pmc\bridge\bridge_asf_pmc.p3d","ca\structures_e\housek\house_k_7_ep1.p3d","ca\structures\shed_ind\shed_ind02.p3d","a3\structures_f\households\house_big01\i_house_big_01_v3_f.p3d","a3\structures_f\households\house_small01\i_house_small_01_v1_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v1_f.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v2_f.p3d","a3\structures_f\households\stone_small\i_stone_housesmall_v1_f.p3d","a3\structures_f\households\wip\unfinished_building_01_f.p3d","a3\structures_f\ind\fuelstation\fuelstation_build_f.p3d","a3\structures_f\ind\carservice\carservice_f.p3d","a3\structures_f\households\house_big02\i_house_big_02_v2_f.p3d","a3\structures_f\households\house_shop02\i_shop_02_v3_f.p3d","a3\structures_f\households\house_big02\u_house_big_02_v1_f.p3d","ca\structures_e\housec\house_c_5_v1_ep1.p3d","a3\structures_f\dominants\wip\wip_f.p3d","a3\structures_f\civ\offices\offices_01_v1_f.p3d","ca\buildings\dum_istan3_hromada2.p3d","a3\structures_f\dominants\church\church_01_v1_f.p3d","ca\structures\house\housev2\housev2_01a.p3d","ca\buildings2\misc_waterstation\misc_waterstation.p3d","ca\buildings\deutshe_mini.p3d","ca\structures\house\housev2\housev2_02_interier.p3d","ca\structures_e\housec\house_c_1_v2_ep1.p3d","ca\structures_e\housec\house_c_1_ep1.p3d","ca\buildings2\a_generalstore_01\a_generalstore_01a.p3d","ca\structures_e\housea\a_office01\a_office01_ep1.p3d","ca\buildings\afbarabizna.p3d","ca\buildings\dum_rasovna.p3d","ca\buildings\sara_domek_zluty.p3d","a3\structures_f\ind\factory\factory_main_f.p3d","a3\structures_f\households\house_small03\i_house_small_03_v1_f.p3d","ca\structures\house\a_office01\a_office01.p3d","ca\structures_e\housek\house_k_6_ep1.p3d","a3\structures_f\ind\shed\i_shed_ind_f.p3d","ca\structures_e\housec\house_c_12_ep1.p3d","ca\structures\house\a_stationhouse\a_stationhouse.p3d","ca\structures_e\housec\house_c_5_v3_ep1.p3d","a3\structures_f\civ\chapels\chapel_v1_f.p3d","a3\structures_f\dominants\hospital\hospital_side1_f.p3d","a3\structures_f\dominants\hospital\hospital_main_f.p3d","a3\structures_f\ind\reservoirtank\reservoirtower_f.p3d","ca\structures_e\housec\house_c_3_ep1.p3d","ca\structures_e\housec\house_c_10_ep1.p3d","ca\structures_e\housec\house_c_5_ep1.p3d","a3\structures_f\households\wip\unfinished_building_02_f.p3d","ca\structures\ind_sawmill\ind_sawmillpen.p3d","a3\structures_f\households\house_shop01\d_shop_01_v1_f.p3d","a3\structures_f\households\house_big01\d_house_big_01_v1_f.p3d","ca\structures\ind_sawmill\ind_sawmill.p3d","a3\structures_f\households\house_big01\i_house_big_01_v2_f.p3d","a3\structures_f\households\house_shop01\i_shop_01_v1_f.p3d","a3\structures_f\households\house_small02\i_house_small_02_v3_f.p3d","ca\buildings2\shed_small\shed_m01.p3d","ca\buildings\dum_mesto2.p3d","a3\structures_f\households\house_shop01\i_shop_01_v2_f.p3d","ca\structures_e\housec\house_c_11_ep1.p3d","ca\structures_e\housec\house_c_5_v2_ep1.p3d","a3\structures_f\ind\dieselpowerplant\dp_smallfactory_f.p3d","a3\structures_f\dominants\hospital\hospital_side2_f.p3d","ca\buildings\dum_mesto_in.p3d","ca\buildings\hut04.p3d","ca\buildings\hut02.p3d","ca\buildings\hut01.p3d","ca\buildings\hut03.p3d","ca\buildings\hut06.p3d","ca\buildings\cihlovej_dum_in.p3d","ca\buildings\hruzdum.p3d","ca\buildings\sara_stodola.p3d","ca\buildings\castle\helfenburk.p3d","ca\buildings\castle\helfenburk_cimburi.p3d","ca\buildings2\a_pub\a_pub_01.p3d","ca\buildings\kulna.p3d","ca\buildings\dum_olez_istan2.p3d","ca\buildings2\ind_workshop01\ind_workshop01_02.p3d","ca\buildings\dum_olez_istan1.p3d","ca\buildings2\ind_workshop01\ind_workshop01_04.p3d","ca\buildings\dum_olez_istan2_maly.p3d","ca\buildings2\ind_workshop01\ind_workshop01_01.p3d","ca\buildings2\ind_cementworks\ind_vysypka\ind_vysypka.p3d","ca\buildings\bouda_plech.p3d","ca\buildings\dum_olez_istan2_maly2.p3d","ca\buildings2\barn_metal\barn_metal.p3d","ca\structures\house\housev\housev_2l.p3d","ca\structures\house\a_office02\a_office02.p3d","ca\structures\house\a_hospital\a_hospital.p3d","ca\structures\house\housev2\housev2_03.p3d","ca\buildings\tovarna1.p3d","a3\structures_f\civ\chapels\chapel_small_v1_f.p3d","a3\structures_f\civ\chapels\chapel_v2_f.p3d","a3\structures_f\households\house_shop02\u_shop_02_v1_f.p3d","ca\buildings\garaz_mala.p3d","ca\buildings\kostel3.p3d","a3\structures_f\bridges\bridge_asphalt_f.p3d","ca\structures\house\church_02\church_02.p3d","ca\structures\house\housev2\housev2_04_interier.p3d","ca\buildings2\ind_cementworks\ind_pec\ind_pec_03a.p3d","ca\buildings2\shed_small\shed_w02.p3d","ca\buildings2\ind_garage01\ind_garage01.p3d","a3\structures_f\ind\shed\shed_big_f.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v1_f.p3d","ca\buildings\kostel_trosky.p3d","a3\structures_f\ind\reservoirtank\reservoirtank_v1_f.p3d","ca\buildings2\houseblocks\houseblock_a\houseblock_a2_1.p3d","ca\buildings2\houseblocks\houseblock_b\houseblock_b2.p3d","ca\buildings2\houseblocks\houseblock_a\houseblock_a1_1.p3d","ca\buildings2\shed_small\shed_w03.p3d","ca\structures_e\housek\house_k_8_ep1.p3d","ca\structures\house\housev2\housev2_01b.p3d","ibr\panthera_objects\mbg_stands.p3d","a3\structures_f\households\stone_big\d_stone_housebig_v1_f.p3d","a3\structures_f\households\house_shop02\d_shop_02_v1_f.p3d","a3\structures_f\households\slum\slum_house01_f.p3d","ca\structures\house\housev\housev_2t1.p3d","ca\structures\house\housev\housev_1l1.p3d","ca\structures_e\housek\house_k_5_ep1.p3d","ca\structures_e\housel\house_l_9_ep1.p3d","ca\structures_e\misc\misc_market\covering_hut_big_ep1.p3d","ca\structures_e\misc\misc_market\covering_hut_ep1.p3d","ca\buildings2\farm_cowshed\farm_cowshed_a.p3d","ca\buildings2\farm_cowshed\farm_cowshed_b.p3d","ca\buildings2\farm_cowshed\farm_cowshed_c.p3d","ca\structures\barn_w\barn_w_01.p3d","ca\buildings2\ind_shed_01\ind_shed_01_main.p3d","ca\buildings2\ind_shed_01\ind_shed_01_end.p3d","ca\structures_e\housek\house_k_3_ep1.p3d","ca\structures_e\housea\a_villa\a_villa_ep1.p3d","ca\buildings2\shed_small\shed_w01.p3d","ca\structures\house\housev\housev_1i1.p3d","ca\structures\house\housev\housev_1i2.p3d","ca\structures\house\housev2\housev2_03b.p3d","ca\buildings2\houseblocks\houseblock_a\houseblock_a3.p3d","ca\buildings2\houseblocks\houseblock_c\houseblock_c4.p3d","ca\structures\a_municipaloffice\a_municipaloffice.p3d","ca\buildings2\houseblocks\houseblock_b\houseblock_b3.p3d","ca\buildings2\houseblocks\houseblock_b\houseblock_b6.p3d","ca\buildings2\houseblocks\houseblock_b\houseblock_b5.p3d","ca\buildings2\houseblocks\houseblock_b\houseblock_b1.p3d","ca\buildings2\houseblocks\houseblock_a\houseblock_a2.p3d","ca\buildings2\houseblocks\houseblock_a\houseblock_a1.p3d","ca\structures\house\housev\housev_3i2.p3d","ca\buildings2\shed_small\shed_m03.p3d","ca\structures\house\housev\housev_2i.p3d","ca\structures\house\housev\housev_3i4.p3d"];
ALIVE_civilianPowerBuildingTypes = ALIVE_civilianPowerBuildingTypes + ["ca\buildings2\misc_powerstation\misc_powerstation.p3d","ca\buildings\trafostanica_mala.p3d","a3\structures_f\ind\solarpowerplant\spp_transformer_f.p3d","a3\structures_f\ind\dieselpowerplant\dp_transformer_f.p3d"];
ALIVE_civilianCommsBuildingTypes = ALIVE_civilianCommsBuildingTypes + ["ca\buildings\telek1.p3d","a3\structures_f\ind\transmitter_tower\tbox_f.p3d","a3\structures_f\ind\transmitter_tower\communication_f.p3d","a3\structures_f\ind\transmitter_tower\ttowersmall_1_f.p3d","a3\structures_f\households\house_shop02\u_shop_02_v1_f.p3d","a3\structures_f\ind\transmitter_tower\ttowersmall_2_f.p3d"];
ALIVE_civilianMarineBuildingTypes = ALIVE_civilianMarineBuildingTypes + ["ca\structures\nav_boathouse\nav_boathouse.p3d","ca\structures\nav_boathouse\nav_boathouse_piert.p3d","a3\structures_f\dominants\lighthouse\lighthouse_f.p3d","ca\structures\nav_pier\nav_pier_m_2.p3d","ca\structures\nav_pier\nav_pier_m_end.p3d","ca\structures\nav_pier\nav_pier_c_t15.p3d","a3\structures_f\dominants\lighthouse\lighthouse_small_f.p3d","ca\structures\nav_pier\nav_pier_c_90.p3d","ca\structures\nav_pier\nav_pier_f_17.p3d","ca\buildings\majak2.p3d","ca\structures\nav_boathouse\nav_boathouse_pierl.p3d","ca\buildings\majak.p3d","a3\structures_f\households\stone_big\i_stone_housebig_v2_dam_f.p3d","ca\structures\nav_pier\nav_pier_c.p3d","ca\structures\nav_pier\nav_pier_c_r.p3d","ca\structures\nav_pier\nav_pier_m_1.p3d","a3\structures_f\naval\piers\pier_f.p3d","ca\structures\nav_pier\nav_pier_f_23.p3d"];
ALIVE_civilianRailBuildingTypes = ALIVE_civilianRailBuildingTypes + [];
ALIVE_civilianFuelBuildingTypes = ALIVE_civilianFuelBuildingTypes + ["ca\buildings\fuelstation_army.p3d","a3\structures_f\ind\fuelstation\fuelstation_feed_f.p3d","a3\structures_f\ind\fuelstation\fuelstation_build_f.p3d","ca\buildings\benzina_schnell.p3d","ca\buildings\fuelstation.p3d","ca\buildings2\ind_tank\ind_tanksmall.p3d"];
ALIVE_civilianConstructionBuildingTypes = ALIVE_civilianConstructionBuildingTypes + ["a3\structures_f\households\wip\unfinished_building_01_f.p3d","a3\structures_f\dominants\wip\wip_f.p3d","a3\structures_f\ind\factory\factory_main_f.p3d","a3\structures_f\households\wip\unfinished_building_02_f.p3d","a3\structures_f\ind\shed\u_shed_ind_f.p3d","a3\structures_f\ind\dieselpowerplant\dp_mainfactory_f.p3d","a3\structures_f\ind\crane\crane_f.p3d","ca\structures\a_buildingwip\a_buildingwip.p3d","ca\buildings2\ind_tank\ind_tankbig.p3d","ca\buildings2\a_crane_02\crane_rails_end.p3d","ca\buildings2\a_crane_02\crane_rails.p3d","ca\buildings2\a_crane_02\a_crane_02a.p3d","ca\buildings2\a_crane_02\a_crane_02b.p3d","ca\structures\a_cranecon\a_cranecon.p3d","ca\buildings\komin.p3d","ca\buildings2\ind_cementworks\ind_malykomin\ind_malykomin.p3d","a3\structures_f\ind\dieselpowerplant\dp_smalltank_f.p3d","a3\structures_f\ind\dieselpowerplant\dp_bigtank_f.p3d"];
};