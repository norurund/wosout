#標準入力で答えを入れていただく形になります。
import sys
ni = list(map(str,sys.stdin.readline().split()))
ni.reverse()
stack = []

#四則演算処理
formula = {
        '+': (lambda x, y: y + x),
        '-': (lambda x, y: y - x),
        '*': (lambda x, y: y * x),
        '/': (lambda x, y: float(y) / x)
}

#入力値に計算記号があるかどうか
for index, z  in enumerate(ni):
    print(stack)
    if z not in formula.keys():
      stack.append(int(z))
      continue
    y = stack.pop()
    x = stack.pop()
    stack.append(formula[z](x, y))
    print('%s %s %s =' % (y, z, x))
    
#小数点
if stack[0] >= 1:
  print(int(stack[0]))
else:
  print(stack[0])
