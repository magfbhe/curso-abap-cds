// Extensao CDS Entity
@AbapCatalog.sqlViewAppendName: 'ZMAGFM3A2E'
@EndUserText.label: 'Extensão de CDS'
extend view ZCDS_MAGF_M2A2_ENTITY with ZCDS_MAGF_M2A3_ENTITY{
    _scarr_to_splfi.cityfrom,
    _scarr_to_splfi.cityto
}
