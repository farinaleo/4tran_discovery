program main
    use m_arguments
    implicit none
    integer :: argc
    character(len=max_arg_length), dimension(max_args) :: arguments
    character(len=max_arg_length) :: exe_name, equation
    integer :: i, len_eq, pos
    real :: coeff(10)
    integer :: power(10)
    integer :: n_terms

    arguments = get_command_line_arguments(argc)
    if (argc /= 1) then

        call get_command_argument(0, exe_name)

        write(*, '(A, I0, A, I0, A)') ''//achar(27)//'[1;31mERROR::INPUT:: '//achar(27)//'[0mExpected only '//achar(27)//'[1;32m', &
        1, ''//achar(27)//'[0m arguments but got '//achar(27)//'[1;31m', &
        argc, ''//achar(27)//'[0m arguments.'

        write(*, '(A, A, A, A, A, A)') ''//achar(27)//'[1;31mERROR::INPUT:: ', &
        ''//achar(27)//'[0mExpected use is ', &
        ''//achar(27)//'[1;36m', trim(exe_name), ' <Polynomial expression>', &
        ''//achar(27)//'[0m'

        stop

    end if

    if (verify(arguments(1), "12345677890X^*+-=. ") /= 0) then
        write(*, '(A)') ''//achar(27)//'[1;31mERROR::INPUT:: Unauthorized char used in input equation'//achar(27)//'[0m'
    end if


end program main