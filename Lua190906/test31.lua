-- 调试(Debug)
-- lua提供了debug库用于提供创建我们自定义调试器的功能.
-- lua本身并未有内置的调试器,但很多开发者共享了他们的lua调试器代码
-- debug()                                      进入一个用户交互模式,运行用户输入的每一个字符串.
--                                              使用简单的命令以及其它调试设置,用户可以检阅全局变量和局部变量,
--                                              改变变量的值,计算一些表达式,等等.
--                                              输入一行仅包含cont的字符串将结束这个函数,这样调用者就可以继续向下运行
-- getfenv(object)                              返回对象的环境变量
-- gethook(optional thread)                     返回三个表示线程钩子设置的值:当前钩子函数,当前钩子掩码,当前钩子计数
-- getinfo([thread,]f[,local])                  返回关于一个函数信息的表.你可以直接提供该函数,也可以用一个数字f表示该函数.
--                                              数字f表示运行在指定线程的调用栈对应层次上的函数:0层表示当前函数(getinfo自身);
--                                              1层表示调用getinfo的函数(除非是尾调用,这种情况不计入栈).
--                                              如果f是一个比活动函数数量还大的数字,getinfo返回nil
-- debug.getlocal([thread,]f,local)             此函数返回在栈的f层处函数的索引为local的局部变量的名字和值.
--                                              这个函数不仅用于访问显式定义的局部变量,也包括形参,临时变量等
-- getmetatable(value)                          把给定索引指向的值的元表压入堆栈.
--                                              如果索引无效,或是这个值没有元表,函数将返回0并且不会向栈上压任何东西
-- getregistry()                                返回注册表.这是一个预定义出来的表,可以用来保存任何C代码想保存的lua值
-- getupvalue(f,up)                             此函数返回函数f的第up个上值的名字和值.如果该函数没有那个上值,返回nil.
--                                              以'('(开括号)打头的变量名表示没有名字的变量(取去除了调试信息的代码块)
-- sethook([thread,]hook,mask[,count])          将一个函数作为钩子函数设入.字符串mask以及数字count决定了钩子将在何时调用.
--                                              掩码是由下列字符组合成的字符串,每个字符有其含义:
--                                              'c':每当lua调用一个函数时,调用钩子
--                                              'r':每当lua从一个函数内返回时,调用钩子
--                                              'l':每当lua进入新的一行时,调用钩子
-- setlocal([thread,]level,local,value)         这个函数将value赋给栈上第level层函数的第local个局部变量.
--                                              如果没有那个变量,函数返回nil.如果level越界,抛出一个错误
-- setmetatable(value,table)                    将value的元表设为table(可以是nil).返回value
-- setupvalue(f,up,value)                       这个函数将value设为函数f的第up个上值.如果函数没有那个上值,返回nil否则返回该上值的名字
-- traceback([thread,][message[,level]])        如果message有,且不是字符串或nil,函数不做任何处理直接返回message.否则它返回调用栈的栈回溯信息.
--                                              字符串可选项message被添加在栈回溯信息的开头.
--                                              数字可选项level指明从栈的哪一层开始回溯(默认为1,即调用traceback的那里)
print("*****实例1*****")
function myfunction()
    print("(in)traceback",debug.traceback( "Stack trace"))
    print("(in)getinfo:",debug.getinfo( 1 ))
    print("Stack trace end")
    return 10
end
myfunction()
print("(out)getinfo:",debug.getinfo( 1 ))
--与样例结果不一样,why?
print("*****实例2*****")
function newCounter()
    local n=0
    local k=0
    return function ()
        k=n
        n=n+1
        return n
    end
end

counter=newCounter()
print(counter())
print(counter())

local i=1

repeat  --这是啥?见test22.lua
    name,val=debug.getupvalue( counter, i )
    if name then
        print("index",i,name,"=",val)
        if(name=="n") then
            debug.setupvalue( counter,2,10 )
        end
        i=i+1
    end
until not name

print(counter())