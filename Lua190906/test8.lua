-- table相关
-- 当我们获取 table 的长度的时候无论是使用 # 还是 table.getn 其都会在索引中断的地方停止计数
-- 而导致无法正确取得 table 的长度
-- Lua下标是从1开始
-- 在 Lua 中，尽可能地把 table 想象成一个实例，元表看成父类
local table1={}
table1[1]="Lua"
table1=nil  --移除引用，Lua垃圾回收会释放内存

print( "*****table(表)的构造*****" )

local table2={}
print("table1的类型是:",type(table2))

table2[1]="Lua"
table2["wow"]="修改前"
print("table2索引为1的元素是",table2[1])
print("table2索引为wow的元素是",table2["wow"])

local alternatetable=table2

print("alternatetable索引为1的元素是",alternatetable[1])
print("table2索引为wow的元素是",alternatetable["wow"])

alternatetable["wow"]="修改后"

print("table2索引为wow的元素是",table2["wow"])

alternatetable=nil

print("alternatetable是",alternatetable)

print("table2索引为wow元素是",table2["wow"])

table2=nil
print("table2是",table2)

print( "*****Table连接*****" )

local fru={"banana","orange","apple"}

-- 返回table连接后的字符串
print("连接后的字符串",table.concat(fru))

-- 指定连接字符
print("连接后的字符串",table.concat( fru, ", " ))

--指定索引来连接table
print("连接后的字符串",table.concat( fru, ", ", 2 , 3 ))

print( "**********Table插入与移除**********" )

local fruits={"banana","orange","apple"}

-- 在末尾插入
table.insert(fruits, "mango")
print("索引为4的元素为",fruits[4])

-- 在索引为2的键外插入
table.insert( fruits,2,"grapes" )
print("索引为2的元素为",fruits[2])

print("最后一个元素为",fruits[5])
table.remove( fruits )
print("移除最后一个元素为",fruits[5])

print( "*****Table排序*****" )
print("排序前")
for k,v in ipairs(fru) do
    print(k,v)
end
table.sort( fru )
for k,v in ipairs(fru) do
    print(k,v)
end
