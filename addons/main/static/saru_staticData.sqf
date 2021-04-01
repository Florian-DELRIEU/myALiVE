private["_worldName"];

_worldName = tolower(worldName);

["SETTING UP MAP: saru"] call ALiVE_fnc_dump;

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

ALiVE_mapCompositionType = "Urban";

if (tolower(_worldName) == "saru") then {
    [ALIVE_mapBounds, worldName, 13000] call ALIVE_fnc_hashSet;

    ALIVE_Indexing_Blacklist = ALIVE_Indexing_Blacklist + [
        "ca\structures\house\housev2\housev2_02_interier.p3d",
        "ca\structures\house\church_03\church_03_ruins.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_11_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_church_b_ruin_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_church_ruin_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_01_f.p3d",
        "a3\structures_f\civ\chapels\chapel_v1_ruins_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_02_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_13_f.p3d",
        "hotze_buildings\sidewalks\place_6.p3d",
        "ca\buildings\kap02.p3d",
        "hotze_buildings\misc\gullii.p3d",
        "hotze_buildings\misc\gullic.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_03_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_tower_f.p3d",
        "a3\structures_f\households\stone_big\stone_housebig_v1_ruins_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_09_f.p3d",
        "ca\buildings\posed.p3d",
        "ca\buildings\podesta_1_cube.p3d",
        "a3\structures_f\mil\shelters\camonet_f.p3d",
        "ca\buildings\bordel_zidka.p3d",
        "ca\roads2\dam\dam_conc\dam_conc_20.p3d",
        "ca\roads2\dam\dam_conc\dam_concp_20.p3d",
        "ca\buildings\molo_beton.p3d",
        "ca\buildings\bozi_muka.p3d",
        "ca\buildings\zvonice.p3d",
        "ca\buildings\kapl.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_06_f.p3d",
        "hotze_buildings\sidewalks\place_3.p3d",
        "hotze_buildings\sidewalks\place_4.p3d",
        "hotze_buildings\sidewalks\place_2.p3d",
        "hotze_buildings\sidewalks\place_1.p3d",
        "ca\structures_e\ind\ind_coltan_mine\ind_coltan_rail_ep1.p3d",
        "ca\structures_e\ind\ind_coltan_mine\ind_coltan_rail_end_ep1.p3d",
        "ca\buildings\dum_zboreny.p3d",
        "a3\roads_f\runway\track_north01_f.p3d",
        "a3\structures_f\mil\fortification\hbarrier_1_f.p3d",
        "ca\structures\nav_pier\nav_pier_f_23.p3d",
        "ca\buildings\dum_zboreny_total.p3d",
        "ca\buildings\dum_zboreny_lidice.p3d",
        "a3\structures_f\dominants\castle\castle_01_church_a_ruin_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_house_ruin_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_08_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_07_f.p3d",
        "a3\structures_f\civ\belltowers\belltower_01_v1_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_04_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_15_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_14_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_step_f.p3d",
        "a3\structures_f\dominants\castle\castle_01_wall_16_f.p3d",
        "a3\structures_f\households\house_big01\d_house_big_01_v1_f.p3d",
        "a3\structures_f\households\house_big01\u_house_big_01_v1_dam_f.p3d",
        "a3\structures_f\households\stone_shed\d_stone_shed_v1_f.p3d",
        "a3\structures_f\households\stone_shed\stone_shed_v1_ruins_f.p3d",
        "a3\structures_f\dominants\wip\wip_ruins_f.p3d",
        "a3\structures_f\households\house_small02\u_house_small_02_v1_dam_f.p3d",
        "a3\structures_f\households\stone_big\d_stone_housebig_v1_f.p3d",
        "a3\structures_f\households\house_shop02\d_shop_02_v1_f.p3d",
        "a3\structures_f\households\house_small02\d_house_small_02_v1_f.p3d",
        "a3\structures_f\households\addons\addon_04_v1_ruins_f.p3d",
        "a3\structures_f\civ\belltowers\belltower_02_v2_ruins_f.p3d",
        "a3\structures_f\households\addons\addon_03mid_v1_ruins_f.p3d",
        "a3\structures_f\households\house_small01\d_house_small_01_v1_f.p3d",
        "a3\structures_f\mil\barracks\barracks_ruins_f.p3d",
        "a3\structures_f\households\house_big02\d_house_big_02_v1_f.p3d",
        "a3\structures_f\households\slum\cargo_house_slum_ruins_f.p3d",
        "a3\structures_f\households\wip\unfinished_building_02_ruins_f.p3d",
        "a3\structures_f\civ\chapels\chapel_v2_ruins_f.p3d",
        "a3\structures_f\ind\concretemixingplant\cmp_shed_dam_f.p3d",
        "a3\structures_f\ind\concretemixingplant\cmp_tower_ruins_f.p3d",
        "a3\structures_f\households\addons\addon_03_v1_ruins_f.p3d",
        "a3\structures_f\households\addons\addon_01_v1_ruins_f.p3d",
        "a3\structures_f\ind\shed\shed_big_ruins_f.p3d",
        "a3\structures_f\ind\concretemixingplant\cmp_shed_ruins_f.p3d",
        "a3\structures_f\households\addons\addon_02_v1_ruins_f.p3d",
        "ca\buildings\majak_podesta.p3d",
        "ca\buildings2\buildingparts\fusebox\fusebox.p3d",
        "ca\structures\castle\a_castle_donjon_ruins.p3d",
        "ca\structures\castle\a_castle_wall1_end_2.p3d",
        "ca\structures\castle\a_castle_bergfrit_ruins.p3d",
        "ca\structures\castle\a_castle_wall1_corner_ruins.p3d",
        "ca\structures\castle\a_castle_bastion_ruins.p3d",
        "ca\structures\castle\a_castle_gate_ruins.p3d",
        "ca\structures\castle\a_castle_wall1_end_2_ruins.p3d",
        "ca\structures\castle\a_castle_wall1_20.p3d",
        "ca\structures\castle\a_castle_wall1_corner_2_ruins.p3d",
        "ca\structures\castle\a_castle_wall1_end.p3d",
        "ca\structures\castle\a_castle_wall2_30_ruins.p3d",
        "ca\structures\castle\a_castle_wall2_30.p3d",
        "ca\structures\castle\a_castle_wall1_20_ruins.p3d",
        "ca\structures\castle\a_castle_walls_10_ruins.p3d",
        "ca\structures\castle\a_castle_wall2_corner.p3d"
    ];

    ALIVE_militaryBuildingTypes = ALIVE_militaryBuildingTypes + [
        "a3\structures_f\mil\cargo\cargo_tower_v3_f.p3d",
        "a3\structures_f\mil\fortification\hbarrier_big_f.p3d",
        "a3\structures_f\mil\bagbunker\bagbunker_small_f.p3d",
        "a3\structures_f\mil\cargo\cargo_hq_v1_f.p3d",
        "a3\structures_f\mil\cargo\cargo_house_v1_f.p3d",
        "a3\structures_f\mil\cargo\medevac_hq_v1_f.p3d",
        "a3\structures_f\mil\fortification\hbarrier_5_f.p3d",
        "a3\structures_f\mil\bagbunker\bagbunker_large_f.p3d",
        "a3\structures_f\mil\fortification\hbarrierwall_corner_f.p3d",
        "a3\structures_f\mil\fortification\hbarriertower_f.p3d",
        "a3\structures_f\mil\fortification\hbarrierwall_corridor_f.p3d",
        "ca\buildings\hlaska.p3d",
        "ca\buildings\hlidac_budka.p3d",
        "ca\structures\mil\mil_barracks.p3d",
        "ca\structures\mil\mil_barracks_l.p3d",
        "ca\structures\mil\mil_barracks_i.p3d",
        "ca\misc2\hbarrier5.p3d",
        "a3\structures_f\mil\cargo\cargo_patrol_v1_f.p3d",
        "a3\structures_f\mil\shelters\camonet_big_f.p3d",
        "ca\buildings\budova4_in.p3d",
        "a3\structures_f\mil\offices\miloffices_v1_f.p3d",
        "hotze_buildings\buildings\bunker\bunker_01.p3d",
        "ca\buildings\budova5.p3d",
        "ca\buildings\tents\mash.p3d",
        "ca\misc_e\guardshed_ep1.p3d",
        "ca\structures_e\mil\mil_barracks_i_ep1.p3d",
        "ca\buildings\garaz_bez_tanku.p3d",
        "ca\buildings\ammostore2.p3d",
        "a3\roads_f\runway\runway_end22_f.p3d",
        "a3\roads_f\runway\runway_main_40_f.p3d",
        "a3\structures_f\mil\bagbunker\bagbunker_tower_f.p3d",
        "a3\structures_f\mil\bunker\bunker_f.p3d",
        "a3\structures_f\ind\airport\airport_tower_f.p3d",
        "a3\roads_f\runway\runway_end04_f.p3d",
        "ca\buildings\fuelstation_army.p3d",
        "ca\buildings\army_hut_int.p3d",
        "ca\buildings\army_hut3_long.p3d",
        "ca\structures_pmc\buildings\bunker\bunker_pmc.p3d",
        "ca\buildings\army_hut2.p3d",
        "ca\buildings\army_hut2_int.p3d",
        "ca\buildings\army_hut_storrage.p3d",
        "ca\buildings\budova2.p3d",
        "ca\buildings\budova1.p3d",
        "ca\buildings\garaz_mala.p3d",
        "ca\buildings\garaz_s_tankem.p3d",
        "ca\structures\mil\mil_controltower.p3d",
        "ca\buildings\hangar_2.p3d",
        "ca\roads\runway_main.p3d",
        "ca\roads\runway_main_tcross.p3d",
        "ca\roads\runway_end9.p3d",
        "ca\misc3\fort_rampart.p3d",
        "ca\buildings\army_hut3_long_int.p3d",
        "a3\structures_f\mil\fortification\hbarrier_3_f.p3d",
        "ca\structures_e\mil\mil_barracks_ep1.p3d",
        "ca\misc2\barrack2\barrack2.p3d",
        "ca\misc_e\tent2_west_ep1.p3d",
        "ca\structures_e\mil\mil_barracks_l_ep1.p3d",
        "ca\structures_e\mil\mil_guardhouse_ep1.p3d",
        "ca\structures\mil\mil_guardhouse.p3d",
        "ca\buildings\tents\fortress_02.p3d",
        "ca\buildings\tents\fortress_01.p3d",
        "ca\buildings\tents\camo_box.p3d",
        "a3\structures_f\mil\cargo\cargo_house_v3_f.p3d"
    ];

    ALIVE_militaryParkingBuildingTypes = ALIVE_militaryParkingBuildingTypes + [
        "a3\structures_f\mil\cargo\cargo_hq_v1_f.p3d",
        "ca\buildings\hangar_2.p3d",
        "ca\misc3\fort_rampart.p3d"
    ];

    ALIVE_militarySupplyBuildingTypes = ALIVE_militarySupplyBuildingTypes + [
        "a3\structures_f\mil\cargo\cargo_hq_v1_f.p3d",
        "ca\buildings\budova4_in.p3d",
        "ca\buildings\ammostore2.p3d",
        "ca\buildings\hangar_2.p3d"
    ];

    ALIVE_militaryHQBuildingTypes = ALIVE_militaryHQBuildingTypes + [
        "a3\structures_f\mil\cargo\cargo_hq_v1_f.p3d",
        "ca\buildings\budova4_in.p3d",
        "a3\structures_f\mil\offices\miloffices_v1_f.p3d"
    ];

    ALIVE_airBuildingTypes = ALIVE_airBuildingTypes + [
        "a3\structures_f\ind\airport\hangar_f.p3d"
    ];

    ALIVE_militaryAirBuildingTypes = ALIVE_militaryAirBuildingTypes + [
        "a3\structures_f\ind\airport\hangar_f.p3d"
    ];

    ALIVE_civilianAirBuildingTypes = ALIVE_civilianAirBuildingTypes + [];

    ALIVE_heliBuildingTypes = ALIVE_heliBuildingTypes + [
        "a3\structures_f\mil\helipads\helipadcircle_f.p3d",
        "a3\structures_f\mil\helipads\helipadcivil_f.p3d"
    ];

    ALIVE_militaryHeliBuildingTypes = ALIVE_militaryHeliBuildingTypes + [
        "a3\structures_f\mil\helipads\helipadcircle_f.p3d",
        "a3\structures_f\mil\helipads\helipadcivil_f.p3d"
    ];

    ALIVE_civilianHeliBuildingTypes = ALIVE_civilianHeliBuildingTypes + [];

    ALIVE_civilianPopulationBuildingTypes = ALIVE_civilianPopulationBuildingTypes + [
        "ca\structures\house\housev2\housev2_02_interier.p3d",
        "ca\structures\house\housev\housev_1i2.p3d",
        "ca\buildings2\shed_small\shed_w02.p3d",
        "ca\buildings\bouda_plech.p3d",
        "ca\buildings\bouda2_vnitrek.p3d",
        "ca\buildings\podesta_1_stairs4.p3d",
        "ca\buildings\podesta_1_cube_long.p3d",
        "ca\buildings\sara_zluty_statek.p3d",
        "ca\buildings\zalchata.p3d",
        "ca\buildings\sara_domek_hospoda.p3d",
        "a3\structures_f\households\house_big02\i_house_big_02_v2_f.p3d",
        "ca\buildings\podesta_1_stairs3.p3d",
        "ca\buildings\sara_domek_podhradi_1.p3d",
        "a3\structures_f\households\house_big01\i_house_big_01_v1_f.p3d",
        "a3\structures_f\households\house_small01\i_house_small_01_v3_f.p3d",
        "ca\buildings\kostel3.p3d",
        "ca\buildings\statek_kulna.p3d",
        "a3\structures_f\households\house_small01\i_house_small_01_v1_f.p3d",
        "ca\structures\shed\shed_small\shed_w4.p3d",
        "ca\structures\misc_powerlines\powlines_transformer2.p3d",
        "ca\buildings\sara_domek02.p3d",
        "ca\buildings\sara_domek04.p3d",
        "ca\buildings\sara_domek01.p3d",
        "ca\buildings\sara_domek_zluty_bez.p3d",
        "ca\buildings\aut_zast.p3d",
        "ca\buildings\sara_domek05.p3d",
        "a3\structures_f\households\house_small01\i_house_small_01_v2_f.p3d",
        "ca\buildings\sara_zluty_statek_in.p3d",
        "ca\buildings\sara_domek03.p3d",
        "ca\buildings\sara_domek_zluty.p3d",
        "ca\buildings\sara_domek_kovarna.p3d",
        "ca\buildings\podesta_1_mid.p3d",
        "ca\buildings\podesta_1_cornl.p3d",
        "ca\buildings\podesta_1_cornp.p3d",
        "ca\structures\house\housev\housev_3i4.p3d",
        "a3\structures_f\households\house_small02\u_house_small_02_v1_f.p3d",
        "a3\structures_f\households\stone_shed\i_stone_shed_v2_f.p3d",
        "ca\buildings\stodola_old.p3d",
        "ca\buildings\sara_stodola2.p3d",
        "ca\buildings\kulna.p3d",
        "a3\structures_f\households\stone_shed\i_stone_shed_v3_f.p3d",
        "a3\structures_f\households\stone_small\i_stone_housesmall_v1_f.p3d",
        "ca\buildings\ryb_domek.p3d",
        "ca\buildings\hut_old02.p3d",
        "ca\buildings\bouda3.p3d",
        "a3\structures_f\households\house_big01\i_house_big_01_v2_f.p3d",
        "a3\structures_f\households\house_small02\i_house_small_02_v3_f.p3d",
        "a3\structures_f\households\house_small02\i_house_small_02_v1_f.p3d",
        "a3\structures_f\households\house_big02\i_house_big_02_v1_f.p3d",
        "a3\structures_f\dominants\church\church_01_proxy_v1_f.p3d",
        "a3\structures_f\dominants\church\church_01_v1_f.p3d",
        "a3\structures_f\households\house_big01\i_house_big_01_v3_f.p3d",
        "a3\structures_f\civ\offices\offices_01_v1_f.p3d",
        "ca\structures_e\misc\shed_m01_ep1.p3d",
        "ca\buildings\podesta_10.p3d",
        "a3\structures_f\households\house_shop02\i_shop_02_v1_f.p3d",
        "hotze_buildings\zidka_klek.p3d",
        "a3\structures_f\households\house_big02\i_house_big_02_v3_f.p3d",
        "ca\buildings\podesta_5.p3d",
        "ca\structures_e\misc\shed_w03_ep1.p3d",
        "a3\structures_f\households\house_shop01\i_shop_01_v3_f.p3d",
        "a3\structures_f\households\house_shop02\i_shop_02_v2_f.p3d",
        "a3\structures_f\households\house_shop01\i_shop_01_v1_f.p3d",
        "a3\structures_f\households\house_shop02\i_shop_02_v3_f.p3d",
        "ca\buildings2\shed_wooden\shed_wooden.p3d",
        "a3\structures_f\mil\barracks\i_barracks_v1_f.p3d",
        "ca\buildings2\ind_garage01\ind_garage01.p3d",
        "a3\structures_f\ind\carservice\carservice_f.p3d",
        "a3\structures_f\ind\fuelstation\fuelstation_build_f.p3d",
        "ca\buildings\podesta_s10.p3d",
        "ca\buildings\podesta_s5.p3d",
        "a3\structures_f\households\house_small03\i_house_small_03_v1_f.p3d",
        "a3\structures_f\households\house_shop01\i_shop_01_v2_f.p3d",
        "ca\structures\house\housev\housev_1i4.p3d",
        "ca\buildings\house_y.p3d",
        "ca\buildings\sara_hasic_zbroj.p3d",
        "ca\buildings\sara_domek_ruina.p3d",
        "ca\buildings\sara_domek_rosa.p3d",
        "ca\buildings\hut01.p3d",
        "ca\buildings\hut02.p3d",
        "ca\buildings\hut03.p3d",
        "ca\buildings\sara_stodola.p3d",
        "a3\structures_f\households\stone_big\i_stone_housebig_v1_f.p3d",
        "ca\buildings\orlhot.p3d",
        "ca\buildings\budova3.p3d",
        "ca\buildings\sara_domek_sedy_bez.p3d",
        "ca\buildings\dum_mesto2l.p3d",
        "ca\buildings\domek_rosa.p3d",
        "ca\buildings\dumruina.p3d",
        "ca\buildings\dum_olezlina.p3d",
        "ca\buildings\dum_rasovna.p3d",
        "ca\buildings\dum02.p3d",
        "ca\buildings\molo_krychle.p3d",
        "a3\structures_f\ind\shed\shed_small_f.p3d",
        "a3\structures_f\ind\shed\shed_big_f.p3d",
        "ca\structures\house\a_office01\a_office01.p3d",
        "ca\buildings2\ind_workshop01\ind_workshop01_l.p3d",
        "ca\buildings2\ind_workshop01\ind_workshop01_box.p3d",
        "ca\buildings\nabrezi_najezd.p3d",
        "ca\buildings2\ind_workshop01\ind_workshop01_02.p3d",
        "ca\buildings2\ind_workshop01\ind_workshop01_01.p3d",
        "ca\buildings2\ind_workshop01\ind_workshop01_04.p3d",
        "ca\buildings\nabrezi.p3d",
        "ca\buildings2\ind_workshop01\ind_workshop01_03.p3d",
        "ca\buildings\deutshe_mini.p3d",
        "ca\buildings2\shed_small\shed_w01.p3d",
        "ca\buildings\dum_m2.p3d",
        "ca\buildings\dum_olez_istan2_maly.p3d",
        "ca\buildings\dum_olez_istan2.p3d",
        "ca\buildings\stanice.p3d",
        "ca\buildings\dum_olez_istan1.p3d",
        "ca\buildings\dum_mesto3_istan.p3d",
        "ca\buildings\dulni_bs.p3d",
        "ca\buildings\dum_mesto_in.p3d",
        "ca\buildings\hospoda_mesto.p3d",
        "ca\buildings\dum_mesto3.p3d",
        "a3\structures_f\households\house_big01\u_house_big_01_v1_f.p3d",
        "ca\buildings\kostel.p3d",
        "a3\structures_f\households\house_small01\u_house_small_01_v1_f.p3d",
        "ca\buildings\kasna.p3d",
        "a3\structures_f\households\stone_big\i_stone_housebig_v2_f.p3d",
        "a3\structures_f\households\stone_big\i_stone_housebig_v3_f.p3d",
        "a3\structures_f\households\stone_small\i_stone_housesmall_v2_f.p3d",
        "a3\structures_f\households\house_big02\u_house_big_02_v1_f.p3d",
        "a3\structures_f\households\house_shop01\u_shop_01_v1_f.p3d",
        "a3\structures_f\households\house_shop02\u_shop_02_v1_f.p3d",
        "a3\structures_f\households\stone_shed\i_stone_shed_v1_f.p3d",
        "ca\buildings\dum01.p3d",
        "ca\buildings\statek_hl_bud.p3d",
        "ca\buildings\dum_mesto.p3d",
        "ca\buildings\dumruina_mini.p3d",
        "a3\structures_f\civ\chapels\chapel_v1_f.p3d",
        "ca\buildings2\a_generalstore_01\a_generalstore_01.p3d",
        "ca\buildings2\ind_cementworks\ind_pec\ind_pec_03a.p3d",
        "ca\structures\house\housev\housev_1t.p3d",
        "ca\buildings2\farm_wtower\farm_wtower.p3d",
        "ca\buildings2\farm_cowshed\farm_cowshed_a.p3d",
        "ca\buildings2\farm_cowshed\farm_cowshed_b.p3d",
        "ca\buildings2\farm_cowshed\farm_cowshed_c.p3d",
        "ca\buildings\sara_stodola3.p3d",
        "ca\buildings\deutshe.p3d",
        "ca\buildings\bouda_garaz.p3d",
        "ca\buildings\hut06.p3d",
        "ca\structures\house\housev\housev_3i3.p3d",
        "ca\structures\house\housev\housev_3i2.p3d",
        "a3\structures_f\households\stone_small\i_stone_housesmall_v3_f.p3d",
        "ca\structures_e\misc\misc_market\kiosk_ep1.p3d",
        "a3\structures_f\ind\shed\i_shed_ind_f.p3d",
        "ca\structures\house\housev2\housev2_04_interier.p3d",
        "ca\structures_e\misc\misc_construction\misc_concbox_ep1.p3d",
        "ca\structures_e\housek\terrace_k_1_ep1.p3d",
        "ca\structures_e\housek\house_k_8_dam_ep1.p3d",
        "ca\structures_e\housek\house_k_7_dam_ep1.p3d",
        "ca\structures_e\housec\house_c_11_ep1.p3d",
        "ca\structures_e\housec\house_c_10_ep1.p3d",
        "ca\structures_e\housek\house_k_3_ep1.p3d",
        "ca\structures_e\housek\house_k_5_ep1.p3d",
        "ca\structures_e\housek\house_k_6_ep1.p3d",
        "ca\structures_e\housek\house_k_1_ep1.p3d",
        "ca\structures_e\housec\house_c_5_v3_ep1.p3d",
        "ca\buildings\hospital.p3d",
        "ca\structures_e\housec\house_c_5_v2_ep1.p3d",
        "ca\structures_e\housec\house_c_4_ep1.p3d",
        "ca\structures_e\housel\house_l_1_ep1.p3d",
        "ca\structures_e\housel\house_l_3_ep1.p3d",
        "ca\buildings\hut04.p3d",
        "ca\structures_e\housec\house_c_5_v1_ep1.p3d",
        "ca\structures_e\housec\house_c_5_ep1.p3d",
        "ca\buildings\afdum_mesto2.p3d",
        "ca\buildings\afbarabizna.p3d",
        "a3\structures_f\households\house_shop02\u_shop_02_v1_dam_f.p3d",
        "a3\structures_f\households\house_shop01\u_shop_01_v1_dam_f.p3d",
        "a3\structures_f\households\wip\unfinished_building_01_ruins_f.p3d",
        "a3\structures_f\civ\chapels\chapel_small_v1_f.p3d",
        "a3\structures_f\households\stone_small\d_stone_housesmall_v1_f.p3d",
        "a3\structures_f\households\house_big02\u_house_big_02_v1_dam_f.p3d",
        "a3\structures_f\households\house_small01\u_house_small_01_v1_dam_f.p3d",
        "a3\structures_f\households\house_shop01\d_shop_01_v1_f.p3d",
        "a3\structures_f\households\house_small02\i_house_small_02_v2_f.p3d",
        "a3\structures_f\civ\belltowers\belltower_02_v1_f.p3d"
    ];

    ALIVE_civilianHQBuildingTypes = ALIVE_civilianHQBuildingTypes + [
        "a3\structures_f\dominants\church\church_01_proxy_v1_f.p3d",
        "a3\structures_f\dominants\church\church_01_v1_f.p3d",
        "a3\structures_f\civ\offices\offices_01_v1_f.p3d",
        "ca\structures\house\a_office01\a_office01.p3d"
    ];

    ALIVE_civilianSettlementBuildingTypes = ALIVE_civilianSettlementBuildingTypes + [
        "ca\structures\house\housev2\housev2_02_interier.p3d",
        "ca\buildings\bouda2_vnitrek.p3d",
        "ca\buildings\sara_zluty_statek.p3d",
        "a3\structures_f\households\house_big02\i_house_big_02_v2_f.p3d",
        "a3\structures_f\households\house_big01\i_house_big_01_v1_f.p3d",
        "a3\structures_f\households\house_small01\i_house_small_01_v3_f.p3d",
        "a3\structures_f\households\house_small01\i_house_small_01_v1_f.p3d",
        "a3\structures_f\households\house_small01\i_house_small_01_v2_f.p3d",
        "a3\structures_f\households\stone_shed\i_stone_shed_v2_f.p3d",
        "a3\structures_f\households\stone_shed\i_stone_shed_v3_f.p3d",
        "a3\structures_f\households\stone_small\i_stone_housesmall_v1_f.p3d",
        "ca\buildings\ryb_domek.p3d",
        "ca\buildings\hut_old02.p3d",
        "a3\structures_f\households\house_big01\i_house_big_01_v2_f.p3d",
        "a3\structures_f\households\house_small02\i_house_small_02_v3_f.p3d",
        "a3\structures_f\households\house_small02\i_house_small_02_v1_f.p3d",
        "a3\structures_f\households\house_big02\i_house_big_02_v1_f.p3d",
        "a3\structures_f\dominants\church\church_01_proxy_v1_f.p3d",
        "a3\structures_f\dominants\church\church_01_v1_f.p3d",
        "a3\structures_f\households\house_big01\i_house_big_01_v3_f.p3d",
        "a3\structures_f\civ\offices\offices_01_v1_f.p3d",
        "ca\buildings\podesta_10.p3d",
        "a3\structures_f\households\house_shop02\i_shop_02_v1_f.p3d",
        "a3\structures_f\households\house_big02\i_house_big_02_v3_f.p3d",
        "a3\structures_f\households\house_shop02\i_shop_02_v2_f.p3d",
        "a3\structures_f\households\house_shop01\i_shop_01_v1_f.p3d",
        "a3\structures_f\households\house_shop02\i_shop_02_v3_f.p3d",
        "a3\structures_f\mil\barracks\i_barracks_v1_f.p3d",
        "ca\buildings\podesta_s10.p3d",
        "a3\structures_f\households\house_small03\i_house_small_03_v1_f.p3d",
        "a3\structures_f\households\house_shop01\i_shop_01_v2_f.p3d",
        "ca\structures\house\housev\housev_1i4.p3d",
        "ca\buildings\house_y.p3d",
        "ca\buildings\sara_domek_ruina.p3d",
        "a3\structures_f\households\stone_big\i_stone_housebig_v1_f.p3d",
        "ca\buildings\orlhot.p3d",
        "ca\buildings\dum_rasovna.p3d",
        "ca\structures\house\a_office01\a_office01.p3d",
        "ca\buildings\deutshe_mini.p3d",
        "ca\buildings\hospoda_mesto.p3d",
        "a3\structures_f\households\house_small01\u_house_small_01_v1_f.p3d",
        "a3\structures_f\households\stone_big\i_stone_housebig_v3_f.p3d",
        "a3\structures_f\households\stone_small\i_stone_housesmall_v2_f.p3d",
        "a3\structures_f\households\house_big02\u_house_big_02_v1_f.p3d",
        "a3\structures_f\households\house_shop01\u_shop_01_v1_f.p3d",
        "a3\structures_f\households\house_shop02\u_shop_02_v1_f.p3d",
        "a3\structures_f\households\stone_shed\i_stone_shed_v1_f.p3d",
        "ca\buildings2\a_generalstore_01\a_generalstore_01.p3d",
        "a3\structures_f\households\stone_small\i_stone_housesmall_v3_f.p3d",
        "ca\structures_e\housek\house_k_8_dam_ep1.p3d",
        "ca\structures_e\housec\house_c_11_ep1.p3d",
        "ca\structures_e\housec\house_c_10_ep1.p3d",
        "ca\structures_e\housek\house_k_3_ep1.p3d",
        "ca\structures_e\housek\house_k_5_ep1.p3d",
        "ca\structures_e\housek\house_k_6_ep1.p3d",
        "ca\structures_e\housek\house_k_1_ep1.p3d",
        "ca\structures_e\housec\house_c_5_v3_ep1.p3d",
        "ca\structures_e\housec\house_c_5_v2_ep1.p3d",
        "ca\structures_e\housec\house_c_4_ep1.p3d",
        "ca\structures_e\housel\house_l_1_ep1.p3d",
        "ca\structures_e\housel\house_l_3_ep1.p3d",
        "ca\structures_e\housec\house_c_5_v1_ep1.p3d",
        "ca\structures_e\housec\house_c_5_ep1.p3d",
        "a3\structures_f\households\house_shop01\u_shop_01_v1_dam_f.p3d",
        "a3\structures_f\households\wip\unfinished_building_01_ruins_f.p3d",
        "a3\structures_f\households\house_small02\i_house_small_02_v2_f.p3d"
    ];

    ALIVE_civilianPowerBuildingTypes = ALIVE_civilianPowerBuildingTypes + [
        "a3\structures_f\ind\dieselpowerplant\dp_bigtank_f.p3d",
        "a3\structures_f\ind\dieselpowerplant\dp_mainfactory_f.p3d",
        "ca\buildings2\misc_powerstation\misc_powerstation.p3d",
        "a3\structures_f\ind\dieselpowerplant\dp_smallfactory_f.p3d",
        "a3\structures_f\ind\wavepowerplant\wavepowerplant_f.p3d",
        "a3\structures_f\ind\windpowerplant\wpp_turbine_v2_f.p3d",
        "a3\structures_f\ind\solarpowerplant\solarpanel_2_f.p3d",
        "ca\buildings\trafostanica_velka.p3d",
        "ca\buildings\trafostanica_mala.p3d"
    ];

    ALIVE_civilianCommsBuildingTypes = ALIVE_civilianCommsBuildingTypes + [
        "a3\structures_f\ind\transmitter_tower\ttowerbig_2_f.p3d",
        "a3\structures_f\ind\transmitter_tower\tbox_f.p3d",
        "ca\buildings\vysilac_fm.p3d",
        "ca\buildings\telek1.p3d",
        "a3\structures_f\ind\transmitter_tower\communication_f.p3d",
        "ca\misc3\antenna.p3d"
    ];

    ALIVE_civilianMarineBuildingTypes = ALIVE_civilianMarineBuildingTypes + [
        "ca\structures\nav_boathouse\nav_boathouse_pierr.p3d",
        "ca\structures\nav_boathouse\nav_boathouse_piert.p3d",
        "ca\structures\nav_boathouse\nav_boathouse.p3d",
        "ca\structures\nav_pier\nav_pier_m_1.p3d",
        "ca\structures\nav_pier\nav_pier_m_end.p3d",
        "a3\structures_f\naval\piers\pier_doubleside_f.p3d",
        "a3\structures_f\naval\piers\pier_f.p3d"
    ];

    ALIVE_civilianRailBuildingTypes = ALIVE_civilianRailBuildingTypes + [];

    ALIVE_civilianFuelBuildingTypes = ALIVE_civilianFuelBuildingTypes + [
        "a3\structures_f\ind\fuelstation\fuelstation_feed_f.p3d",
        "a3\structures_f\ind\fuelstation\fuelstation_shed_f.p3d",
        "a3\structures_f\ind\dieselpowerplant\dp_smalltank_f.p3d",
        "ca\buildings2\ind_tank\ind_tanksmall2.p3d",
        "ca\buildings\fuelstation.p3d"
    ];

    ALIVE_civilianConstructionBuildingTypes = ALIVE_civilianConstructionBuildingTypes + [
        "ca\buildings2\ind_cementworks\ind_vysypka\ind_vysypka.p3d",
        "ca\buildings2\ind_cementworks\ind_expedice\ind_expedice_3.p3d",
        "a3\structures_f\ind\crane\crane_f.p3d",
        "ca\buildings2\ind_cementworks\ind_silovelke\ind_silovelke_01.p3d"
    ];
};
