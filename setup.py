from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import os
import numpy



include_dirs=[numpy.get_include(),
                  os.path.join(numpy.get_include(), 'numpy')]
                  
extra_compile_args=['-O2']                  

ext_modules = []

for name in ["cythonized_numpy", "cythonized_numpy_2", "cythonized_numpy_2b",
                "cythonized_numpy_3", "cythonized_numpy_4", "memview", "pointer_arith"]:
   e = Extension(name, 
                 ["%s.pyx" % (name,)],
                 include_dirs=include_dirs,
                 extra_compile_args=extra_compile_args)
   ext_modules.append(e)              
                    


setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = ext_modules
)


