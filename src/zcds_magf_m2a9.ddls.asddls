//Cds com Parametros - Lista
// 1 - Forma
// Select limpo sem filtro, nesse caso o filtro seria no abap
//DATA: lt_country TYPE STANDARD TABLE OF spfli-countryto.
//lt_country = VALUE #( ( 'BR' ) ( 'US' ) ( 'DE' ) ).
//SELECT *
//  FROM zcds_magf_m2a9
//  WHERE countryto IN @lt_country
//  INTO TABLE @DATA(lt_result).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds com Paramêtros - Lista( 1ª Forma)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_MAGF_M2A9 as select from spfli
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
}
