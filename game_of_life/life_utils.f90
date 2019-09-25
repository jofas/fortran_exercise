module life_utils

    ! Module intended for use with the Game of Life practical
    implicit none

    character*(10) picfile

contains
  
    subroutine create_pgm_file(iteration_number, n, board)
        ! Subroutine to print out the output .pgm files. The subroutine has 3 inputs,
        ! all defined as intent(in):-
        ! 
        ! iteration_number, integer = current iteration number
        ! n, integer = the dimension of board 
        ! board = an n x n array of integers 
        ! The routine opens a file with file name = lifeXX.pgm where XX is an integer
        ! of width 2 - e.g. if iteration_number is 0 then the output file will be life00.pgm

        implicit none
        integer, intent(in) :: iteration_number
        integer, intent(in) :: board(n, n)
        integer, intent(in) :: n
    
        write(picfile, fmt='(''life'', i2.2, ''.pgm'')') iteration_number
        open(unit=10, file=picfile)
        write(10, fmt='(''P2'',/,i3,2x,i3,/,i3)') n, n, 1
        write(10,fmt='(8(i1,1x))') board
        close(unit=10)

    end subroutine create_pgm_file
  
end module life_utils
