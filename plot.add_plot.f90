SUBROUTINE add_plot(x, y)
!###########################################
REAL(kind=DoubleReal), DIMENSION(:) :: x
REAL(kind=DoubleReal), DIMENSION(:) :: y
!###########################################
INTEGER(kind=StandardInteger) :: n
!REAL(kind=DoubleReal), DIMENSION(1:4) :: x_axis
!
!###########################################

IF (SIZE(x,1) .EQ. SIZE(y,1)) THEN
  pcount = pcount + 1
  plots(pcount)%counter = SIZE(x,1)
  
  ! ALLOCATE MEM
  IF(ALLOCATED(plots(pcount)%points))THEN
    DEALLOCATE(plots(pcount)%points)
  END IF
  ALLOCATE(plots(pcount)%points(1:SIZE(x,1), 1:4))
  !print *, x, y
  ! STORE X/Y
  plots(pcount)%points(:,1) = x(:)
  plots(pcount)%points(:,2) = y(:)
  
  ! FIND MIN MAX
  DO n=1,plots(pcount)%counter 
    IF(n .EQ. 1 .OR. plots(pcount)%points(n,1) .LT. plots(pcount)%x_min)THEN
      plots(pcount)%x_min = plots(pcount)%points(n,1)
    END IF
    IF(n .EQ. 1 .OR. plots(pcount)%points(n,1) .GT. plots(pcount)%x_max)THEN
      plots(pcount)%x_max = plots(pcount)%points(n,1)
    END IF
    IF(n .EQ. 1 .OR. plots(pcount)%points(n,2) .LT. plots(pcount)%y_min)THEN
      plots(pcount)%y_min = plots(pcount)%points(n,2)
    END IF
    IF(n .EQ. 1 .OR. plots(pcount)%points(n,2) .GT. plots(pcount)%y_max)THEN
      plots(pcount)%y_max = plots(pcount)%points(n,2)
    END IF
  END DO
  
  IF (pcount .EQ. 1 .OR. plots(pcount)%x_min .LT. x_min) THEN
    x_min = plots(pcount)%x_min
  END IF
  IF (pcount .EQ. 1 .OR. plots(pcount)%x_max .GT. x_max) THEN
    x_max = plots(pcount)%x_max
  END IF  
  IF (pcount .EQ. 1 .OR. plots(pcount)%y_min .LT. y_min) THEN
    y_min = plots(pcount)%y_min
  END IF
  IF (pcount .EQ. 1 .OR. plots(pcount)%y_max .GT. y_max) THEN
    y_max = plots(pcount)%y_max
  END IF
  
  ! ALLOCATE MEM
  IF(ALLOCATED(plots(pcount)%plotpoints))THEN
    DEALLOCATE(plots(pcount)%plotpoints)
  END IF
  ALLOCATE(plots(pcount)%plotpoints(1:501, 1:2))
  
  CALL interp_resize_array(plots(pcount)%points, 4, plots(pcount)%plotpoints)
END IF

END SUBROUTINE add_plot