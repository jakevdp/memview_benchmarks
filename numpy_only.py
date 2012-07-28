import numpy as np

dot = np.dot

def slicefunc(Xi, Xj):
    return dot(Xi, Xj)

def compute_distances(X):
    acc = 0.0
    N = X.shape[0]

    for i in range(N):
        for j in range(N):
            acc += slicefunc(X[i,:], X[j,:])
    
    return acc
    
    
    
