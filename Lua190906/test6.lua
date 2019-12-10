-- pairs与ipairs

-- 官方解释如下：
-- pairs(t)
-- 如果t有元方法__pairs，以t为参数调用它，并返回其返回的前三个值。
-- 否则，返回三个值：next函数，表t，以及nil。因此以下代码
--      for k,v in pairs(t) do body end
-- 能迭代表t中的所有键值对。
-- ipairs(t)
-- 返回三个值（迭代函数、表t以及0），如此，以下代码
--      for i,v in ipairs(t) do body end
-- 将迭代键值对（1,t[1])，(2,t[2])，...，直到第一个空值。

-- pairs(t)
-- value为nil时跳过并继续遍历
-- ipairs(t)
-- key必须以[1]开始且连续，遇nil或key不连续时终止遍历

-- 连续
local tab1={[1]="111",[2]="222",[3]="333",[4]="444"}
print("pairs(tab1):",pairs(tab1))
local tab2={["1"]="111",["2"]="222",["3"]="333",["4"]="444"}
local tab3={k1="111",k2="222",k3="333",k4="444"}
-- 断续
local tab4={[1]="111",[2]="222",[4]="444"}
local tab5={["1"]="111",["2"]="222",["4"]="444"}
local tab6={k1="111",k2="222",k4="444"}
-- nil
local tab7={[1]=nil,[2]="222",[3]="333",[4]="444"}
local tab8={[1]="333",[2]="222",[3]=nil,[4]="444"}
local tab9={["1"]=nil,["2"]="222",["3"]="333",["4"]="444"}
local tab10={["1"]="333",["2"]="222",["3"]=nil,["4"]="444"}
local tab11={k1=nil,k2="222",k3="333",k4="444"}
local tab12={k1="333",k2="222",k3=nil,k4="444"}
-- 混合
local tab13={[1]="111",["2"]="222",[3]="333",[4]="444"}
local tab14={[1]="111",k2="222",[3]="333",[4]="444"}

local tab15={["1"]="111",k2="222",["3"]="333",["4"]="444"}
local tab16={["1"]="111",[2]="222",["3"]="333",["4"]="444"}

local tab17={k1="111",[2]="222",k3="333",k4="444"}
local tab18={k1="111",["2"]="222",k3="333",k4="444"}
-- 乱续
local tab19={[3]="111",[1]="222",[4]="333",[2]="444"}
local tab20={["3"]="111",["1"]="222",["4"]="333",["2"]="444"}
local tab21={k3="111",k1="222",k4="333",k2="444"}
-- pairs
print("*****pairs(tab1)*****")
for k,v in pairs(tab1) do
    print(k,v)
end
print("*****pairs(tab2)*****")
for k,v in pairs(tab2) do
    print(k,v)
end
print("*****pairs(tab3)*****")
for k,v in pairs(tab3) do
    print(k,v)
end
print("*****pairs(tab4)*****")
for k,v in pairs(tab4) do
    print(k,v)
end
print("*****pairs(tab5)*****")
for k,v in pairs(tab5) do
    print(k,v)
end
print("*****pairs(tab6)*****")
for k,v in pairs(tab6) do
    print(k,v)
end
print("*****pairs(tab7)*****")
for k,v in pairs(tab7) do
    print(k,v)
end
print("*****pairs(tab8)*****")
for k,v in pairs(tab8) do
    print(k,v)
end
print("*****pairs(tab9)*****")
for k,v in pairs(tab9) do
    print(k,v)
end
print("*****pairs(tab10)*****")
for k,v in pairs(tab10) do
    print(k,v)
end
print("*****pairs(tab11)*****")
for k,v in pairs(tab11) do
    print(k,v)
end
print("*****pairs(tab12)*****")
for k,v in pairs(tab12) do
    print(k,v)
end
print("*****pairs(tab13)*****")
for k,v in pairs(tab13) do
    print(k,v)
end
print("*****pairs(tab14)*****")
for k,v in pairs(tab14) do
    print(k,v)
end
print("*****pairs(tab15)*****")
for k,v in pairs(tab15) do
    print(k,v)
end
print("*****pairs(tab16)*****")
for k,v in pairs(tab16) do
    print(k,v)
end
print("*****pairs(tab17)*****")
for k,v in pairs(tab17) do
    print(k,v)
end
print("*****pairs(tab18)*****")
for k,v in pairs(tab18) do
    print(k,v)
end
print("*****pairs(tab19)*****")
for k,v in pairs(tab16) do
    print(k,v)
end
print("*****pairs(tab20)*****")
for k,v in pairs(tab17) do
    print(k,v)
end
print("*****pairs(tab21)*****")
for k,v in pairs(tab18) do
    print(k,v)
end
-- ipairs
print("*****ipairs(tab1)*****")
for k,v in ipairs(tab1) do
    print(k,v)
end
print("*****ipairs(tab2)*****")
for k,v in ipairs(tab2) do
    print(k,v)
end
print("*****ipairs(tab3)*****")
for k,v in ipairs(tab3) do
    print(k,v)
end
print("*****ipairs(tab4)*****")
for k,v in ipairs(tab4) do
    print(k,v)
end
print("*****ipairs(tab5)*****")
for k,v in ipairs(tab5) do
    print(k,v)
end
print("*****ipairs(tab6)*****")
for k,v in ipairs(tab6) do
    print(k,v)
end
print("*****ipairs(tab7)*****")
for k,v in ipairs(tab7) do
    print(k,v)
end
print("*****ipairs(tab8)*****")
for k,v in ipairs(tab8) do
    print(k,v)
end
print("*****ipairs(tab9)*****")
for k,v in ipairs(tab9) do
    print(k,v)
end
print("*****ipairs(tab10)*****")
for k,v in ipairs(tab10) do
    print(k,v)
end
print("*****ipairs(tab11)*****")
for k,v in ipairs(tab11) do
    print(k,v)
end
print("*****ipairs(tab12)*****")
for k,v in ipairs(tab12) do
    print(k,v)
end
print("*****ipairs(tab13)*****")
for k,v in ipairs(tab13) do
    print(k,v)
end
print("*****ipairs(tab14)*****")
for k,v in ipairs(tab14) do
    print(k,v)
end
print("*****ipairs(tab15)*****")
for k,v in ipairs(tab15) do
    print(k,v)
end
print("*****ipairs(tab16)*****")
for k,v in ipairs(tab16) do
    print(k,v)
end
print("*****ipairs(tab17)*****")
for k,v in ipairs(tab17) do
    print(k,v)
end
print("*****ipairs(tab18)*****")
for k,v in ipairs(tab18) do
    print(k,v)
end
print("*****ipairs(tab19)*****")
for k,v in ipairs(tab16) do
    print(k,v)
end
print("*****ipairs(tab20)*****")
for k,v in ipairs(tab17) do
    print(k,v)
end
print("*****ipairs(tab21)*****")
for k,v in ipairs(tab18) do
    print(k,v)
end