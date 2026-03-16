*&---------------------------------------------------------------------*
*& Report ZR_MAGF_SPFLI_CDS_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_magf_spfli_cds_alv.

START-OF-SELECTION.

  cl_salv_gui_table_ida=>create_for_cds_view( iv_cds_view_name = 'ZCDS_SPLFI_MVMGARCIAFIL' )->fullscreen( )->display( ).
