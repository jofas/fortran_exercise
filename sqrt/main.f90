program main
  use lib
  implicit none

  real    :: a, b, c
  complex :: res1, res2

  write (*, *) "Provide a, b, c:"
  read  (*, *) a, b, c

  if (a == 0.0) then
    write (*, *) "a can not be zero"
    stop
  endif

  call compute_equation(a, b, c, res1, res2)

  write (*, *) "results: ", res1, res2
end
