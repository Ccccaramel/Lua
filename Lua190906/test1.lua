-- 错误处理
-- <1>语法错误
-- <2>运行错误
-- 注:下列实例需分开逐一运行
print("*****assert*****")

local function add(a,b)
-- 	assert(type(a)=="number","a不是一个数字")
	assert(type(b)=="number","b不是一个数字")
	return a+b
end
add(10)  --如何理解？(详见test20.lua),由于此特性lua不支持重载，当然，你可以自己写一个模板或者使用特殊的技巧
-- assert(1==3)
print("*****error函数*****")
-- error(message[,level])
-- 终止正在执行的函数，并返回message的内容作为错误信息
-- 通常情况下，error会附加一些错误位置的信息到message头部
-- level参数指示获得错误的位置：
-- level=1(默认):为调用error位置(文件+行号)
-- level=2:指出哪个调用error的函数的函数
-- level=3:不添加错误位置信息

-- print "123"
-- if 60>=20 then
-- 	error("too long Depth to replace")
-- 	return
-- end

print("*****pcall*****")
-- 处理错误可以使用函数pcall(protected call)来包装需要执行的代码
-- pcall接收一个函数和要传递给后者的参数,并执行,执行结果:有错误或无错误,返回值true或`false,errorinfo
-- 语法格式如下
-- if pcall(function_name,...) then
--    没有错误
-- else
--    一些错误
-- end

-- pcall(function(i) print(i) end,33)
-- pcall(function(i) print(i) error('error..') end ,33)

-- pcall以一种"保护模式"来调用第一个参数,因此pcall可以捕获函数执行中的任何错误
-- 通常在错误发生时,希望落得更多的调试信息,而不只是发生错误的位置.
-- 但pcall返回时,它已经销毁了调用栈的部分内容.
-- lua提供了xpcall函数,xpcall接受第二个参数---一个错误处理函数,当错误发生时,lua会在调用栈展开(unwind)前调用错误处理函数
-- 于是就可以在这个函数中使用debug库来获取关于错误的额外信息了
-- debug库提供了两个通用的错误处理函数:
-- debug debug:提供一个Lua提示符,让用户来检查错误的原因
-- debug traceback:根据调用栈来构建一个扩展的错误消息
print("*****xpcall*****")

-- function myfunction()
-- 	local n=n/nil
-- end

-- function myerrorhandler(err)
-- 	print("ERROR:",err)
-- end

-- local status=xpcall(myfunction,myerrorhandler)
-- print(status)