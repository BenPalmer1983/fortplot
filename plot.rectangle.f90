SUBROUTINE rectangle_int(x, y, w, h, fill_in, stroke_w, stroke_c)
!###########################################
INTEGER(kind=StandardInteger), INTENT(IN) :: x
INTEGER(kind=StandardInteger), INTENT(IN) :: y
INTEGER(kind=StandardInteger), INTENT(IN) :: w
INTEGER(kind=StandardInteger), INTENT(IN) :: h
CHARACTER(*), INTENT(IN) :: fill_in
INTEGER(kind=StandardInteger), INTENT(IN) :: stroke_w
CHARACTER(len=7), INTENT(IN) :: stroke_c
!###########################################
CHARACTER(len=7) :: fill
!###########################################
fill = "       "
IF(LEN(fill_in) .GE. 7)THEN
  fill(1:7) = fill_in(1:7)
ELSE
  fill(1:LEN(fill_in)) = fill_in(1:LEN(fill_in))
END IF

!CALL line_dp(1.0D0 * x1, 1.0D0 * y1, 1.0D0 * x2, 1.0D0 * y2, 1.0D0 * stroke_w, stroke_c)
CALL rectangle_dp(1.0D0 * x, 1.0D0 * y, 1.0D0 * w, 1.0D0 * h, fill, 1.0D0 * stroke_w, stroke_c)
END SUBROUTINE rectangle_int

SUBROUTINE rectangle_dp(x, y, w, h, fill_in, stroke_w, stroke_c)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x
REAL(kind=DoubleReal), INTENT(IN) :: y
REAL(kind=DoubleReal), INTENT(IN) :: w
REAL(kind=DoubleReal), INTENT(IN) :: h
CHARACTER(*), INTENT(IN) :: fill_in
REAL(kind=DoubleReal), INTENT(IN) :: stroke_w
CHARACTER(len=7), INTENT(IN) :: stroke_c
!###########################################
CHARACTER(len=7) :: fill
CHARACTER(len=16) :: x_text
CHARACTER(len=16) :: y_text
CHARACTER(len=16) :: w_text
CHARACTER(len=16) :: h_text
CHARACTER(len=16) :: stroke_w_text
INTEGER(kind=StandardInteger) :: x_len
INTEGER(kind=StandardInteger) :: y_len
INTEGER(kind=StandardInteger) :: w_len
INTEGER(kind=StandardInteger) :: h_len
INTEGER(kind=StandardInteger) :: sw_len
CHARACTER(len=128) :: rect
!###########################################
fill = "       "
IF(LEN(fill_in) .GE. 7)THEN
  fill(1:7) = fill_in(1:7)
ELSE
  fill(1:LEN(fill_in)) = fill_in(1:LEN(fill_in))
END IF

! FLIP HEIGHT

CALL blank_line(rect) 
CALL dp_text(x, x_text, x_len)
CALL dp_text(y-h, y_text, y_len)
CALL dp_text(w, w_text, w_len)
CALL dp_text(h, h_text, h_len)
CALL dp_text(stroke_w, stroke_w_text, sw_len)

rect = '<rect x="'//x_text(1:x_len)//'" y="'//y_text(1:y_len)//'" '// &
'width="'//w_text(1:w_len)//'" height="'//h_text(1:h_len)//'" '// &
'fill="'//trim(fill)//'" '// &
'stroke-width="'//stroke_w_text(1:sw_len)//'" '// &
'stroke="'//stroke_c//'" '// &
'/>'
CALL add_instruction(rect)

END SUBROUTINE rectangle_dp