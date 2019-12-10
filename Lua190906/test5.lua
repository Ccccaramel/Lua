-- nil的"删除"作用
tab={key1="val2",key2="val2",key3="val3"}
for k,v in pairs(tab) do
    print(k.."-"..v)
end
print("******************")
tab.key1=nil
for k,v in pairs(tab) do  --注意：无序输出？详见pairs与ipairs
    print(k.."-"..v)
end