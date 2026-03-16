" ALV IDA não aceita parametros
" CDS com parâmetros → SEM IDA
" IDA e CDS com parâmetros são conceitos incompatíveis por design.

REPORT zr_magf_cds_range_2.

TABLES spfli.

SELECT-OPTIONS s_coun FOR spfli-countryto.
PARAMETERS: p_air(3) type c OBLIGATORY.
START-OF-SELECTION.

  IF s_coun[] IS INITIAL.
    MESSAGE 'Informe ao menos um país' TYPE 'E'.
  ENDIF.

  SORT s_coun BY low.

  DATA lt_data TYPE STANDARD TABLE OF zcds_magf_m2a8.

  IF not s_coun-high is INITIAL.
    data(lv_from) = s_coun-low.
    data(lv_to)   = s_coun-high.
  ELSE.
    lv_from = s_coun-low.
    lv_to   = s_coun-low.
  ENDIF.

  SELECT *
    FROM zcds_magf_m2a10(
           p_countryto_from = @lv_from,
           p_countryto_to   = @lv_to,
           p_airpfrom       = @p_air
         )
    INTO TABLE @lt_data
    ORDER BY countryto, connid.

  DATA lo_alv TYPE REF TO cl_salv_table.

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table = lo_alv
    CHANGING
      t_table      = lt_data
  ).

  lo_alv->display( ).
