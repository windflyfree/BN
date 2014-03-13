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


function click(x,y) 
    touchDown(x,y)
    mSleep(200)
    touchUp(x,y)
    mSleep(250)
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
	mSleep(100)
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
      return xx,yy,waitfor
    end

    waitfor=waitfor+1
  end
end

--detect two imgs, return x,y when at least one img appears 
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



init("0",0)

allstarttime=os.time()
falsen=0
victoryn=0

while true do

resetIDLETimer()	
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
click(unitselect.soldiers,unitselecty)
mSleep(200)
--click(unitx,unity[8])--[点士兵兵种第8位]
--mSleep(200)


--click(unitselect.all,unitselecty)--[点选兵分类按钮]
--click(unitselect.aircraft,unitselecty)
--mSleep(200)
--click(unitx,unity[6])
--mSleep(200)

--click(unitselect.all,unitselecty)--[点选兵分类按钮]
--mSleep(200)
--click(unitselect.vehicles,unitselecty)
--mSleep(200)


dragDrop(unitx,unity[16],unitx,unity[1],20)
mSleep(200)
dragDrop(unitx,unity[16],unitx,unity[9],20)
mSleep(2000)
click(unitx,unity[15])
--mSleep(200)



click(unitselect.all,unitselecty)--[点选兵分类按钮]
mSleep(200)
click(unitselect.critters,unitselecty)
click(unitx,unity[5])
click(unitx,unity[1])
click(unitx,unity[1])
click(unitx,unity[1])






click(764,1913) --11 begin

waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds
mSleep(500)

click(hl[1][3].x,hl[1][3].y)
click(LBoarx,LBoary[3])
click(ehl[2][3].x,ehl[2][3].y)
click(ehl[1][3].x,ehl[1][3].y)
--waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds
--click(hl[2][3].x,hl[2][3].y)--[hl23]
--click(1475,1340)--[飞侠 skill2]
--beatit()



--waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds
--click(hl[2][2].x,hl[2][2].y)--[hl23]
--beatit()

--waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds
--click(hl[2][4].x,hl[2][4].y)--[hl23]
--click(1475,1400)--[hl24 skill2]
--beatit()


waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)
mSleep(1000)
click(hl[1][2].x,hl[1][2].y)--[mm12]
click(1490,1230)--[mm skill3]
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
   goto vict
end


click(hl[3][3].x,hl[3][3].y)
dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[1][2].x,ehl[1][2].y,10)
dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[1][2].x,ehl[1][2].y,10)
click(ehl[1][2].x,ehl[1][2].y)




--rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
--if rx~=-1 and ry~=-1 then
--   goto vict
--end

--waitForImage("abort_esv.png",90,274,1815,368,2047,0,10)  --wait the abort button for 10 seconds
click(hl[2][3].x,hl[2][3].y)--[hl23]
--click(1475,1340)--[飞侠 skill2]
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
   goto vict
end

click(hl[1][1].x,hl[1][1].y)--[mm12]
click(1490,1230)--[mm skill3]
beatit()

rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,"abort_esv.png",90,298,1913,339,1940,0,16)         --wait for victory dialog for 5sec
if rx~=-1 and ry~=-1 then
   goto vict
end

click(hl[1][4].x,hl[1][4].y)--[mm12]
click(1490,1230)--[mm skill3]
beatit()


rx,ry=waitForImage("victory_esv.png",90,531,996,554,1058,0,8)  

for i=1,3 do--[three pull]
click(210,1985)
mSleep(200)
end

click(1030,825) -- in case of touching mission button

::vict::

  
click(965,800) --23 ok
mSleep(1000)

click(1015,780) --24 ok2
mSleep(500)

click(1260,870)  --  for the event ad
mSleep(50)

click(830,1005) --new ad
mSleep(50)

waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,35)


endtime=os.time()
thetime=endtime-thestarttime
alltime=endtime-allstarttime
victoryn=victoryn+1

if rx==-1 and ry==-1 then
	falsen=falsen+1
	
	playAudio("Xylophone.mp3")
		
	click(965,800) --23 ok
	mSleep(1000)

end
	
initLog("mm",0)
wLog("mm", string.format( "%d battle, %d sec, %d sec All, %d false ", victoryn, thetime, alltime, falsen) )
closeLog("mm")

if falsen==5 then
	for xyi=1,3 do
		playAudio("Xylophone.mp3")
		mSleep(15000)
	end
	closeApp(com.z2live.battlenations1)
	mSleep(5000)
	lockDevice()	
end
  
end