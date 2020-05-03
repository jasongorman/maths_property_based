       IDENTIFICATION DIVISION.
       PROGRAM-ID. CEILING-TEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    Test data
           01  INPUT-NUMBER    PIC 9(4)V9(3).
           01  RESULT          PIC 9(4)V9(3).
           01  EXPECTED-RESULT   PIC 9(4)V9(3).
      *    Test stats
       LINKAGE SECTION.
           COPY 'test-context.cpy'.
       PROCEDURE DIVISION USING TEST-CONTEXT.
       MAIN-PROCEDURE.
           PERFORM CEILING-OF-ZERO-TEST.
           PERFORM CEILING-OF-POINT-SEVEN-TEST.
           PERFORM CEILING-OF-POINT-FOUR-TEST.

           GOBACK.

       CEILING-OF-ZERO-TEST.
           MOVE 0.0 TO INPUT-NUMBER.
           MOVE 0.0 TO EXPECTED-RESULT.

           CALL 'CEIL' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT,
               'CEILING-OF-ZERO-TEST', EXPECTED-RESULT, RESULT.

       CEILING-OF-POINT-SEVEN-TEST.
           MOVE 0.7 TO INPUT-NUMBER.
           MOVE 1.0 TO EXPECTED-RESULT.

           CALL 'CEIL' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT,
               'CEILING-OF-POINT-SEVEN-TEST', EXPECTED-RESULT, RESULT.

       CEILING-OF-POINT-FOUR-TEST.
           MOVE 0.4 TO INPUT-NUMBER.
           MOVE 1.0 TO EXPECTED-RESULT.

           CALL 'CEIL' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT,
               'CEILING-OF-POINT-FOUR-TEST', EXPECTED-RESULT, RESULT.

       END PROGRAM CEILING-TEST.
