from math import ceil, inf

# other implementations include mid in argument list
# i can't see why this is necessary
def find_max_crossing_subarray(A,low,high):
  mid = ceil((low + high) / 2)
  print(mid)
  left_sum = -inf
  sum = 0
  max_left = mid
  for i in range(mid,low-1,-1):
    sum = sum + A[i]
    if sum > left_sum:
      left_sum = sum
      max_left = i
  
  right_sum = -inf
  sum = 0
  max_right = mid + 1
  for j in range(mid+1,high+1):
    sum = sum + A[j]
    if sum > right_sum:
      right_sum = sum
      max_right = j
  return (max_left, max_right, left_sum, right_sum)

if __name__ == "__main__":
  array = [i for i in range(0,101)]
  print(find_max_crossing_subarray(array, 50, 75))