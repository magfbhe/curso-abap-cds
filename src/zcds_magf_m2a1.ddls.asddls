@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS com Join'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true
define view entity ZCDS_MAGF_M2A1 as select from spfli
inner join scarr
//left outer join scarr
//right outer join scarr
on spfli.carrid = scarr.carrid
{
    @EndUserText.label: 'ID comp. Aerea'
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
}
