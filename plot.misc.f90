SUBROUTINE line_length(line, line_len)
!###########################################
CHARACTER(*), INTENT(IN) :: line
INTEGER(kind=StandardInteger), INTENT(OUT) :: line_len
INTEGER(kind=StandardInteger) :: n
!###########################################
n = len(line)
line_len = len(line)
DO WHILE(n >= 1)
  IF(line(n:n) .NE. " ")THEN
    line_len = n
    n = 0
  END IF
  n = n - 1
END DO
END SUBROUTINE line_length


SUBROUTINE blank_line(line)
!###########################################
CHARACTER(*), INTENT(INOUT) :: line
INTEGER(kind=StandardInteger) :: n
!###########################################
DO n=1,LEN(line)
  line(n:n) = " "
END DO
END SUBROUTINE blank_line




SUBROUTINE int_text(int_in, line_out, line_len)
!###########################################
INTEGER(kind=StandardInteger), INTENT(IN) :: int_in
CHARACTER(*), INTENT(OUT) :: line_out
INTEGER(kind=StandardInteger), INTENT(OUT) :: line_len
!###########################################
INTEGER(kind=StandardInteger) :: n
CHARACTER(LEN=16) :: temp
!###########################################
CALL blank_line(temp)
CALL blank_line(line_out)
WRITE(temp, "(I16)") int_in
line_len = 0
DO n=1, LEN(temp)
  IF(temp(n:n) .NE. " ")THEN
    line_len = line_len + 1
    line_out(line_len:line_len) = temp(n:n)
  END IF
END DO
END SUBROUTINE int_text


SUBROUTINE dp_text(dp_in, line_out, line_len)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: dp_in
CHARACTER(*), INTENT(OUT) :: line_out
INTEGER(kind=StandardInteger), INTENT(OUT) :: line_len
!###########################################
INTEGER(kind=StandardInteger) :: n
CHARACTER(LEN=16) :: temp
!###########################################
CALL blank_line(temp)
CALL blank_line(line_out)
WRITE(temp, "(F10.5)") dp_in
line_len = 0
DO n=1, LEN(temp)
  IF(temp(n:n) .NE. " ")THEN
    line_len = line_len + 1
    line_out(line_len:line_len) = temp(n:n)
  END IF
END DO
END SUBROUTINE dp_text