import numpy as np

def slicefunc(Xi, Xj):
    return np.dot(Xi, Xj)

def compute_distances(X):
    X = np.asarray(X)
    N = X.shape[0]

    for i in range(N):
        for j in range(N):
            slicefunc(X[i], X[j])
