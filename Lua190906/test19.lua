-- Lua 变量 + local
-- Lua 变量：全局变量、局部变量、表中的域
-- 未赋值的变量的默认值为 nil
-- 尽可能使用局部变量：
--    1.避免命名冲突
--    2.访问局部变量的速度比全局变量更快(原因:local变量是存放在 lua 的堆栈里面的 array 操作，而全局变量是存放在 _G 中的 table 中，效率不及堆栈)
-- local 变量过多会有堆栈溢出问题，一个模块最多拥有200个 local 变量
-- 模块级 local 变量暂无限制，但也需要考虑热更新问题
glob=1                  --全局变量
local num2=2            --局部变量

function test()
    num3=3              --全局变量
    local num4=4        --局部变量
end

test()
print(num3,num4)

do
    local glob=11       --局部变量
    num2=22             --对全局变量重新赋值
    print(glob,num2)
end

print(glob,num2)