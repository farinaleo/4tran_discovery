program main
    implicit none
    integer :: argc, i, arg_length
    integer, parameter :: max_args = 100  ! Maximum number of arguments
    integer, parameter :: max_arg_length = 100  ! Maximum length of each argument
    character(len=max_arg_length) :: argv   ! Assuming a maximum length of 100 characters per argument
    character(len=max_arg_length), dimension(max_args) :: arguments

    argc = command_argument_count()

    ! Check if the number of arguments exceeds the maximum allowed
    if (argc > max_args) then
        print *, "Error: Too many command-line arguments."
        stop 1
    endif

    ! Retrieve command-line arguments
    do i = 1, argc
        call get_command_argument(i, argv)
        arg_length = len(trim(argv))
        if (arg_length > max_arg_length - 1) then
            print *, "Error: Argument ", i, " is too long."
            stop 1
        endif
        arguments(i) = trim(argv)
    end do

    ! Print out command-line arguments
    do i = 1, argc
        print  '("Argument ", I0,": ", A)', i, arguments(i)
    end do

end program main