-- 函数
function maxNum(num1,num2)
    if(num1>num2) then
        result=num1
    else
        result=num2
    end
    return result
end
print("两者比较最大值为:",maxNum(10, 5))
print("两者比较最大值为:",maxNum(3, 9))
print("*****将函数作为参数传递给函数*****")
myprint=function(param)
    print("这是打印函数 -  ##",param,"##")
end
function add(num1,num2,functionPrint)
    result = num1+num2
    functionPrint(result)
end
myprint(12)
add(3, 6, myprint)
print("*****多返回值*****")
local s,e=string.find("www.php.cn","php")  --Lua下标从1开始
print(s,e)
print("*****可变参数*****")
function average(...)
    result=0
    local arg={...}
    for k,v in pairs(arg) do
        result=result+v
    end
    print("总共传入"..#arg.."个数")
    print("总共传入"..select("#",...).."个数")  --获取可变参数的数量
    return result/#arg
end
print("平均值为",average(10,6,14,3,7,0,8))
print("*****遍历可变参数*****")
do
    function foo(...)
        for i=1,select("#", ...) do
            local arg=select(i, ...)  --用于访问n到select('#',…)的参数，赋值时只会将第一个值赋值给变量，你可以尝试打印它
            print("arg",arg)
        end
    end
    foo(1,3,5,7)
end