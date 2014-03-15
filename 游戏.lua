_m={}
_m['游戏主界面']=function()
	while true do
		if _m['函数.界面匹配'](Hero['主界面特征']) then
			Hero['点击'](Hero['开始游戏'])
			mSleep(1500)
			_m['注册账号界面']()
		else
			_m['等待检测'](1000)
		end
	end
end

solo = {}
solo['主界面'] = function()
end
solo['主界面特征'] = {{1024,272,0x292c21},{1029,251,0xffebb5},{203,323,0xefefef}}