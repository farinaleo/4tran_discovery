program main
    implicit none
    character(len=200) :: command, part1, part2

    ! Définition des données à tracer
    integer, parameter :: n = 50
    real :: x(n * n + n), y(n * n + n), z(n * n + n)
    integer :: i, j, nique
    real :: r_x, r_y
    integer :: res

    ! Génération des données
    nique = 1
    do i = 1, n
        do j = 1, n
            r_x = i * 0.05 - 1.75
            r_y = j * 0.05 - 1.25
            res = mandelbrot(r_x, r_y, 100)
            x(nique) = r_x
            y(nique) = r_y
            z(nique) = real(res)
            nique = nique + 1
        end do
    end do

    ! Écriture des données dans un fichier temporaire
    open(unit=10, file='srcs/data.dat', status='replace')
    do i = 1, nique
        write(10, *) x(i), y(i), z(i)
    end do
    close(unit=10)

    ! Commande Gnuplot pour tracer les données
    ! Notez que vous devez adapter le chemin d'accès selon votre environnement
    part1 = 'gnuplot -persist -e "set dgrid3d 49,49,5;set pm3d; set hidden3d;splot ''srcs/data.dat'''
    part2 = ' using 1:2:3 with lines;do for [i=0:100000] {;pause 0.1}"'
    command = trim(adjustl(part1)) // trim(adjustl(part2))
    PRINT *, command
    call execute_command_line(command)

contains

    function mandelbrot(x, y, maxiter) result(iter)
        implicit none
        integer, intent(in) :: maxiter
        real, intent(in) :: x, y
        real :: zx, zy, zx2, zy2, temp
        integer :: iter

        iter = 0
        zx = 0.0
        zy = 0.0
        zx2 = 0.0
        zy2 = 0.0

        do while (iter < maxiter .and. zx2 + zy2 < 4.0)
            temp = zx * zx - zy * zy + x
            zy = 2.0 * zx * zy + y
            zx = temp
            zx2 = zx * zx
            zy2 = zy * zy
            iter = iter + 1
        end do
    end function mandelbrot

end program main