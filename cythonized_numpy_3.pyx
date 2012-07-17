import numpy as np
cimport numpy as np

cdef slice_func(np.ndarray[np.float64_t, ndim=2, mode='c'] X,
                np.intp_t i,
                np.intp_t j):
    cdef np.intp_t k, M
    cdef np.float64_t tmp

    M = X.shape[1]
    tmp = 0
    
    for k from 0 <= k < M:
        tmp += X[i, k] * X[j, k]

def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.intp_t i, j, N
    N = X.shape[0]

    for i from 0 <= i < N:
        for j from 0 <= j < N:
            slice_func(X, i, j)
