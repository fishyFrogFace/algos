from linked_list import toList

class Node:
    def __init__(self, i, prev, next):
        self.i = i
        self.prev = prev
        self.next = next

def prepend(node, x):
    newNode = Node(x, None, node)
    if node:
      node.prev = newNode
    return newNode

def fromList(list):
  prev = None
  for i in range(len(list)-1,-1,-1):
      new = prepend(prev, list[i])
      prev = new
  return prev

def findLast(node):
  while node.next:
    node = node.next
  return node

def toReverseList(node):
  n = findLast(node)
  defined = True
  list = []
  while defined:
      if n and n.i != None:
          list.append(n.i)
          n = n.prev
      else:
          defined = False
  return list

def delete(node, x):
    def delOne(n, prev, x):
        if n:
            if n.i == x:
                prev.next = n.next
                n.next.prev = prev
            else:
                delOne(n.next, n, x)

    # check if the list is not empty and the first node is the one to get deleted
    if node and node.i == x:
        node.next.prev = None
        return node.next
    else:
        delOne(node.next, node, x)
        return node

if __name__ == "__main__":
    print(toReverseList(delete(fromList([1,2,3,4,5]),1)))