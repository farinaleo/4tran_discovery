module m_arguments
    implicit none

    ! Constants for maximum number and length of arguments
    integer, parameter :: max_args = 100
    integer, parameter :: max_arg_length = 100

contains

    subroutine process_command_line_arguments(arguments, argc)
        ! This subroutine processes the command-line arguments and stores them in an array.

        ! Inputs:
        !   arguments: Array to store the command-line arguments
        !   argc: Number of command-line arguments

        ! Outputs:
        !   arguments: Array containing the command-line arguments

        integer, intent(out) :: argc
        character(len=max_arg_length), dimension(max_args), intent(out) :: arguments
        integer :: i, arg_length
        character(len=max_arg_length) :: argv

        argc = command_argument_count()

        ! Check if the number of arguments exceeds the maximum allowed
        if (argc > max_args) then
            write(*, '(A)') ''//achar(27)//'[1;31mERROR::ARGUMENTS::'//achar(27)//'[0m Too many command-line arguments.'
            stop 1
        endif

        ! Retrieve command-line arguments
        do i = 1, argc
            call get_command_argument(i, argv)
            arg_length = len(trim(argv))
            if (arg_length > max_arg_length - 1) then
                write(*, '(A,I0,A)') ''//achar(27)//'[1;31mERROR::ARGUMENTS::'//achar(27)//'[0m Argument '//achar(27)//'[1;36m', i, ''//achar(27)//'[1;0m is too long.'//achar(27)//'[0m'
                stop 1
            endif
            arguments(i) = trim(argv)
        end do
    end subroutine process_command_line_arguments

    function get_command_line_arguments(argc) result(args)
        ! This function returns the command-line arguments array and the argument count.

        character(len=max_arg_length), dimension(max_args) :: args
        integer :: argc

        ! Call subroutine to process command-line arguments
        call process_command_line_arguments(args, argc)

        ! Return the arguments array and the argument count
    end function get_command_line_arguments

    function get_command_line_arguments_single() result(single_argument)
        ! This function concatenates all command-line arguments into a single string.
    
        character(len=max_arg_length * max_args) :: single_argument
        integer :: argc, i
        character(len=max_arg_length), dimension(max_args) :: args

        ! Call subroutine to process command-line arguments
        call process_command_line_arguments(args, argc)

        ! Initialize the concatenated string
        single_argument = ''

        ! Concatenate all arguments into a single string
        do i = 1, argc
            single_argument = trim(adjustl(single_argument)) // ' ' // trim(adjustl(args(i)))
        end do
    end function get_command_line_arguments_single

end module m_arguments