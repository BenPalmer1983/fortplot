SUBROUTINE polyline_int(x, y, stroke_w, stroke_c, fill)
!###########################################
INTEGER(kind=StandardInteger), DIMENSION(:), INTENT(IN) :: x
INTEGER(kind=StandardInteger), DIMENSION(:), INTENT(IN) :: y
INTEGER(kind=StandardInteger), INTENT(IN) :: stroke_w
CHARACTER(len=7), INTENT(IN) :: stroke_c
CHARACTER(len=7), INTENT(IN) :: fill
!###########################################
CALL polyline_dp(1.0D0 * x, 1.0D0 * y, 1.0D0 * stroke_w, stroke_c, fill)
END SUBROUTINE polyline_int


SUBROUTINE polyline_dp(x, y, stroke_w, stroke_c, fill)
!###########################################
REAL(kind=DoubleReal), DIMENSION(:), INTENT(IN) :: x
REAL(kind=DoubleReal), DIMENSION(:), INTENT(IN) :: y
REAL(kind=DoubleReal), INTENT(IN) :: stroke_w
CHARACTER(len=7), INTENT(IN) :: stroke_c
CHARACTER(len=7), INTENT(IN) :: fill
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
INTEGER(kind=StandardInteger) :: n
!###########################################

CALL blank_line(theline) 
theline = '<polyline points="'
CALL add_instruction(theline)

CALL blank_line(theline) 
CALL add_instruction(theline)

DO n = 1, SIZE(x,1) - 1
  CALL dp_text(x(n), x1_text, x1_len)
  CALL dp_text(y(n), y1_text, y1_len)
  CALL dp_text(x(n+1), x2_text, x2_len)
  CALL dp_text(y(n+1), y2_text, y2_len)
  CALL blank_line(theline) 
  theline = x1_text(1:x1_len)//','//y1_text(1:y1_len)//' '// &
            x2_text(1:x2_len)//','//y2_text(1:y2_len)//' '
  CALL add_instruction(theline)
END DO

CALL dp_text(stroke_w, stroke_w_text, sw_len)
CALL blank_line(theline) 
theline = '" stroke="'//stroke_c//'" stroke-width="'//stroke_w_text(1:sw_len)//'" fill="none" />'
CALL add_instruction(theline)


END SUBROUTINE polyline_dp