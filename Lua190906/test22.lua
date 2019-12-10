-- Lua循环
-- Lua提供的几种循环处理方式：
--   <1> while
--   <2> for
--   <3> repeat...until(类似于do..while)
--   <4> 循环嵌套(实例略)
-- break
local sign=0
print("*****while*****")
while sign < 6 do
    print("num的值:",sign)
    sign=sign+1
end
print("*****for*****")
for i=1,5,1 do  --第三个参数默认为1，即每次循环i++
    print(i)
end
print("*****for-fun()*****")
function f(x)
    print("function")
        return x*2
end
for i=1,f(3) do
    print(i)
end
print("*****泛型for循环*****")
local table1={"one","two","three"}
for i,v in ipairs(table1) do
    print(v)
end
print("*****泛型for循环*****")
local num1=10
repeat
    print("num1:",num1)
    num1=num1+1
until (num1>14)




