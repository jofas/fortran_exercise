program main
  use trig
  implicit none

  real, dimension(3) :: input
  real, dimension(3) :: rad
  real, dimension(3) :: deg

  write (*, *) "Enter three angles in degree"
  read  (*, *) input

  input(:) = mod(input(:), 360.0)

  rad(:) = degtorad(input(:))

  write (*, *) "Transformed to radians:"
  write (*, *) rad

  deg(:) = radtodeg(rad(:))

  write (*, *) "Transformed back to degree"
  write (*, *) deg
end
