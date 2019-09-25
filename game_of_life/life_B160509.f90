!Exam number = B160509
!
module lib
  implicit none
contains
  subroutine compute_neighbors(board, neighbors)
    integer, dimension(:, :), intent(in)  :: board
    integer, dimension(:, :), intent(out) :: neighbors
    integer, dimension(:, :), allocatable :: left,        &
                                             right,       &
                                             upper,       &
                                             lower,       &
                                             left_upper,  &
                                             left_lower,  &
                                             right_upper, &
                                             right_lower

    left  = cshift(board, shift=-1, dim=1)
    right = cshift(board, shift=1,  dim=1)
    upper = cshift(board, shift=-1, dim=2)
    lower = cshift(board, shift=1,  dim=2)

    left_upper  = cshift(upper, shift=-1, dim=1)
    left_lower  = cshift(lower, shift=-1, dim=1)
    right_upper = cshift(upper, shift=1,  dim=1)
    right_lower = cshift(lower, shift=1,  dim=1)

    neighbors = left + right + upper + lower &
              + left_upper  + left_lower     &
              + right_upper + right_lower

    deallocate(left)
    deallocate(right)
    deallocate(upper)
    deallocate(lower)

    deallocate(left_upper)
    deallocate(left_lower)
    deallocate(right_upper)
    deallocate(right_lower)
  end
end

program life
  ! (1) Insert a statement to use the life_utils module
  !found in the file life_utils.f90
  !
  use life_utils
  use lib
  implicit none

  ! This code will perform maxloop iterations of an n x n
  ! Game of Life board. Cells on the array board can be
  ! either alive (with value 1) or dead (with value 0)

  integer, parameter       :: n       = 8
  integer, parameter       :: maxloop = 10
  integer                  :: loop

  ! (2)  Declare main arrays:
  integer, dimension(n, n) :: board
  integer, dimension(n, n) :: neighbors

  ! (3)  Initialise board
  board(:, :)   = 0
  board(:, n/2) = 1
  board(n/2, :) = 1

  ! (3.1) Compute the number of alive cells and print out
  write (*,*) 0, sum(board)

  ! Please leave this part as is.
  ! Print the starting config of board to file life00.pgm
  ! using the create_pgm_file subroutine inside the
  ! life_utils module
  call create_pgm_file(0, n, board)

  ! (4)  Perform maxloop updates
  !      Start of a do loop running from 1 to maxloop
  !      (make sure to use "loop" as the loop index)
  do loop = 1, maxloop

    ! (5)  Count number of neighbours
    call compute_neighbors(board, neighbors)

    ! (6)  Calculate new generation
    where (neighbors == 3)
      board = 1
    elsewhere (neighbors < 2 .or. neighbors > 3)
      board = 0
    endwhere

    ! (6.1) Compute the number of alive cells and print out
    write (*,*) loop, sum(board)

    ! Please leave this bit as is
    ! Write out new state of board to a file, the file
    ! number will change depending on the value of loop
    ! which should run from 1 to maxloop (i.e. 10).
    ! Therefore, once you've added the appropriate code
    ! you'll have a total of 10 .pgm files with names
    ! life00.pgm, life01.pgm ... , life10.pgm
    call create_pgm_file(loop, n, board)
  enddo
end program life
