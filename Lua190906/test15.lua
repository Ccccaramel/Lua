-- string(原格式输出+format())
-- 单引号、双引号、[[]]
-- [[]]:原格式输出
local html=[[
    <html>
    <head><head>
    <body>
        <a href="http://www.php.cn">this is php!</a>
    <body>
]]
print(html)

s1="this is a string!"
print("s1:",string.format(s1))