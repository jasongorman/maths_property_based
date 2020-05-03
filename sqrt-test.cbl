       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQRT-TEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 TEST-DATA.
               02  NUM-0       PIC 9(4)V9(3) VALUE ZEROES.
               02  ROOT-0      PIC 9(4)V9(3) VALUE ZEROES.
               02  NUM-1       PIC 9(4)V9(3) VALUE 1.0.
               02  ROOT-1      PIC 9(4)V9(3) VALUE 1.0.
               02  NUM-4       PIC 9(4)V9(3) VALUE 4.0.
               02  ROOT-2      PIC 9(4)V9(3) VALUE 2.0.
               02  NUM-9       PIC 9(4)V9(3) VALUE 9.0.
               02  ROOT-3      PIC 9(4)V9(3) VALUE 3.0.
               02  NUM-16      PIC 9(4)V9(3) VALUE 16.0.
               02  ROOT-4      PIC 9(4)V9(3) VALUE 4.0.
               02  NUM-0-25    PIC 9(4)V9(3) VALUE 0.25.
               02  ROOT-0-5    PIC 9(4)V9(3) VALUE 0.7.
           01  TEST-CASES REDEFINES TEST-DATA.
               02 TEST-CASE OCCURS 6 TIMES INDEXED BY I.
                   03  NUM     PIC 9(4)V9(3).
                   03  ROOT    PIC 9(4)V9(3).
           01  RESULT              PIC 9(4)V9(3).
           01  TEST-NAME       PIC X(30).
       LINKAGE SECTION.
           COPY 'test-context.cpy'.
       PROCEDURE DIVISION USING TEST-CONTEXT.
       MAIN-PROCEDURE.
           PERFORM SQRT-TEST VARYING I FROM 1 BY 1 UNTIL I > 6.
           GOBACK.

       SQRT-TEST.
           STRING 'SQRT-OF-'
                   FUNCTION TRIM(NUM(I))
                   '-TEST'
           INTO TEST-NAME
           END-STRING.

           CALL 'SQRT' USING NUM(I), RESULT.
           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT, TEST-NAME,
                                   ROOT(I), RESULT.

       END PROGRAM SQRT-TEST.
