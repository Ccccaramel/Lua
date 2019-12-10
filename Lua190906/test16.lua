-- function与匿名函数
-- 在Lua中函数是被看作是"第一类值(First-Class Value)"，函数可存在变量里
function factorial_1( n )
    if n==0 then
        return 1
    else
        return n*factorial_1(n-1)
    end
end
print(factorial_1(5))
factorial_2=factorial_1
print(factorial_2(5))

print("*****匿名函数*****")
function testFun(tab,fun)
    for k,v in pairs(tab) do
        print(fun(k,v));
    end
end
local tab={key="val1",key2="val2"};
testFun(tab,
function (key,val)
    return key.."="..val;
end
);