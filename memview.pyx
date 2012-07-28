import numpy as np
cimport numpy as np
cimport cython

@cython.boundscheck(False)
@cython.wraparound(False)
cdef np.float64_t slice_func(np.float64_t[::1] Xi,
                             np.float64_t[::1] Xj):
    cdef np.intp_t k, M
    cdef np.float64_t tmp = 0.0
    M = Xi.shape[0]

    for k in range(M):
        tmp += Xi[k] * Xj[k]
        
    return tmp

def compute_distances(np.float64_t[:, ::1] X):
    cdef np.float64_t acc = 0.0

    cdef np.intp_t i, j, N
    N = X.shape[0]

    for i in range(N):
        for j in range(N):
            acc += slice_func(X[i,:], X[j,:])
    
    return float(acc)