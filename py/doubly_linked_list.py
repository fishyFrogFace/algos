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

if __name__ == "__main__":
    one = prepend(None, 1)
    two = prepend(one, 0)
    print(one.prev.i)