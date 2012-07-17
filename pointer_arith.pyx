import numpy as np
cimport numpy as np

cdef slice_func(np.float64_t* Xi,
                np.float64_t* Xj,
                np.intp_t M):
    cdef np.intp_t k
    cdef np.float64_t tmp = 0

    for k from 0 <= k < M:
        tmp += Xi[k] * Xj[k]

def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.intp_t i, j, k, N, M
    N = X.shape[0]
    M = X.shape[1]

    cdef np.float64_t* Xdata = <np.float64_t*>X.data

    for i from 0 <= i < N:
        for j from 0 <= j < N:
            slice_func(&Xdata[i * M], &Xdata[j * M], M)
