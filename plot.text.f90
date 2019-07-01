SUBROUTINE text_dp_int(x, y, int_in)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x
REAL(kind=DoubleReal), INTENT(IN) :: y
INTEGER(kind=StandardInteger), INTENT(IN) :: int_in
!###########################################
CHARACTER(len=16) :: text_in
INTEGER(kind=StandardInteger) :: text_len
!###########################################
CALL int_text(int_in, text_in, text_len)
CALL text_dp_char(x, y, text_in(1:text_len))
END SUBROUTINE text_dp_int

SUBROUTINE text_dp_dp(x, y, dp_in)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x
REAL(kind=DoubleReal), INTENT(IN) :: y
REAL(kind=DoubleReal), INTENT(IN) :: dp_in
!###########################################
CHARACTER(len=16) :: text_in
INTEGER(kind=StandardInteger) :: text_len
!###########################################
CALL dp_text(dp_in, text_in, text_len)
CALL text_dp_char(x, y, text_in(1:text_len))
END SUBROUTINE text_dp_dp




SUBROUTINE text_int_char(x, y, text_in)
!###########################################
INTEGER(kind=StandardInteger), INTENT(IN) :: x
INTEGER(kind=StandardInteger), INTENT(IN) :: y
CHARACTER(*), INTENT(IN) :: text_in
!###########################################
CALL text_dp_char(1.0D0 * x, 1.0D0 * y, text_in)
END SUBROUTINE text_int_char


SUBROUTINE text_dp_char(x, y, text_in)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x
REAL(kind=DoubleReal), INTENT(IN) :: y
CHARACTER(*), INTENT(IN) :: text_in
!###########################################
CHARACTER(len=16) :: x_text
CHARACTER(len=16) :: y_text
INTEGER(kind=StandardInteger) :: x_len
INTEGER(kind=StandardInteger) :: y_len
CHARACTER(len=256) :: text_line
!###########################################

CALL blank_line(text_line) 
CALL dp_text(x, x_text, x_len)
CALL dp_text(y, y_text, y_len)

text_line = '<text '// &
'x="'//x_text(1:x_len)//'" '// &
'y="'//y_text(1:y_len)//'" '// &
'class="small" '// &
'>'// &
trim(text_in) // &
'</text>'
CALL add_instruction(text_line)

END SUBROUTINE text_dp_char