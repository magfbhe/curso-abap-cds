//Cds com Join E Parametros
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds com Join e Paramêtros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true
define view entity ZCDS_MAGF_M2A5 
with parameters p_countryto : land1   
as select from spfli
inner join scarr
on spfli.carrid = scarr.carrid
{
    key spfli.carrid as Carrid,
    key spfli.connid as Connid,
    spfli.countryfr as Countryfr,
    spfli.cityfrom as Cityfrom,
    spfli.airpfrom as Airpfrom,
    spfli.countryto as Countryto,
    spfli.cityto as Cityto,
    spfli.airpto as Airpto,
    //spfli.fltime as Fltime,
    spfli.deptime as Deptime,
    spfli.arrtime as Arrtime,
     @Semantics.quantity.unitOfMeasure: 'Distid'
    spfli.distance as Distance,
    spfli.distid as Distid,
    spfli.fltype as Fltype,
    spfli.period as Period
} where spfli.countryto = $parameters.p_countryto
