import numpy_only
import cythonized_numpy
import cythonized_numpy_2
import cythonized_numpy_2b
import cythonized_numpy_3
import cythonized_numpy_4
import pointer_arith
import memview

import numpy as np
from time import clock

X = np.random.random((1000, 1000))

modules = [numpy_only,
           cythonized_numpy,
           cythonized_numpy_2,
           cythonized_numpy_2b,
           cythonized_numpy_3,
           cythonized_numpy_4,
           pointer_arith,
           memview]

for module in modules:
    tmp = X.copy()
    t0 = clock()
    module.compute_distances(tmp)
    t1 = clock()

    print "%s: %.3g sec" % (module.__name__, t1 - t0)
