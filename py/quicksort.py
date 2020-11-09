def quicksort(A):
  def qs(A,p,ril):
    if p < ril:
      q = partition(A,p,ril)
      qs(A,p,q-1)
      qs(A,q+1,ril)

  def partition(A,p,ril):
    x = A[ril]
    i = p - 1
    for j in range(p,ril):
      if A[j] <= x:
        i += 1
        exchange(A,i,j)
    exchange(A,ril,i+1)
    return i+1
  qs(A, 0, len(A)-1)
  return A

def exchange(A,i,j):
  A[i], A[j] = A[j], A[i]

if __name__ == "__main__":
  print(list(map(quicksort, [[2,-4,0,5,1,3],[0],[],[1,2,3,4,5,6,7,8,9]])))

  