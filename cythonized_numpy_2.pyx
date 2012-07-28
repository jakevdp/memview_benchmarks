import numpy as np
cimport numpy as np
cimport cython

cdef object dot = np.dot

cdef np.float64_t slice_func(np.ndarray[np.float64_t, ndim=1, mode='c'] Xi,
                np.ndarray[np.float64_t, ndim=1, mode='c'] Xj) except? 0.0:
    return <np.float64_t> dot(Xi, Xj)

@cython.boundscheck(False)
@cython.wraparound(False)
def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.float64_t acc = 0.0
    cdef np.intp_t i, j, N
    N = X.shape[0]

    for i in range(N):
        for j in range(N):
            acc += slice_func(X[i,:], X[j,:])

    return float(acc)