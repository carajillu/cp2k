import numpy as np

from cpython.mem cimport PyMem_Malloc, PyMem_Free

cdef extern from "libfinalize.h":
    void cp2k_finalize(bint mpi_flag)

def finalize(mpi_flag: bool):
    cp2k_finalize(mpi_flag)
    return