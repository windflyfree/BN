--[[
  11 12 13
6  7  8  9 10
5  4  3  2  1
]]

enemy={
  {x=903,y=437},   --1
  {x=775,y=659},   --2
  {x=682,y=858},   --3
  {x=577,y=1071},  --4
  {x=470,y=1285},  --5
  {x=364,y=1075},  --6
  {x=475,y=868},   --7
  {x=591,y=636},   --8
  {x=709,y=426},   --9
  {x=814,y=200},   --10
  {x=593,y=202},   --11
  {x=482,y=460},   --12
  {x=376,y=649}    --13
}

ehl={
{{x=474,y=1291},{x=580,y=1077},{x=687,y=862},{x=794,y=650},{x=900,y=437}},
{{x=368,y=1077},{x=474,y=862},{x=580,y=650},{x=687,y=437},{x=794,y=224}},
{{x=368,y=650},{x=368,y=650},{x=474,y=437},{x=580,y=224},{x=580,y=224}},
}

hl={
{{x=630,y=1640},{x=710,y=1400},{x=830,y=1180},{x=955,y=955},{x=1070,y=770}},
{{x=740,y=1830},{x=850,y=1640},{x=960,y=1420},{x=1060,y=1200},{x=1170,y=980}},
{{x=0,y=0},{x=960,y=1850},{x=1060,y=1620},{x=1170,y=1420}},
}

unitx=1475
unity={2015,1860,1730,1600,1470,1340,1210,1080,950,820,690,560,430,300,170,40} 

unitselecty=1975
unitselect={all=1375,aircraft=1335,ignorable=1295,infect=1255,critters=1215,vehicles=1175,soldiers=1135}


mapx={lefttop=512,leftbottom=1024,center=768,righttop=512,rightbottom=1024}
mapy={lefttop=1360,leftbottom=1360,center=1024,righttop=680,rightbottom=680}


topad={x=1360,y=1025}
ad1={x=1280,y=780}
ad2={x=1280,y=320}
adsafe={x=1515,y=500}

unit_count = 2
-- category,page,pos,number
--[[units = { {cat="critters",page=0,pos=2,num=5},               -- mammoth
          {cat="soldiers",page=3,pos=14,num=1} }             -- plasma field tech

attacks = 5
a_seq={  -- unit row,unit col, weapon coordinate(x,y), aim drag?, taget row, target col
    {row=1,col=3,wpx=-1,wpy=-1,drag=false,trgtx=-1,trgty=-1} ,      -- row1 col3, no weapon switch, no aim drag, use beatit() to fire 
    {row=1,col=3,wpx=1484,wpy=1223,drag=false,trgtx=-1,trgty=-1},   -- row1,col3, weapon:yell, no aim drag, use beatit() to fire
    {row=3,col=3,wpx=-1,wpy=-1,drag=true,trgtx=-1,trgty=-1},        -- plasma, 3,3 no weapon switch, aim drag, beatit()
    {row=1,col=5,wpx=1484,wpy=1223,drag=false,trgtx=-1,trgty=-1},   -- mammoth 2, yell
    {row=1,col=4,wpx=1484,wpy=1223,drag=false,trgtx=-1,trgty=-1}    -- mammoth 3, yell
}          

]]

--            category,page,pos,number
units = { {cat="critters",page=0,pos=2,num=5},             -- mammoth
          {cat="soldiers",page=0,pos=9,num=1} }            -- aero jetpack trooper

attacks = 4
a_seq={  -- unit row,unit col, weapon coordinate(x,y), aim drag?, taget row, target col
    {row=2,col=3,wpx=1471,wpy=1348,drag=true,trgtx=-1,trgty=-1} ,   -- row2 col3, weapon #2, aiming drag, use beatit() to fire 
    {row=1,col=3,wpx=1484,wpy=1223,drag=false,trgtx=-1,trgty=-1},   -- row1,col3, weapon:yell, no aim drag, use beatit() to fire
    {row=1,col=5,wpx=1484,wpy=1223,drag=false,trgtx=-1,trgty=-1},   -- mammoth 2, yell
    {row=1,col=4,wpx=1484,wpy=1223,drag=false,trgtx=-1,trgty=-1}    -- mammoth 3, yell
}          


function deployTroop()
  for i=1,unit_count do
    click(unitselect.all, unitselecty)                -- unit category button
    click(unitselect[units[i].cat], unitselecty)      -- category
    
    mSleep(300)
    pg=1                                              -- page
    while pg<=units[i].page do
      preciseDrag(unitx,unity[16],unitx,unity[1],20)
      mSleep(400)
      pg=pg+1
    end
  
    mSleep(500)

    for j=1,units[i].num do                           -- deploy the unit(s)
      click(unitx, unity[units[i].pos])
    end
  end
end


function proceedAttackSequence()
  local xx,yy

  bigonefound=false

  for i=1,attacks do
    
    if i==1 then
      rx,ry=waitForImage("abort_esv.png",90,298,1913,339,1940,0,15)  --wait the abort button for 15 seconds
      if rx==-1 and ry==-1 then
        return i,false,false                                 -- timeout, mission failed
      end
    end

    click(764,1913) 

    xx=hl[a_seq[i].row][a_seq[i].col].x     -- get unit position
    yy=hl[a_seq[i].row][a_seq[i].col].y

    click(xx,yy)                            -- activate unit

    if a_seq[i].wpx~=-1 then
      click(a_seq[i].wpx, a_seq[i].wpy)     -- switch weapon
    end

    if a_seq[i].drag==true then             -- drag the aiming scope
      xi,yi,bigonefound=findtheBigOne()
      dragDrop(ehl[2][3].x,ehl[2][3].y,ehl[xi][yi].x,ehl[xi][yi].y,5)      -- indirect aim scope drag
      dragDrop(ehl[1][3].x,ehl[1][3].y,ehl[xi][yi].x,ehl[xi][yi].y,5)      -- maybe drag from 1,3
    end

    if a_seq[i].trgtx~=-1 then                                   --fire !!!
      xx=ehl[a_seq[i].trgtx][a_seq[i].trgty].x
      yy=ehl[a_seq[i].trgtx][a_seq[i].trgty].y

      click(xx,yy)
    else
      beatit()
    end

    if i<attacks then
      rx,ry,rx1,ry1=waitForTwoImages("victory_esv.png",90,531,996,554,1058,0,       --wait for victory dialog or
                                       "abort_esv.png",90,298,1913,339,1940,0,16)   --the abort button for 16 sec
      if rx~=-1 and ry~=-1 then
        vict_dialog()
        return i,true,bigonefound
      else 
        if rx==-1 and ry==-1 and rx1==-1 and ry1==-1 then         -- timeout, mission failed
          return i,false,bigonefound
        end
      end
    else                         -- Last round
      rx,ry=waitForImage("victory_esv.png",90,531,996,554,1058,0,20)    --wait for victory dialog

      if rx==-1 and ry==-1 then       -- no victory dialog
        for i=1,3 do
          click(196,1970)             -- push pullback button 3 times
          mSleep(200)
        end
        return i,false,bigonefound
      else
        vict_dialog()
        return i,true,bigonefound
      end
    end                 -- [if i<attacks]

  end    -- [for i=1,attacks do]

end

--[[ ]]

function vict_dialog()
    click(966,800)    --23 ok
    mSleep(300)
    click(1013,782)   --24 ok2
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

function dropDrag(x1,y1,x2,y2)
  touchDown(x1,y1)
  mSleep(50)
  touchMove(x1,y2)
  mSleep(50)
  touchUp(x1,y2)
  mSleep(50)
end

function preciseDrag(x1,y1,x2,y2,b)
  touchDown(x1,y1)
  mSleep(50)
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

function mapZoomOut()
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

function click(x,y) 
  touchDown(x,y)
  mSleep(50)
  touchUp(x,y)
  mSleep(100)
end

--[[
function dropDrag(x1,y1,x2,y2)
  touchDown(x1,y1)
  mSleep(50)
  touchMove(x1,y2)
  mSleep(50)
  touchUp(x1,y2)
  mSleep(50)
end
]]

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
  --dialog(string.format("%d",waitfor),1)
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
      mSleep(50)
      touchUp(ehl[hi][i].x,ehl[hi][i].y)
      mSleep(50)
    end
  end
  for i=2,4 do
    touchDown(ehl[3][i].x,ehl[3][i].y)
    mSleep(50)
    touchUp(ehl[3][i].x,ehl[3][i].y)
    mSleep(50)
  end
  mSleep(50)
  click(764,1913)
end

function findtheBigOne()

  keepScreen(ture)        

  for i=1,3 do
    for j=1,5 do
      a=getColor(ehl[i][j].x-31,ehl[i][j].y-129)
      if (a>3000000 and a<3400000) then 
        keepScreen(false)
        return i,j,true
      end             
    end
  end

  keepScreen(false)
  return 2,3,false
end

function clearLastBattle()
  local xx,xy

  xx,xy=findImageInRegionFuzzy("savedbattle_v.png",90,0,0,700,300,0)
  if xx~=-1 and xy~=-1 then
    click(xx+5,xy+5)
    waitForImage("abort_esv.png",90,298,1913,339,1940,0,15) 
    mSleep(200)
    for i=1,3 do          -- touch the pull back button 3 times
      click(210,1985)
      mSleep(200)
    end
    mSleep(1000)
    
    click(965,800) --23 ok
    mSleep(300)

    click(1015,780) --24 ok2
    mSleep(200)   
  end
end

function gotoBigfootHome()
  mapZoomOut()               -- Zoom out the map (assume we are standing on the world map)
  mSleep(500)

  dragDrop(mapx.righttop,mapy.righttop,mapx.leftbottom,mapy.leftbottom,10)

  mSleep(500)
  click(150,800)             -- bigfoot's homeland
  mSleep(500)

  rx,ry=findImageInRegionFuzzy("bigfoot_home_v.png",90,0,0,300,1500,0)      -- find the "goto" button
  if rx==-1 and ry==-1 then
    return false
  end

  click(rx,ry)

  rx,ry=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,30)  
  if rx==-1 and ry==-1 then
    return false
  end

  mSleep(500)
  mapZoomOut()               -- Zoom out the map
  return true
end

function reEnterBN()

  for i=1,5 do      -- Try 5 times
    resetIDLETimer()
    closeApp("com.z2live.battlenations1")
    mSleep(5000)
    runApp("com.z2live.battlenations1")
    mSleep(10000)
    init("com.z2live.battlenations1",0)

    hx,hy=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,60)

    if hx~=-1 and hy~=-1 then     -- found the little house
      appendLog("mm.log", "relaunch battlenations: success")
      return true
    end
  end

  appendLog("mm.log", "relaunch battlenations: failed")
  return false
end

function saveScreen(filename,x,y,x1,y1,reason)
  snapshot(filename,x,y,x1,y1)
  appendLog("mm.log","screen saved in "..filename)
end

function appendLog( logfile, str )
  initLog(logfile,0)
  wLog(logfile, str )
  closeLog(logfile)
end

function bigFootFloor(count)
  t_start=os.time()
  tic=0
  failure = 0

  for i=1,count do
    resetIDLETimer()
    b_start=os.time()
    tic=tic+1

    mSleep(200)
    click(1419,407)   --1. X
    click(895,1023)   --2 Occ
    click(820,975)    --3 battle

    rx,ry=waitForImage("begin_grey_esv.png",90,740,1904,794,1940,0,30)  --Wait the round grey button for 30 seconds
    if rx==-1 and ry==-1 then
      return false
    end

    deployTroop()

    click(764,1913)          --11 begin

    rounds,finished,bigone = proceedAttackSequence()   -- Proceed the attack plan

    if finished==false then
      failure=failure+1
      for i=1,2 do
        click(196,1970)             -- push pullback button 2 times
        mSleep(200)
      end
      vict_dialog()
      appendLog("mm.log","Battle failed #"..string.format("%d",failure))
    else
      failure=0
    end
    
    if failure==5 then
      return false        -- too many fails
    end

    rx,ry = waitForImage("smallhouse_v.png",90,171,1881,904,2047,0,35)

    if bigone==true then
      bf="Y"
    else
      bf="N"
    end

    if rx~=-1 and ry~=-1 then
      now=os.time()
      bt=now-b_start
      tt=now-t_start
      appendLog("mm.log", "BBF:"..bf..string.format(" %d rounds, %d sec, Totally %d sec, battle %d, %4.1f sec/battle,%d SP", 
                                                      rounds, bt, tt, tic, tt/tic, tic*267))
    else
      return false      -- home land not found
    end

  end   -- end of for

  return true

end

--[[ Main code ]]
success=true

while success==true do

  fine=bigFootFloor( 500 )  

  if fine == false then     -- failed fighting on bigfoot land
    appendLog("mm.log", "Bigfoot's home is a mess, begin to clean it up")
    for i=1,3 do            -- try relaunch BN and go to bigfoot's home for 3 times

      success=reEnterBN()   -- kill and relaunch BN

      if success == false then
        appendLog("mm.log", "relaunch Battle nations app failed, locking device...")
        lockDevice()
      end

      click(adsafe.x,adsafe.y)

      clearLastBattle()

      mSleep(1000)
      click(1410,65)           -- World map button
      mSleep(5000)

      x,y=waitForImage("smallhouse_v.png",90,171,1881,1204,2047,0,25)

      if x~=-1 and y~=-1 then 
        sucess=gotoBigfootHome()
      else
        break                -- no smallhouse logo on world map
      end

      if sucess == true then  -- our troop is right on position
        appendLog("mm.log","Enter bigfoot land, ready to fight")
        break
      end

    end

  end

end

lockDevice()