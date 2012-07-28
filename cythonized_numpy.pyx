import numpy as np
cimport numpy as np

cdef object dot = np.dot

cdef np.float64_t slicefunc(object Xi, object Xj) except? 0.0:
    return <np.float64_t> dot(Xi, Xj)

def compute_distances(X):
    cdef np.float64_t acc = 0.0
    cdef np.intp_t i, j, N
    N = X.shape[0]

    for i in range(N):
        for j in range(N):
            acc += slicefunc(X[i,:], X[j,:])
    
    return float(acc)