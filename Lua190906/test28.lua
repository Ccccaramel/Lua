-- 关于模块与包的构建详见test28_module.lua

-- 加载机制
-- 对于自定义的模块，模块文件不可以随便放置，函数require有自己的文件路径加载策略，他会尝试从Lua文件或C程序库中加载模块。
-- require用于搜索Lua文件的路径是存放在全局变量package.path中，当Lua启动后，会以环境变量LUA_PATH的值来初始这个环境变量。
-- 如果没有找到该环境变量，则使用一个编译时定义的默认路径来初始化
-- 如果没有LUA_PATH这个环境变量，也可以自定义设置，在当前用户根目录下打开.profile文件(没有则创建，打开。bashrc文件亦可)，
-- 例如把"~/lua/"路径加入LUA_PATH环境变量里：
-- #LUA_PATH
-- export LUA_PATH=";~/lua/?.lua;;"   最后2个";;"表示新加的路径后面加上原来的默认路径
-- 接着，更新环境变量参数，使之立即生效
-- source ~/.profile
-- 余下部分略

-- C包
-- Lua和C是很容易结合的，使用C为Lua写包
-- 与Lua中写包不同，C包在使用以前必须首先加载并连接，在大多数系统中最容易的实现方式是通过动态连接库机制。
-- Lua在一个叫loadlib的函数内提供了所有的动态连接的功能，这个函数有两个参数：库的绝对路径和初始化函数，
-- 所以典型的调用的例子如下：
-- local path="/usr/local/lua/lib/libluasocket.so"
-- local f=loadlib(path,"luaopen_socket")
-- loadlib函数加载指定的库并且连接到Lua，然而它并不打开库（没调用初始化函数），
-- 反之它返回初始化函数作为Lua的一个函数，这样我们就可以直接在Lua中调用它。
-- 如果加载动态库或者查找初始化函数时报错，loadlib将返回nil和错误信息。
-- 我们可以修改前面一段代码，使其检测错误然后调用初始化函数：
-- loacl path="/usr/local/lib/libluasocket.so"
--    或者 path="C:\\windows\\luasocket.dll" 这是 Window 平台下
-- local f=assert(loadlib(path,"luaopen_socket"))
-- f()   --真正打开库
-- 一般情况下我们期望二进制的发布库包含一个与前面代码段类似的stub文件，安装二进制库的时候可以随便放在某个目录，
-- 只需要修改stub文件对应二进制库的实际路径即可。
-- 将stub文件所在的目录加入到LUA_PATH，这样设定后就可以使用require函数加载C库了


package.path=package.path..";/LuaData/Lua190906/?.lua"  --让lua包含我们的个人路径
require("test28_module")  --require会返回一个由模块常量或函数组成的table，并且还定义一个包含该table的全局变量
local m=require("test28_module")  --给加载的模块定义一个别名变量，方便调用
print(module.constant)
module.fun3()