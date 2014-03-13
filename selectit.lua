function IO_ID()--识别分辨率，判断设备类型
	IO_IDx,IO_IDy=getScreenSize() --横屏状态(长,宽)
	mSleep(3000)
	dialog("自动识别设备分辨率为: \n "..IO_IDx.."×"..IO_IDy,1)
	if IO_IDx==640 and IO_IDy==960 then--iPhone4 iPhone4s
		dialog("识别到您的设备为: \n iPhone4 iPhone4s",3)
		IO_ID=1 --iPhone4、iPhone4s
		dialog("暂不支持该设备,脚本停止! \n 请联系QQ:22515528",9)
		mSleep(1000)
		lua_exit()
	elseif IO_IDx==640 and IO_IDy==1136 then--iPhone5 iPhone5s touch5
		dialog("识别到您的设备为: \n iPhone5 iPhone5s touch5",3)
		IO_ID=2 --iPhone5、iPhone5s
		dialog("暂不支持该设备,脚本停止! \n 请联系QQ:22515528",9)
		mSleep(1000)
		lua_exit()
	elseif IO_IDx==768 and IO_IDy==1024 then--iPad1 iPad2 iPad_Mini1
		dialog("识别到您的设备为: \n iPad1 iPad2 iPad_Mini1",3)
		IO_ID=3 --iPad1、iPad2、iPad Mini1
		dialog("暂不支持该设备,脚本停止! \n 请联系QQ:22515528",9)
		mSleep(1000)
		lua_exit()
	elseif IO_IDx==1536 and IO_IDy==2048 then--iPad3 iPad4 iPad_air iPad_Mini2
		dialog("识别到您的设备为: \n iPad3 iPad4 iPad_air iPad_Mini2",3)
		IO_ID=4 --iPad3、iPad4、iPad Mini2
		IO_Location()
	else
		dialog("未找到相应设备,脚本停止! \n 请联系QQ:22515528",9)
		mSleep(1000)
		lua_exit()
	end
end

function IO_Location()
	if IO_ID==4 then

		ehl={
			{{x=474,y=1291},{x=580,y=1077},{x=687,y=862},{x=794,y=650},{x=900,y=437}},
			{{x=368,y=1077},{x=474,y=862},{x=580,y=650},{x=687,y=437},{x=794,y=224}},
			{{x=368,y=1077},{x=368,y=650},{x=474,y=437},{x=580,y=224},{x=794,y=224}},
		}

		hl={
			{{x=635,y=1610},{x=740,y=1400},{x=840,y=1190},{x=950,y=965},{x=1060,y=770}},
			{{x=740,y=1830},{x=840,y=1610},{x=950,y=1400},{x=1060,y=1190},{x=1170,y=970}},
			{{x=950,y=1830},{x=950,y=1830},{x=1060,y=1610},{x=1170,y=1400},{x=1170,y=1400}},
		}

		unit_x=1475
		unit_y={2015,1860,1730,1600,1470,1340,1210,1080,950,820,690,560,430,300,170,40} 

		unitselect_y=1975
		unitselect_x={all=1375,aircraft=1335,ignorable=1295,infect=1255,critters=1215,vehicles=1175,soldiers=1135}

		Skill_x=1480
		LBoary={1580,1350,1120,940}

		LMammothy={1580,1450,1230,1000}

		map_x={lefttop=512,leftbottom=1024,center=768,righttop=512,rightbottom=1024}
		map_y={lefttop=1360,leftbottom=1360,center=1024,righttop=680,rightbottom=680}

		abort_x,abort_y,abort_color=303,1867,14708992 
		victory_x,victory_y,victory_color=980,821,16315892

		x_x,x_y,occ_x,occ_y,battle_x,battle_y=1420,400,895,1005,820,975

		begin_x,begin_y=760,1910
		ok1_x,ok1_y,ok2_x,ok2_y=965,800,1015,780

		pull_x,pull_y=210,1985
		home2map_x,home2map_y,big2home_x,big2home_y=1410,65,1450,250
		map2big_x,map2big_y=150,800
		map2wild_x,map2wild_y=1260,780
		map2raptor_x,map2raptor_y=900,1490

		smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2=171,1881,1204,2047
		begin_grey_x1,begin_grey_y1,begin_grey_x2,begin_grey_y2=648,1802,905,2047
		redx_x1,redx_y1,redx_x2,redx_y2=293,25,374,95

		in_v_x1,in_v_y1,in_v_x2,in_v_y2=100,10,300,200
		atall_x1,atall_y1,atall_x2,atall_y2=100,150,1350,1900

	end
end

function click(x,y,timeDown,timeUp)
	if timeDown==nil or timeUp==nil then
		timeDown,timeUp=50,100
	end 	
	touchDown(x,y)
	mSleep(timeDown)
	touchUp(x,y)
	mSleep(timeUp)
end

function dragDrop(x1,y1,x2,y2,b)
	if b==nil then
		b=10
	end
	mSleep(80)
	touchDown(x1,y1)
	mSleep(70)
	i=(x2-x1)/b
	j=(y2-y1)/b
	for step=1,b do
		touchMove(x1+i*step,y1+j*step)
		mSleep(15)
	end	
	touchMove(x2-1,y2-1)
	mSleep(15)
	touchMove(x2,y2)
	mSleep(150)
	touchUp(x2,y2)
end

function waitForImage( imgFile,d,x1,y1,x2,y2,color,waitfor )

	local xx=-1
	local yy=-1
 
	for i=1,waitfor do
		mSleep(1000)
		xx,yy=findImageInRegionFuzzy(imgFile,d,x1,y1,x2,y2,color)
		if (xx~=-1 and yy~=-1) then
			mSleep(100)
			return xx,yy
		end
		
	end
end

function waitForColor( x,y,color,waitfor )
	for i=1,waitfor*4 do
		mSleep(250)
		xx=getColor(x,y)
		if	xx==color	then
			return 
		end		
	end
end

function waitForTwoColor(x1,y1,color1,x2,y2,color2,waitfor )
	for i=1,waitfor*4 do
		mSleep(250)
		xx1=getColor(x1,y1)
		xx2=getColor(x2,y2)			
		if xx1==color1  or xx2==color2 then
			return xx1,xx2
		end
	end
end

function waitForTwoImages( img1,d1,x1,y1,x2,y2,color1,img2,d2,x3,y3,x4,y4,color2,waitfor )
	local xx1=-1
	local yy1=-1
	local xx2=-1
	local yy2=-1
 
	for i=1,waitfor*4 do
		mSleep(250)
		xx1,yy1=findImageInRegionFuzzy(img1,d1,x1,y1,x2,y2,color1)
		xx2,yy2=findImageInRegionFuzzy(img2,d2,x3,y3,x4,y4,color2)
		
		if (xx1~=-1 and yy1~=-1) or (xx2~=-1 and yy2~=-1) then
			return xx1,yy1,xx2,yy2
		end
		
	end
end

function beatit()
	click(5,5,30,50)
	mSleep(30)
	for hi=1,2 do
		for i=1,5 do
			click(ehl[hi][i].x,ehl[hi][i].y,30,50)
		end
	end
	click(5,5,30,50)
end

function mapZoomOut()
	
	mSleep(1000)
	touchDown(4,1000,500)
	mSleep(100)
	touchDown(2,500,1500)
	mSleep(100)		
	touchMove(4,900,7500)
	mSleep(30)
	touchMove(2,650,1350)
	mSleep(30)			
	touchMove(4,800,1000)
	mSleep(60)
	touchMove(2,800,1200)
	mSleep(60)
	touchUp(4,800,1000)
	mSleep(100)
	touchUp(2,800,1200)
	mSleep(100)

end

function findtheBigOne()
	keepScreen(ture)				
	for i=1,3 do
		for j=1,5 do
			a=getColor(ehl[i][j].x-31,ehl[i][j].y-129)
			if (a>3000000 and a<3400000) then 
				keepScreen(false)
				return hl[2][j].x,hl[2][j].y,ehl[i][j].x,ehl[i][j].y
			end							
		end
	end
	keepScreen(false)
	return -1,-1
end

function z_attacks()
	require "patrol_config"
	while true do	
			
		wolfx,wolfy=findImageInRegionFuzzy("attack_v.png",80,atall_x1,atall_y1,atall_x2,atall_y2,0) 		
		if wolfx~=-1 and wolfy~=-1 then
			
			click(wolfx+50,wolfy+60)
			mSleep(500)
			click(wolfx+119,wolfy-87)
					
			waitForImage("begin_grey_esv.png",90,begin_grey_x1,begin_grey_y1,begin_grey_x2,begin_grey_y2,0,30) 
			
			for i=1,#(units) do
				click(unitselect_x.all, unitselect_y)                -- unit category button
				click(unitselect_x[units[i].cat], unitselect_y)      -- category
    
				pg=1                                              -- page
				while pg<=units[i].page do
					dragDrop(unit_x,unit_y[16],unit_x,unit_y[1],20)
					mSleep(300)
					pg=pg+1
				end
  
				mSleep(300)

				for j=1,units[i].num do                           -- deploy the unit(s)
					click(unit_x, unit_y[units[i].pos],10,15)
				end
			end

			click(begin_x,begin_y) --11 begin

			waitForColor(abort_x,abort_y,abort_color,15) 
			while true do

				for i=1,#(a_seq) do
			
					mSleep(a_seq[i].time)
		  
					xx=hl[a_seq[i].row][a_seq[i].col].x     -- get unit position
					yy=hl[a_seq[i].row][a_seq[i].col].y
			
					local xi=-1,yi,enemyxi,enemyyi
					if a_seq[i].drag==true then
						mSleep(200)
						xi,yi,enemyxi,enemyyi=findtheBigOne()
					end

					click(xx,yy)                            -- activate unit

					click(a_seq[i].wpx, a_seq[i].wpy)     -- switch weapon
	      
			
					if xi~=-1  then             -- drag the aiming scope
						dragDrop(ehl[2][3].x,ehl[2][3].y,enemyxi,enemyyi,20)      -- indirect aim scope drag
						dragDrop(ehl[1][3].x,ehl[1][3].y,enemyxi,enemyyi,20)      -- maybe drag from 1,3
						click(enemyxi,enemyyi)	
					end		 
		  
					beatit()

					rx1,rx2=waitForTwoColor(victory_x,victory_y,victory_color,abort_x,abort_y,abort_color,15)         
					if rx1==victory_color then
						goto vict
					end
				end
			end
			
			::vict::

			click(ok1_x,ok1_y) --23 ok
			mSleep(1000)

			click(ok2_x,ok2_y) --24 ok2
			mSleep(500)

						
			ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,15)

			if ifadx==-1 and ifady==-1 then						
				return -1
			end
							
		else		
			return		
		end		
	end			
end
	
function homeattack()
	require "home_config"
	
	while true do	
			
		wolfx,wolfy=findImageInRegionFuzzy("atall.png",80,atall_x1,atall_y1,atall_x2,atall_y2,0) 		
		if wolfx~=-1 and wolfy~=-1 then
			
			click(wolfx+50,wolfy+60)
			mSleep(500)
			click(wolfx+119,wolfy-87)
					
			waitForImage("begin_grey_esv.png",90,begin_grey_x1,begin_grey_y1,begin_grey_x2,begin_grey_y2,0,30) 
			
			for i=1,#(units) do
				click(unitselect_x.all, unitselect_y)                -- unit category button
				click(unitselect_x[units[i].cat], unitselect_y)      -- category
    
				pg=1                                              -- page
				while pg<=units[i].page do
					dragDrop(unit_x,unit_y[16],unit_x,unit_y[1],20)
					mSleep(300)
					pg=pg+1
				end
  
				mSleep(300)

				for j=1,units[i].num do                           -- deploy the unit(s)
					click(unit_x, unit_y[units[i].pos],10,15)		
				end
			end

			click(begin_x,begin_y) --11 begin

			waitForColor(abort_x,abort_y,abort_color,15) 
			while true do

				for i=1,#(a_seq) do
			
					mSleep(a_seq[i].time)
		  
					xx=hl[a_seq[i].row][a_seq[i].col].x     -- get unit position
					yy=hl[a_seq[i].row][a_seq[i].col].y
			
					local xi=-1,yi,enemyxi,enemyyi
					if a_seq[i].drag==true then
						mSleep(200)
						xi,yi,enemyxi,enemyyi=findtheBigOne()
					end

					click(xx,yy)                            -- activate unit

					click(a_seq[i].wpx, a_seq[i].wpy)     -- switch weapon
	      
			
					if xi~=-1  then             -- drag the aiming scope
						dragDrop(ehl[2][3].x,ehl[2][3].y,enemyxi,enemyyi,20)      -- indirect aim scope drag
						dragDrop(ehl[1][3].x,ehl[1][3].y,enemyxi,enemyyi,20)      -- maybe drag from 1,3
						click(enemyxi,enemyyi)	
					end		 
		  
					beatit()

					rx1,rx2=waitForTwoColor(victory_x,victory_y,victory_color,abort_x,abort_y,abort_color,15)         
					if rx1==victory_color then
						goto vict
					end
				end
			end
			
			::vict::

			click(ok1_x,ok1_y) --23 ok
			mSleep(1000)

			click(ok2_x,ok2_y) --24 ok2
			mSleep(500)

						
			ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,15)

			if ifadx==-1 and ifady==-1 then						
				return -1
			end
							
		else
		
			return
		
		end
		
	end		
	
end

function colorbigfoot(attacknumber)
	
	require "bigfoot_config"
	
	waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,35)  --wait the grey button for 30 seconds
	
		
	allstarttime=os.time()
	falsen=0
	victoryn=0	

	for i=1,attacknumber do
			
		thestarttime=os.time()

		mSleep(200)

		click(x_x,x_y) --1. X
		mSleep(200)

		click(occ_x,occ_y) --2 Occ
		mSleep(200)

		click(battle_x,battle_y) --3 battle
		
	
		
		waitForImage("begin_grey_esv.png",90,begin_grey_x1,begin_grey_y1,begin_grey_x2,begin_grey_y2,0,30) --wait the grey button for 30 seconds
		
		for i=1,#(units) do
			click(unitselect_x.all, unitselect_y)                -- unit category button
			click(unitselect_x[units[i].cat], unitselect_y)      -- category
    
			pg=1                                              -- page
			while pg<=units[i].page do
				dragDrop(unit_x,unit_y[16],unit_x,unit_y[1],20)
				mSleep(300)
				pg=pg+1
			end
  
			mSleep(300)

			for j=1,units[i].num do                           -- deploy the unit(s)
				touchDown(unit_x, unit_y[units[i].pos])
				mSleep(10)
				touchUp(unit_x, unit_y[units[i].pos])
				mSleep(15)
			end
		end

		click(begin_x,begin_y) --11 begin

		waitForColor(abort_x,abort_y,abort_color,15) 

		for i=1,#(a_seq) do
			
			mSleep(a_seq[i].time)
		  
			xx=hl[a_seq[i].row][a_seq[i].col].x     -- get unit position
			yy=hl[a_seq[i].row][a_seq[i].col].y
			
			local xi=-1,yi,enemyxi,enemyyi
			if a_seq[i].drag==true then
				mSleep(200)
				xi,yi,enemyxi,enemyyi=findtheBigOne()
			end

			click(xx,yy)                            -- activate unit

			click(a_seq[i].wpx, a_seq[i].wpy)     -- switch weapon
	      
			
			if xi~=-1  then             -- drag the aiming scope
				dragDrop(ehl[2][3].x,ehl[2][3].y,enemyxi,enemyyi,20)      -- indirect aim scope drag
				dragDrop(ehl[1][3].x,ehl[1][3].y,enemyxi,enemyyi,20)      -- maybe drag from 1,3
				click(enemyxi,enemyyi)	
			end		 
		  
			beatit()

			rx1,rx2=waitForTwoColor(victory_x,victory_y,victory_color,abort_x,abort_y,abort_color,15)         
			if rx1==victory_color then
				goto vict
			end
		end
			
		falsen=falsen+1   
		snapshot("false"..string.format("%02d",falsen)..".png",0,0,1536,2048)
		for i=1,2 do--[three pull]
			click(pull_x,pull_y)
			mSleep(200)
		end
		mSleep(5000)	
		goto exit	


		::vict::
		victoryn=victoryn+1
		
		::exit::
		click(ok1_x,ok1_y) 
		mSleep(300)

		click(ok2_x,ok2_y) 
		mSleep(2000)
		
				
		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,30)

		if ifadx==-1 and ifady==-1 then
			return				
		end
			
		thetime=os.time()-thestarttime
		alltime=os.time()-allstarttime
		
		initLog("mm",0)
		wLog("mm", string.format( "%d Bat, %d S, %d False, %d S/Bat, All %d S, %d CP", victoryn, thetime, falsen, alltime/victoryn, alltime, victoryn*534) )
		closeLog("mm")

		if falsen==5 then				
			return	
		end
	end
	click(big2home_x,big2home_y)
end
	
function main()
	while true do 	
		::startbn:: 	
		mSleep(5000) 
		runApp("com.z2live.battlenations1") 
		mSleep(15000) 
		init("0",0)
		
		click(5,5)

		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,45)
		if ifhomex==-1 and ifhomey==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
			
		end
		
		for i=1,2 do
			mapZoomOut()
		
			for i=1,3 do
			
				homefalse=homeattack()
				if homefalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end
					
				dragDrop(map_x.lefttop,map_y.lefttop,map_x.rightbottom,map_y.rightbottom,10)
			end
	
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.leftbottom,map_y.leftbottom,map_x.righttop,map_y.righttop,10)
			
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.leftbottom,map_y.leftbottom,map_x.righttop,map_y.righttop,10)
			

			for i=1,3 do
				
				homefalse=homeattack()
				if homefalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end	
				
				dragDrop(map_x.rightbottom,map_y.rightbottom,map_x.lefttop,map_y.lefttop,10)
			end
	
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.righttop,map_y.righttop,map_x.leftbottom,map_y.leftbottom,10)
			
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.righttop,map_y.righttop,map_x.leftbottom,map_y.leftbottom,10)
			
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
		
		end
						
		click(home2map_x,home2map_y)--home click world map
					
		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,30)

		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
		else				
			mapZoomOut()
	
			mSleep(500)
			click(map2wild_x,map2wild_y) --wild
			mSleep(500)
	
			rx,ry=findImageInRegionFuzzy("in_v.png",90,atall_x1,atall_y1,atall_x2,atall_y2,0)
			if rx==-1 and ry==-1 then
				click(home2map_x,home2map_y) --2home
				goto startbn
			end
	
			click(rx,ry)

			ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,15)

			if ifadx==-1 and ifady==-1 then

				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			else	
		
				for i=1,3 do		
					wildfalse=z_attacks()
					if wildfalse==-1 then
						closeApp("com.z2live.battlenations1")
						mSleep(5000)
						goto startbn
					end				
					dragDrop(map_x.lefttop,map_y.lefttop,map_x.righttop,map_y.righttop,10)
				end
		
				for i=1,3 do		
					wildfalse=z_attacks()
					if wildfalse==-1 then
						closeApp("com.z2live.battlenations1")
						mSleep(5000)
						goto startbn
					end				
					dragDrop(map_x.rightbottom,map_y.rightbottom,map_x.leftbottom,map_y.leftbottom,10)
				end
			
			end
			
			end			--wild	
					
		click(big2home_x,big2home_y) -- to home
		
		
		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,30)
		
		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end				
		
		click(home2map_x,home2map_y)--home click world map
		
	
		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,30)

		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
		else
		
			mapZoomOut()
	
			mSleep(500)
			click(map2raptor_x,map2raptor_y)  --raptor
			mSleep(500)
	
			rx,ry=findImageInRegionFuzzy("in_v.png",80,atall_x1,atall_y1,atall_x2,atall_y2,0)
			if rx==-1 and ry==-1 then
				closeApp("com.z2live.battlenations1")
				goto startbn
			end
	
			click(rx,ry)
		
			waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,35) --wait the grey button for 30 seconds
		
			for i=1,3 do		
				wildfalse=z_attacks()
				if wildfalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(map_x.lefttop,map_y.lefttop,map_x.righttop,map_y.righttop,10)
			end
		
			for i=1,3 do		
				wildfalse=z_attacks()
				if wildfalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(map_x.rightbottom,map_y.rightbottom,map_x.leftbottom,map_y.leftbottom,10)
			end
			
			
			end 				--raptor
					
		click(big2home_x,big2home_y) -- to home
		
						
		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,30)
		
		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end	
		
		click(home2map_x,home2map_y)	--home click world map
		

		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,15)
		
		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end	
		
		clearbigfoot()
	end	
end	

function clearbigfoot()
	while true do
		::startbn::
		mSleep(2000)
		runApp("com.z2live.battlenations1")
		mSleep(15000) 
		init("0",0)	
		
		click(5,5)	
		
		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,45)
		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end
		
		mSleep(2000)
		
		xx,xy=findImageInRegionFuzzy("redx_v.png",90,redx_x1,redx_y1,redx_x2,redx_y2,0)
		if xx~=-1 and xy~=-1 then
			click(xx,xy)
			waitForColor(abort_x,abort_y,abort_color,15)  --wait the grey button for 30 seconds
			for i=1,2 do--[three pull]
				click(pull_x,pull_y)
				mSleep(200)
			end
			mSleep(5000)
	
			click(ok1_x,ok1_y) --23 ok
			mSleep(300)

			click(ok2_x,ok2_y) --24 ok2
			mSleep(200)		
			goto bigfoot
		end			

		
		click(home2map_x,home2map_y)							

		mSleep(5000)
		ifadx,ifady=waitForImage("smallhouse_v.png",90,smallhouse_x1,smallhouse_y1,smallhouse_x2,smallhouse_y2,0,30)
		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end
		
		mapZoomOut()
	
		mSleep(500)
	
		dragDrop(map_x.righttop,map_y.righttop,map_x.leftbottom,map_y.leftbottom,10)
	
		mSleep(500)
		click(map2big_x,map2big_y)
		mSleep(500)
	
		rx,ry=findImageInRegionFuzzy("in_v.png",90,in_v_x1,in_v_y1,in_v_x2,in_v_y2,0)
		if rx==-1 and ry==-1 then
			closeApp("com.z2live.battlenations1")	
			goto startbn
		end	
		click(rx,ry)								
		
		::bigfoot::	
		colorbigfoot(2000)	
		closeApp("com.z2live.battlenations1")	
	end
end

function Selectit()
	IO_ID()
	init("0",0)	
	mSleep(2000) 
	ret = dialogRet("请选择攻击类型","取消","全体巡逻","大脚",10)
	
	if ret==1 then
		main()
	end
	
	if ret==2 then
		goto bigfoot	
	end	
	
	if ret==0 then
		lua_exit()
	end
	
	::bigfoot::
	clearbigfoot()
end

Selectit()

--colorbigfoot(1000)




