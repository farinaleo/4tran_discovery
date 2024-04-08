program main
    implicit none
    integer :: argc, i
    integer, parameter :: max_args = 100  ! Maximum number of arguments
    character(len=100) :: argv   ! Assuming a maximum length of 100 characters per argument
    character(len=100), dimension(max_args) :: arguments

    argc = command_argument_count()

    ! Check if the number of arguments exceeds the maximum allowed
    if (argc > max_args) then
        print *, "Error: Too many command-line arguments."
        stop 1
    endif

    ! Retrieve command-line arguments
    do i = 1, argc
        call get_command_argument(i, argv)
        arguments(i) = trim(argv)
    end do

    ! Print out command-line arguments
    do i = 1, argc
        print *, 'Argument ', i, ': ', arguments(i)
    end do

end program main
