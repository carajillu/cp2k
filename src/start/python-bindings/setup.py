#!/usr/bin/env python3
#  vim: set ts=4 sw=4 tw=0 :

from setuptools import setup, Extension
import glob
import numpy

try:
    from Cython.Build import cythonize

    USE_CYTHON = True
    EXT = "pyx"
except ImportError:
    USE_CYTHON = False
    EXT = "c"
    cythonize = lambda ext: ext

pyx_lst=glob.glob("**/*.pyx", recursive=True)


extensions = []
for pyx in pyx_lst:
    ext_name=pyx.replace("src/", "").replace(".pyx", "").replace("/", ".")
    extensions += [Extension(name=ext_name, sources=[pyx], include_dirs=[numpy.get_include()],libraries=["cp2k"])]
for ext in extensions:
    print(ext)

#This doesn't work, leaving it here as a reminder
#extensions=Extension("cp2k",sources=pyx_lst,include_dirs=[numpy.get_include()],libraries=["cp2k"])

setup(name="cp2k", ext_modules=cythonize(extensions))
