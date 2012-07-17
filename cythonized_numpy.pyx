import numpy as np
cimport numpy as np

cdef slicefunc(Xi, Xj):
    np.dot(Xi, Xj)

def compute_distances(X):
    cdef np.intp_t i, j, N
    N = X.shape[0]

    for i from 0 <= i < N:
        for j from 0 <= j < N:
            slicefunc(X[i], X[j])
