// Cds com Associação e Parametros 3 tabelas
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS com Associação e Parâmetros'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_MAGF_M2A7
  with parameters
    p_countryto : abap.char( 2 )
as select from spfli
association to parent scarr as _spfli_to_scarr
    on $projection.Carrid = _spfli_to_scarr.carrid
association [0..*] to sflight as _spfli_to_sflight
    on  $projection.Carrid = _spfli_to_sflight.carrid
    and $projection.Connid = _spfli_to_sflight.connid
{
    key carrid   as Carrid,
    key connid   as Connid,
    countryfr    as Countryfr,
    cityfrom     as Cityfrom,
    airpfrom     as Airpfrom,
    countryto    as Countryto,
    cityto       as Cityto,
    airpto       as Airpto,
    fltime       as Fltime,
    deptime      as Deptime,
    arrtime      as Arrtime,
    @Semantics.quantity.unitOfMeasure: 'Distid'
    distance     as Distance,
    distid       as Distid,
    fltype       as Fltype,
    period       as Period,
    _spfli_to_scarr,    // Associação com SCARR
    _spfli_to_sflight   // Associação com SFLIGHT
}
where countryto = $parameters.p_countryto
