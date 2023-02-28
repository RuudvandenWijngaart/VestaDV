REM ////////////////////////////////////////////////////////////////////////////////////////
REM //                                                                                    //
REM //                                                                                    //
REM //                   Configuratie voor project: GeoParaat                             //
REM //                                                                                    //
REM //                              Object Vision 2020                                    //
REM //                                                                                    //
REM ////////////////////////////////////////////////////////////////////////////////////////
REM //                                                                                    //
REM // Dit betreft de batch file die met ogr2ogr de geopackage maakt op basis van een     //
REM // verzameling shape files en dbf bestanden                                           //
REM //                                                                                    //
REM ////////////////////////////////////////////////////////////////////////////////////////

ogr2ogr -f GPKG bag_snapshot.gpkg ligplaats.shp -sql "SELECT ID AS identificatie, NUM_ID AS nummeraanduiding_id, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_CON AS Is_Geconstateerd FROM ligplaats" -a_srs "EPSG:28992"
ogr2ogr -f GPKG bag_snapshot.gpkg ligplaats_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg standplaats.shp -sql "SELECT ID AS identificatie, NUM_ID AS nummeraanduiding_id, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_CON AS Is_Geconstateerd FROM standplaats" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg standplaats_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg pand.shp -sql "SELECT ID AS identificatie, bouwjaar,woontype AS WoningType, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_CON AS Is_Geconstateerd, NR_BIJEEN AS NR_BIJEENKOMST, NR_CEL AS NR_CEL, NR_GEZOND AS NR_GEZONDHEIDSZORG, NR_INDUST AS NR_INDUSTRIE, NR_KANTOOR AS NR_KANTOOR, NR_LOGIES AS NR_LOGIES, NR_ONDERW AS NR_ONDERWIJS, NR_OVERIG AS NR_OVERIG, NR_SPORT AS NR_SPORT, NR_WINKEL AS NR_WINKEL, NR_WOON AS NR_WOON FROM pand" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg pand_status_code.dbf -append
ogr2ogr -f GPKG bag_snapshot.gpkg pand_woningtype.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg vbo.shp -sql "SELECT ID AS identificatie, nummer_id AS nummeraanduiding_identificatie, oppervl AS oppervlakte,pand_id as pand_identificatie_geom, bijeen AS heeft_bijeenkomst_functie, cel AS heeft_cel_functie, gezondheid AS heeft_gezondheids_functie, industrie AS heeft_industrie_functie, kantoor AS heeft_kantoor_functie, logies AS heeft_logies_functie, onderwijs AS heeft_onderwijs_functie, overig AS heeft_overig_functie, sport AS heeft_sport_functie, winkel AS heeft_winkel_functie,woon AS heeft_woon_functie, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_CON AS Is_Geconstateerd FROM vbo" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg vbo_pand_rel.dbf -sql "SELECT ID AS identificatie, pand_id AS pand_identificatie FROM vbo_pand_rel" -append
ogr2ogr -f GPKG bag_snapshot.gpkg vbo_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg nummeraanduiding.dbf -sql "SELECT ID AS identificatie, huisnummer, huisletter, toevoeging, postcode, typeAO as typeAdresseerbaarObject, openbar_id as openbareruimte_identificatie, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_CON AS Is_Geconstateerd FROM nummeraanduiding" -append
ogr2ogr -f GPKG bag_snapshot.gpkg nummeraanduiding_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg openbareruimte.dbf -sql "SELECT ID AS identificatie, naam, type, woonpl_id as woonplaats_identificatie, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_CON AS Is_Geconstateerd FROM openbareruimte" -append
ogr2ogr -f GPKG bag_snapshot.gpkg openbareruimte_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg woonplaats.shp -sql "SELECT ID AS identificatie, naam as woonplaatsNaam, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_CON AS Is_Geconstateerd FROM woonplaats" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg woonplaats_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg adres.shp -sql "SELECT id AS nummeraanduiding_identificatie, straatnaam,  huisnummer, huisletter, toevoeging, postcode, woonplaats as woonplaatsNaam FROM adres" -a_srs "EPSG:28992" -append
