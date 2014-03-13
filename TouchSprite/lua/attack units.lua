ehl={
   {{x=470,y=1295},{x=580,y=1080},{x=685,y=860},{x=790,y=650},{x=900,y=440}},
   {{x=365,y=1080},{x=470,y=860},{x=580,y=650},{x=685,y=440},{x=790,y=235}},
   {{x=365,y=650},{x=365,y=650},{x=440,y=470},{x=580,y=235},{x=580,y=235}},
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



function click(x,y) 
    touchDown(x,y)
    mSleep(100)
    touchUp(x,y)
    mSleep(150)
end


function dragDrop(x1,y1,x2,y2,b)
    touchDown(x1,y1)
    mSleep(150)
	i=(x2-x1)/b
	j=(y2-y1)/b
	for step=1,b do
		touchMove(x1+i*step,y1+j*step)
		mSleep(15)
	end	
	mSleep(150)
	touchUp(x2,y2)
end

function waitForImage( imgFile,d,x1,y1,x2,y2,color,seconds )
	local waitfor
	local xx=-1
  local yy=-1
 
  waitfor = 0
  while true do
    mSleep(1000)
    xx,yy=findImageInRegionFuzzy(imgFile,d,x1,y1,x2,y2,color)

    if (xx~=-1 and yy~=-1) or waitfor==seconds then
      return xx,yy
    end

    waitfor=waitfor+1
  end
end

function waitForTwoImages( img1,d1,x1,y1,x2,y2,color1,img2,d2,x3,y3,x4,y4,color2,seconds )
  local waitfor
  local xx1=-1
  local yy1=-1
  local xx2=-1
  local yy2=-1
 
  waitfor = 0
  while true do
    mSleep(1000)

    xx1,yy1=findImageInRegionFuzzy(img1,d1,x1,y1,x2,y2,color1)
    xx2,yy2=findImageInRegionFuzzy(img2,d2,x3,y3,x4,y4,color2)

    if (xx1~=-1 and yy1~=-1) or (xx2~=-1 and yy2~=-1) or waitfor==seconds then
      return xx1,yy1,xx2,yy2
    end

    waitfor=waitfor+1
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
click(764,1913)
end





function attack()

--mSleep(5000)
--attackx,attacky=findImageInRegionFuzzy("attack_v.png",80,0,0,1500,2047,0) 
--click(attackx,attacky)
--mSleep(500)
--attackx,attacky=findImageInRegionFuzzy("attacka_v.png",80,0,0,1500,2047,0) 
--click(attackx,attacky)

waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30)  --wait the grey button for 30 seconds
mSleep(300)


click(unitselect.all,unitselecty)--[点选兵分类按钮]
click(unitselect.vehicles,unitselecty)
mSleep(200)

dragDrop(unitx,unity[16],unitx,unity[1],20)
mSleep(2000)
click(unitx,unity[8])



click(unitselect.all,unitselecty)--[点选兵分类按钮]
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

for i=1,5 do
	
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

click(hl[2][2].x,hl[2][2].y)
click(LBoarx,LBoary[4])
dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][2].x,ehl[1][2].y,10)
dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[1][2].x,ehl[1][2].y,10)
click(ehl[1][2].x,ehl[1][2].y)

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
break
end

click(hl[1][1].x,hl[1][1].y)--[mm12]
click(LMammothx,LMammothy[3])
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
break
end

click(hl[1][2].x,hl[1][2].y)--[mm12]
click(LMammothx,LMammothy[3])
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
break
end

click(hl[2][4].x,hl[2][4].y)
click(LBoarx,LBoary[4])
dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][4].x,ehl[1][4].y,10)
dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[1][4].x,ehl[1][4].y,10)
click(ehl[1][4].x,ehl[1][4].y)

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

click(hl[1][4].x,hl[1][4].y)--[mm12]
click(LMammothx,LMammothy[3])
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
break
end

click(hl[1][5].x,hl[1][5].y)--[mm12]
click(LMammothx,LMammothy[3])
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
break
end

click(hl[2][3].x,hl[2][3].y)
click(LBoarx,LBoary[4])
dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][3].x,ehl[1][3].y,10)
click(ehl[1][3].x,ehl[1][3].y)

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
break
end

end

end



function attacks()

--mSleep(5000)
--attackx,attacky=findImageInRegionFuzzy("attack_v.png",80,0,0,1500,2047,0) 
--click(attackx,attacky)
--mSleep(500)
--attackx,attacky=findImageInRegionFuzzy("attacka_v.png",80,0,0,1500,2047,0) 
--click(attackx,attacky)

waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30)  --wait the grey button for 30 seconds
mSleep(300)


click(unitselect.all,unitselecty)--[点选兵分类按钮]
click(unitselect.vehicles,unitselecty)
mSleep(200)

dragDrop(unitx,unity[16],unitx,unity[1],20)
mSleep(2000)
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
end


function touchmap()
mSleep(10000)

touchDown(4,1000,500)
mSleep(15)
touchDown(2,500,1500)
mSleep(2)
touchMove(4,800,1000)
mSleep(15)
touchMove(2,800,1200)
mSleep(2)
touchUp(4,800,1000)
mSleep(15)
touchUp(2,800,1200)

end


function vict()
  
click(965,800) --23 ok
mSleep(1000)

click(1015,780) --24 ok2
mSleep(500)

click(1260,870)  --  for the event ad
mSleep(50)

click(830,1005) --new ad
mSleep(50)

waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35)

end


function wild()
for i=1,3 do
	while true do
		
		attackx,attacky=findImageInRegionFuzzy("attack_v.png",80,100,150,1400,1900,0) 
		if attackx==-1 and attacky==-1 then
		break
		else	
			click(attackx-50,attacky)
			attackx,attacky=findImageInRegionFuzzy("attacka_v.png",80,100,150,1400,1900,0) 
			click(attackx,attacky)
	
			attacks()
			vict()
			
		end
	end
	
dragDrop(mapx.rightbottom,mapy.rightbottom,mapx.leftbottom,mapy.leftbottom,10)
	
for i=1,3 do
	while true do
		
		attackx,attacky=findImageInRegionFuzzy("attack_v.png",80,100,150,1400,1900,0) 
		if attackx~=-1 and attacky~=-1 then
			click(attackx-50,attacky)
			attackx,attacky=findImageInRegionFuzzy("attacka_v.png",80,100,150,1400,1900,0) 
			click(attackx,attacky)
	
			attacks()
			vict()
			
		
		else	
		break	
		end
	end
	
dragDrop(mapx.leftbottom,mapy.leftbottom,mapx.rightbottom,mapy.rightbottom,10)
	
end	

end
end

		
function homeattack()
	while true do
		wolfx,wolfy=findImageInRegionFuzzy("homeattack_v.png",80,100,150,1400,1900,0) 
				if wolfx~=-1 and wolfy~=-1 then
					click(wolfx,wolfy)
					mSleep(500)
					click(wolfx+40,wolfy-120)
					attack()
					vict()
	    else	
		break
		end
	end		
end

function homewolf()
	for i=1,3 do
		homeattack()	
		dragDrop(mapx.lefttop,mapy.lefttop,mapx.rightbottom,mapy.rightbottom,10)
	end
	homeattack()
	dragDrop(mapx.leftbottom,mapy.leftbottom,mapx.righttop,mapy.righttop,10)
	homeattack()
	dragDrop(mapx.leftbottom,mapy.leftbottom,mapx.righttop,mapy.righttop,10)

	for i=1,3 do
		homeattack()	
		dragDrop(mapx.rightbottom,mapy.rightbottom,mapx.lefttop,mapy.lefttop,10)
	end
	homeattack()
	dragDrop(mapx.righttop,mapy.righttop,mapx.leftbottom,mapy.leftbottom,10)
	homeattack()
	dragDrop(mapx.righttop,mapy.righttop,mapx.leftbottom,mapy.leftbottom,10)
	homeattack()
end



	topad={x=1360,y=1025}
	ad1={x=1280,y=780}
	ad2={x=1280,y=320}
	adsafe={x=1515,y=500}
	
function ifad()	
mSleep(2000)
click(ad1.x,ad1.y)
click(ad2.x,ad2.y)
click(adsafe.x,adsafe.y)
end


function ddj()
allstarttime=os.time()
falsen=0
victoryn=0

thestarttime=os.time()

mSleep(500)

click(1420,400) --1. X
mSleep(500)

click(895,1005) --2 Occ
mSleep(500)

click(820,975) --3 battle

waitForImage("begin_grey_esv.png",90,648,1802,905,2047,0,30)  --wait the grey button for 30 seconds
mSleep(300)




click(unitselect.all,unitselecty)--[点选兵分类按钮]
mSleep(200)
click(unitselect.vehicles,unitselecty)
--mSleep(200)


dragDrop(unitx,unity[16],unitx,unity[1],20)
mSleep(200)
dragDrop(unitx,unity[16],unitx,unity[9],20)
mSleep(2000)
click(unitx,unity[4])
--mSleep(200)



click(unitselect.all,unitselecty)--[点选兵分类按钮]
click(unitselect.critters,unitselecty)
--click(unitx,unity[5])

for i=1,3 do
    touchDown(unitx,unity[1])
    mSleep(50)
    touchUp(unitx,unity[1])
    mSleep(50)
	
end





click(764,1913) --11 begin

waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds
mSleep(500)

click(hl[1][2].x,hl[1][2].y)--[mm12]
beatit()

waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds
click(hl[2][3].x,hl[2][3].y)--[mm12]

beatit()


waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds

click(hl[1][2].x,hl[1][2].y)--[mm12]
click(1490,1230)--[mm skill3]
beatit()


rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
   goto vict
end

click(hl[1][3].x,hl[1][3].y)--[mm12]
click(1490,1230)--[mm skill3]
beatit()


rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
   goto vict
end



click(hl[1][4].x,hl[1][4].y)--[mm12]
click(1490,1230)--[mm skill3]
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
   goto vict
else
   for i=1,3 do--[three pull]
   click(210,1985)
   mSleep(200)
   end
   mSleep(15000)
   click(1030,825) -- in case of touching mission button
   
end




::vict::

  
click(965,800) --23 ok
mSleep(1000)

click(1015,780) --24 ok2
mSleep(500)



waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35)

click(1260,870)  --  for the event ad
mSleep(50)

click(830,1005) --new ad
mSleep(50)


endtime=os.time()
thetime=endtime-thestarttime
alltime=endtime-allstarttime
victoryn=victoryn+1

if rx==-1 and ry==-1 then
	falsen=falsen+1
end

if falsen==5 then
	closeApp(com.z2live.battlenations1)
end
  
end





init("0",0)
for i=1,120 do
	ddj()
end

while true do
mSleep(5000)
	
runApp("com.z2live.battlenations1")
mSleep(30000)

ifadx,ifady=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,60)

if ifadx==-1 and ifady==-1 then
-- 	mSleep(5000)
-- 	click(topad.x,topad.y)
-- 	mSleep(5000)
-- 	click(ad1.x,ad1.y)
-- 	mSleep(5000)
-- 	click(ad2.x,ad2.y)
-- 	mSleep(5000)	
-- 	click(adsafe.x,adsafe.y)
-- 	mSleep(10000)
	
-- 	ifadx,ifady=findImageInRegionFuzzy("smallhouse_v.png",90,171,1881,1204,2047,0)
	
	if ifadx==-1 and ifady==-1 then
		closeApp("com.z2live.battlenations1")
		mSleep(10000)
--	else
--		touchmap()	
--		homewolf()
--		homewolf()	
--		closeApp("com.z2live.battlenations1")
---		mSleep(3600000)			
--	end

else
	touchmap()	
	homewolf()
	homewolf()	
	closeApp("com.z2live.battlenations1")
	mSleep(3600000)
end

end