//Cds Com Parametros
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds com Paramêtros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_MAGF_M2A4 
with parameters p_moeda : abap.char( 3 )
as select from scarr
{
    key carrid as Carrid,
    carrname as Carrname,
    currcode as Currcode,
    url as Url
} where currcode = $parameters.p_moeda
