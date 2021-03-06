       IDENTIFICATION DIVISION.
       PROGRAM-ID. ASSERT-EQUAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       COPY 'test-context.cpy'.
       01  TEST-NAME   PIC X(30).
       01  EXPECTED    PIC 9(4)V9(3).
       01  ACTUAL      PIC 9(4)V9(3).
       01  MARGIN      PIC 9(4)V9(3).
       PROCEDURE DIVISION USING TEST-CONTEXT, TEST-NAME,
                                           EXPECTED, ACTUAL, MARGIN.
       MAIN-PROCEDURE.
           ADD 1 to TESTS-RUN.

           IF (EXPECTED - ACTUAL) IS <= MARGIN THEN
               ADD 1 TO PASSES
           ELSE
               DISPLAY 'FAILED: ' FUNCTION TRIM(TEST-NAME) '. Expected '
               EXPECTED ' but was ' ACTUAL
               ADD 1 TO FAILURES.

           GOBACK.
       END PROGRAM ASSERT-EQUAL.
