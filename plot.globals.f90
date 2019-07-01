CHARACTER(LEN=128), DIMENSION(:), ALLOCATABLE :: svg_data
INTEGER(kind=StandardInteger) :: svg_lines = 0
CHARACTER(LEN=32) :: svg_filename = "                                "


INTEGER(kind=StandardInteger) :: width = 1280
INTEGER(kind=StandardInteger) :: height = 720

REAL(kind=DoubleReal) :: plot_area_x_lower = 0.175D0
REAL(kind=DoubleReal) :: plot_area_x_upper = 0.925D0
REAL(kind=DoubleReal) :: plot_area_y_lower = 0.175D0
REAL(kind=DoubleReal) :: plot_area_y_upper = 0.925D0



INTEGER(kind=StandardInteger) :: pcount = 0
TYPE(t_plot), DIMENSION(:), ALLOCATABLE :: plots
REAL(kind=DoubleReal) :: x_min = 0.0D0
REAL(kind=DoubleReal) :: x_max = 0.0D0
REAL(kind=DoubleReal) :: y_min = 0.0D0
REAL(kind=DoubleReal) :: y_max = 0.0D0


REAL(kind=DoubleReal), DIMENSION(:), ALLOCATABLE :: x_grid
REAL(kind=DoubleReal), DIMENSION(:), ALLOCATABLE :: y_grid


CHARACTER(LEN=32), DIMENSION(:), ALLOCATABLE :: svg_colour

LOGICAL :: x_axes_values = .TRUE.

