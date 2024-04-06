ProGrAm plot_example
	implicit none
	character(len=100) :: command

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
		write(10, *) x(i), z(i)
	end do
	close(unit=10)

	! Commande Gnuplot pour tracer les données
	! Notez que vous devez adapter le chemin d'accès selon votre environnement
	command = 'gnuplot -persist -e "plot ''srcs/data.dat'' with lines"'
	call execute_command_line(command)

END program plot_example
