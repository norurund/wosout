#メソッドの引数で問題を入れていただく形になります。
#四則演算
def formula(a, b, ope)
    return b + a if ope == "+"
    return a - b if ope == "-"
    return b * a if ope == "*"
    return a / b if ope == "/"
end

#ポーランド記法分解
def cal(num)
p num
stack = []
arr = num.split(" ")
arr.reverse!
arr.each do |i|
    if i =~ /\d/
        stack << i
    else
        a = stack.pop.to_f
        b = stack.pop.to_f
        ope = i.to_s
        p "#{a} #{ope} #{b}"
        stack << formula(a, b, ope)
    end
end

#小数点
if stack[0] >= 1
    p stack[0]
  else
    p stack[0].to_f
end
end

cal("/ + 2 2 + 3 5")
