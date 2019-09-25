module trig
  implicit none

  real :: PI = 4.0d0 * atan(1.0d0)

contains

  elemental real function degtorad(x) result(y)
      real, intent(in) :: x

      y = x * PI / 180.0
  end

  elemental real function radtodeg(x) result(y)
      real, intent(in) :: x

      y = x * 180.0 / PI
  end
end
