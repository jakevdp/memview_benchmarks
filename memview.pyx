import numpy as np
cimport numpy as np

cdef slice_func(np.float64_t[:] Xi,
                np.float64_t[:] Xj,
                np.intp_t M):
    cdef np.intp_t k
    cdef np.float64_t tmp

    for k from 0 <= k < M:
        tmp += Xi[k] * Xj[k]
    

def compute_distances(object X):
    cdef object Xobj = np.asarray(X, dtype=np.float64, order='C')
    cdef np.float64_t[:, ::1] Xmemview = Xobj

    cdef np.intp_t i, j, N
    N = X.shape[0]
    M = X.shape[1]

    for i from 0 <= i < N:
        for j from 0 <= j < N:
            slice_func(Xmemview[i], Xmemview[j], M)
