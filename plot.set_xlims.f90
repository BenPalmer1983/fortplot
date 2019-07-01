SUBROUTINE set_xlims(xmin, xmax)
!###########################################
REAL(kind=DoubleReal), INTENT(IN) :: xmin
REAL(kind=DoubleReal), INTENT(IN) :: xmax
!###########################################
x_lims = .TRUE.
x_plot_min = xmin
x_plot_max = xmax
END SUBROUTINE plot_limits 