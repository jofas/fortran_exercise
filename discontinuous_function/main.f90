program main
  implicit none

  integer :: i, C1 = 5, C2 = 10
  integer, dimension(10000) :: x = (/ (i, i = 1, 10000) /)
  integer, dimension(10000) :: y

  y(:399) = x(:399) ** 3 + C1
  y(400: 999) = x(400:999) ** 2 + C2
  y(1000:) = x(1000:)

  write (*, *) y(50), y(500), y(1500)
end
