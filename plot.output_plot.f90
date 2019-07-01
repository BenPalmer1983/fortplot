
SUBROUTINE output_plot()
!###########################################
INTEGER(kind=StandardInteger) :: n, wlen, hlen
CHARACTER(len=128) :: svg_head
CHARACTER(len=16) :: width_text
CHARACTER(len=16) :: height_text
!###########################################

! BEFORE ADDING ANYTHING
CALL plot_limits()
CALL calc_grid()


! BACKGROUND AND AXES
CALL style()
CALL add_background()
CALL make_plots()
CALL border()
CALL axes()
CALL add_grid()

CALL blank_line(svg_head)
CALL blank_line(width_text)
CALL blank_line(height_text)
CALL int_text(width, width_text, wlen)
CALL int_text(height, height_text, hlen)

svg_head = '<svg width="'//width_text(1:wlen)//'" height="'//height_text(1:hlen)//'" ' &
           //'viewBox="0.0 0.0 '//width_text(1:wlen)//' '//height_text(1:hlen)//'" ' &
           //'xmlns="http://www.w3.org/2000/svg">'


! OPEN FILE
OPEN(UNIT=999,FILE=svg_filename)

CALL write_line('<?xml version="1.0" encoding="UTF-8" ?>')
CALL write_line(svg_head)

DO n=1, svg_lines
  CALL write_line(svg_data(n))
END DO

CALL write_line('</svg>')

! CLOSE FILE
CLOSE(999)
END SUBROUTINE output_plot


SUBROUTINE write_line(line)
CHARACTER(*) :: line
INTEGER(kind=StandardInteger) :: n, n_end
CHARACTER(LEN=6) :: wfmt
wfmt = "(A   "
CALL line_length(line, n_end)
IF(n_end .LT. 10)THEN
  WRITE(wfmt(3:3), "(I1)") n_end
  wfmt(4:4) = ")"
ELSE IF(n_end .LT. 100)THEN
  WRITE(wfmt(3:4), "(I2)") n_end
  wfmt(5:5) = ")"
ELSE IF(n_end .LT. 1000)THEN
  WRITE(wfmt(3:5), "(I3)") n_end
  wfmt(6:6) = ")"
END IF
WRITE(999,wfmt) line(1:n_end)
END SUBROUTINE write_line





