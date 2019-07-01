SUBROUTINE add_background(colour_in)
!###########################################
CHARACTER(len=7), OPTIONAL, INTENT(IN) :: colour_in
!###########################################
CHARACTER(len=7) :: colour
REAL(kind=DoubleReal) :: x, y
!###########################################

colour = "#FFFFFF"
IF (PRESENT(colour_in)) THEN
  colour = colour_in
END IF

CALL coords_xy(0.0D0, 0.0D0, x, y)
CALL rectangle(x, y, 1.0D0 * width, 1.0D0 * height, colour, 1.0D0, colour)


END SUBROUTINE add_background