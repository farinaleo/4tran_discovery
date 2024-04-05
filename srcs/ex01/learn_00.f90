subroutine test_real
	implicit none
	integer :: i
	real :: r

	print *, 'This is a test for the arithmetic operations in Fortran'

	print *, 'This is a loop from 1 to 10 to print r + 2 (a simple addition)'
	do i = 1, 10
		r = real(i)
		print *, r , '+ 2 = ', r + 2
	end do

	print *, 'This is a loop from 1 to 10 to print r - 2 (a simple subtraction)'
	do i = 1, 10
		r = real(i)
		print *, r , '- 2 = ', r - 2
	end do

	print *, 'This is a loop from 1 to 10 to print r * 2 (a simple multiplication)'
	do i = 1, 10
		r = real(i)
		print *, r , '* 2 = ', r * 2
	end do

	print *, 'This is a loop from 1 to 10 to print r / 2 (a simple division)'
	do i = 1, 10
		r = real(i)
		print *, r , '/ 2 = ', r / 2
	end do

	print *, 'This is a loop from 1 to 10 to print r ** 2 (a simple power)'
	do i = 1, 10
		r = real(i)
		print *, r , '** 2 = ', r ** 2
	end do

	print *, 'This is a test for the comparison operations in Fortran'

	print *, 'This is a loop from 1 to 10 to print r == 2 (a simple equal comparison)'
	do i = 1, 10
		r = real(i)
		print *, r , '== 2 = ', r == 2
	end do

	print *, 'This is a loop from 1 to 10 to print r /= 2 (a simple not equal comparison)'
	do i = 1, 10
		r = real(i)
		print *, r , '/= 2 = ', r /= 2
	end do

	print *, 'This is a loop from 1 to 10 to print r > 2 (a simple greater than comparison)'
	do i = 1, 10
		r = real(i)
		print *, r , '> 2 = ', r > 2
	end do

	print *, 'This is a loop from 1 to 10 to print r < 2 (a simple less than comparison)'
	do i = 1, 10
		r = real(i)
		print *, r , '< 2 = ', r < 2
	end do

	print *, 'This is a loop from 1 to 10 to print r >= 2 (a simple greater than or equal comparison)'
	do i = 1, 10
		r = real(i)
		print *, r , '>= 2 = ', r >= 2
	end do

	print *, 'This is a loop from 1 to 10 to print r <= 2 (a simple less than or equal comparison)'
	do i = 1, 10
		r = real(i)
		print *, r , '<= 2 = ', r <= 2
	end do

end subroutine test_real


subroutine test_complex
	implicit none
	integer :: i
	complex :: c

	print *, 'This is a test for the arithmetic operations in Fortran'

	print *, 'This is a loop from 1 to 10 to print i + 2 (a simple addition)'
	do i = 1, 10
		c = cmplx(i, 0)
		print *, c , '+ 2 = ', c + 2
	end do

	print *, 'This is a loop from 1 to 10 to print i - 2 (a simple subtraction)'
	do i = 1, 10
		c = cmplx(i, 0)
		print *, c , '- 2 = ', c - 2
	end do

	print *, 'This is a loop from 1 to 10 to print i * 2 (a simple multiplication)'
	do i = 1, 10
		c = cmplx(i, 0)
		print *, c , '* 2 = ', c * 2
	end do

	print *, 'This is a loop from 1 to 10 to print i / 2 (a simple division)'
	do i = 1, 10
		c = cmplx(i, 0)
		print *, c , '/ 2 = ', c / 2
	end do

	print *, 'This is a loop from 1 to 10 to print i ** 2 (a simple power)'
	do i = 1, 10
		c = cmplx(i, 0)
		print *, c , '** 2 = ', c ** 2
	end do

	print *, 'This is a test for the comparison operations in Fortran'

	print *, 'This is a loop from 1 to 10 to print i == 2 (a simple equal comparison)'
	do i = 1, 10
		c = cmplx(i, 0)
		print *, c , '== 2 = ', c == cmplx(2, 0)
	end do

	print *, 'This is a loop from 1 to 10 to print i /= 2 (a simple not equal comparison)'
	do i = 1, 10
		c = cmplx(i, 0)
		print *, c , '/= 2 = ', c /= cmplx(2, 0)
	end do

end subroutine test_complex

program hello
	implicit none

	print *, 'This is my first code in Fortran! (latest version)'
	call test_real
	call test_complex
	
end program hello
