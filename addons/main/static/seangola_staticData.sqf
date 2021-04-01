private["_worldName"];
 _worldName = tolower(worldName);
 ["SETTING UP MAP: seangola"] call ALiVE_fnc_dump;
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
 if(tolower(_worldName) == "seangola") then {
[ALIVE_mapBounds, worldName, 10000] call ALIVE_fnc_hashSet;
ALIVE_militaryBuildingTypes = ALIVE_militaryBuildingTypes + ["ca\structures\mil\mil_controltower.p3d","ca\structures\mil\mil_barracks_i.p3d","ca\buildings\hlidac_budka.p3d","ca\buildings\posed.p3d","ca\buildings2\ind_garage01\ind_garage01.p3d","ca\buildings\hangar_2.p3d","ca\structures\mil\mil_house.p3d"];
ALIVE_militaryParkingBuildingTypes = ALIVE_militaryParkingBuildingTypes + ["ca\structures\mil\mil_controltower.p3d","ca\buildings\hangar_2.p3d","ca\structures\mil\mil_house.p3d"];
ALIVE_militarySupplyBuildingTypes = ALIVE_militarySupplyBuildingTypes + ["ca\structures\mil\mil_controltower.p3d","ca\structures\mil\mil_house.p3d"];
ALIVE_militaryHQBuildingTypes = ALIVE_militaryHQBuildingTypes + ["ca\structures\mil\mil_controltower.p3d","ca\structures\mil\mil_barracks_i.p3d","ca\buildings\hangar_2.p3d","ca\structures\mil\mil_house.p3d"];
ALIVE_airBuildingTypes = ALIVE_airBuildingTypes + ["ca\roads\runway_end9.p3d","ca\roads2\runway_poj_t_2.p3d","ca\roads2\runway_main.p3d","ca\roads\runway_end27.p3d"];
ALIVE_militaryAirBuildingTypes = ALIVE_militaryAirBuildingTypes + ["ca\roads\runway_end9.p3d","ca\roads2\runway_poj_t_2.p3d","ca\roads2\runway_main.p3d","ca\roads\runway_end27.p3d"];
ALIVE_civilianPopulationBuildingTypes = ALIVE_civilianPopulationBuildingTypes + ["a3\structures_f\households\slum\slum_house03_f.p3d","a3\structures_f\households\slum\slum_house01_f.p3d","ibr\seangola_obj\ahut1.p3d"];
ALIVE_civilianSettlementBuildingTypes = ALIVE_civilianSettlementBuildingTypes + ["a3\structures_f\households\slum\slum_house03_f.p3d","a3\structures_f\households\slum\slum_house01_f.p3d","a3\structures_f\households\slum\slum_house02_f.p3d","ibr\seangola_obj\ahut1.p3d"];
};
