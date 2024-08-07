/*----------------------------------------------------------------------------*/
/*  CP2K: A general program to perform molecular dynamics simulations         */
/*  Copyright 2000-2024 CP2K developers group <https://cp2k.org>              */
/*                                                                            */
/*  SPDX-License-Identifier: GPL-2.0-or-later                                 */
/*----------------------------------------------------------------------------*/

#include <stdbool.h>

/*******************************************************************************
 * \brief Definitions for the functions exported in libversion.F
 * \author Joan Clark-Nicolas Aug 2024
 ******************************************************************************/

#ifndef LIBVERSION_H
#define LIBVERSION_H

#ifdef __cplusplus
extern "C" {
#endif
/*******************************************************************************
 * \brief Get the CP2K version stringand release year
 * \param version_str The buffer to write the version string into
 * \param str_length The size of the buffer (must be large enough)
 ******************************************************************************/
void cp2k_get_version(char *version_str, int str_length);
void cp2k_get_year(char *year_str, int str_length);
#ifdef __cplusplus
}
#endif

#endif