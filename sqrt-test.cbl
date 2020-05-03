       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQRT-TEST.
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
           PERFORM SQRT-OF-ZERO-TEST.
           PERFORM SQRT-OF-ONE-TEST.
           PERFORM SQRT-OF-FOUR-TEST.
           PERFORM SQRT-OF-NINE-TEST.
           PERFORM SQRT-OF-SIXTEEN-TEST.
           PERFORM SQRT-OF-POINT-TWO-FIVE-TEST.

           GOBACK.

       SQRT-OF-ZERO-TEST.
           MOVE 0.0 TO INPUT-NUMBER.
           MOVE 0.0 TO EXPECTED-RESULT.

           CALL 'SQRT' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT, 'SQRT-OF-ZERO-TEST',
                                   EXPECTED-RESULT, RESULT.

       SQRT-OF-ONE-TEST.
           MOVE 1.0 TO INPUT-NUMBER.
           MOVE 1.0 TO EXPECTED-RESULT.

           CALL 'SQRT' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT, 'SQRT-OF-ONE-TEST',
                                   EXPECTED-RESULT, RESULT.

       SQRT-OF-FOUR-TEST.
           MOVE 4.0 TO INPUT-NUMBER.
           MOVE 2.0 TO EXPECTED-RESULT.

           CALL 'SQRT' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT, 'SQRT-OF-FOUR-TEST',
                                   EXPECTED-RESULT, RESULT.

       SQRT-OF-NINE-TEST.
           MOVE 9.0 TO INPUT-NUMBER.
           MOVE 3.0 TO EXPECTED-RESULT.

           CALL 'SQRT' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT, 'SQRT-OF-NINE-TEST',
                                   EXPECTED-RESULT, RESULT.

       SQRT-OF-SIXTEEN-TEST.
           MOVE 16.0 TO INPUT-NUMBER.
           MOVE 4.0 TO EXPECTED-RESULT.

           CALL 'SQRT' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT,
               'SQRT-OF-SIXTEEN-TEST', EXPECTED-RESULT, RESULT.

       SQRT-OF-POINT-TWO-FIVE-TEST.
           MOVE 0.25 TO INPUT-NUMBER.
           MOVE 0.5 TO EXPECTED-RESULT.

           CALL 'SQRT' USING INPUT-NUMBER, RESULT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT,
               'SQRT-OF-POINT-TWO-FIVE-TEST', EXPECTED-RESULT, RESULT.

       END PROGRAM SQRT-TEST.