from cpython.mem cimport PyMem_Malloc, PyMem_Free

cdef class CP2K():

    def __init__(self,mpi_flag):
        from core import initialize
        initialize.init(mpi_flag)

    def __exit__(self, exc_type, exc_value, traceback):
        from core import finalize
        finalize.finalize()
        self.destroy()
    