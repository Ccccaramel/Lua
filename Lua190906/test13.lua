-- 关于boolean类型
-- boolean类型只有两个可选值：true(真)和false(假)，false与nil为"假"，其他均为"真"
if false or nil then
    print("At least one of them is true")
else
    print("false and nil all for false!")
end