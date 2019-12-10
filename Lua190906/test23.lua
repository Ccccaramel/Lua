-- 流程控制
-- <1>if语句
-- <2>if..else语句
-- <3>if嵌套语句
print("*****if语句*****")
local num1=10
if num1<20 then
    print("num1<20")
end
print("num1的值:",num1)
print("*****if..else语句*****")
if(num1<5) then
    print("num1小于5")
else
    print("num1大于5")
end
print("num1值:",num1)
print("*****if..elseif..else语句*****")
if num1==5 then
    print("num1等于5")
elseif num1==15 then
    print("num1等于15")
else
    print("未匹配到num1的值")
end
print("num1值:",num1)