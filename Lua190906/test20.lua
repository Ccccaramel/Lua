-- 赋值语句
-- Lua可以对多个变量同时赋值，变量列表和值列表的各个元素用逗号分开，
-- 赋值语句右边的值会依次赋给左边的变量。
-- 当变量个数和值的个数不一致时：
--    a.变量个数 > 值的个数    按变量个数补足nil
--    b.变量个数 < 值的个数    多于的值会被忽略
local num1,num2,num3=1,2,3
print(num1,num2,num3)

num1,num2=num1+1,num2+2,num3+3
print(num1,num2)

local num4,num5,num6=0
print(num4,num5,num6)