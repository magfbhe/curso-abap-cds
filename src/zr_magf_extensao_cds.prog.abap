*&---------------------------------------------------------------------*
*& Report zr_magf_extensao_cds
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_magf_extensao_cds.

*---------------------------------------------------------------------*
* Data
*---------------------------------------------------------------------*
DATA:
  gt_data TYPE STANDARD TABLE OF zcds_magf_m2a2,
  gr_alv  TYPE REF TO cl_salv_table.


*---------------------------------------------------------------------*
* Start of Selection
*---------------------------------------------------------------------*
START-OF-SELECTION.

*  IF p_connid IS NOT INITIAL.
    SELECT *
      FROM zcds_magf_m2a2
      INTO TABLE @gt_data.
*  ELSE.
*    SELECT *
*        FROM zcds_magf_m3a2
*        INTO TABLE @gt_data.
*  ENDIF.
  IF gt_data IS INITIAL.
    MESSAGE 'Nenhum dado encontrado para o CONNID informado' TYPE 'E'.
    RETURN.
  ENDIF.

*---------------------------------------------------------------------*
* ALV
*---------------------------------------------------------------------*
  cl_salv_table=>factory( IMPORTING r_salv_table = gr_alv
                          CHANGING  t_table      = gt_data ).
  gr_alv->get_functions( )->set_all( abap_true ).
  gr_alv->get_columns( )->set_optimize( abap_true ).
  gr_alv->get_display_settings( )->set_list_header( |Extensao CDS| ).
  gr_alv->display( ).
