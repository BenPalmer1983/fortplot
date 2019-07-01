! ADD INSTRUCTIONS FOR PLOTS TO SVG

SUBROUTINE make_plots()
!###########################################
INTEGER(kind=StandardInteger) :: pn
REAL(kind=DoubleReal) :: x, y
!###########################################


DO pn=1, pcount
  IF (plots(pn)%counter .GT. 1) THEN
    IF (plots(pn)%plot_type .EQ. 1) THEN
      CALL point_plot(pn)
    ELSE IF (plots(pn)%plot_type .EQ. 2) THEN
      CALL line_plot(pn)
    END IF    
  END IF
END DO


END SUBROUTINE make_plots



SUBROUTINE point_plot(pn)
!###########################################
INTEGER(kind=StandardInteger) :: pn
!###########################################
INTEGER(kind=StandardInteger) :: n
REAL(kind=DoubleReal) :: x, y
!###########################################

DO n = 1, plots(pn)%counter
  CALL pc(plots(pn)%plotpoints(n,1), plots(pn)%plotpoints(n,2), x, y)
  CALL circle(x, y, 1.0D0, "#000000")
END DO

END SUBROUTINE point_plot
  

 
SUBROUTINE line_plot(pn)
!###########################################
INTEGER(kind=StandardInteger) :: pn
!###########################################
INTEGER(kind=StandardInteger) :: n
REAL(kind=DoubleReal) :: x, y
REAL(kind=DoubleReal), DIMENSION(:), ALLOCATABLE :: x_arr
REAL(kind=DoubleReal), DIMENSION(:), ALLOCATABLE :: y_arr
!###########################################

ALLOCATE(x_arr(1:SIZE(plots(pn)%plotpoints,1)))
ALLOCATE(y_arr(1:SIZE(plots(pn)%plotpoints,1)))

DO n = 1, SIZE(plots(pn)%plotpoints,1)
  CALL pc(plots(pn)%plotpoints(n,1), plots(pn)%plotpoints(n,2), x_arr(n), y_arr(n))
END DO 
CALL polyline(x_arr(:), y_arr(:), 1.0D0, '#000010', 'none   ')


END SUBROUTINE line_plot
 
 
 