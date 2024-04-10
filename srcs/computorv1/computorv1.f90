program main
    use m_arguments
    implicit none
    integer :: argc
    character :: p
    character(len=max_arg_length), dimension(max_args) :: arguments
    character(len=max_arg_length) :: exe_name, equation,str2
    integer :: i, len_eq, pos
    real :: coeff(10)
    integer :: power(10)
    integer :: n_terms

    arguments = get_command_line_arguments(argc)
    if (argc < 1) then

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
    arguments(1) = '1 + 2 * x^2 = 0'
    if (verify(arguments(1), "1234567890xX^*+-=. ") /= 0) then
        write(*, '(A)') ''//achar(27)//'[1;31mERROR::INPUT:: Unauthorized char used in input equation'//achar(27)//'[0m'
    end if

    write(*,*)len_trim(arguments(1)), arguments(1)
    arguments(1) = '1 + 2 * x^2 = 0'
    str2 = ''
    do i = 1, len(arguments(1))
        if (arguments(1)(i:i) /= ' ') then
            str2 = trim(str2) // trim(arguments(1)(i:i))
        endif
    end do
    write(*,*)len_trim(str2), str2


end program main