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
        if node and node.i != None:
            list.append(node.i)
            node = node.next
        else:
            defined = False
    return list

def toListRecursive(node):
    def toListRec(n, list):
        if n and n.i != None:
            list.append(n.i)
            return toListRec(n.next, list)
        else:
            return list
    return toListRec(node, [])

def search_list(node, x):
    if node:
        if node.i == x:
            return node
        else:
            return search_list(node.next, x)
    else:
        return None

def prepend(node, x):
    return Node(x, node)

def delete(node, x):
    def delOne(n, prev, x):
        if n:
            if n.i == x:
                prev.next = n.next
            else:
                delOne(n.next, n, x)

    # check if the list is not empty and the first node is the one to get deleted
    if node and node.i == x:
        return node.next
    else:
        delOne(node.next, node, x)
        return node

if __name__ == "__main__":
    lst = fromList([n for n in range(0,6)])
    new = delete(lst, 3)
    print(toList(new))