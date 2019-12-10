-- _G
-- 用于存放全局变量？
local n1=12
local n2=23
local cla={}
function fun()
    return 0
end

_G.n1=n1
_G.n2=n2
_G.cla=cla
_G.fun=fun
_G._ImportModule = _G._ImportModule or {}
local _ImportModule = _G._ImportModule
print(_G)