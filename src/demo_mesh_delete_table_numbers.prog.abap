REPORT demo_mesh_delete_table_numbers.

CLASS demo DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      main,
      class_constructor.
  PRIVATE SECTION.
    TYPES:
      BEGIN OF line1,
        col1 TYPE i,
        col2 TYPE i,
      END OF line1,
      t_itab1 TYPE SORTED TABLE OF line1
                   WITH NON-UNIQUE KEY col1 col2,
      BEGIN OF line2,
        col1 TYPE i,
        col2 TYPE i,
        col3 TYPE i,
      END OF line2,
      t_itab2 TYPE SORTED TABLE OF line2
                   WITH NON-UNIQUE KEY col1 col2
                   WITH UNIQUE HASHED KEY mkey
                        COMPONENTS col1 col2 col3,
      BEGIN OF MESH t_mesh,
        node1 TYPE t_itab1
          ASSOCIATION _node2 TO node2 ON col1 = col1
                                     AND col2 = col2,
        node2 TYPE t_itab2,
      END OF MESH t_mesh.
    CLASS-DATA
      mesh TYPE t_mesh.
ENDCLASS.

CLASS demo IMPLEMENTATION.
  METHOD main.
    DATA(out) = cl_demo_output=>new(
      )->begin_section( 'Initial node1'
      )->write( mesh-node1
      )->next_section( 'Initial node2'
      )->write( mesh-node2 ).

    out->next_section( 'Delete One Line Using ON' ).
    DELETE TABLE mesh-node1\_node2[ mesh-node1[ 1 ] ].
    out->write( mesh-node2 ).

    out->next_section( 'Delete One Line Using ON and WITH KEY' ).
    DELETE TABLE mesh-node1\_node2[ mesh-node1[ 2 ] ]
      WITH TABLE KEY mkey COMPONENTS col3 = 23.
    out->write( mesh-node2 ).

    out->next_section( 'Delete One Line Using ON and FROM wa' ).
    DELETE TABLE mesh-node1\_node2[ mesh-node1[ 3 ] ]
      FROM VALUE line2( col3 = 33  ) USING KEY mkey.
    out->write( mesh-node2 ).

    out->display( ).
  ENDMETHOD.
  METHOD class_constructor.
    mesh-node1 = VALUE #(
      FOR j = 1 UNTIL j > 5
      ( col1 = 10 * j + 1 col2 = 10 * j + 2 ) ).
    DO lines( mesh-node1 ) TIMES.
      INSERT VALUE line2( col3 = 3 + sy-index * 10 )
             INTO TABLE mesh-node1\_node2[ mesh-node1[ sy-index ] ].
    ENDDO.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  demo=>main( ).
