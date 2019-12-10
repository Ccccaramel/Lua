-- 协同程序
-- Lua协同程序与线程类似：拥有独立的堆栈，独立的局部变量，独立的指令指针，
-- 同时又与其它协同程序共享全局变量和其它大部分东西。
-- 协同是非常强大的功能，但用起来也很复杂。

-- 线程与协程程序的区别
-- 线程与协同程序的主要区别在于，一个具有多个线程的程序可以同时可以运行几个线程，而协同程序去需要彼此协作的运行。
-- 在任意指定时刻只有一个协同程序在运行，并且这个正在运行的协同程序只有在明确的被要求挂起的时候才会被挂起
-- 协同程序有点类似同步的多线程，在等待同一个线程锁的几个线程有点类似协同。

-- coroutine.create(function):创建coroutine，返回coroutine，参数是一个函数，当和resume配合使用时就唤醒函数调用
-- coroutine.resume(thread[,value1,value2,...]):重启coroutine,和create配合使用
-- coroutine.yield():挂起coroutine,将coroutine设置为挂起状态，这个和resume配合使用能有很多有用的效果
-- coroutine.status(thread):查看coroutine的状态（状态有三种：dead,duspended,running）
-- coroutine.wrap():创建coroutine，返回一个函数，一旦调用这个函数，就进入coroutine,和create功能重复
-- coroutine.running():返回正在跑的coroutine，一个coroutine就是一个线程，当使用running时就返回一个coroutine的线程号

-- coroutine的三种状态：
-- <1>:suspended        挂起，协同刚创建完成时或者yield之后
-- <2>:running          运行
-- <3>:dead             函数走完后的状态，这时候不能再重新resume

print("*****create*****")
co=coroutine.create(  --创建
    function(i)
        print(i)
    end
)

print(coroutine.status( co ))  --查看状态
coroutine.resume( co,1)  --唤醒/重启
print(coroutine.status( co ))  --查看状态

print("*****wrap*****")

co=coroutine.wrap(  --创建
    function(i)
        print(i)
    end
)

co(1)

print("*****yield*****")

co2=coroutine.create(  --创建
    function()
        for i=1,10 do
            print("data:",i)
            if i==3 then
                print("(内)状态:",coroutine.status(co2))  --查看状态
                print("(内)线程号:",coroutine.running())  --返回线程号
            end
            coroutine.yield()  --挂起
        end
    end
)
print("one")
coroutine.resume( co2 )  --唤醒/重启
print("two")
coroutine.resume( co2 )  --唤醒/重启
print("three")
coroutine.resume( co2 )  --唤醒/重启
print("four")

print("(外)状态:",coroutine.status( co2 ))  --查看状态
print("(外)线程号:",coroutine.running())  --返回线程号

-- 与菜鸟教程的结果有出入，或许与lua版本有关
print("**********")
print("----------")
function foo(a)
    print("foo 函数输出:",a)
    return coroutine.yield( 2*a )  --每当非首次重启时传入的参数都将作为上一次挂起的返回值   参数（或多个参数）==返回值
end

co=coroutine.create( function (a,b)
    print("第一次协同程序执行输出:",a,b)
    local r=foo(a+1)

    print("第二次协同程序执行输出:",r)
    local r,s=coroutine.yield( a+b,a-b )

    print("第三次协同程序执行输出:",r,s)
    return b,"结束协同程序"
end)

print("main:",coroutine.resume( co,1,10))  --第一次唤醒：将两个参数依次赋值给a、b。返回值：true(唤醒成功)/false(唤醒失败)+yield()内的参数
print("---divide---")
print("main:",coroutine.resume( co,"r1" ))  --第一次重启：将字符 "r" 以参数形式传入
print("---divide---")
print("main:",coroutine.resume( co,"x","y" ))  --第二次重启
print("---divide---")
print("main:",coroutine.resume( co,"x","y" ))  --第三次重启：
print("---divide---")

print("*****生产者-消费者问题*****")
local newProductor
function productor()
    local i=0
    while i<=100 do
        i=i+1
        send(i)
    end
end

function consumer()
    while true do
        local i=receive()
        print(i)
        if i==100 then
            break
        end
    end
end

function receive()
    local status,value=coroutine.resume( newProductor )
    return value
end

function send(x)
    coroutine.yield( x )
end

-- 启动程序
newProductor=coroutine.create( productor )
consumer()
