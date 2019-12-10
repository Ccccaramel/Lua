-- 全局环境(变量类型+内存地址)
local env = getfenv()   --返回全局环境（默认参数为1），详情百度
for k,v in pairs(env) do
    _G[k] = v
    print(v)
end