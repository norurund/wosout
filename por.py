import sys
ni = list(map(str,sys.stdin.readline().split()))
ni.reverse()
stack = []
operator = {
        '+': (lambda x, y: x + y),
        '-': (lambda x, y: x - y),
        '*': (lambda x, y: x * y),
        '/': (lambda x, y: float(x) / y)
}
for index, z  in enumerate(ni):
    print(index)
    print(stack)
    print(z)
    if z not in operator.keys():
      stack.append(int(z))
      continue
    y = stack.pop()
    x = stack.pop()
    stack.append(operator[z](x, y))
    print('%s %s %s =' % (x, z, y))
print(stack[0])
