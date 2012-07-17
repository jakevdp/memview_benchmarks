import numpy as np
cimport numpy as np

cdef slice_func(np.ndarray[np.float64_t, ndim=1, mode='c'] Xi,
                np.ndarray[np.float64_t, ndim=1, mode='c'] Xj):
    np.dot(Xi, Xj)

def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.intp_t i, j, N
    N = X.shape[0]

    for i from 0 <= i < N:
        for j from 0 <= j < N:
            slice_func(X[i], X[j])
