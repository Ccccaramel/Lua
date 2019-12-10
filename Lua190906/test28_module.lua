-- 模块与包
-- 模块类似于一个封装库，
-- Lua模块是由变量、函数等已知元素组成的table
module={}

module.constant="this is a string"

function module.fun1()
    io.write("this is a public function!\n")
end

local function fun2()
    print("this is private functon!")
end

function module.fun3()
    fun2()
end

return module