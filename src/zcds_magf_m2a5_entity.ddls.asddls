////Cds com Join E Parametros Entity
// Para usar o odata:publish nao pode ser entity view
@AbapCatalog.sqlViewName: 'ZMAGFM2A5'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds com Join e Paramêtros Entity'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
define view ZCDS_MAGF_M2A5_Entity with parameters
    p_countryto : land1
as select from spfli
  inner join scarr
    on spfli.carrid = scarr.carrid
{
    key spfli.carrid    as Carrid,
    key spfli.connid    as Connid,
        spfli.countryfr as Countryfr,
        spfli.cityfrom  as Cityfrom,
        spfli.airpfrom  as Airpfrom,
        spfli.countryto as Countryto,
        spfli.cityto    as Cityto,
        spfli.airpto    as Airpto,
        spfli.deptime   as Deptime,
        spfli.arrtime   as Arrtime,
        @Semantics.quantity.unitOfMeasure: 'Distid'
        spfli.distance  as Distance,
        spfli.distid    as Distid,
        spfli.fltype    as Fltype,
        spfli.period    as Period
}
where spfli.countryto = $parameters.p_countryto
