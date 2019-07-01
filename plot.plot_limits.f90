SUBROUTINE plot_limits()
!###########################################
!###########################################

IF(x_lims .EQV. .FALSE.)THEN
  x_plot_min = x_min
  x_plot_max = x_max
END IF 
IF(y_lims .EQV. .FALSE.)THEN
  y_plot_min = y_min
  y_plot_max = y_max
END IF 

END SUBROUTINE plot_limits 