ProGrAm plot_example
	implicit none
	character(len=200) :: command, part1, part2

	! Définition des données à tracer
	integer, parameter :: n = 1000
	integer, parameter :: z_t = 30
	real :: x(n * n + n), y(n * n + n)
	integer :: i, j, nique, k
	real :: r_x, r_y
	integer :: res

	! Génération des données
	nique = 1
	do i = 1, n
		do j = 1, n
			r_x = i * 0.1
			r_y = j * 0.1
			if (sierpinski(r_x, r_y, 10.0)) then
				x(nique) = r_x
				y(nique) = r_y
				nique = nique + 1
				if (nique > n * n + n - 1) then
					exit
				end if
			end if
			if (nique > n * n + n - 1) then
				exit
			end if
		end do
		if (nique > n * n + n - 1) then
			exit
		end if
	end do

	! Écriture des données dans un fichier temporaire
	open(unit=10, file='srcs/data.dat', status='replace')
	do i = 1, nique
		write(10, *) x(i), y(i)
	end do
	close(unit=10)

	! Commande Gnuplot pour tracer les données
	! Notez que vous devez adapter le chemin d'accès selon votre environnement
	part1 = 'gnuplot -persist -e "plot ''srcs/data.dat'' using 1:2 with points pointtype 7 pointsize 0.5"'
	command = part1
	PRINT *, command
	call execute_command_line(command)

contains

	function sierpinski(x, y, condition) result(print)
		implicit none
		real, intent(in) :: condition
		real, intent(in) :: x, y
		real:: x_1, y_1, x_2, y_2, x_3, y_3
		real :: tmp
		logical :: print
		if ( .not. (0 < MOD(y, condition)) .or. .not. (0 < MOD(x, condition))) then
			print = .true.
		else
			print = .false.
		end if
	end function sierpinski


END program plot_example