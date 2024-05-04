       IDENTIFICATION DIVISION.
           PROGRAM-ID. NewtonRaphsonReciprocal.
      *> Newton-Raphson method for computing 1/a     

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01  A     PIC S99      VALUE 0.
           01  XNEW  PIC S9V9(5)  VALUE 0.
           01  XOLD  PIC S9V9(5)  VALUE -0.0100.
           01  N     PIC 99       VALUE 10.
           01  INV   PIC S9V9(5)  VALUE 0.

       PROCEDURE DIVISION.
      *> Get number
           DISPLAY "Insert Number (-10<n<10)"
           ACCEPT A
              
      *> Check input     
           IF A<=-10 OR A >+10 THEN
           DISPLAY "Error: number x must be -10 < x < +10"
           END-IF

           IF A = 0 THEN
           DISPLAY "Result: Infinite"
           END-IF

      *> Initialize the algorithm 
           IF A < 0 THEN
           MOVE -0.01 TO XOLD
           ELSE
           MOVE +0.01 TO XOLD
           END-IF  

      *> Use the algorithm
           IF (NOT A = 0) AND A > -10 AND A <= 10 THEN
               PERFORM N TIMES
                   COMPUTE XNEW = XOLD *( 2 - A * XOLD)
                   DISPLAY "Result: ",XNEW
                   MOVE XNEW TO XOLD
               END-PERFORM
               DIVIDE  A INTO 1 GIVING INV
               DISPLAY "Exact Result:" INV
           END-IF.
