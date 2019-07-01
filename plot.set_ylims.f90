SUBROUTINE set_ylims(ymin, ymax)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: ymin
REAL(kind=DoubleReal), INTENT(IN) :: ymax
!###########################################
y_lims = .TRUE.
y_plot_min = ymin
y_plot_max = ymax
END SUBROUTINE set_ylims 