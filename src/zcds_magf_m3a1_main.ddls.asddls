// CDs hierarquica
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds Hierarquica'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_MAGF_M3A1_MAIN as select from zemployee
association[0..1] to ZCDS_MAGF_M3A1_MAIN as _manager 
    on $projection.ManagerId = _manager.EmpId
{
    key emp_id as EmpId,
    emp_name as EmpName,
    manager_id as ManagerId,
    cost_center as CostCenter,
    _manager // Make association public
}
