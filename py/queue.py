class Queue:
    head = 0
    tail = 0
    queue = [0 for i in range(0,11)]

def enqueue(Q,x):
    Q.queue[Q.tail] = x
    if Q.tail == len(Q.queue)-1:
        Q.tail = 0
    else:
        Q.tail = Q.tail + 1
    return Q

def dequeue(Q):
    x = Q.queue[Q.head]
    if Q.head == len(Q.queue)-1:
        Q.head = 0
    else:
        Q.head = Q.head + 1 
    return x

qu = Queue()
for i in range(1,13):
    enqueue(qu,i).queue
print(qu.queue)

for i in range(0,12):
    print(dequeue(qu))
    print("q.head:", qu.head)
