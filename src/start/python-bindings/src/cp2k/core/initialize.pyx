import numpy as np

from cpython.mem cimport PyMem_Malloc, PyMem_Free

cdef extern from "libinitialize.h":
    void cp2k_init(bint init_mpi)
    

def init(init_mpi: bool):
    cp2k_init(init_mpi)
    return