-- . 与 :
Object={
    __ClassType = "<base class>",
    __DefPos = "object"
}

function Object:add1(num1,num2)
    return num1+num2*2
end

function Object.add2(num1,num2)
    return num1+num2*2
end
--[[
:   意味着第一个参数位置存在一个self参数
.   无上述特征

-------定义方法时--------
你所看到的:
class:add(n1,n2)
    pass

实际上:
class:add(self,n1,n2)
    pass

-------调用方法时--------
你所看到的:
c:add(n1,n2)

实际上:
c:add(self,n1,n2)
--]]
print(Object.add1(0,3,4))  --
print(Object:add1(3,4))
print(Object.add2(3,4))
print(Object:add2(1,3))