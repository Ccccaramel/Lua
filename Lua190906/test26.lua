-- 数组
array={}
local array1={"Lua","tutorial"}
for i=0,2 do
    print(array1[i])
end
print("*****以负数为索引值*****")
for i=-2,2 do
    array1[i]=i
end
for i=-2,2 do
    print(array1[i])
end
print("*****多维数组*****")
local array2={}
for i=1,3 do
    array2[i]={}
    for j=1,3 do
        array2[i][j]=i*j
    end
end
for i=1,3 do
    local s=""
    for j=1,3 do
        s=s.."   "..array2[i][j]
    end
    print(s)
end