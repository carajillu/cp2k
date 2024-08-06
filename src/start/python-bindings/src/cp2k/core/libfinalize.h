/*----------------------------------------------------------------------------*/
/*  CP2K: A general program to perform molecular dynamics simulations         */
/*  Copyright 2000-2024 CP2K developers group <https://cp2k.org>              */
/*                                                                            */
/*  SPDX-License-Identifier: GPL-2.0-or-later                                 */
/*----------------------------------------------------------------------------*/

#include <stdbool.h>

/*******************************************************************************
 * \brief Definitions for the functions exported in libfinalize.F
 * \author Joan Clark-Nicolas Aug 2024
 ******************************************************************************/

#ifndef LIBFINALIZE_H
#define LIBFINALIZE_H

#ifdef __cplusplus
extern "C" {
#endif
/*******************************************************************************
 * \brief Finalize CP2K and MPI if mpi_flag is true
 * \warning You are supposed to call cp2k_finalize() before exiting the program.
 ******************************************************************************/
void cp2k_finalize(bool mpi_flag);
#ifdef __cplusplus
}
#endif

#endif