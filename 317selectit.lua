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

		inbig_x,inbig_y=186,131
		inwild_x,inwild_y=1176,131
		inraptor_x,inraptor_y=993,713
		atall_x=0x000000
		home_posandcolor="32|40|0xff8000,0|82|0x000000"
		jungle_posandcolor="32|40|0xf5ab00,0|82|0x000000"
		
		atall_x1,atall_y1,atall_x2,atall_y2=100,150,1450,1800
		
		homeMapColor={{0xd17902,1385,64},
		              {0xe9b009,1405,43},
			          {0x6fa13a,1419,59}}
		
		jungleMapColor={{0x7cef03,1429,408},
					    {0xc1b9b1,1470,374},
					    {0xd5ac8c,1466,439}}
		
		worldMapColor={{0xffed8a,1398,258},
					   {0x3172ff,1422,240},
					   {0xd92207,1422,280}}
		
		begin_grey_Color={{0xdedbd5,220,1987},
						  {0x595043,225,2023},
						  {0xbdb5a7,192,1994}}
		
		
		redx_color,redx_x,redx_y=0xff6f00,334,61
	end
end

function click(x,y,timeDown,timeUp)
	local timeDown=timeDown or 50
	local timeUp=timeUp or 100
	touchDown(x,y)
	mSleep(timeDown)
	touchUp(x,y)
	mSleep(timeUp)
end

function dragDrop(x1,y1,x2,y2,b)
	b=b or 15
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
	mSleep(30)
	touchMove(x2,y2)
	mSleep(150)
	touchUp(x2,y2)
end

function getSkill(x,y)
	local m
	m=1775-130*x-95*y
	return m
end

function waitForColor(color,d,x,y,waitfor)
  for i=1,waitfor*4 do
    mSleep(250)
	keepScreen(true)	
    local rx,ry = findColorInRegionFuzzy(color,d,x,y,x,y)
	keepScreen(false)				
    if  rx~=-1 and ry~=-1 then
      return true
    end   
  end
  return false
end

function waitForTwoColor(color1,d1,x1,y1,color2,d2,x2,y2,waitfor)
	for i=1,waitfor*4 do
		mSleep(250)
		keepScreen(true)				
	    local rx1,ry1 = findColorInRegionFuzzy(color1,d1,x1,y1,x1,y1)
	    local rx2,ry2 = findColorInRegionFuzzy(color2,d2,x2,y2,x2,y2)
		keepScreen(false)				
	    if  rx1~=-1 or rx2~=-1 then
	      return rx1,ry1,rx2,ry2
	    end   
	end
	return false
end

function waitFor3Color(img,diff,waitfor)
		   					   
	for i=1,waitfor*4 do
		mSleep(250)
		keepScreen(true)
		
		for j=1,#(img) do
			rx={}
	   		rx[j] = findColorInRegionFuzzy(img[j][1],diff,img[j][2],img[j][3],img[j][2],img[j][3])
		    m=j
			if rx[j]==-1 then
				break
			end
			m=j+1
		end
		
		keepScreen(false)	
		
		if m==#(img)+1 then
			return ture

		end
	end
	return false
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
	local i,j			
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

function deployTroop(units)	
	for i=1,#(units) do
		click(unitselect_x.all, unitselect_y)                -- unit category button
		click(unitselect_x[units[i].cat], unitselect_y)      -- category

		pg=1                                              -- page
		while pg<=units[i].page do
			mSleep(800)
			dragDrop(unit_x,unit_y[16],unit_x,unit_y[1],20)
			mSleep(300)
			pg=pg+1
		end

		mSleep(300)

		for j=1,units[i].num do                           -- deploy the unit(s)
			click(unit_x, unit_y[units[i].pos],20,25)		
		end
	end
end

function proceedAttackSequence(a_seq)
	click(begin_x,begin_y)
	waitForColor(abort_color,85,abort_x,abort_y,30) 
	for i=1,2 do

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
				dragDrop(ehl[2][3].x,ehl[2][3].y,enemyxi,enemyyi,30)      -- indirect aim scope drag
				dragDrop(ehl[1][3].x,ehl[1][3].y,enemyxi,enemyyi,30)      -- maybe drag from 1,3
				click(enemyxi,enemyyi)	
			end		 

			beatit()


			rx1,ry1,rx2,ry2=waitForTwoColor(victory_color,85,victory_x,victory_y,abort_color,85,abort_x,abort_y,15)         
			if rx1~=-1 and ry1~=-1 then
				goto vict
			end
		end
	end

	for i=1,2 do--[three pull]
		click(pull_x,pull_y)
		mSleep(200)
	end
	mSleep(5000)
	
	::vict::

	click(ok1_x,ok1_y) --23 ok
	mSleep(1000)

	click(ok2_x,ok2_y) --24 ok2
	mSleep(500)

end

function jungle_attacks()
	require "jungle_config"
	while true do	
			
		wolfx,wolfy = findMultiColorInRegionFuzzy(atall_x,jungle_posandcolor,90,atall_x1,atall_y1,atall_x2,atall_y2)		
		if wolfx~=-1 and wolfy~=-1 then
			click(wolfx-35,wolfy-21)
			mSleep(100)
			click(wolfx-18,wolfy-121)
					
			waitFor3Color(begin_grey_Color,95,35)	
			
			deployTroop(jungle_units)
			
			proceedAttackSequence(jungle_a_seq)
						
			ifwait=waitFor3Color(jungleMapColor,95,35)						

			if ifwait==false then
				return false				
			end							
		else		
			return		
		end		
	end			
end
	
function home_attacks()
	require "home_config"
	
	while true do	
			
		wolfx,wolfy = findMultiColorInRegionFuzzy(atall_x,home_posandcolor,95,atall_x1,atall_y1,atall_x2,atall_y2)		
		if wolfx~=-1 and wolfy~=-1 then
			click(wolfx-35,wolfy-21)
			mSleep(100)
			click(wolfx-18,wolfy-121)
					
			waitFor3Color(begin_grey_Color,95,35)
			
			deployTroop(home_units)
			
			proceedAttackSequence(home_a_seq)
						
			ifwait=waitFor3Color(homeMapColor,95,35)
								 
			if ifwait==false then
				return false				
			end	
							
		else		
			return 	
		end		
	end		
end

function bigfoot_attacks(attacknumber)
	
	require "bigfoot_config"
	
	ifwait=waitFor3Color(jungleMapColor,95,35)
			
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
		
		waitFor3Color(begin_grey_Color,95,35)
	
		deployTroop(bigfoot_units)
		
		click(begin_x,begin_y) --11 begin

		waitForColor(abort_color,85,abort_x,abort_y,30)
		
		a_seq=bigfoot_a_seq

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
				dragDrop(ehl[2][3].x,ehl[2][3].y,enemyxi,enemyyi,30)      -- indirect aim scope drag
				dragDrop(ehl[1][3].x,ehl[1][3].y,enemyxi,enemyyi,30)      -- maybe drag from 1,3
				click(enemyxi,enemyyi)	
			end		 
		  
			beatit()

			rx1,ry1,rx2,ry2=waitForTwoColor(victory_color,85,victory_x,victory_y,abort_color,85,abort_x,abort_y,30)         
			if rx1~=-1 and ry1~=-1 then
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
		
				
		ifwait=waitFor3Color(jungleMapColor,95,30)

		if ifwait==false then
			return false				
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
		init("0",0)
		mSleep(15000) 
		click(0,0)
		
		ifwait=waitFor3Color(homeMapColor,95,55)
							 
		if ifwait==false then
			closeApp("com.z2live.battlenations1")
			goto startbn
			
		end
		
		rx,ry = findColorInRegionFuzzy(redx_color,90,redx_x,redx_y,redx_x,redx_y)
		if rx~=-1 and ry~=-1 then
			click(rx,ry)
			waitForColor(abort_color,85,abort_x,abort_y,30)  --wait the grey button for 30 seconds
			for i=1,2 do--[three pull]
				click(pull_x,pull_y)
				mSleep(200)
			end
				
			closeApp("com.z2live.battlenations1")
			goto startbn
		end		
		
		for i=1,2 do
			mapZoomOut()
		
			for i=1,3 do
			
				homefalse=home_attacks()
				if homefalse==false then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end
					
				dragDrop(map_x.lefttop,map_y.lefttop,map_x.rightbottom,map_y.rightbottom,10)
			end
	
			homefalse=home_attacks()
			if homefalse==false then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.leftbottom,map_y.leftbottom,map_x.righttop,map_y.righttop,10)
			
			homefalse=home_attacks()
			if homefalse==false then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.leftbottom,map_y.leftbottom,map_x.righttop,map_y.righttop,10)
			

			for i=1,3 do
				
				homefalse=home_attacks()
				if homefalse==false then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end	
				
				dragDrop(map_x.rightbottom,map_y.rightbottom,map_x.lefttop,map_y.lefttop,10)
			end
	
			homefalse=home_attacks()
			if homefalse==false then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.righttop,map_y.righttop,map_x.leftbottom,map_y.leftbottom,10)
			
			homefalse=home_attacks()
			if homefalse==false then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(map_x.righttop,map_y.righttop,map_x.leftbottom,map_y.leftbottom,10)
			
			homefalse=home_attacks()
			if homefalse==false then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
		
		end
						
		click(home2map_x,home2map_y)--home click world map
					
	    ifwait=waitFor3Color(worldMapColor,95,30)
		if ifwait==false then
			closeApp("com.z2live.battlenations1")
			goto startbn
		else				
			mapZoomOut()
	
			mSleep(200)
			click(map2wild_x,map2wild_y) --wild
			mSleep(300)
	
			click(inwild_x,inwild_y)

			ifwait=waitFor3Color(jungleMapColor,95,30)
			if ifwait==false then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			else	
		
				for i=1,3 do		
					junglefalse=jungle_attacks()
					if junglefalse==false then
						closeApp("com.z2live.battlenations1")
						mSleep(5000)
						goto startbn
					end				
					dragDrop(map_x.lefttop,map_y.lefttop,map_x.righttop,map_y.righttop,10)
				end
		
				for i=1,3 do		
					junglefalse=jungle_attacks()
					if junglefalse==false then
						closeApp("com.z2live.battlenations1")
						mSleep(5000)
						goto startbn
					end				
					dragDrop(map_x.rightbottom,map_y.rightbottom,map_x.leftbottom,map_y.leftbottom,10)
				end
			
			end
			
			end			--wild	
					
		click(big2home_x,big2home_y) -- to home
		
		
		ifwait=waitFor3Color(homeMapColor,95,35)

		if ifwait==false then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end				
		
		click(home2map_x,home2map_y)--home click world map
		
	
		ifwait=waitFor3Color(worldMapColor,95,30)
							 
		if ifwait==false then
			closeApp("com.z2live.battlenations1")
			goto startbn
		else
		
			mapZoomOut()
	
			mSleep(500)
			click(map2raptor_x,map2raptor_y)  --raptor
			mSleep(500)
			
			click(inraptor_x,inraptor_y)
		
			ifwait=waitFor3Color(jungleMapColor,95,30)
			if ifwait==false then
				closeApp("com.z2live.battlenations1")
				goto startbn
			end
		
			for i=1,3 do		
				junglefalse=jungle_attacks()
				if junglefalse==false then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(map_x.lefttop,map_y.lefttop,map_x.righttop,map_y.righttop)
			end
		
			for i=1,3 do		
				junglefalse=jungle_attacks()
				if junglefalse==false then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(map_x.rightbottom,map_y.rightbottom,map_x.leftbottom,map_y.leftbottom)
			end
			
			
		end 				--raptor
					
		click(big2home_x,big2home_y) -- to home
		
						
		ifwait=waitFor3Color(homeMapColor,95,30)
		if ifwait==false then
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
		
		click(0,0)	
		
	    ifwait=waitFor3Color(homeMapColor,95,55)
		if ifwait==false then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end
		
		mSleep(2000)
		
		rx,ry = findColorInRegionFuzzy(redx_color,90,redx_x,redx_y,redx_x,redx_y)		
		if rx~=-1 and ry~=-1 then
			click(rx,ry)
			waitForColor(abort_color,85,abort_x,abort_y,30)  --wait the grey button for 30 seconds
			for i=1,2 do--[three pull]
				click(pull_x,pull_y)
				mSleep(200)
			end
				
			closeApp("com.z2live.battlenations1")
			goto startbn
		end			

		
		click(home2map_x,home2map_y)							

		mSleep(5000)
		ifwait=waitFor3Color(worldMapColor,95,30)
		if ifwait==false then
			closeApp("com.z2live.battlenations1")
			goto startbn
		end
		
		mapZoomOut()
	
		mSleep(300)
	
		dragDrop(map_x.righttop,map_y.righttop,map_x.leftbottom,map_y.leftbottom)
	
		mSleep(300)
		click(map2big_x,map2big_y)
		mSleep(300)
		
		click(inbig_x,inbig_y)								
		
		::bigfoot::	
		bigfoot_attacks(100)	
		closeApp("com.z2live.battlenations1")	
		main()
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

