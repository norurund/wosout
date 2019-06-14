import sys
ni = list(map(str,sys.stdin.readline().split()))
ni.reverse()
stack = []
operator = {
        '+': (lambda x, y: y + x),
        '-': (lambda x, y: y - x),
        '*': (lambda x, y: y * x),
        '/': (lambda x, y: float(y) / x)
}
for index, z  in enumerate(ni):
    print(stack)
    if z not in operator.keys():
      stack.append(int(z))
      continue
    y = stack.pop()
    x = stack.pop()
    stack.append(operator[z](x, y))
    print('%s %s %s =' % (y, z, x))
if stack[0] >= 1:
  print(int(stack[0]))
else:
  print(stack[0])
