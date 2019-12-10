-- 面向对象与继承

-- Meta class
Shape = {area = 0}  --<1>--类似于创建一个" 基类 "，并包含一个属性，且有初始值
-- 基础类方法 new
function Shape:new (o,side)  --" 基类 "的一个方法
  o = o or {}  --肯定不是一个字典那么简单的了，往下看就会明白它其实是一个" 基类 "的" 子类 ""
--   setmetatable(o, self)  --这个 self 指的就是" 基类 "，把" 基类 "设置为 o 的"元表"，目的是把" 基类 "设为 o 的" 父类 "，即令 o 继承" 基类 "(还没结束，需要下一步)
--   self.__index = self  --仅仅设为"元表"是无法成为 o 的" 基类 "的，当访问 o 所没有的属性或方法时得去寻找" 基类 "中是否包含，故必须使用 __index 元方法
setmetatable(o, {__index = self})  --第 8、9 行等价于此行，拆分阅读易于理解
side = side or 0  --边长
  self.area = side*side;  --为" 基类 "创建一个属性，并将面积的值存入其中
  return o  --返回" 子类 "，在lua中似乎没有" 类 "与" 实例 "之分，不调用的时候是" 类 ",调用的时候是" 实例 "
end
-- 基础类方法 printArea
function Shape:printArea ()  --为" 基类 "添加方法，同时也添加到了" 子类 "
  print("面积为 ",self.area)
end

-- 创建对象
myshape = Shape:new(nil,10)  --<2>--创建了一个" 子类 "的" 实例 "
myshape:printArea()  --调用一个方法,输出结果

Square = Shape:new()  --<2`>--又创建了一个" 子类 "的" 实例 "(以下简称" 实2 ")。阅读第 6、9 行，无参则使用默认参数
-- 派生类方法 new
function Square:new (o,side)  --为" 实2 "添加新的方法，此方法仅对" 实2 "有效，" 实2 "。似乎又变成了" 类 "，只能" 实例化 "它获取返回值
  o = o or Shape:new(o,side)  --通过" 基类 "又创建了一个" 子类 ",具体功能见第 5 行
--   setmetatable(o, self)  --见第 7 行注释
--   self.__index = self  --见第 8 行注释
setmetatable(o, {__index = self})  --第 28、29 行等价于此行
  return o  --到此已是" 基类 "的" 子类 "的" 子类 "(以下简称" 子2 ")了，另外，通过此类创建的" 实例 "将会" 覆盖 "" 基类 "的 new() 方法
end

-- 派生类方法 printArea
function Square:printArea ()  --" 子2 "创建了一个与" 基类 "同名的方法
  print("正方形面积为 ",self.area)
end

-- 创建对象
mysquare = Square:new(nil,10)  --<3>--这是一个由" 子2 "创建的实例
mysquare:printArea()  --由第 32 行可知，这里并不是调用" 基类 "的而是调用" 子2 "的

Rectangle = Shape:new()  --<2``>--又创建了一个" 子类 "的" 实例 "，其实依旧是" 类 "
-- 派生类方法 new
function Rectangle:new (o,length,breadth)  --是的，又把" 基类 "的方法" 覆盖 "了，该方法的功能由计算正方形面积变成了计算矩形面积
  o = o or Shape:new(o)
--   setmetatable(o, self)
--   self.__index = self
  setmetatable(o, {__index = self}) --第 48、49 行等价于此行

  self.area = length * breadth  --重新定义了 self.area 的计算方式
  return o
end

-- 派生类方法 printArea
function Rectangle:printArea ()  --没错，打印的方法也覆盖了，说明文字改成了"矩形"
  print("矩形面积为 ",self.area)
end

-- 创建对象
myrectangle = Rectangle:new(nil,10,20)  --第一个参数居然传进一个 nil ???，或许只是为了初始化" 基类 "，毕竟本质元表，元表得有点东西才行，否则无意义
myrectangle:printArea()  --end