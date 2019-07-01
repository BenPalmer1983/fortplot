SUBROUTINE calc_grid()



CALL calc_grid_make(x_plot_min, x_plot_max, x_grid)
CALL calc_grid_make(y_plot_min, y_plot_max, y_grid)





END SUBROUTINE calc_grid


SUBROUTINE calc_grid_make(min_in, max_in, grid)
!####################################################
REAL(kind=DoubleReal), INTENT(IN) :: min_in
REAL(kind=DoubleReal), INTENT(IN) :: max_in
REAL(kind=DoubleReal), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: grid
!####################################################
REAL(kind=DoubleReal) :: a_range
INTEGER(kind=StandardInteger) :: expo
REAL(kind=DoubleReal) :: step_size
INTEGER(kind=StandardInteger) :: n, counter, step_mult
REAL(kind=DoubleReal) :: gv
!####################################################
a_range = max_in - min_in
expo = floor(log10(1.0D0 * ceiling(10000.0D0 * a_range)) - 4.0D0)
step_size = 10.0D0**(expo - 1)
gv = ceiling(min_in / step_size) * step_size
counter = 0
DO WHILE(gv .LE. max_in)
  IF(gv .GE. min_in)THEN
    counter = counter + 1
  END IF
  gv = gv + step_size
END DO
IF(counter .GT. 14)THEN
  step_size = step_size * ceiling(counter / 10.0D0)
END IF
gv = ceiling(min_in / step_size) * step_size
counter = 0
DO WHILE(gv .LE. max_in)
  IF(gv .GE. min_in)THEN
    counter = counter + 1
  END IF
  gv = gv + step_size
END DO
ALLOCATE(grid(1:counter))
gv = ceiling(min_in / step_size) * step_size
counter = 0
DO WHILE(gv .LE. max_in)
  IF(gv .GE. min_in)THEN
    counter = counter + 1
    grid(counter) = gv
  END IF
  gv = gv + step_size
END DO
END SUBROUTINE calc_grid_make