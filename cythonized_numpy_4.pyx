import numpy as np
cimport numpy as np

def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.intp_t i, j, k, N, M
    cdef np.float64_t tmp
    N = X.shape[0]
    M = X.shape[1]

    for i from 0 <= i < N:
        for j from 0 <= j < N:
            tmp = 0
            for k from 0 <= k < M:
                tmp += X[i, k] * X[j, k]
