*&---------------------------------------------------------------------*
*& Report zr_magf_cds_lista
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_magf_cds_lista.

TABLES spfli.

DATA lt_ranges TYPE if_salv_service_types=>yt_named_ranges.

*---------------------------------------------------------------------*
* Seleção
*---------------------------------------------------------------------*
SELECT-OPTIONS: s_coun FOR spfli-countryto.

*---------------------------------------------------------------------*
* Execução
*---------------------------------------------------------------------*
START-OF-SELECTION.
*---------------------------------------------------------------------*
* Criar ALV IDA
*---------------------------------------------------------------------*
  DATA(lo_alv) = cl_salv_gui_table_ida=>create_for_cds_view( iv_cds_view_name = 'ZCDS_MAGF_M2A9' ).
*---------------------------------------------------------------------*
* Monta filtros (SELECT-OPTIONS → IDA)
*---------------------------------------------------------------------*
  DATA(lo_range_collector) =  NEW cl_salv_range_tab_collector( ).
  lo_range_collector->add_ranges_for_name( iv_name   = 'COUNTRYTO'
                                           it_ranges = s_coun[] ).
  lo_range_collector->get_collected_ranges( IMPORTING et_named_ranges = lt_ranges ).
  lo_alv->set_select_options( it_ranges = lt_ranges ).
*---------------------------------------------------------------------*
* Display
*---------------------------------------------------------------------*
  lo_alv->fullscreen( )->display( ).
