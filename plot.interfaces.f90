INTERFACE line
  MODULE PROCEDURE line_int, line_dp
END INTERFACE line

INTERFACE polyline
  MODULE PROCEDURE polyline_int, polyline_dp
END INTERFACE polyline

INTERFACE rectangle
  MODULE PROCEDURE rectangle_int, rectangle_dp
END INTERFACE rectangle

INTERFACE circle
  MODULE PROCEDURE circle_int, circle_dp
END INTERFACE circle

INTERFACE text
  MODULE PROCEDURE text_dp_char, text_int_char, text_dp_int, text_dp_dp
END INTERFACE text