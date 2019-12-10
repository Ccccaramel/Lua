-- 迭代器
-- 迭代器是一种对象，它能遍历标准模板库容器中的部分或全部元素，每个迭代器对象代表容器中的确定的地址。
-- 在Lua中迭代器是一种支持指针类型的结构，它可以遍历集合的每一个元素

-- 泛型for在自己内部保存迭代函数，实际上它保存三个值：迭代函数、状态常量、控制变量（重点:泛型for它保存了三个值！！！）
-- 泛型for迭代器提供了集合的key/value对
-- 泛型for的执行过程略

-- Lua迭代器分为两种类型
-- 无状态的迭代器
-- 多状态的迭代器
print("*****无状态迭代器*****")
-- 无状态的迭代器是指不保留任何状态的迭代器，因此在循环中我们可以利用无状态迭代器避免创建闭包花费额外的代价。
-- 每一次迭代，迭代函数都是用两个变量（状态常量和控制变量）的值作为参数被调用，
-- 一个无状态的迭代器只利用这两个值可以获取下一个元素。
-- 例如ipairs
function square(iteratorMaxCount,currentNumber)
    print(iteratorMaxCount.."*"..currentNumber)
    if currentNumber<iteratorMaxCount then
        currentNumber=currentNumber+1
    return currentNumber,currentNumber*currentNumber
    end
end
for i,n in square,3,0 do
    print(i,n)
end
-- currentNumber自增，明白为什么吗？
print("*****多状态迭代器*****")
-- 多数情况下，迭代器需要保存多个状态信息而不仅只是简单的状态常量和控制变量，最简单的方法是闭包，
-- 或是将所有的状态信息封装到table内，将table作为迭代器的状态常量，
-- 因此这种情况下可以将所有的信息存放在table内，所以迭代函数通常不需要第二个参数
local array={"Google","PHP"}
function elementIterator(collection)
    print("1",collection)
    local index=0
    local count=#collection
    print("2",count)
    return function()
        print("3",index)
        index = index+1
        print("4",index)
        if index<=count then
            return collection[index]
        end
    end
end
for element in elementIterator(array) do  --返回的是一个闭包，故迭代函数的主体只执行一次，
    print(element)
end
-- 闭包与匿名函数的区别，你知道吗？
