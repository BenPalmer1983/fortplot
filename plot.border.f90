SUBROUTINE border(colour_in)
!###########################################
CHARACTER(len=7), OPTIONAL, INTENT(IN) :: colour_in
!###########################################
CHARACTER(len=7) :: colour
REAL(kind=DoubleReal) :: x, y
REAL(kind=DoubleReal) :: w
REAL(kind=DoubleReal) :: h
!###########################################

colour = "#000000"
IF (PRESENT(colour_in)) THEN
  colour = colour_in
END IF

w = width * (plot_area_x_upper - plot_area_x_lower)
h = height * (plot_area_y_upper - plot_area_y_lower)
CALL coords_xy(plot_area_x_lower, plot_area_y_lower, x, y)
CALL rectangle_dp(x, y, w, h, "none", 1.0D0, "#000000")

!CALL coords(plot_area_x_lower, plot_area_y_lower, plot_area_x_upper, plot_area_y_lower, x1, y1, x2, y2)
!CALL line(x1, y1, x2, y2, 1, colour)

! LEFT
!CALL coords(plot_area_x_lower, plot_area_y_lower, plot_area_x_lower, plot_area_y_upper, x1, y1, x2, y2)
!CALL line(x1, y1, x2, y2, 1, colour)

! TOP
!CALL coords(plot_area_x_lower, plot_area_y_upper, plot_area_x_upper, plot_area_y_upper, x1, y1, x2, y2)
!CALL line(x1, y1, x2, y2, 1, colour)

! RIGHT
!CALL coords(plot_area_x_upper, plot_area_y_lower, plot_area_x_upper, plot_area_y_upper, x1, y1, x2, y2)
!CALL line(x1, y1, x2, y2, 1, colour)


END SUBROUTINE border