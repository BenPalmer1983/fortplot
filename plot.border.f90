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


CALL rectangle_dp(0.0D0, 1.0D0 * height, 1.0D0 * width, height * plot_area_y_lower-1.0D0, "#FFFFFF", 1.0D0, "#FFFFFF") ! BLOCK UNDER
!CALL rectangle_dp(0.0D0, height * plot_area_y_upper - 1.0D0, 1.0D0 * width, 100, "#000000", 1.0D0, "#FFFFFF") ! BLOCK OVER





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