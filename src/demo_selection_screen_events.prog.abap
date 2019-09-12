REPORT demo_selection_screen_events MESSAGE-ID sabapdemos.

DATA field1(10) TYPE c.

SELECT-OPTIONS sel_opt1 FOR field1.
SELECTION-SCREEN BEGIN OF BLOCK block1.
PARAMETERS:  test1(10) TYPE c,
             test2(10) TYPE c.
SELECTION-SCREEN END OF BLOCK block1.

PARAMETERS: r1 RADIOBUTTON GROUP rad1 DEFAULT 'X',
            r2 RADIOBUTTON GROUP rad1.

AT SELECTION-SCREEN.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'.

AT SELECTION-SCREEN OUTPUT.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'OUTPUT'.

AT SELECTION-SCREEN ON sel_opt1.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON SEL_OPT1'.

AT SELECTION-SCREEN ON test1.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON TEST1'.

AT SELECTION-SCREEN ON test2.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON TEST2'.

AT SELECTION-SCREEN ON END OF sel_opt1.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON END OF SEL_OPT1'.

AT SELECTION-SCREEN ON HELP-REQUEST FOR sel_opt1-low.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON HELP-REQUEST FOR SEL_OPT1-LOW'.

AT SELECTION-SCREEN ON HELP-REQUEST FOR sel_opt1-high.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON HELP-REQUEST FOR SEL_OPT1-HIGH'.

AT SELECTION-SCREEN ON HELP-REQUEST FOR test1.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON HELP-REQUEST FOR TEST1'.

AT SELECTION-SCREEN ON HELP-REQUEST FOR test2.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON HELP-REQUEST FOR TEST2'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR sel_opt1-low.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON VALUE-REQUEST FOR SEL_OPT1-LOW'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR sel_opt1-high.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON VALUE-REQUEST FOR SEL_OPT1-HIGH'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR test1.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON VALUE-REQUEST FOR TEST1'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR test2.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON VALUE-REQUEST FOR TEST2'.

AT SELECTION-SCREEN ON BLOCK block1.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON BLOCK BLOCK1'.

AT SELECTION-SCREEN ON RADIOBUTTON GROUP rad1.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON RADIOBUTTON GROUP RAD1'.
