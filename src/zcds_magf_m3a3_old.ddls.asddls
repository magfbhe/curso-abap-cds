// Extensão de CDS
@AbapCatalog.sqlViewAppendName: 'ZMAGFM3A3'
@EndUserText.label: 'Extensão de CDS'
extend view ZCDS_MAGF_M2A2 with ZCDS_MAGF_M3A3_OLD{
    _scarr_to_splfi.airpfrom,
    _scarr_to_splfi.airpto
}
