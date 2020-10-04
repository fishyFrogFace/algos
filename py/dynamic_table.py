class Table:
  size = 0
  num = 0

def table_insert(T, x):
  if T.size == 0:
    T.size = 1
  #else:
    #print("load factor before:", T.num/T.size)
  if T.num == T.size:
    print("we're expanding! T.num is:", T.num)
    T.size = 2*T.size
  T.num = T.num + 1
  #print("size:", str(T.size) + ", num:", str(T.num) + ", load factor:", str(T.num/T.size))
  #print("--------------------------------------------------")

def table_insert_3(T, x):
  if T.size == 0:
    T.size = 1
  #else:
    #print("load factor before:", T.num/T.size)
  if T.num/T.size > 1/3:
    print("we're expanding! we have this many elements:", str(T.num-1), "and this is what we're expanding to: ", 3*T.size)
    T.size = 3*T.size
  T.num = T.num + 1
  #print("size:", str(T.size) + ", num:", str(T.num) + ", load factor:", str(T.num/T.size))
  #print("--------------------------------------------------")

table = Table()
for i in range(1,2190):
  table_insert_3(table, i)