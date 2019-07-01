TYPE :: t_plot

INTEGER(kind=StandardInteger) :: counter = 0
REAL(kind=DoubleReal), DIMENSION(:,:), ALLOCATABLE :: points

REAL(kind=DoubleReal) :: x_min = 0.0D0
REAL(kind=DoubleReal) :: x_max = 0.0D0
REAL(kind=DoubleReal) :: y_min = 0.0D0
REAL(kind=DoubleReal) :: y_max = 0.0D0

INTEGER(kind=StandardInteger) :: plot_type = 2     ! 1 point, 2 line

REAL(kind=DoubleReal), DIMENSION(:,:), ALLOCATABLE :: plotpoints

END TYPE t_plot