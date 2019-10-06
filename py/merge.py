# edit merge so you check for empty lists instead of using an infinite last element

def merge(A,p,q,r):
    n1 = q-p+1
    L = A[:n1]
    R = A[q+1:r+1]
    i = 0
    j = 0
    for k in range(p,r+1):
        if i != len(L) and j != len(R):
            if L[i] <= R[j]:
                A[k] = L[i]
                i += 1
            else:
                A[k] = R[j]
                j += 1
        else:
            notEmpty, counter = (R, j) if i == len(L) - 1 else (L, i)
            while k < r:
                A[k] = notEmpty[counter]
                counter += 1
                k += 1

A = [1,2,3,4,5,1,2,3,4,5]
merge(A,0,4,9)
print(A)