SUBROUTINE interp_resize_array(arr_in, n, arr_out)
!#################################
REAL(kind=DoubleReal), DIMENSION(:,:), INTENT(IN) :: arr_in
INTEGER(kind=StandardInteger), INTENT(IN) :: n
REAL(kind=DoubleReal), DIMENSION(:,:), INTENT(OUT) :: arr_out
!#################################
INTEGER(kind=StandardInteger) :: i, j, m
INTEGER(kind=StandardInteger) :: xpos, s_in, xw
REAL(kind=DoubleReal) :: a, b, d
INTEGER(kind=StandardInteger) :: l
INTEGER(kind=StandardInteger) :: w
!#################################

l = size(arr_out, 1)
w = size(arr_out, 2)
s_in = size(arr_in, 1)
a = arr_in(1, 1)
b = arr_in(s_in, 1)

! Fill in "x" values
d = (b - a) / (l - 1)
DO i = 1, l
  arr_out(i, 1) = a + (i - 1) * d
END DO

! Fill in "y" values
xw = n - 1
m = 1
DO i=1, l
  DO WHILE(m .LT. s_in .AND. arr_in(m,1) .LT. arr_out(i,1))  
    m = m + 1
  END DO
  xpos = m - n / 2 + 1
  IF(xpos .LT. 1)THEN
    xpos = 1
  ELSE IF(xpos .GT. s_in - xw)THEN
    xpos = s_in - xw
  END IF
  arr_out(i,2) = interp_n(arr_out(i,1), arr_in(xpos:xpos+xw,1), arr_in(xpos:xpos+xw,2))
END DO
  
! Complete derivatives
xw = n - 1
DO i=1, l
  DO j=3, w
    xpos = i + n / 2
    IF(xpos .LT. 1)THEN
      xpos = 1
    ELSE IF(xpos .GT. s_in - xw)THEN
      xpos = s_in - xw
    END IF
    arr_out(i,j) = interp_dn(arr_out(i,1), arr_out(xpos:xpos+xw,1), arr_out(xpos:xpos+xw,j-1))
  END DO
END DO

END SUBROUTINE interp_resize_array


! INTERPOLATES BETWEEN N POINTS

FUNCTION interp_n(xi, x, y) RESULT (yi)
! Identity for square matrix
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal), INTENT(IN) :: xi
REAL(kind=DoubleReal), INTENT(IN), DIMENSION(:) :: x
REAL(kind=DoubleReal), INTENT(IN), DIMENSION(:) :: y
REAL(kind=DoubleReal) :: yi
! PRIVATE
INTEGER(kind=StandardInteger) :: i, j
REAL(kind=DoubleReal) :: li
!############################################################
yi = 0.0D0
DO i = 1, SIZE(x,1)
  li = 1.0D0
  DO j = 1, SIZE(x,1)
    IF(i .NE. j) THEN
      li = li * (xi - x(j)) / (x(i) - x(j))
    END IF
  END DO
  yi = yi + li * y(i)
END DO
!############################################################
END FUNCTION interp_n


FUNCTION interp_dn(xi, x, y) RESULT (ypi)
! Interpolate and return derivative at xi
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal) :: xi
REAL(kind=DoubleReal), DIMENSION(:) :: x
REAL(kind=DoubleReal), DIMENSION(:) :: y
REAL(kind=DoubleReal) :: ypi
! PRIVATE
INTEGER(kind=StandardInteger) :: i, j, k
REAL(kind=DoubleReal) :: fx, gx, psum
!############################################################
IF (SIZE(x,1) .EQ. SIZE(y,1)) THEN
  ypi = 0.0D0
  Do i=1,SIZE(x,1)
    fx = 1.0D0
    gx = 0.0D0
    Do j=1,SIZE(x,1)
      If(i .NE. j) Then
        fx = fx / (x(i) - x(j))
        psum = 1.0D0
        Do k=1,SIZE(x,1)
          If((i .NE. k) .AND. (j .NE. k))Then
            psum = psum * (xi - x(k))
          End If
        End Do
        gx = gx + psum
      End If
    End Do
    ypi = ypi + fx * gx * y(i)
  End Do
END IF
!############################################################
END FUNCTION interp_dn