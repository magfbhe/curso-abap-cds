//Cds com Associação
@EndUserText.label: 'CDS com Associação'
@Metadata.ignorePropagatedAnnotations: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
define view entity ZCDS_MAGF_M2A2 as select from scarr
association to parent spfli as _scarr_to_splfi
    on $projection.Carrid = _scarr_to_splfi.carrid
{
    key carrid as Carrid,
    carrname as Carrname,
    currcode as Currcode,
    url as Url,
    //_scarr_to_splfi.cityfrom, Se quiser que ja execute a associação
    _scarr_to_splfi // Make association public
}
