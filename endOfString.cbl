           identification division.
           program-id. StringEndsWith.
           data division.

           WORKING-STORAGE SECTION.
           01  str.
               05 str-length   pic 9(3).
               05 ws-str            pic x occurs 0 to 100 times
                                     depending on str-length.
           01  end-str.
               05 e-length     pic 9(3).
               05 ws-end            pic x occurs 0 to 100 times
                                     depending on e-length.
           01  result          pic 9 VALUE 1.
           01  WS-I   PIC 999 .

           procedure division .

                   move "004HABc" to str
                   move "003abc" to end-str
      * assign '1' to result if str ends with end-str, otherwise '0'

                   PERFORM VARYING WS-I FROM 0 BY 1
                       UNTIL WS-I = e-length
                   IF FUNCTION UPPER-CASE(ws-end(e-length - WS-I))
                      <>
                      FUNCTION UPPER-CASE(ws-str(str-length - WS-I))
                           MOVE 0 TO result

                       END-IF

                    END-PERFORM

                    DISPLAY result



           STOP RUN.
