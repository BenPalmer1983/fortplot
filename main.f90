PROGRAM fplot
! University of Birmingham
! Ben Palmer

USE MPI
USE kinds
USE plot, ONLY: new_plot, output_plot, add_plot, set_ylims

IMPLICIT NONE

CALL main()

CONTAINS

! Subroutines


SUBROUTINE main()
!###########################################
! PRIVATE VARIABLES
INTEGER(kind=StandardInteger) :: error
INTEGER(kind=StandardInteger) :: proc_id, proc_count
INTEGER(kind=StandardInteger) :: thread_id, thread_count
INTEGER(kind=StandardInteger) :: OMP_GET_NUM_THREADS, OMP_GET_THREAD_NUM
INTEGER(kind=StandardInteger) :: n
REAL(kind=DoubleReal), DIMENSION(:), ALLOCATABLE :: x
REAL(kind=DoubleReal), DIMENSION(:), ALLOCATABLE :: y

!###########################################
CALL MPI_Init(error)

Call MPI_Comm_rank(MPI_COMM_WORLD,proc_id,error)
Call MPI_Comm_size(MPI_COMM_WORLD,proc_count,error)

ALLOCATE(x(1:101))
ALLOCATE(y(1:101))


DO n=1,101
  x(n) = -5.0D0 + ((n - 1.0D0) / 100.0D0) * 10.0D0
  y(n) = x(n)**2 - 4.0D0
END DO

! Example Usage
CALL new_plot("output",7)
CALL set_ylims(-10.0D0, 20.0D0)
CALL add_plot(x, y)
CALL output_plot()

CALL MPI_Finalize(error)
END SUBROUTINE main


END PROGRAM fplot
