REPORT zr_magf_cds_hier.

*---------------------------------------------------------------------*
* Types
*---------------------------------------------------------------------*
TYPES: BEGIN OF ty_cds,
         empid            TYPE zcds_magf_m3a1-empid,
         empname          TYPE zcds_magf_m3a1-empname,
         managerid        TYPE zcds_magf_m3a1-managerid,
         costcenter       TYPE zcds_magf_m3a1-costcenter,
         hier_lvl         TYPE zcds_magf_m3a1-hier_lvl,
         hier_rank        TYPE zcds_magf_m3a1-hier_rank,
         hier_orphan      TYPE zcds_magf_m3a1-hier_orphan,
         hier_parent_rank TYPE zcds_magf_m3a1-hier_parent_rank,
         hier_tree_size   TYPE zcds_magf_m3a1-hier_tree_size,
         id_node          TYPE zcds_magf_m3a1-id_node,
         id_parent        TYPE zcds_magf_m3a1-id_parent,
       END OF ty_cds.

TYPES: BEGIN OF ty_node_map,
         id_node TYPE zcds_magf_m3a1-id_node,
         nkey    TYPE lvc_nkey,
       END OF ty_node_map.

*---------------------------------------------------------------------*
* Data
*---------------------------------------------------------------------*
DATA: gt_cds      TYPE STANDARD TABLE OF ty_cds,
      gt_dummy    TYPE STANDARD TABLE OF zcds_magf_m3a1,
      gt_node_map TYPE HASHED TABLE OF ty_node_map
                    WITH UNIQUE KEY id_node,
      gt_fcat     TYPE lvc_t_fcat.

DATA: go_container TYPE REF TO cl_gui_custom_container,
      go_tree      TYPE REF TO cl_gui_alv_tree.

*---------------------------------------------------------------------*
* Start
*---------------------------------------------------------------------*
START-OF-SELECTION.
  PERFORM get_data.
  CALL SCREEN 100.

*---------------------------------------------------------------------*
* Screen
*---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'S100'.
  IF go_tree IS INITIAL.
    PERFORM build_tree.
  ENDIF.
ENDMODULE.

MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK' OR 'EXIT' OR 'CANCEL'.
      LEAVE PROGRAM.
  ENDCASE.
ENDMODULE.

*---------------------------------------------------------------------*
* Forms
*---------------------------------------------------------------------*
FORM get_data.
  SELECT *
    FROM zcds_magf_m3a1
    INTO TABLE @gt_cds.
ENDFORM.

FORM build_tree.

  CREATE OBJECT go_container
    EXPORTING
      container_name = 'CC_ALV'.

  CREATE OBJECT go_tree
    EXPORTING
      parent = go_container.

  PERFORM build_fcat.

  go_tree->set_table_for_first_display(
    EXPORTING
      i_structure_name = ''
    CHANGING
      it_outtab        = gt_dummy
      it_fieldcatalog = gt_fcat
  ).

  PERFORM add_nodes.

  go_tree->frontend_update( ).

ENDFORM.

FORM build_fcat.

*  DATA ls_fcat TYPE lvc_s_fcat.
*
*  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
*    EXPORTING
*      i_structure_name = 'ZCDS_MAGF_M3A1'
*    CHANGING
*      ct_fieldcat      = gt_fcat.
*
*  DELETE gt_fcat WHERE fieldname NOT IN ( 'EMPNAME' 'COSTCENTER' ).
  DATA ls_fcat TYPE lvc_s_fcat.

  CLEAR ls_fcat.
  ls_fcat-fieldname = 'EMPNAME'.
  ls_fcat-coltext   = 'Employee'.
  APPEND ls_fcat TO gt_fcat.

  CLEAR ls_fcat.
  ls_fcat-fieldname = 'COSTCENTER'.
  ls_fcat-coltext   = 'Cost Center'.
  APPEND ls_fcat TO gt_fcat.
ENDFORM.

FORM add_nodes.

  DATA: lv_node_key   TYPE lvc_nkey,
        lv_parent_key TYPE lvc_nkey.

  SORT gt_cds BY hier_rank.

  LOOP AT gt_cds INTO DATA(ls_cds).

    CLEAR lv_parent_key.

    IF ls_cds-id_parent IS NOT INITIAL.
      READ TABLE gt_node_map
        WITH TABLE KEY id_node = ls_cds-id_parent
        INTO DATA(ls_parent).
      IF sy-subrc = 0.
        lv_parent_key = ls_parent-nkey.
      ENDIF.
    ENDIF.

    go_tree->add_node(
      EXPORTING
        i_relat_node_key = lv_parent_key
        i_relationship = 4
        i_node_text     = |{ ls_cds-empname }|
        is_outtab_line  = ls_cds
      IMPORTING
        e_new_node_key  = lv_node_key
    ).

    INSERT VALUE ty_node_map(
      id_node = ls_cds-id_node
      nkey    = lv_node_key
    ) INTO TABLE gt_node_map.

  ENDLOOP.

ENDFORM.
