SUBROUTINE plot_init(filename)
!###########################################
CHARACTER(*) :: filename
INTEGER(kind=StandardInteger) :: n
!###########################################

! ALLOCATE ARRAYS
IF (ALLOCATED(svg_data)) THEN
  DEALLOCATE(svg_data)
END IF
ALLOCATE(svg_data(1:100000))

DO n=1,10000
  CALL blank_line(svg_data(n))
END DO

svg_filename(1:LEN(filename)) = filename(1:LEN(filename))
svg_filename(LEN(filename)+1:LEN(filename)+4) = ".svg"

! ALLOCATE PLOT ARRAY
IF (ALLOCATED(plots)) THEN
  DEALLOCATE(plots)
END IF
ALLOCATE(plots(1:16))




END SUBROUTINE plot_init