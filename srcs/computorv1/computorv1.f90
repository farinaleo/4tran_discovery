module TypesModule
    implicit none
    
    ! Define the derived type
    type :: Terms
        real :: coefficient
        integer :: exponent
    end type Terms

end module TypesModule


program main
    use m_arguments
    use TypesModule
    implicit none
    integer :: argc
    character :: p
    character(len=max_arg_length), dimension(max_args) :: arguments
    character(len=max_arg_length) :: exe_name, equation, str2, term, coeff, power
    integer :: i, j, len_eq, pos
    real :: nbr
    integer :: n_terms, is_equal_passed, maxExponent
    integer :: yolo, bolo, colo
    logical :: valid
    real :: coefficient, sign
    integer :: exponent
    integer, parameter :: max_degree = 100
    type(Terms) :: polynomial(max_degree)
    maxExponent = 0
    do i = 1, max_degree
        polynomial(i)%coefficient = 0 ! example: coefficient = i
        polynomial(i)%exponent = i - 1               ! example: exponent = i - 1
    end do
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

    arguments(1) = '3.123 * x^0 - 1 * x^1 + 1 * x^1 + 1 * x^2 + 2 * x^2 = 0.3232 * x^3 + 0.3232 * x^32 - 42.3232 * x^1'
    ! arguments(1) = '1 * x^0 = 2 * x^0'
    arguments(1) = '12312.43 * x^0 + 1 * x^1 + 2312 * x^2'
    ! arguments(1) = '1 * x^0 + 2 * x^1 + 1 * x^2'
    str2 = ''
    do i = 1, len(arguments(1))
        if (arguments(1)(i:i) /= ' ') then
            str2 = trim(str2) // trim(arguments(1)(i:i))
        endif
    end do
    is_equal_passed = 0
    i = 1
    do j = 1, len_trim(str2)
        if (i >= len_trim(str2)) then
            exit
        endif
        if (str2(i-1:i-1) == '=') then
            is_equal_passed = 1
        end if
        if ((i == 1 .and. is_equal_passed == 0) .or. (str2(i-1:i-1) == '+' .and. is_equal_passed == 0) .or. (str2(i-1:i-1) == '-' .and. is_equal_passed == 1) .or. (str2(i-1:i-1) == ' ' .and. is_equal_passed == 0)) then
            sign = 1.0
        else if ((str2(i-1:i-1) == '+' .and. is_equal_passed == 1) .or. (str2(i-1:i-1) == '-' .and. is_equal_passed == 0) .or. (str2(i-1:i-1) == '=' .and. is_equal_passed == 1)) then
            sign = (-1.0)
        end if
        yolo = index(str2(i:), '+')
        bolo = index(str2(i:), '-')
        colo = index(str2(i:), '=')
        if ((bolo == 0 .and. colo /= 0) .or. (colo /= 0 .and. colo < bolo)) then
            bolo = colo
        end if
        if ((bolo == 0 .or. yolo < bolo) .and. yolo /= 0) then
            term = str2(i:i+yolo-2)
            i = i + yolo
        else if (bolo == 0 .and. yolo == 0) then
            term = str2(i:)
            i = i + len_trim(str2) - i
        else
            term = str2(i:i+bolo-2)
            i = i + bolo
        end if
        call check_term(term, coefficient, exponent, valid)
        if (valid .eqv. .false.) then
            print *, 'ERROR'
            stop
        end if
        call check_multiple_occurrences(term, valid)
        if (valid .eqv. .false.) then
            print *, 'ERROR'
            stop
        end if
        if (exponent >= max_degree) then
            print *, 'ERROR'
            stop
        end if        
        polynomial(exponent+1)%coefficient = polynomial(exponent+1)%coefficient + coefficient * sign
        polynomial(exponent+1)%exponent = exponent
    end do

    write(*, '(A)', advance="no") "Reduced form:"
    do i = 1, max_degree
        if (polynomial(i)%coefficient /= 0 .and. polynomial(i)%coefficient > 0) then
            write(*, '(A,F10.4,A,I0)', advance="no") ' +', polynomial(i)%coefficient, ' * x^', polynomial(i)%exponent
            if (polynomial(i)%exponent > maxExponent) then
                maxExponent = polynomial(i)%exponent
            end if
        else if (polynomial(i)%coefficient /= 0) then
            write(*, '(AF10.4,A,I0)', advance="no") ' + (', polynomial(i)%coefficient, ') * x^', polynomial(i)%exponent
            if (polynomial(i)%exponent > maxExponent) then
                maxExponent = polynomial(i)%exponent
            end if
        end if
    end do
    print *, '= 0'
    write(*, '(A, I0)') 'Polynomial Degree : ', maxExponent
    if (maxExponent > 2) then
        write(*, '(A)') 'Polynomial Degree is strictly greater than 2, can''t solve :('
    else if (maxExponent == 0) then
        write(*, '(A)') '∀x ∊ ℝ, 𝘗(x)=0'
    else
        call handle_polynomial_solutions(polynomial)
    end if
end program main

subroutine handle_polynomial_solutions(polynomial)
    use TypesModule
    integer :: determinant
    type(Terms) :: polynomial(max_degree)
    determinant = polynomial(2)%coefficient * polynomial(2)%coefficient - 4 * polynomial(1)%coefficient * polynomial(3)%coefficient
    print *, 'Δ: ', determinant
    if (determinant < 0) then
        Print *, 'Discriminant is strictly negative, no Reals solution'
    end if
end subroutine

subroutine check_term(term, coefficient, exponent, is_valid_format)
    use m_arguments
    implicit none
    character(len=max_arg_length), intent(in) :: term
    logical, intent(out) :: is_valid_format
    real, intent(out) :: coefficient
    integer, intent(out) :: exponent
    integer :: i, len_str, i_x, i_caret, i_e, i_m, end_term, min_end_term
    character(len=10) :: float_str, int_str
    
       is_valid_format = .false.
    coefficient = 0.0
    exponent = 0
    float_str = ''
    int_str = ''
    min_end_term = len(term)
    end_term = index(term, '+')
    if (end_term < min_end_term .and. end_term > 0) min_end_term = end_term

    end_term = index(term, '-')
    if (end_term < min_end_term .and. end_term > 0) min_end_term = end_term
    
    end_term = index(term, '=')
    if (end_term < min_end_term .and. end_term > 0) min_end_term = end_term
       len_str = len(term)
    i_x = index(term, 'x')
    i_m = index(term, '*')
    i_caret = index(term, '^')
    
       if (i_x > 0 .and. i_caret > i_x) then
               float_str = term(1:i_m-1)
               read(float_str, *, iostat=i_e) coefficient
        if (i_e == 0) then
                       int_str = term(i_caret+1:min_end_term - 1)
                       read(int_str, *, iostat=i_e) exponent
            if (i_e == 0 .and. exponent >= 0) then
                is_valid_format = .true.
            end if
        end if
    end if
end subroutine check_term

subroutine check_multiple_occurrences(input_string, has_multiple_occurrences)
    use m_arguments
    implicit none
    character(len=max_arg_length), intent(in) :: input_string
    logical, intent(out) :: has_multiple_occurrences
    integer :: i, len_str
    integer :: star_count, caret_count, x_count
    
       len_str = len(input_string)
    star_count = 0
    caret_count = 0
    x_count = 0
    
       do i = 1, len_str
        if (input_string(i:i) == '*') then
            star_count = star_count + 1
        elseif (input_string(i:i) == '^') then
            caret_count = caret_count + 1
        elseif (input_string(i:i) == 'x' .or. input_string(i:i) == 'X') then
            x_count = x_count + 1
        endif
    end do
    
       if (star_count > 1 .or. caret_count > 1 .or. x_count > 1) then
        has_multiple_occurrences = .false.
    else
        has_multiple_occurrences = .true.
    endif
end subroutine check_multiple_occurrences

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

