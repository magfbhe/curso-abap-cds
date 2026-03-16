//Cds com Parametros - Lista e Range
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds com Paramêtros - Lista e Range'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_MAGF_M2A10
  with parameters
    p_countryto_from : abap.char(2),
    p_countryto_to   : abap.char(2),
    p_airpfrom       : abap.char( 3)
as select from spfli
{
    key carrid as Carrid,
    key connid as Connid,
    countryfr as Countryfr,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    countryto as Countryto,
    cityto as Cityto,
    airpto as Airpto,
    fltime as Fltime,
    deptime as Deptime,
    arrtime as Arrtime,
    @Semantics.quantity.unitOfMeasure: 'Distid'
    distance as Distance,
    distid as Distid,
    fltype as Fltype,
    period as Period
} where countryto between
      $parameters.p_countryto_from
  and $parameters.p_countryto_to
  and airpfrom = $parameters.p_airpfrom
