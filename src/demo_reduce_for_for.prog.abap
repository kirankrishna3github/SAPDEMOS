REPORT demo_reduce_for_for.

CLASS demo DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS demo IMPLEMENTATION.
  METHOD main.
    TYPES:
      BEGIN OF line,
        col1 TYPE i,
        col2 TYPE i,
      END OF line,
      BEGIN OF line1,
        col1 TYPE i,
        col2 TYPE STANDARD TABLE OF line WITH EMPTY KEY,
      END OF line1,
      itab1 TYPE STANDARD TABLE OF line1 WITH EMPTY KEY,
      BEGIN OF line2,
        col1 TYPE i,
        col2 TYPE i,
        col3 TYPE i,
      END OF line2.

    DATA(out) = cl_demo_output=>new( ).

    DATA(itab1) = VALUE itab1(
      ( col1 = 1 col2 = VALUE line1-col2( ( col1 = 111 col2 = 112 )
                                          ( col1 = 121 col2 = 122 ) ) )
      ( col1 = 2 col2 = VALUE line1-col2( ( col1 = 211 col2 = 212 )
                                          ( col1 = 221 col2 = 222 ) ) )
      ( col1 = 3 col2 = VALUE line1-col2( ( col1 = 311 col2 = 312 )
                                          ( col1 = 321 col2 = 322 ) ) )
                             ).
    LOOP AT itab1 INTO DATA(line1).
      out->write( name = |ITAB1, Line { sy-tabix }, COL2|
                  data = line1-col2 ).
    ENDLOOP.

    DATA(result) = REDUCE string(
      INIT text TYPE string
      FOR wa1 IN itab1
      FOR wa2 IN wa1-col2
      NEXT text =
             |{ text } { wa1-col1 }, { wa2-col1 }, { wa2-col2 }\n| ).
    out->write_html( `<b>Result</b>`
      )->write(  result  ).

    out->display( ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  demo=>main( ).
