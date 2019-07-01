SUBROUTINE axes(colour_in)
!###########################################
CHARACTER(len=7), OPTIONAL, INTENT(IN) :: colour_in
!###########################################
CHARACTER(len=7) :: colour
REAL(kind=DoubleReal) :: x1, y1, x2, y2
!###########################################

colour = "#000077"
IF (PRESENT(colour_in)) THEN
  colour = colour_in
END IF

! X axis  y = 0
IF (x_min .LT. 0.0D0 .AND. x_max .GT. 0.0D0) THEN
  CALL pc_x(0.0D0, x1)
  CALL coords_y(plot_area_y_lower, y1)
  CALL pc_x(0.0D0, x2)
  CALL coords_y(plot_area_y_upper, y2)
  CALL line(x1, y1, x2, y2, 1.5D0, colour)
END IF

! X axis  y = 0
IF (y_min .LT. 0.0D0 .AND. y_max .GT. 0.0D0) THEN
  CALL coords_x(plot_area_x_lower, x1)
  CALL pc_y(0.0D0, y1)
  CALL coords_x(plot_area_x_upper, x2)
  CALL pc_y(0.0D0, y2)
  CALL line(x1, y1, x2, y2, 1.5D0, colour)
END IF

END SUBROUTINE axes