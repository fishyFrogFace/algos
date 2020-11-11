def counting_sort(A, B, d):
  n = lambda x: x // 10**(d-1) % 10
  C = [0 for i in range(0, 11)]
  for j in A:
    C[n(j)] += 1
  for i in range(1, 11):
    C[i] += C[i-1]
  for m in reversed(A):
    B[C[n(m)]-1] = m
    C[n(m)] = C[n(m)] - 1
  return B

def radix_sort(A, d):
  for i in range(1, d+1):
    B = [0 for i in range(0, len(A))]
    A = counting_sort(A, B, i)
  return A

if __name__ == "__main__":
  myList = [4,60,356,6,12,5485,7340,4940,40]
  print(radix_sort(myList, 4))