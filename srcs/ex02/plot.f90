ProGrAm plot_example
	implicit none
	character(len=200) :: command, part1, part2

	! Définition des données à tracer
	integer, parameter :: n = 100000
	real :: x(n), y(n), z(n)
	integer :: i
	real :: r

	! Génération des données
	do i = 1, n
		r = i * 0.0001
		x(i) = r
		y(i) = cos(r)
		z(i) = sin(r)
	end do

	! Écriture des données dans un fichier temporaire
	open(unit=10, file='srcs/data.dat', status='replace')
	do i = 1, n
		write(10, *) x(i), y(i), z(i)
	end do
	close(unit=10)

	! Commande Gnuplot pour tracer les données
	! Notez que vous devez adapter le chemin d'accès selon votre environnement
	part1 = 'gnuplot -persist -e "plot ''srcs/data.dat'' using 1:2 with lines title ''Curve 1'', '
    part2 = '''srcs/data.dat'' using 1:3 with lines title ''Curve 2''"'
	command = trim(adjustl(part1)) // trim(adjustl(part2))
	PRINT *, command
	call execute_command_line(command)

END program plot_example
