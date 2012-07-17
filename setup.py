from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import os
import numpy

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("cythonized_numpy", ["cythonized_numpy.pyx"]),
                   Extension("cythonized_numpy_2", ["cythonized_numpy_2.pyx"]),
                   Extension("cythonized_numpy_3", ["cythonized_numpy_3.pyx"]),
                   Extension("cythonized_numpy_4", ["cythonized_numpy_4.pyx"]),
                   Extension("memview", ["memview.pyx"]),
                   Extension("pointer_arith", ["pointer_arith.pyx"])],
    include_dirs=[numpy.get_include(),
                  os.path.join(numpy.get_include(), 'numpy')]
)
