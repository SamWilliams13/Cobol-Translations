       IDENTIFICATION DIVISION.
           PROGRAM-ID. ComplexData.
      *> How to write a file     

       DATA DIVISION.
           WORKING-STORAGE SECTION.
      *> Some complex data type, notice the "02", "03" levels
           01  Employee.
               02 fname     PIC X(10).
               02 lname     PIC X(10).
               02 SSN.
                   03 A     PIC 999.
                   03 B     PIC 99.
                   03 C     PIC 9(4).
               02 city      PIC X(10).
           01 n-letters     PIC 9.

       PROCEDURE DIVISION.           
      *> Set the values of the fields.
      *> this does not work
           MOVE "Michael Smith     123456789 Portland" TO Employee
           DISPLAY fname
      
      *> This works
           MOVE "Michael   Smith     123456789Portland" TO Employee
           DISPLAY fname ", " lname " SSN: "A "-" B "-" C

      *> This works, too
           MOVE "Michael" TO fname
           MOVE "Smith" TO lname
           MOVE "123456789" TO SSN
           MOVE "Portland" TO city
           DISPLAY fname ", " lname " SSN: "A "-" B "-" C

      *> Another way
           MOVE "Michael" TO fname
           MOVE "Smith" TO lname
           MOVE "123"  TO A
           MOVE "45"   TO B
           MOVE "6789" TO C
           MOVE "Portland" TO city
           DISPLAY fname ", " lname " SSN: "A "-" B "-" C.
