class Node:
    def __init__(self, i, next):
        self.i = i
        self.next = next

def fromList(list):
    prev = None
    for i in range(len(list)-1,-1,-1):
        new = Node(list[i],prev)
        prev = new
    return prev

def fromListRecursive(list):
    def fromListRec(l, prev, index):
        if index == -1:
            return prev
        else:
            return fromListRec(l, Node(l[index],prev), index-1)
    return fromListRec(list, None, len(list)-1)

def toList(node):
    defined = True
    list = []
    while defined:
        if node and node.i:
            list.append(node.i)
            node = node.next
        else:
            defined = False
    return list

def toListRecursive(node):
    def toListRec(n, list):
        if n and n.i:
            list.append(n.i)
            return toListRec(n.next, list)
        else:
            return list
    return toListRec(node, [])
