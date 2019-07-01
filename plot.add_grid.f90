SUBROUTINE add_grid(colour_in)
!###########################################
CHARACTER(len=7), OPTIONAL, INTENT(IN) :: colour_in
!###########################################
CHARACTER(len=7) :: colour
INTEGER(kind=StandardInteger) :: n
REAL(kind=DoubleReal) :: x1, y1, x2, y2
!###########################################

colour = "#0000AA"
IF (PRESENT(colour_in)) THEN
  colour = colour_in
END IF

! X axis  y = 0
DO n=1, SIZE(x_grid, 1)
  CALL pc_x(x_grid(n), x1)
  CALL coords_y(plot_area_y_lower, y1)
  CALL pc_x(x_grid(n), x2)
  CALL coords_y(plot_area_y_upper, y2)
  CALL line(x1, y1, x2, y2, 0.25D0, colour)
  
  IF (x_axes_values) THEN
    CALL text(x1 - 10, y1 + 25, x_grid(n))
  END IF
END DO

!print *, x_grid
!print *, y_grid

! X axis  y = 0
DO n=1, SIZE(y_grid, 1)
  CALL coords_x(plot_area_x_lower, x1)
  CALL pc_y(y_grid(n), y1)
  CALL coords_x(plot_area_x_upper, x2)
  CALL pc_y(y_grid(n), y2)
  CALL line(x1, y1, x2, y2, 0.25D0, colour)
  
  IF (x_axes_values) THEN
    CALL text(x1 - 60, y1 + 5, y_grid(n))
  END IF
END DO

!CALL coords(plot_area_x_lower, plot_area_y_lower, plot_area_x_upper, plot_area_y_lower, x1, y1, x2, y2)
!CALL line(x1, y1, x2, y2, 1, colour)

!CALL coords(plot_area_x_lower, plot_area_y_lower, plot_area_x_lower, plot_area_y_upper, x1, y1, x2, y2)
!CALL line(x1, y1, x2, y2, 1, colour)

END SUBROUTINE add_grid


