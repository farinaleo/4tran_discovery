ProGrAm plot_example
	implicit none
	character(len=500) :: command, part1, part2, part3, part4

	! Définition des données à tracer
	integer, parameter :: n = 1000000
	real :: x(n), y(n), z(n), t(n), l(n)
	integer :: i
	real :: r, pi, tmp

	pi = 3.14159265358979323846

	! Génération des données
	do i = 1, n
		r = i * 0.0001
		x(i) = r
		! y = |Sin(xx)/2(xx-pi/2)/pi|
		! Sin(2 Sin(2 Sin(2 Sin(x))))
!		tmp = sin(r ** r) / 2 ** ((r ** r - pi / 2) / pi)
!		if (tmp < 0) then
!			tmp = -tmp
!		end if
		y(i) = sin(2 * sin(2 * sin(2 * sin(r))))
		z(i) = sin(r)
		t(i) = r ** 0.5
		l(i) = log(r)
	end do

	! Écriture des données dans un fichier temporaire
	open(unit=10, file='srcs/data.dat', status='replace')
	do i = 1, n
		write(10, *) x(i), y(i), z(i), t(i), l(i)
	end do
	close(unit=10)

	! Commande Gnuplot pour tracer les données
	! Notez que vous devez adapter le chemin d'accès selon votre environnement
	part1 = 'gnuplot -persist -e "plot ''srcs/data.dat'' using 1:2 with lines title ''Cos''"'
!	part2 = '''srcs/data.dat'' using 1:3 with lines title ''Sin'', '
!	part3 = '''srcs/data.dat'' using 1:4 with lines title ''Sqrt'', '
!	part4 = '''srcs/data.dat'' using 1:2 with lines title ''Test''"'
	command = trim(adjustl(part1)) // trim(adjustl(part2)) // trim(adjustl(part3)) // trim(adjustl(part4))
	PRINT *, command
	call execute_command_line(command)

END program plot_example