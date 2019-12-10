-- 关于无返回值的方法的返回值问题
o={}
cls={}
function cls:func()
	setmetatable(o,{__index=self})
end
if o.func then
	print "True"
else
	print "False"
end
if o.func=="False" then
	print "==True"
end
if o.func==false then
	print "===True"
end
if o.func==nil then
	print "==nil"
end
print("***",o.func,"***")
