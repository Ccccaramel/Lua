-- Lua数据类型
-- Lua是动态类型语言，变量不要类型定义，只需要为变量赋值。
-- Lua中有8个基本类型：
-- nil           只有nil属于该类，表示一个无效值
-- boolean       (略)
-- number        双精度类型的实浮点数
-- string        (略)
-- function      (略)
-- userdata      表示任意存储在变量中的C数据结构
-- thread        (略)
-- table         lua中的表(table)其实是一个"关联数组"(associative arrays)，数组的索引可以是数字、字符串或表类型。
--               在Lua里，table的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表