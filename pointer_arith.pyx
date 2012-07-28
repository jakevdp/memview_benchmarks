import numpy as np
cimport numpy as np

cdef np.float64_t slice_func(np.float64_t* Xi,
                np.float64_t* Xj,
                np.intp_t M):
    cdef np.intp_t k
    cdef np.float64_t tmp = 0.0

    for k in range(M):
        tmp += Xi[k] * Xj[k]

    return tmp

def compute_distances(np.ndarray[np.float64_t, ndim=2, mode='c'] X):
    cdef np.float64_t acc = 0.0
    cdef np.intp_t i, j, k, N, M
    N = X.shape[0]
    M = X.shape[1]

    cdef np.float64_t* Xdata = <np.float64_t*> np.PyArray_DATA(X)

    for i in range(N):
        for j in range(N):
            acc += slice_func(Xdata + i*N, Xdata + j*N, M)

    return float(acc)

    

