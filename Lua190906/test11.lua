-- debug.getinfo()相关
-- 注意！返回值非内存地址
local Sha={}
function Sha:hi()
    print("hi")
    return 0
end
print(debug.getinfo(1))
print(debug.getinfo(1))
print(debug.getinfo(2))
local path=debug.getinfo(2, 'Sl')
print(path)
local path1=debug.getinfo(2, 'Sl')
print(path1)
-- print(debug.getinfo(sha))