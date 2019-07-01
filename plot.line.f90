SUBROUTINE line_int(x1, y1, x2, y2, stroke_w, stroke_c)
!###########################################
INTEGER(kind=StandardInteger), INTENT(IN) :: x1
INTEGER(kind=StandardInteger), INTENT(IN) :: y1
INTEGER(kind=StandardInteger), INTENT(IN) :: x2
INTEGER(kind=StandardInteger), INTENT(IN) :: y2
INTEGER(kind=StandardInteger), INTENT(IN) :: stroke_w
CHARACTER(len=7), INTENT(IN) :: stroke_c
!###########################################
CALL line_dp(1.0D0 * x1, 1.0D0 * y1, 1.0D0 * x2, 1.0D0 * y2, 1.0D0 * stroke_w, stroke_c)
END SUBROUTINE line_int


SUBROUTINE line_dp(x1, y1, x2, y2, stroke_w, stroke_c)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x1
REAL(kind=DoubleReal), INTENT(IN) :: y1
REAL(kind=DoubleReal), INTENT(IN) :: x2
REAL(kind=DoubleReal), INTENT(IN) :: y2
REAL(kind=DoubleReal), INTENT(IN) :: stroke_w
CHARACTER(len=7), INTENT(IN) :: stroke_c
!###########################################
CHARACTER(len=16) :: x1_text
CHARACTER(len=16) :: y1_text
CHARACTER(len=16) :: x2_text
CHARACTER(len=16) :: y2_text
CHARACTER(len=16) :: stroke_w_text
INTEGER(kind=StandardInteger) :: x1_len
INTEGER(kind=StandardInteger) :: y1_len
INTEGER(kind=StandardInteger) :: x2_len
INTEGER(kind=StandardInteger) :: y2_len
INTEGER(kind=StandardInteger) :: sw_len
CHARACTER(len=128) :: theline
!###########################################

CALL blank_line(theline) 
CALL dp_text(x1, x1_text, x1_len)
CALL dp_text(y1, y1_text, y1_len)
CALL dp_text(x2, x2_text, x2_len)
CALL dp_text(y2, y2_text, y2_len)
CALL dp_text(stroke_w, stroke_w_text, sw_len)

theline = '<line '// &
'x1="'//x1_text(1:x1_len)//'" '// &
'y1="'//y1_text(1:y1_len)//'" '// &
'x2="'//x2_text(1:x2_len)//'" '// &
'y2="'//y2_text(1:y2_len)//'" '// &
'stroke-width="'//stroke_w_text(1:sw_len)//'" '// &
'stroke="'//stroke_c//'" '// &
'/>'
CALL add_instruction(theline)

END SUBROUTINE line_dp