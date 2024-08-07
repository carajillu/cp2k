!--------------------------------------------------------------------------------------------------!
!   CP2K: A general program to perform molecular dynamics simulations                              !
!   Copyright 2000-2024 CP2K developers group <https://cp2k.org>                                   !
!                                                                                                  !
!   SPDX-License-Identifier: GPL-2.0-or-later                                                      !
!--------------------------------------------------------------------------------------------------!

!--------------------------------------------------------------------------------------------------!
! IMPORTANT: Update libversion.h when you add, remove or change a function in this file.              !
!--------------------------------------------------------------------------------------------------!

! **************************************************************************************************
!> \brief CP2K C/C++ interface
!> \par History
!>       08.2024 created [Joan Clark-Nicolas] based on libcp2k.F
!> \author Joan Clark-Nicolas
! **************************************************************************************************

MODULE libversion
    #include "../../../../../base/base_uses.f90"
    USE ISO_C_BINDING,                   ONLY: C_CHAR,&
                                               C_DOUBLE,&
                                               C_FUNPTR,&
                                               C_INT,&
                                               C_LONG,&
                                               C_NULL_CHAR
    
    USE cp2k_info,                       ONLY: cp2k_version, cp2k_year, cp2k_home
   
    IMPLICIT NONE

    ! **************************************************************************************************
    !> \brief ...
    !> \param version_str ...
    !> \param str_length ...
    ! **************************************************************************************************
    SUBROUTINE cp2k_get_version(version_str, str_length) BIND(C)
        CHARACTER(LEN=1, KIND=C_CHAR), INTENT(OUT)         :: version_str(*)
        INTEGER(C_INT), VALUE                              :: str_length

        INTEGER                                            :: i, n

        n = LEN_TRIM(cp2k_version)
        CPASSERT(str_length >= n + 1)
        MARK_USED(str_length)

        ! copy string
        DO i = 1, n
           version_str(i) = cp2k_version(i:i)
        END DO
        version_str(n + 1) = C_NULL_CHAR
     END SUBROUTINE cp2k_get_version

     SUBROUTINE cp2k_get_year(year_str, str_length) BIND(C)
        CHARACTER(LEN=1, KIND=C_CHAR), INTENT(OUT)         :: year_str(*)
        INTEGER(C_INT), VALUE                              :: str_length

        INTEGER                                            :: i, n

        n = LEN_TRIM(cp2k_year)
        CPASSERT(str_length >= n + 1)
        MARK_USED(str_length)

        ! copy string
        DO i = 1, n
           year_str(i) = cp2k_year(i:i)
        END DO
        year_str(n + 1) = C_NULL_CHAR
     END SUBROUTINE cp2k_get_year
END MODULE libversion