import numpy as np

from cpython.mem cimport PyMem_Malloc, PyMem_Free

cdef extern from "libversion.h":
    void cp2k_get_version(char* version_str, int str_length)
    void cp2k_get_year(char* year_str, int str_length)

def get_version_string():
    n = 255 * sizeof(char)

    data = <char *>PyMem_Malloc(n)
    if not data:
        raise MemoryError()

    versionstr = ''
    try:
        cp2k_get_version(data, n)
        versionstr = data.decode('UTF-8')
    finally:
        PyMem_Free(data)

    return versionstr

def get_year_string():
    n = 255 * sizeof(char)

    data = <char *>PyMem_Malloc(n)
    if not data:
        raise MemoryError()

    yearstr = ''
    try:
        cp2k_get_year(data, n)
        yearstr = data.decode('UTF-8')
    finally:
        PyMem_Free(data)

    return yearstr