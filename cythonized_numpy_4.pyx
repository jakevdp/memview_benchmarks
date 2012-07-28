import numpy as np
cimport numpy as np
cimport cython

@cython.boundscheck(False)
@cython.wraparound(False)
def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.intp_t i, j, k, N, M
    cdef np.float64_t tmp = 0.0
    N = X.shape[0]
    M = X.shape[1]

    for i in range(N):
        for j in range(N):
            tmp = 0
            for k in range(M):
                tmp += X[i, k] * X[j, k]

    return float(tmp)