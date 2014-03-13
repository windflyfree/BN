init("0",1)
r,g,b,c=0
repeat  
	mSleep(50) 
	r,g,b = getColorRGB(111,36)
	--dialog(r.." "..g.." "..b.." "..getDeviceID(),10)
	until r==11
	--dialog(r.." "..g.." "..b.." "..getDeviceID(),10)
	print("Hello World.")
	nx,ny=224,525     --第一个基准坐标X ,y
	aa={}
	nj=0
	for i=0,3,1 do 
		print("i is now " .. i  ) 
		x=i*230+nx
		y=ny
		print("x is now " .. x .."-" ..y) 
		aa[i+1]={}
		aa[i+1]["x"]=x
		aa[i+1]["y"]=y
		--dialog("x is now " .. x .."-" ..y,10) 
	end
	function cilck(x,y)
		touchDown(x,y)
		mSleep(50)
		touchUp(x,y)
	end
	--开始
	p=1
	while  p>0  do--死循环
		for i=1,4 do
			x=aa['x']
			y=aa['y']
			keepScreen(ture)
			r,g,b = getColorRGB(x,y)
			keepScreen(false)
			-- c=getColor(x,y)
			--  dialog(i..":"..r.." "..g.." "..b.." C:",10)-------
  
			if g~=b then
				--识别到有方块 开始按
				--   dialog("准备按下",10)
				cilck(x,y+10）
				mSleep(0)
			end              
			-- 
		end
	end