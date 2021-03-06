REPORT demo_create_tabular_data.

CLASS demo DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS demo IMPLEMENTATION.
  METHOD main.

    DATA dref TYPE REF TO data.

    DATA: dbtab TYPE tabname VALUE 'SPFLI',
          rows  TYPE i VALUE 100.

    FIELD-SYMBOLS <table> TYPE ANY TABLE.

    cl_demo_input=>new(
      )->add_field( CHANGING field = dbtab
      )->add_field( CHANGING field = rows )->request( ).

    DATA(out) = cl_demo_output=>new( ).

    dbtab = to_upper( dbtab ).
    TRY.
        cl_abap_dyn_prg=>check_table_name_str(
          val = dbtab
          packages = 'SAPBC_DATAMODEL' ).
      CATCH cx_abap_not_a_table.
        out->display( 'Database table not found' ).
        LEAVE PROGRAM.
      CATCH cx_abap_not_in_package.
        out->display(
          'Only tables from the flight data model are allowed' ).
        LEAVE PROGRAM.
    ENDTRY.

    TRY.
        CREATE DATA dref TYPE STANDARD TABLE OF (dbtab)
                              WITH NON-UNIQUE DEFAULT KEY.
        ASSIGN dref->* TO <table>.
        SELECT *
               FROM (dbtab) UP TO @rows ROWS
               INTO TABLE @<table>.
        out->display( <table> ).
      CATCH cx_sy_create_data_error.
        out->display( 'Error in data creation' ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  demo=>main( ).
