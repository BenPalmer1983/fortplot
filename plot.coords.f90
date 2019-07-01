!##############################################
!
!         FOR PLOTTING IN COMPLETE
!           PLOT AREA  0.0 to 1.0
!
!##############################################

SUBROUTINE coords_xy(x_in, y_in, x_out, y_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x_in, y_in
REAL(kind=DoubleReal), INTENT(OUT) :: x_out, y_out
!###########################################
CALL coords_x(x_in, x_out)
CALL coords_y(y_in, y_out)
END SUBROUTINE coords_xy

SUBROUTINE coords_x(x_in, x_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x_in
REAL(kind=DoubleReal), INTENT(OUT) :: x_out
!###########################################
x_out = width * x_in
END SUBROUTINE coords_x

SUBROUTINE coords_y(y_in, y_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: y_in
REAL(kind=DoubleReal), INTENT(OUT) :: y_out
!###########################################
y_out = height - height * y_in
END SUBROUTINE coords_y


!##############################################
!
!         FOR PLOTTING IN PLOT AREA 
!
!##############################################

! TRANSFORM FROM 
SUBROUTINE pc(x_in, y_in, x_out, y_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x_in, y_in
REAL(kind=DoubleReal), INTENT(OUT) :: x_out, y_out
!###########################################
!###########################################
CALL pc_x(x_in, x_out)
CALL pc_y(y_in, y_out)
END SUBROUTINE pc

SUBROUTINE pc_x(x_in, x_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x_in
REAL(kind=DoubleReal), INTENT(OUT) :: x_out
!###########################################
REAL(kind=DoubleReal) :: rx1, rx2
REAL(kind=DoubleReal) :: pad_xl, pad_xu
!###########################################

! Calculate the range of x axis plottable area
!pad_xl = plot_area_x_lower * width
!pad_xu = plot_area_x_upper * width
!rx2 = (pad_xu - pad_xl)

! Convert from x value to a pixel
!rx1 = x_max - x_min
!x_out = pad_xl + (rx2 * ((x_in - x_min) / rx1))


CALL x_in_plotarea((x_in - x_min) / (x_max - x_min), plot_area_x_lower, plot_area_x_upper, x_out)



END SUBROUTINE pc_x


SUBROUTINE pc_y(y_in, y_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: y_in
REAL(kind=DoubleReal), INTENT(OUT) :: y_out
!###########################################
REAL(kind=DoubleReal) :: ry1, ry2
REAL(kind=DoubleReal) :: pad_yl, pad_yu
!###########################################
CALL y_in_plotarea((y_in - y_min) / (y_max - y_min), plot_area_y_lower, plot_area_y_upper, y_out)
END SUBROUTINE pc_y


!# x_in is a number from 0 to 1
!# returns the pixel x 
SUBROUTINE x_in_plotarea(x_in, pa_x_min, pa_x_max, x_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: x_in
REAL(kind=DoubleReal), INTENT(IN) :: pa_x_min
REAL(kind=DoubleReal), INTENT(IN) :: pa_x_max
REAL(kind=DoubleReal), INTENT(OUT) :: x_out
!###########################################
REAL(kind=DoubleReal) :: ry1, ry2
REAL(kind=DoubleReal) :: pad_yl, pad_yu
!###########################################
x_out = (width * pa_x_min) + width * (pa_x_max - pa_x_min) * x_in
END SUBROUTINE x_in_plotarea

!# x_in is a number from 0 to 1
!# returns the pixel x 
SUBROUTINE y_in_plotarea(y_in, pa_y_min, pa_y_max, y_out)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: y_in
REAL(kind=DoubleReal), INTENT(IN) :: pa_y_min
REAL(kind=DoubleReal), INTENT(IN) :: pa_y_max
REAL(kind=DoubleReal), INTENT(OUT) :: y_out
!###########################################
REAL(kind=DoubleReal) :: ry1, ry2
REAL(kind=DoubleReal) :: pad_yl, pad_yu
!###########################################
y_out = height - ((height * pa_y_min) + height * (pa_y_max - pa_y_min) * y_in)
END SUBROUTINE y_in_plotarea