module lib
  implicit none

contains

  subroutine compute_equation(a, b, c, res1, res2)
    real,    intent(in)  :: a, b, c
    complex, intent(out) :: res1, res2
    complex              :: sq

    sq = cmplx(b ** 2 - 4.0 * a * c)

    res1 = (-b + sqrt(sq)) / (2.0 * a)
    res2 = (-b - sqrt(sq)) / (2.0 * a)
  end
end
