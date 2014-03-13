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

unitx=1475
unity={2015,1860,1730,1600,1470,1340,1210,1080,950,820,690,560,430,300,170,40} 

unitselecty=1975
unitselect={all=1375,aircraft=1335,ignorable=1295,infect=1255,critters=1215,vehicles=1175,soldiers=1135}

LBoarx=1480 
LBoary={1580,1350,1120,940}

LMammothx=1480
LMammothy={1580,1450,1230,1000}

Rangedx=1480
Rangedy={1580,1450}


mapx={lefttop=512,leftbottom=1024,center=768,righttop=512,rightbottom=1024}
mapy={lefttop=1360,leftbottom=1360,center=1024,righttop=680,rightbottom=680}


topad={x=1360,y=1025}
ad1={x=1280,y=780}
ad2={x=1280,y=320}
adsafe={x=1515,y=500}

abortx,aborty,abortcolor=303,1867,14708992 
victoryx,victoryy,victorycolor=980,821,16315892

function click(x,y) 	
	touchDown(x,y)
	mSleep(50)
	touchUp(x,y)
	mSleep(150)
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
			return xx,yy
		end
		
	end
end

function waitForColor( x,y,color,waitfor )
	for i=1,waitfor do
		mSleep(1000)
		xx=getColor(x,y)
		if	xx==color	then
			return 
		end		
	end
end

function waitForTwoColor(x1,y1,color1,x2,y2,color2,waitfor )
	for i=1,waitfor do
		mSleep(1000)
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
 
	for i=1,waitfor do
		mSleep(1000)
		xx1,yy1=findImageInRegionFuzzy(img1,d1,x1,y1,x2,y2,color1)
		xx2,yy2=findImageInRegionFuzzy(img2,d2,x3,y3,x4,y4,color2)
		
		if (xx1~=-1 and yy1~=-1) or (xx2~=-1 and yy2~=-1) then
			return xx1,yy1,xx2,yy2
		end
		
	end
end

function beatit()
	for hi=1,2 do
		for i=1,5 do
			touchDown(ehl[hi][i].x,ehl[hi][i].y)
			mSleep(30)
			touchUp(ehl[hi][i].x,ehl[hi][i].y)
			mSleep(50)
		end
	end
end

function maptouch()
	
	mSleep(500)
	touchDown(4,1000,500)
	mSleep(300)
	touchDown(2,500,1500)
	mSleep(300)		
	touchMove(4,900,7500)
	mSleep(30)
	touchMove(2,650,1350)
	mSleep(30)			
	touchMove(4,800,1000)
	mSleep(60)
	touchMove(2,800,1200)
	mSleep(60)
	touchUp(4,800,1000)
	mSleep(300)
	touchUp(2,800,1200)
	mSleep(300)

end

function wild()
	while true do
		attackx,attacky=findImageInRegionFuzzy("attack_v.png",80,100,150,1400,1900,0) 
		if attackx~=-1 and attacky~=-1 then	
		
			click(attackx,attacky)
			mSleep(500)
			click(attackx+125,attacky-200)
					
			waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30) 
			mSleep(300)

			click(unitselect.all,unitselecty)--[点选兵分类按钮]
			click(unitselect.vehicles,unitselecty)
			mSleep(200)

			dragDrop(unitx,unity[16],unitx,unity[1],20)
			mSleep(1000)
			click(unitx,unity[8])



			click(unitselect.all,unitselecty)--[点选兵分类按钮]
			mSleep(200)
			click(unitselect.critters,unitselecty)
			mSleep(200)
			for i=1,2 do
				touchDown(unitx,unity[5])
				mSleep(50)
				touchUp(unitx,unity[5])
				mSleep(50)
			end
			mSleep(200)	
			click(760,1910) --11 begin

			while true do
	
				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
				if rx~=-1 and ry~=-1 then
					break
				end


				click(hl[1][3].x,hl[1][3].y)
				click(Rangedx,Rangedy[2])
				beatit()


				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
				if rx~=-1 and ry~=-1 then
					break
				end
				mSleep(500)

				click(hl[1][2].x,hl[1][2].y)
				click(LBoarx,LBoary[2])
				dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][2].x,ehl[1][2].y,10)
				dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[1][2].x,ehl[1][2].y,10)
				click(ehl[1][2].x,ehl[1][2].y)

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[1][4].x,hl[1][4].y)
				click(LBoarx,LBoary[2])
				dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][4].x,ehl[1][4].y,10)
				dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[1][4].x,ehl[1][4].y,10)
				click(ehl[1][4].x,ehl[1][4].y)

			end
			
			click(965,800) --23 ok
			mSleep(1000)

			click(1015,780) --24 ok2
			mSleep(500)

			ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

			if ifadx==-1 and ifady==-1 then
				mSleep(5000)
				click(topad.x,topad.y)
				--		mSleep(5000)
				click(ad1.x,ad1.y)
				--		mSleep(5000)
				click(ad2.x,ad2.y)
				--		mSleep(5000)
				click(adsafe.x,adsafe.y)
				mSleep(5000)
			end		
						
			ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

			if ifadx==-1 and ifady==-1 then						
				return -1
			end
							
		else
		
			return
					
		end
	end
end

function ifad()
	ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

	if ifadx==-1 and ifady==-1 then
		mSleep(5000)
		click(topad.x,topad.y)
		--		mSleep(5000)
		click(ad1.x,ad1.y)
		--		mSleep(5000)
		click(ad2.x,ad2.y)
		--		mSleep(5000)
		click(adsafe.x,adsafe.y)
		mSleep(5000)
	end	
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
	
function homeattack()
	
	while true do	
			
		wolfx,wolfy=findImageInRegionFuzzy("atall.png",80,100,150,1400,1900,0) 		
		if wolfx~=-1 and wolfy~=-1 then
			
			click(wolfx+50,wolfy+60)
			mSleep(500)
			click(wolfx+115,wolfy-100)
					
			waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30) 
			mSleep(500)


			click(unitselect.all,unitselecty)
			click(unitselect.vehicles,unitselecty)
			mSleep(200)

			dragDrop(unitx,unity[16],unitx,unity[1],20)
			mSleep(1000)
			click(unitx,unity[8])



			click(unitselect.all,unitselecty)
			mSleep(200)
			click(unitselect.critters,unitselecty)
			mSleep(200)
			for i=1,4 do
				touchDown(unitx,unity[1])
				mSleep(50)
				touchUp(unitx,unity[1])
				mSleep(50)
			end
	
			for i=1,3 do
				touchDown(unitx,unity[5])
				mSleep(50)
				touchUp(unitx,unity[5])
				mSleep(50)
			end
			mSleep(200)	
			click(760,1910) --11 begin

			while true do
	
				mSleep(500)

				click(hl[1][3].x,hl[1][3].y)
				click(Rangedx,Rangedy[2])
				beatit()

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)       
				if rx~=-1 and ry~=-1 then
					break
				end
				
				mSleep(500)
				
				click(hl[2][2].x,hl[2][2].y)
				click(LBoarx,LBoary[4])
				dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][2].x,ehl[1][2].y,10)
				dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[1][2].x,ehl[1][2].y,10)
				click(ehl[1][2].x,ehl[1][2].y)

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[1][1].x,hl[1][1].y)--[mm12]
				click(LMammothx,LMammothy[3])
				beatit()

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[1][2].x,hl[1][2].y)--[mm12]
				click(LMammothx,LMammothy[3])
				beatit()

					

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[1][3].x,hl[1][3].y)
				click(Rangedx,Rangedy[2])
				beatit()
					
				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[2][4].x,hl[2][4].y)
				click(LBoarx,LBoary[4])
				dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][4].x,ehl[1][4].y,10)
				dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[1][4].x,ehl[1][4].y,10)
				click(ehl[1][4].x,ehl[1][4].y)

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[1][4].x,hl[1][4].y)--[mm12]
				click(LMammothx,LMammothy[3])
				beatit()

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[1][5].x,hl[1][5].y)--[mm12]
				click(LMammothx,LMammothy[3])
				beatit()

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         
				if rx~=-1 and ry~=-1 then
					break
				end

				click(hl[2][3].x,hl[2][3].y)
				click(LBoarx,LBoary[4])
				dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][3].x,ehl[1][3].y,10)
				click(ehl[1][3].x,ehl[1][3].y)

				rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)        
				if rx~=-1 and ry~=-1 then
					break
				end

			end



			click(965,800) --23 ok
			mSleep(1000)

			click(1015,780) --24 ok2
			mSleep(500)

			--	ifad()	
						
			ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

			if ifadx==-1 and ifady==-1 then						
				return -1
			end
							
		else
		
			return
		
		end
		
	end		
	
end

function bigfoot(attacknumber)

	maptouch()
	
	mSleep(500)
	
	dragDrop(mapx.righttop,mapy.righttop,mapx.leftbottom,mapy.leftbottom,10)
	
	mSleep(500)
	click(150,800)
	mSleep(500)
	
	rx,ry=findImageInRegionFuzzy("in_v.png",90,100,10,300,200,0)
	if rx==-1 and ry==-1 then
		return
	end
	
	click(rx,ry)
	
	waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35)  --wait the grey button for 30 seconds
	mSleep(500)
	maptouch()
	
	xx,xy=findImageInRegionFuzzy("redx_v.png",90,0,600,800,1500,0)
	if xx~=-1 and xy~=-1 then
		click(xx+50,xy+50)
		mSleep(500)
		click(xx+125,xy-130)
		waitForImage("abort_esv.png",90,298,1913,339,1940,0,15)  --wait the grey button for 30 seconds
		for i=1,2 do--[three pull]
			click(210,1985)
			mSleep(200)
		end
		mSleep(5000)
		
		click(965,800) --23 ok
		mSleep(300)

		click(1015,780) --24 ok2
		mSleep(200)		
		waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35) 
	end
		
	allstarttime=os.time()
	falsen=0
	victoryn=0	

	for i=1,attacknumber do
		
	
		thestarttime=os.time()

		mSleep(200)

		click(1420,400) --1. X
		mSleep(200)

		click(895,1005) --2 Occ
		mSleep(200)

		click(820,975) --3 battle
		
	
		
		waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30)  --wait the grey button for 30 seconds

		ourunits_x,ourunits_y=findtheBigOne()

		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.aircraft,unitselecty)
		mSleep(200)
		click(unitx,unity[6]) --摇摆机
		mSleep(200)
		
		dragDrop(hl[2][3].x,hl[2][3].y,hl[3][3].x,hl[3][3].y,20)

		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.soldiers,unitselecty)
		mSleep(200)
		for x=1,2 do
			dragDrop(unitx,unity[16],unitx,unity[1],20)
		end
		mSleep(500)
		click(unitx,unity[15])
		--		click(unitx,unity[16])  --等离子
	
		
		if ourunits_x~=-1 then
			dragDrop(hl[2][3].x,hl[2][3].y,ourunits_x,ourunits_y)
		end
		
	
		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.critters,unitselecty)
		for i=1,3 do
			touchDown(unitx,unity[1])
			mSleep(10)
			touchUp(unitx,unity[1])
			mSleep(15)
		end


		click(764,1913) --11 begin

		waitForImage("abort_esv.png",90,298,1913,339,1940,0,15) 


		click(hl[3][3].x,hl[3][3].y)
		click(LBoarx,LBoary[3])
		beatit()

		waitForImage("abort_esv.png",90,298,1913,339,1940,0,15) 

		mSleep(800)
		
		click(hl[1][2].x,hl[1][2].y)
		click(LMammothx,LMammothy[3])
		beatit()
		
		if ourunits_x~=-1 then
		
			rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,15)         
			if rx~=-1 and ry~=-1 then
				goto vict
			end

			click(ourunits_x,ourunits_y)
			beatit()
		
		end
		--		click(hl[3][3].x,hl[3][3].y)   --等离子
		--		z_enemy()
		


		rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,15)         
		if rx~=-1 and ry~=-1 then
			goto vict
		end


		click(hl[1][3].x,hl[1][3].y)
		click(LMammothx,LMammothy[3])
		beatit()

		rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,15)         
		if rx~=-1 and ry~=-1 then
			goto vict
		end



		click(hl[1][4].x,hl[1][4].y)
		click(LMammothx,LMammothy[3])
		beatit()

		

		rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,15)         
		if rx~=-1 and ry~=-1 then
			goto vict
		else
			for i=1,2 do--[three pull]
				click(210,1985)
				mSleep(200)
			end
			mSleep(5000)
			falsen=falsen+1   
		end




		::vict::
		
		victoryn=victoryn+1
		
		click(965,800) --23 ok
		mSleep(300)

		click(1015,780) --24 ok2
		mSleep(200)
		
		
		--  ifad()
		
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)

		if ifadx==-1 and ifady==-1 then
			return				
		end
			
		endtime=os.time()
		thetime=endtime-thestarttime
		alltime=endtime-allstarttime
		
		initLog("mm",0)
		wLog("mm", string.format( "%d battle, %d sec, %d sec All, %d false ", victoryn, thetime, alltime, falsen) )
		closeLog("mm")

		if falsen==5 then				
			return	
		end

	end

	click(1450,250) -- dj to home
end

function colorbigfoot(attacknumber)

	maptouch()
	
	mSleep(500)
	
	dragDrop(mapx.righttop,mapy.righttop,mapx.leftbottom,mapy.leftbottom,10)
	
	mSleep(500)
	click(150,800)
	mSleep(500)
	
	rx,ry=findImageInRegionFuzzy("in_v.png",90,100,10,300,200,0)
	if rx==-1 and ry==-1 then
		return
	end
	
	click(rx,ry)
	
	waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35)  --wait the grey button for 30 seconds
	mSleep(500)
	maptouch()
	
	xx,xy=findImageInRegionFuzzy("redx_v.png",90,0,600,800,1500,0)
	if xx~=-1 and xy~=-1 then
		click(xx+50,xy+50)
		mSleep(500)
		click(xx+125,xy-130)
		waitForImage("abort_esv.png",90,298,1913,339,1940,0,15)  --wait the grey button for 30 seconds
		for i=1,2 do--[three pull]
			click(210,1985)
			mSleep(200)
		end
		mSleep(5000)
		
		click(965,800) --23 ok
		mSleep(300)

		click(1015,780) --24 ok2
		mSleep(200)		
		waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35) 
	end
		
	allstarttime=os.time()
	falsen=0
	victoryn=0	

	for i=1,attacknumber do
		
	
		thestarttime=os.time()

		mSleep(200)

		click(1420,400) --1. X
		mSleep(200)

		click(895,1005) --2 Occ
		mSleep(200)

		click(820,975) --3 battle
		
	
		
		waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30) --wait the grey button for 30 seconds

		ourunits_x,ourunits_y=findtheBigOne()

		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.aircraft,unitselecty)
		mSleep(200)
		click(unitx,unity[6]) --摇摆机
		mSleep(200)
		
		dragDrop(hl[2][3].x,hl[2][3].y,hl[3][3].x,hl[3][3].y,20)

		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.soldiers,unitselecty)
		mSleep(200)
		for x=1,2 do
			dragDrop(unitx,unity[16],unitx,unity[1],20)
		end
		mSleep(500)
		click(unitx,unity[15])
		--		click(unitx,unity[16])  --等离子
	
		
		if ourunits_x~=-1 then
			dragDrop(hl[2][3].x,hl[2][3].y,ourunits_x,ourunits_y)
		end
		
	
		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.critters,unitselecty)
		for i=1,3 do
			touchDown(unitx,unity[1])
			mSleep(10)
			touchUp(unitx,unity[1])
			mSleep(15)
		end


		click(764,1913) --11 begin

		waitForColor(abortx,aborty,abortcolor,15) 


		click(hl[3][3].x,hl[3][3].y)
		click(LBoarx,LBoary[3])
		beatit()

		waitForColor(abortx,aborty,abortcolor,15) 

		mSleep(500)
		
		click(hl[1][2].x,hl[1][2].y)
		click(LMammothx,LMammothy[3])
		beatit()
		
		if ourunits_x~=-1 then
		
			rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
			if rx1==victorycolor then
				goto vict
			end

			click(ourunits_x,ourunits_y)
			beatit()
		
		end
		--		click(hl[3][3].x,hl[3][3].y)   --等离子
		--		z_enemy()
		


		rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
		if rx1==victorycolor then
			goto vict
		end


		click(hl[1][3].x,hl[1][3].y)
		click(LMammothx,LMammothy[3])
		beatit()

		rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
		if rx1==victorycolor then
			goto vict
		end



		click(hl[1][4].x,hl[1][4].y)
		click(LMammothx,LMammothy[3])
		beatit()

		

		rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
		if rx1==victorycolor then
			goto vict
		else
			for i=1,2 do--[three pull]
				click(210,1985)
				mSleep(200)
			end
			mSleep(5000)
			falsen=falsen+1   
		end




		::vict::
		
		victoryn=victoryn+1
		
		click(965,800) --23 ok
		mSleep(300)

		click(1015,780) --24 ok2
		mSleep(200)
		
		
		--  ifad()
		
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)

		if ifadx==-1 and ifady==-1 then
			return				
		end
			
		endtime=os.time()
		thetime=endtime-thestarttime
		alltime=endtime-allstarttime
		
		initLog("mm",0)
		wLog("mm", string.format( "%d battle, %d sec, %d sec All, %d false ", victoryn, thetime, alltime, falsen) )
		closeLog("mm")

		if falsen==5 then				
			return	
		end

	end

	click(1450,250) -- dj to home
end
	
function nowcolorbigfoot(attacknumber)
	init("0",0)	
	mSleep(2000) 

	waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35)  --wait the grey button for 30 seconds
	mSleep(500)
	maptouch()

	xx,xy=findImageInRegionFuzzy("redx_v.png",90,0,600,800,1500,0)
	if xx~=-1 and xy~=-1 then
		click(xx+50,xy+50)
		mSleep(500)
		click(xx+125,xy-130)
		waitForImage("abort_esv.png",90,298,1913,339,1940,0,15)  --wait the grey button for 30 seconds
		for i=1,2 do--[three pull]
			click(210,1985)
			mSleep(200)
		end
		mSleep(5000)
	
		click(965,800) --23 ok
		mSleep(300)

		click(1015,780) --24 ok2
		mSleep(200)		
		waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35) 
	end
	
	allstarttime=os.time()
	falsen=0
	victoryn=0	

	for i=1,attacknumber do
	

		thestarttime=os.time()

		mSleep(200)

		click(1420,400) --1. X
		mSleep(200)

		click(895,1005) --2 Occ
		mSleep(200)

		click(820,975) --3 battle
	

	
		waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30) --wait the grey button for 30 seconds

		ourunits_x,ourunits_y,enemyx,enemyy=findtheBigOne()

		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.aircraft,unitselecty)
		mSleep(200)
		click(unitx,unity[6]) --摇摆机
		mSleep(200)
	
		dragDrop(hl[2][3].x,hl[2][3].y,hl[3][3].x,hl[3][3].y,20)

		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.soldiers,unitselecty)
		mSleep(200)
		for x=1,2 do
			dragDrop(unitx,unity[16],unitx,unity[1],20)
		end
		mSleep(500)
		click(unitx,unity[15])
		--		click(unitx,unity[16])  --等离子

	
		if ourunits_x~=-1 then
			dragDrop(hl[2][3].x,hl[2][3].y,ourunits_x,ourunits_y)
		end
	

		click(unitselect.all,unitselecty)--[点选兵分类按钮]
		click(unitselect.critters,unitselecty)
		for i=1,3 do
			touchDown(unitx,unity[1])
			mSleep(10)
			touchUp(unitx,unity[1])
			mSleep(15)
		end


		click(764,1913) --11 begin

		waitForColor(abortx,aborty,abortcolor,15) 


		click(hl[3][3].x,hl[3][3].y)
		click(LBoarx,LBoary[3])
		beatit()

		waitForColor(abortx,aborty,abortcolor,15) 

		mSleep(500)
		click(hl[1][2].x,hl[1][2].y)
		click(LMammothx,LMammothy[3])
		beatit()
	
		if ourunits_x~=-1 then
	
			rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
			if rx1==victorycolor then
				goto vict
			end

			click(ourunits_x,ourunits_y)
			beatit()
	
		end
		--		click(hl[3][3].x,hl[3][3].y)   --等离子
		--		z_enemy()
	
		--		waitForColor(90,abortx,aborty,abortcolor,15) 


		rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
		if rx1==victorycolor then
			goto vict
		end


		click(hl[1][3].x,hl[1][3].y)
		click(LMammothx,LMammothy[3])
		beatit()

		rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
		if rx1==victorycolor then
			goto vict
		end



		click(hl[1][4].x,hl[1][4].y)
		click(LMammothx,LMammothy[3])
		beatit()

	

		rx1,rx2=waitForTwoColor(victoryx,victoryy,victorycolor,abortx,aborty,abortcolor,15)         
		if rx1==victorycolor then
			goto vict
		else
			for i=1,2 do--[three pull]
				click(210,1985)
				mSleep(200)
			end
			mSleep(5000)
			falsen=falsen+1   
		end




		::vict::
	
		victoryn=victoryn+1
	
		click(965,800) --23 ok
		mSleep(300)

		click(1015,780) --24 ok2
		mSleep(200)
	
	
		--  ifad()
	
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)

		if ifadx==-1 and ifady==-1 then
			return				
		end
		
		endtime=os.time()
		thetime=endtime-thestarttime
		alltime=endtime-allstarttime
	
		initLog("mm",0)
		wLog("mm", string.format( "%d battle, %d sec, %d sec All, %d false ", victoryn, thetime, alltime, falsen) )
		closeLog("mm")

		if falsen==5 then				
			return	
		end

	end

	click(1450,250) -- dj to home
end
				
function clearraptor()
	::startbn:: 
	mSleep(5000) 
	runApp("com.z2live.battlenations1") 
	init("0",0)
					
	ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,60)  --raptor

	if ifadx==-1 and ifady==-1 then
		click(topad.x,topad.y)
		mSleep(5000)
		click(ad1.x,ad1.y)
		mSleep(5000)
		click(ad2.x,ad2.y)
		mSleep(5000)
		click(adsafe.x,adsafe.y)
		mSleep(10000)
	end	

	ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

	if ifadx==-1 and ifady==-1 then

		closeApp("com.z2live.battlenations1")
		mSleep(5000)
		goto startbn
	else	
		
		click(1410,65)--home click world map

		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)

		if ifadx==-1 and ifady==-1 then
			click(topad.x,topad.y)
			mSleep(5000)
			click(ad1.x,ad1.y)
			mSleep(5000)
			click(ad2.x,ad2.y)
			mSleep(5000)
			click(adsafe.x,adsafe.y)
			mSleep(10000)
		end	
		
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			mSleep(5000)
			goto startbn
		else
	
			maptouch()

			mSleep(2000)
			click(900,1490)  --raptor
			mSleep(2000)

			rx,ry=findImageInRegionFuzzy("in_v.png",80,800,300,1200,800,0)
			if rx==-1 and ry==-1 then
				closeApp("com.z2live.battlenations1")
				goto startbn
			end

			click(rx,ry)
	
			waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35) --wait the grey button for 30 seconds
	
			for i=1,3 do		
				wildfalse=wild()
				if wildfalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(mapx.lefttop,mapy.lefttop,mapx.righttop,mapy.righttop,10)
			end
	
			for i=1,3 do		
				wildfalse=wild()
				if wildfalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(mapx.rightbottom,mapy.rightbottom,mapx.leftbottom,mapy.leftbottom,10)
			end		
		end
		
	end		
end

function clearbigfoot()
	while true do
		
		mSleep(2000)
		runApp("com.z2live.battlenations1")
		mSleep(15000) 
		init("0",0)	
		
		click(adsafe.x,adsafe.y)	
		
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,45)
		if ifadx==-1 and ifady==-1 then
			goto closeit
		end
		--		ifad()	

		--		click(1395,370)--ifhome
		--		mSleep(500)
		--		ifhomex,ifhomey=findImageInRegionFuzzy("ifhome_v.png",80,600,300,1200,1000,0)
		---		if ifhomex==-1 and ifhomey==-1 then
			--			goto closeit
			--		end
			--		click(ifhomex,ifhomey)
			--		click(adsafe.x,adsafe.y)

		click(1410,65)							

			--		ifad()	

		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)
		
		if ifadx~=-1 and ifady~=-1 then
				--			bigfoot(2000)
			colorbigfoot(2000)
		end
		
		::closeit::			
		closeApp("com.z2live.battlenations1")
	end
end

function main()
	while true do 
	
		::startbn:: 
	
		mSleep(5000) 
		runApp("com.z2live.battlenations1") 
		mSleep(30000) 
		init("0",0)

		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,45)  --raptor
		if ifadx==-1 and ifady==-1 then
			click(ad1.x,ad1.y)
			mSleep(2000)
			click(ad2.x,ad2.y)
			click(adsafe.x,adsafe.y)
			mSleep(8000)
		end	
		
		maptouch()
		click(1395,370)--ifhome
		mSleep(500)
		ifhomex,ifhomey=findImageInRegionFuzzy("ifhome_v.png",80,600,300,1200,1000,0)
		if ifhomex==-1 and ifhomey==-1 then
			goto closeit
		end
		click(ifhomex,ifhomey)
		
		
		for i=1,2 do
			maptouch()
		
			for i=1,3 do
			
				homefalse=homeattack()
				if homefalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end
					
				dragDrop(mapx.lefttop,mapy.lefttop,mapx.rightbottom,mapy.rightbottom,10)
			end
	
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(mapx.leftbottom,mapy.leftbottom,mapx.righttop,mapy.righttop,10)
			
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(mapx.leftbottom,mapy.leftbottom,mapx.righttop,mapy.righttop,10)
			

			for i=1,3 do
				
				homefalse=homeattack()
				if homefalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end	
				
				dragDrop(mapx.rightbottom,mapy.rightbottom,mapx.lefttop,mapy.lefttop,10)
			end
	
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(mapx.righttop,mapy.righttop,mapx.leftbottom,mapy.leftbottom,10)
			
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
			
			dragDrop(mapx.righttop,mapy.righttop,mapx.leftbottom,mapy.leftbottom,10)
			
			homefalse=homeattack()
			if homefalse==-1 then
				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			end
		
		end
		
				
		click(1410,65)--home click world map
		
					
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)  --wild

		if ifadx==-1 and ifady==-1 then
			click(ad1.x,ad1.y)
			mSleep(2000)
			click(ad2.x,ad2.y)
			click(adsafe.x,adsafe.y)
			mSleep(8000)
		end	
			
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

		if ifadx==-1 and ifady==-1 then
			goto closeit
		else				
			maptouch()
	
			mSleep(2000)
			click(1260,780)
			mSleep(2000)
	
			rx,ry=findImageInRegionFuzzy("in_v.png",90,1000,30,1330,300,0)
			if rx==-1 and ry==-1 then
				click(1450,65) --home
				goto startbn
			end
	
			click(rx,ry)
			
			ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)

			if ifadx==-1 and ifady==-1 then
				click(ad1.x,ad1.y)
				mSleep(2000)
				click(ad2.x,ad2.y)
				click(adsafe.x,adsafe.y)
				mSleep(8000)
			end	

			ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

			if ifadx==-1 and ifady==-1 then

				closeApp("com.z2live.battlenations1")
				mSleep(5000)
				goto startbn
			else	
		
				for i=1,3 do		
					wildfalse=wild()
					if wildfalse==-1 then
						closeApp("com.z2live.battlenations1")
						mSleep(5000)
						goto startbn
					end				
					dragDrop(mapx.lefttop,mapy.lefttop,mapx.righttop,mapy.righttop,10)
				end
		
				for i=1,3 do		
					wildfalse=wild()
					if wildfalse==-1 then
						closeApp("com.z2live.battlenations1")
						mSleep(5000)
						goto startbn
					end				
					dragDrop(mapx.rightbottom,mapy.rightbottom,mapx.leftbottom,mapy.leftbottom,10)
				end
			
			end
			
		end				
					
		click(1450,250) -- to home
		
						
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,45)  --raptor
		if ifadx==-1 and ifady==-1 then
			click(ad1.x,ad1.y)
			mSleep(2000)
			click(ad2.x,ad2.y)
			click(adsafe.x,adsafe.y)
			mSleep(8000)
		end	
		
		maptouch()
		click(1395,370)--ifhome
		mSleep(500)
		ifhomex,ifhomey=findImageInRegionFuzzy("ifhome_v.png",80,600,300,1200,1000,0)
		if ifhomex==-1 and ifhomey==-1 then
			goto closeit
		end
		click(ifhomex,ifhomey)
			
			
		click(1410,65)--home click world map
	
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)

		if ifadx==-1 and ifady==-1 then
			click(topad.x,topad.y)
			mSleep(5000)
			click(ad1.x,ad1.y)
			mSleep(5000)
			click(ad2.x,ad2.y)
			mSleep(5000)
			click(adsafe.x,adsafe.y)
			mSleep(10000)
		end	
			
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)

		if ifadx==-1 and ifady==-1 then
			closeApp("com.z2live.battlenations1")
			mSleep(5000)
			goto startbn
		else
		
			maptouch()
	
			mSleep(2000)
			click(900,1490)  --raptor
			mSleep(2000)
	
			rx,ry=findImageInRegionFuzzy("in_v.png",80,800,300,1200,800,0)
			if rx==-1 and ry==-1 then
				click(1410,65)
				goto startbn
			end
	
			click(rx,ry)
		
			waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35) --wait the grey button for 30 seconds
		
			for i=1,3 do		
				wildfalse=wild()
				if wildfalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(mapx.lefttop,mapy.lefttop,mapx.righttop,mapy.righttop,10)
			end
		
			for i=1,3 do		
				wildfalse=wild()
				if wildfalse==-1 then
					closeApp("com.z2live.battlenations1")
					mSleep(5000)
					goto startbn
				end				
				dragDrop(mapx.rightbottom,mapy.rightbottom,mapx.leftbottom,mapy.leftbottom,10)
			end
			
			
		end
			
	
		
		click(1450,250) -- to home
						
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,45)  --raptor
		if ifadx==-1 and ifady==-1 then
			click(ad1.x,ad1.y)
			mSleep(2000)
			click(ad2.x,ad2.y)
			click(adsafe.x,adsafe.y)
			mSleep(8000)
		end	
		
		maptouch()
		click(1395,370)--ifhome
		mSleep(500)
		ifhomex,ifhomey=findImageInRegionFuzzy("ifhome_v.png",80,600,300,1200,1000,0)
		if ifhomex==-1 and ifhomey==-1 then
			goto closeit
		end
		click(ifhomex,ifhomey)
		
		click(1410,65)	
						
		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,60)  --worldmap
		if ifadx==-1 and ifady==-1 then
			click(topad.x,topad.y)
			mSleep(3000)
			click(ad1.x,ad1.y)
			mSleep(3000)
			click(ad2.x,ad2.y)
			mSleep(3000)
			click(adsafe.x,adsafe.y)
			mSleep(3000)
		end	


		ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,15)
		
		if ifadx~=-1 and ifady~=-1 then				
			bigfoot(120)
		end
	
		::closeit::
		closeApp("com.z2live.battlenations1")	
	end	
end	


function Selectit()
		init("0",0)	
		mSleep(2000) 
		ret = dialogRet("请选择攻击类型","取消","全体巡逻","大脚",10)
	
		if ret==1 then
			main()
		end
	
		if ret==2 then
			goto bigfoot	
		end	
	
		::bigfoot::
		clearbigfoot()
end




Selectit()







