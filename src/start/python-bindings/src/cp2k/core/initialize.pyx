import numpy as np

from cpython.mem cimport PyMem_Malloc, PyMem_Free

cdef extern from "libinitialize.h":
    void cp2k_init(bint mpi_flag)
    

def init(mpi_flag: bool):
    cp2k_init(mpi_flag)
    return