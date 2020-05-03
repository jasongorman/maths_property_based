       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQRT-TEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01  NUM                 PIC 9(4)V9(4).
           01  ROOT                PIC 9(4)V9(4).
           01  RESULT              PIC 9(4)V9(4).
           01  MARGIN              PIC 9(4)V9(3) VALUE 0.01.
           01  DISPLAY-NUM         PIC zzz9.99.
           01  TEST-NAME       PIC X(30).
       LINKAGE SECTION.
           COPY 'test-context.cpy'.
       PROCEDURE DIVISION USING TEST-CONTEXT.
       MAIN-PROCEDURE.
           PERFORM SQRT-TEST VARYING NUM FROM 1 BY 1 UNTIL NUM > 1000.
           GOBACK.

       SQRT-TEST.
           MOVE NUM TO DISPLAY-NUM.
           STRING 'SQRT-OF-'
                   FUNCTION TRIM(DISPLAY-NUM)
                   '-TEST'
           INTO TEST-NAME
           END-STRING.

           CALL 'SQRT' USING NUM, ROOT.

           COMPUTE RESULT = ROOT * ROOT.

           CALL 'ASSERT-EQUAL' USING TEST-CONTEXT, TEST-NAME,
                                   NUM, RESULT, MARGIN.

       END PROGRAM SQRT-TEST.
