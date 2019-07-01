MODULE plot

USE kinds

IMPLICIT NONE

INCLUDE "plot.types.f90"
INCLUDE "plot.interfaces.f90"
INCLUDE "plot.globals.f90"

CONTAINS

INCLUDE "plot.new_plot.f90"
INCLUDE "plot.style.f90"
INCLUDE "plot.init.f90"
INCLUDE "plot.calc_grid.f90"
INCLUDE "plot.add_instruction.f90"
INCLUDE "plot.add_background.f90"
INCLUDE "plot.add_grid.f90"
INCLUDE "plot.border.f90"
INCLUDE "plot.axes.f90"
INCLUDE "plot.add_plot.f90"
INCLUDE "plot.make_plots.f90"


INCLUDE "plot.coords.f90"

INCLUDE "plot.line.f90"
INCLUDE "plot.polyline.f90"
INCLUDE "plot.rectangle.f90"
INCLUDE "plot.circle.f90"
INCLUDE "plot.text.f90"


INCLUDE "plot.output_plot.f90"
INCLUDE "plot.misc.f90"
INCLUDE "plot.interp.f90"





END MODULE plot