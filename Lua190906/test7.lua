-- 关于Metatable
print( "**********Lua元表**********" )

local mytable={tom=12,
    jim=13,
    mary=14,
    add=function(a,b)
        return a+b
    end
}   --普通表
local mymetatable={mark=15,tom=16}   --元表
setmetatable(mytable,mymetatable)   --把 mymetatable 设为 table 的元表
mt=getmetatable(mytable)   --返回mymetatable
for k,v in pairs(mt) do
    print("k:",k,",v:",v)
end
fun1=mytable["add"]
print("fun1(4,7):",fun1(4,7))
print( "**********Lua：__index元方法**********" )   --用于对表的访问

local other = { foo=3 }
local t = setmetatable ( {} , {__index=other} )
print( t.foo )   --正常输出   3
print( t.bar )   --输出为nil

mytable=setmetatable({key1="value1"},{
    __index=function (mytable,key)
        if key=="key2" then
            return "metatablevalue"
        else
            return nil
        end
    end
})
print(mytable.key1,mytable.key2)

print( "**********__newindex方法**********" )   --用于表的更新

mymetatable={}
mytable=setmetatable({key1="value1"}, {__newindex=mymetatable})
print(mytable.key1)

mytable.newkey="新值2"
print(mytable.newkey,mymetatable.newkey)   --表不存在对应的key时会将数据插入元表

mytable.key1="新值1"
print(mytable.key1,mymetatable.key1)   --表存在key时直接更新
----------------------------------
mytable=nil
mytable=setmetatable({key="value1"},{
    __newindex=function(mytable,key,value)
        rawset(mytable, key,"\""..value.."\"")   --虽然使用了元方法，但最终并未将value存入元表中，因为被rawset（）抢先一步了，进行了一次”原始的访问“（忽略元表的访问），这是对表的直接访问
    end
})
mytable.key1="new value"
mytable.key2=4

print(mytable.key1,mytable.key2)

print( "**********为表添加操作符**********" )

function table_maxn(t)
    local mn=0
    for k,v in pairs(t) do
        if mn<k then
            mn=k
        end
    end
    return mn
end

--两表相加操作
mytable=setmetatable({1,2,3},{
    __add=function (mytable,newtable)
        for i=1,table_maxn(newtable) do
            table.insert( mytable,table_maxn(mytable)+1,newtable[i] )        
        end
    return mytable
end
})

local secondtable={4,5,6}

mytable=mytable+secondtable
for k,v in ipairs(mytable) do
    print(k,v)
end

print( "**********__call元方法**********" )   --计算表中元素和，包括元表

mytable = setmetatable({10}, {
    __call = function(mytable, newtable)
        sum = 0
        for i = 1, table_maxn(mytable) do
            sum = sum + mytable[i]
        end
        for i = 1, table_maxn(newtable) do
            sum = sum + newtable[i]
        end
    return sum
end
})
local newtable = {10,20,30}
print(mytable(newtable))

print( "**********__tostring元方法**********" )   --修改表的输出行为

mytable = setmetatable({ 10, 20, 30 }, {
    __tostring = function(mytable)
        sum = 0
        for k, v in pairs(mytable) do
            sum = sum + v
        end
    return "表所有元素的和为 " .. sum
end
})
print(mytable)