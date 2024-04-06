pROGRAm read_value
    iMplicit none
    integer :: birth, ierr

    ! Prompt user to enter their age
    write (*,"('Enter your Birth year: ')",advance='no') 

    ! Read user input and check for errors
    read(*,*,iostat=ierr) birth

    ! Check if an error occurred during input
    if (ierr /= 0) then
        print *, ''//achar(27)//'[31mERROR::.Invalid input. Please enter a valid integer.'//achar(27)//'[0m'
        return
    end if

    birth = 2024 - birth

    ! Display the user's age
    PRINT '("Your age is ",I0)', birth

    if (birth < 0) then
        PRINT '("That seems weird...")'
    else if (birth > 111) then
        PRINT '("How are you still alive???")'
    else
        PRINT '("Nice")'
    end if
end program read_value