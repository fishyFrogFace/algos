def counting_sort(A, B, k):
  C = [0 for i in range(0, k+1)]
  for j in A:
    C[j] += 1
  for i in range(1, k+1):
    C[i] += C[i-1]
  for n in reversed(A):
    B[C[n]-1] = n
    C[n] = C[n] - 1
  return B

if __name__ == "__main__":
  myList = [4,0,3,6,1,5,7,0,4]
  otherList = [0 for i in range(0, len(myList))]
  print(counting_sort(myList, otherList, 7))