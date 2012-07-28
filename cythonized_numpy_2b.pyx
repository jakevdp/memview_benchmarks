import numpy as np
cimport numpy as np
cimport cython


@cython.boundscheck(False)
@cython.wraparound(False)
cdef np.float64_t slice_func(np.ndarray[np.float64_t, ndim=1, mode='c'] Xi,
                             np.ndarray[np.float64_t, ndim=1, mode='c'] Xj) except? 0.0:
    cdef np.intp_t k, M
    cdef np.float64_t tmp = 0.0

    M = Xi.shape[0]
    tmp = 0
    
    for k in range(M):
        tmp += Xj[k] * Xj[k]

    return tmp


def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.intp_t i, j, N
    cdef np.float64_t acc = 0.0
    
    N = X.shape[0]
    for i in range(N):
        for j in range(N):
            acc += slice_func(X[i,:], X[j,:])

    return float(acc)