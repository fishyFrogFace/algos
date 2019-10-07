def binarySearch(A,elem,start,end):
    middle = (end+start)//2
    if A[middle] == elem:
        return middle
    elif A[middle] < elem:
        return binarySearch(A,elem,middle+1,end)
    else:
        return binarySearch(A,elem,start,middle-1)

binarySearch([i for i in range(0,1000)],999,0,1000)
