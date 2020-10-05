from math import floor, inf

# other implementations include mid in argument list
# i can't see why this is necessary
def find_max_crossing_subarray(A, low, mid, high):
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
  return (max_left, max_right, left_sum + right_sum)

def inspect(a):
  print(a)
  return a

def find_max_subarray(A):
  def max_sub(A, low, high):
    mid = floor((low + high) / 2)
    if high == low:
      return (low, high, A[low])
    else:
      cross = _, _, cross_sum = find_max_crossing_subarray(A, low, mid, high)
      left = _, _, left_sum = max_sub(A, low, mid)
      right = _, _, right_sum = max_sub(A, mid+1, high)
      largest = max(cross_sum, left_sum, right_sum)
      if largest == left_sum:
        return left
      elif largest == cross_sum: 
        return cross
      else:
        return right

  return max_sub(A, 0, len(A)-1)

if __name__ == "__main__":
  #array = [i for i in range(0,101)]
  #print(find_max_crossing_subarray(array, 50, 63, 75))
  array = [-45,-40,1,1,-35,-30,-25,-20,-15,-10,-5,0,1,0,0,4]
  print(find_max_subarray(array))