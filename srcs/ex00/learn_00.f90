subroutine test_integer
	implicit none
	integer :: i

	print *, 'This is a test for the arithmetic operations in Fortran'

	print *, 'This is a loop from 1 to 10 to print i + 2 (a simple addition)'
	do i = 1, 10
		print *, i , '+ 2 = ', i + 2
	end do

	print *, 'This is a loop from 1 to 10 to print i - 2 (a simple subtraction)'
	do i = 1, 10
		print *, i , '- 2 = ', i - 2
	end do

	print *, 'This is a loop from 1 to 10 to print i * 2 (a simple multiplication)'
	do i = 1, 10
		print *, i , '* 2 = ', i * 2
	end do

	print *, 'This is a loop from 1 to 10 to print i / 2 (a simple division)'
	do i = 1, 10
		print *, i , '/ 2 = ', i / 2
	end do

	print *, 'This is a loop from 1 to 10 to print i ** 2 (a simple power)'
	do i = 1, 10
		print *, i , '** 2 = ', i ** 2
	end do

	print *, 'This is a test for the comparison operations in Fortran'

	print *, 'This is a loop from 1 to 10 to print i == 2 (a simple equal comparison)'
	do i = 1, 10
		print *, i , '== 2 = ', i == 2
	end do

	print *, 'This is a loop from 1 to 10 to print i /= 2 (a simple not equal comparison)'
	do i = 1, 10
		print *, i , '/= 2 = ', i /= 2
	end do

	print *, 'This is a loop from 1 to 10 to print i > 2 (a simple greater than comparison)'
	do i = 1, 10
		print *, i , '> 2 = ', i > 2
	end do

	print *, 'This is a loop from 1 to 10 to print i < 2 (a simple less than comparison)'
	do i = 1, 10
		print *, i , '< 2 = ', i < 2
	end do

	print *, 'This is a loop from 1 to 10 to print i >= 2 (a simple greater than or equal comparison)'
	do i = 1, 10
		print *, i , '>= 2 = ', i >= 2
	end do

	print *, 'This is a loop from 1 to 10 to print i <= 2 (a simple less than or equal comparison)'
	do i = 1, 10
		print *, i , '<= 2 = ', i <= 2
	end do

end subroutine test_integer


subroutine test_logical
	implicit none
	logical :: a
	logical :: b

	a = .true.
	b = .false.

	print *, 'This is a test for the logical operations in Fortran'

	print * , 'a = ', a
	print * , 'b = ', b

	print *, 'This is  print to test .and. (a simple and operation)'
	print *, a, '.and.', a, '=', a .and. a
	print *, b, '.and.', b, '=', b .and. b
	print *, a, '.and.', b, '=', a .and. b

	print *, 'This is  print to test .or. (a simple or operation)'
	print *, a, '.or.', a, '=', a .or. a
	print *, b, '.or.', b, '=', b .or. b
	print *, a, '.or.', b, '=', a .or. b

	print *, 'This is  print to test .not. (a simple not operation)'
	print *, '.not.', a, '=',.not. a
	print *, '.not.', b, '=',.not. b

	print *, 'This is  print to test .eqv. (a simple equivalence operation)'
	print *, a, '.eqv.', a, '=', a .eqv. a
	print *, b, '.eqv.', b, '=', b .eqv. b
	print *, b, '.eqv.', a, '=', b .eqv. a

	print *, 'This is  print to test .neqv. (a simple non equivalence operation)'
	print *, a, '.neqv.', a, '=', a .neqv. a
	print *, b, '.neqv.', b, '=', b .neqv. b
	print *, b, '.neqv.', a, '=', b .neqv. a

end subroutine test_logical

program hello
	implicit none

	print *, 'This is my first code in Fortran! (newest version)'
	call test_integer()
	call test_logical()
	
end program hello
