SUBROUTINE circle_int(x, y, r, fill)
!###########################################
INTEGER(kind=StandardInteger), INTENT(IN) :: x
INTEGER(kind=StandardInteger), INTENT(IN) :: y
INTEGER(kind=StandardInteger), INTENT(IN) :: r
CHARACTER(len=7), INTENT(IN) :: fill
!###########################################
!CALL line_dp(1.0D0 * x1, 1.0D0 * y1, 1.0D0 * x2, 1.0D0 * y2, 1.0D0 * stroke_w, stroke_c)
CALL circle_dp(1.0D0 * x, 1.0D0 * y, 1.0D0 * r, fill)
END SUBROUTINE circle_int

SUBROUTINE circle_dp(x, y, r, fill)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x
REAL(kind=DoubleReal), INTENT(IN) :: y
REAL(kind=DoubleReal), INTENT(IN) :: r
CHARACTER(len=7), INTENT(IN) :: fill
!###########################################
CHARACTER(len=16) :: x_text
CHARACTER(len=16) :: y_text
CHARACTER(len=16) :: r_text
INTEGER(kind=StandardInteger) :: x_len
INTEGER(kind=StandardInteger) :: y_len
INTEGER(kind=StandardInteger) :: r_len
CHARACTER(len=128) :: circle_text
!###########################################

CALL blank_line(circle_text) 
CALL dp_text(x, x_text, x_len)
CALL dp_text(y, y_text, y_len)
CALL dp_text(r, r_text, r_len)

circle_text = '<circle '// &
'cx="'//x_text(1:x_len)//'" '// &
'cy="'//y_text(1:y_len)//'" '// &
'r="'//r_text(1:r_len)//'" '// &
'fill="'//fill//'" '// &
'/>'
CALL add_instruction(circle_text)

END SUBROUTINE circle_dp