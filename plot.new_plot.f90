SUBROUTINE new_plot(filename, num_in)
!###########################################
CHARACTER(*) :: filename
INTEGER(kind=StandardInteger), OPTIONAL :: num_in
!###########################################
CHARACTER(LEN=3) :: num
!###########################################
IF(PRESENT(num_in))THEN
  num = "   "
  WRITE(num, "(I3)") num_in
  IF(num_in .LT. 10)THEN
    num(1:2) = "00"
  ELSE IF(num_in .LT. 100)THEN
    num(1:1) = "0"
  END IF  
  CALL plot_init(filename//"_"//num)
ELSE
  CALL plot_init(filename)
END IF
END SUBROUTINE new_plot