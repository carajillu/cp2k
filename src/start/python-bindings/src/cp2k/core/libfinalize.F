!--------------------------------------------------------------------------------------------------!
!   CP2K: A general program to perform molecular dynamics simulations                              !
!   Copyright 2000-2024 CP2K developers group <https://cp2k.org>                                   !
!                                                                                                  !
!   SPDX-License-Identifier: GPL-2.0-or-later                                                      !
!--------------------------------------------------------------------------------------------------!

!--------------------------------------------------------------------------------------------------!
! IMPORTANT: Update libfinalize.h when you add, remove or change a function in this file.              !
!--------------------------------------------------------------------------------------------------!

! **************************************************************************************************
!> \brief CP2K C/C++ interface
!> \par History
!>       08.2024 created [Joan Clark-Nicolas] based on libcp2k.F
!> \author Joan Clark-Nicolas
! **************************************************************************************************

MODULE libfinalize
      #include "../../../../../base/base_uses.f90"
      USE ISO_C_BINDING,                   ONLY: C_CHAR,&
                                                 C_DOUBLE,&
                                                 C_FUNPTR,&
                                                 C_INT,&
                                                 C_LONG,&
                                                 C_NULL_CHAR
      USE f77_interface,                   ONLY: finalize_cp2k
      IMPLICIT NONE
      SUBROUTINE cp2k_finalize(mpi_flag) BIND(C)
         LOGICAL, INTENT(IN) :: mpi_flag
       
         INTEGER :: ierr
       
         CALL finalize_cp2k(mpi_flag, ierr)
         CPASSERT(ierr == 0)
      END SUBROUTINE cp2k_init

END MODULE libfinalize