CLASS zcl_amdp_magf_m3a2_par DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS : get_flights FOR TABLE FUNCTION zcds_magf_m3a2_parameter.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_magf_m3a2_par IMPLEMENTATION.
  METHOD get_flights BY DATABASE FUNCTION
                        FOR HDB
                        LANGUAGE SQLSCRIPT
                        OPTIONS READ-ONLY
                        USING scarr spfli.
    RETURN select :client       AS client,
                  sf.carrid      as carrid,
                  sf.connid      as connid,
                  sc.carrname    as carrname,
                  sc.currcode    as currcode,
                  sc.url         as url,
                  sf.countryfr   as countryfr,
                  sf.airpfrom    as airpfrom,
                  sf.countryto   as countryto,
                  sf.cityfrom    as cityfrom,
                  sf.cityto      as cityto
    from spfli as sf
    inner join scarr as sc
    on sc.carrid = sf.carrid
    where sf.mandt  = :client
      AND sf.connid = :p_connid;

  ENDMETHOD.

ENDCLASS.
