program main
    use m_arguments
    implicit none
    integer :: argc
    character :: p
    character(len=max_arg_length), dimension(max_args) :: arguments
    character(len=max_arg_length) :: exe_name, equation, str2, term, coeff, power
    integer :: i, j, len_eq, pos
    real :: nbr
    integer :: n_terms
    integer :: yolo, bolo, colo

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
    if (verify(arguments(1), "1234567890xX^*+-=. ") /= 0) then
        write(*, '(A)') ''//achar(27)//'[1;31mERROR::INPUT:: Unauthorized char used in input equation'//achar(27)//'[0m'
    end if

    arguments(1) = '3.123 * x^1 - 1 * x^1 + 1 * x^1 + 1 * x^1 + 2 * x^2 = 0 * x^3.43'
    str2 = ''
    do i = 1, len(arguments(1))
        if (arguments(1)(i:i) /= ' ') then
            str2 = trim(str2) // trim(arguments(1)(i:i))
        endif
    end do
    i = 1
    do j = 1, len_trim(str2)
        if (i >= len_trim(str2)) then
            exit
        endif
        yolo = index(str2(i:), '+')
        bolo = index(str2(i:), '-')
        colo = index(str2(i:), '=')
        if ((bolo == 0 .and. colo /= 0) .or. (colo /= 0 .and. colo < bolo)) then
            bolo = colo
        end if
        if ((bolo == 0 .or. yolo < bolo) .and. yolo /= 0) then
            term = str2(i:i+yolo-1)
            i = i + yolo
        else if (bolo == 0 .and. yolo == 0) then
            term = str2(i:)
            i = i + len_trim(str2) - i
        else
            term = str2(i:i+bolo-1)
            i = i + bolo
        end if
        call get_term(term, coeff, power)
        print *, trim(coeff), ' power: ', trim(power)
    end do
end program main

subroutine get_term(term, coeff, power)
    use m_arguments
    implicit none
    character(len=max_arg_length), intent(in) :: term
    character(len=max_arg_length), intent(out) :: coeff, power
    integer :: i, center, is_end

    center = index(term, '*')
    coeff = term(1:center - 1)
    is_end = max(index(term, '+'), index(term, '-'), index(term, '='))
    if (is_end /= 0) then
        power = term(center + 3:len_trim(term) - 1)
    else 
        power = term(center + 3:len_trim(term))
    end if

end subroutine

subroutine ator(str, nbr)
    implicit none
    character(len=16),intent(in)::str
    real,intent(out)::nbr
    integer::istat

    read (str,*,iostat=istat) nbr
    if (istat/=0) then
      nbr=0
    end if  
end subroutine

