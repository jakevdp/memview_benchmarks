import numpy_only
import cythonized_numpy
import cythonized_numpy_2
import cythonized_numpy_3
import cythonized_numpy_4
import pointer_arith
import memview

import numpy as np
from time import time

X = np.random.random((200, 100))

modules = [numpy_only,
           cythonized_numpy,
           cythonized_numpy_2,
           cythonized_numpy_3,
           cythonized_numpy_4,
           pointer_arith,
           memview]

for module in modules:
    t0 = time()
    module.compute_distances(X)
    t1 = time()

    print "%s: %.3g sec" % (module.__name__, t1 - t0)
