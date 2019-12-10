-- 文件I/O
-- I/O库用于读取和处理文件。分为简单模式、完全模式。
-- <1>简单模式：拥有一个当前输入文件和一个当前输出文件，并且提供针对这些文件相关的操作
-- <2>完全模式：使用外部的文件句柄来实现。它以一种面对对象的形式，将所有的文件操作定义为文件句柄的方法

-- 简单模式在做一些简单的文件操作时较为合适。
-- 但是在进行一些高级的文件操作的时候，简单模式就显得力不从心。
-- 例如同时读取多个文件这样的操作，使用完全模式则较为合适
-- 打开文件操作语句如下：
-- file=io.open(filename[,mode])
-- r      以只读方式打开文件，该文件必须存在
-- w      打开只写文件，若文件存在则文件长度清为0，即该文件内容会消失。若文件不存在则建立该文件
-- a      以附加的形式打开只写文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾，即文件原先的内容会被保存。(EOF符保留)
-- r+     以可读写方式打开文件，该文件必须存在
-- w+     打开可读写文件，若文件存在则文件长度清为零，即该文件内容会消失。若文件不存在则建立该文件
-- a+     与a类似，但此文件可读可写
-- b      二进制模式，如果文件是二进制文件，可以加上b
-- +      表示对文件既可以读也可以写

-- 简单模式
-- 注意操作的文件在根目录的位置！
print("*****简单模式*****")
local file=io.open("Lua190906/test.txt","r")  --以只读的方式打开文件

io.input(file)  --设置默认输入文件为test.txt

print(io.read())  --输出文件第一行

io.close(file)  --关闭打开的文件

file=io.open("Lua190906/test.txt","a")  --以附加的方式打开只写文件

io.output(file)  --设置默认输出文件为test.txt

io.write("此行是通过test30.lua的简单模式添加的\n")  --在文件最后一行添加文本

io.close(file)  --关闭打开的文件

-- 关于io.read()的参数：
-- "*n"            读取一个数字并返回它。file.read("*n")
-- "*a"            从当前位置读取整个文件。file.read("*a")
-- "*|"            读取下一行，在文件尾(EOF)处返回nil。file.read("*|")
-- <number>        返回一个指定字符个数的字符串，或在EOF时返回nil。file.read(5)

-- 其他的io方法有：
-- io.tmpfile():返回一个临时文件句柄，该文件以更新模式打开，程序结束时自动删除
-- io.type(file):检测obj是否一个可用的文件句柄
-- io.flush():向文件写入缓冲中的所有数据
-- io.lines(optional file name):返回一个迭代函数，每次调用将获得文件中的一行内容，当到文件尾时，将返回nil，但不关闭文件

-- 完全模式
-- 通常我们需要在同一时间处理多个文件。
-- 我们需要使用file:function_name来代替io.function_name方法。
print("*****完全模式*****")
local file1=io.open("Lua190906/test.txt","r")  --以只读方式打开文件

print(file1:read())  --输出文件第一行

file1:close()  --关闭打开的文件

file1=io.open("Lua190906/test.txt","a")  --以附加的方式打开只写文件

file1:write("此行是通过test30.lua的完全模式添加的\n")  --在文件最后一行添加文本

file1:close()  --关闭打开的文件

-- read的参数与简单模式一致

-- 其他方法：
-- file:seek(optional whence,optional offset):设置和获取当前文件位置，成功则返回最终的文件位置(按字节)，失败则返回nil加错误信息
--    参数whence值可以是：
--       "set":从文件头开始
--       "cur":从当前位置开始【默认】
--       "end":从文件尾开始
--       offset:默认为0
--    不带参数file:seek()则返回当前位置，file:seek("set")则定位到文件头，file:seek("end")则定位到文件尾并返回文件大小
-- file:flush():向文件写入缓冲中的所有数据
-- io.lines(optional file name):打开指定的文件filename为读模式并返回一个迭代函数，每次调用将获得文件中的一行内容，
--    当到文件尾时，将返回nil，并自动关闭文件
--    若不带参数时io.lines()<=>io.input():lines();读取默认输入设备的内容，但结束时不关闭文件，如·
--       for line in io.lines("main.lua") do
--          print(line)
--       end
print("*****使用seek方法*****")  --啥意思？
local file2=io.open("Lua190906/test.txt","r")

file2:seek("end",-25)
print(file2:read("*a"))

-- 关闭打开的文件
file2:close()
