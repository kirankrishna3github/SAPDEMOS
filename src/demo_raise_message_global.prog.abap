REPORT demo_raise_message_global.

CLASS msg_demo DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS main.
  PRIVATE SECTION.
    CLASS-METHODS meth EXCEPTIONS exception.
ENDCLASS.

CLASS msg_demo IMPLEMENTATION.
  METHOD main.
    TRY.
        meth( EXCEPTIONS exception = 4 ).
        IF sy-subrc <> 0.
          RAISE EXCEPTION TYPE cx_demo_dyn_t100
            MESSAGE ID sy-msgid
                    TYPE sy-msgty
                    NUMBER sy-msgno
                    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
      CATCH cx_demo_dyn_t100 INTO DATA(oref).
        cl_demo_output=>display(
          |Caught exception:\n\n| &&
          |"{ oref->get_text( ) }", Type { oref->msgty } | ).
        MESSAGE oref TYPE 'I' DISPLAY LIKE oref->msgty.
    ENDTRY.
  ENDMETHOD.
  METHOD meth.
    MESSAGE e888(sabapdemos) WITH 'I' 'am' 'an' 'Exception!'
                             RAISING exception.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  msg_demo=>main( ).
