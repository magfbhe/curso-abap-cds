//Cds com Associação Entity
@AbapCatalog.sqlViewName: 'ZMAGFM2A2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@EndUserText.label: 'CDS com Associação'
@AccessControl.authorizationCheck: #CHECK
define view ZCDS_MAGF_M2A2_ENTITY as select from scarr
association to parent spfli as _scarr_to_splfi
    on $projection.Carrid = _scarr_to_splfi.carrid
{
    key carrid as Carrid,
    key _scarr_to_splfi.connid as Connid,
    carrname as Carrname,
    currcode as Currcode,
    url as Url,
    //_scarr_to_splfi.cityfrom, Se quiser que ja execute a associação
    _scarr_to_splfi // Make association public
}
