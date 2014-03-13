function click(x,y) 	
	touchDown(x,y)
	mSleep(50)
	touchUp(x,y)
	mSleep(150)
end

mSleep(5000) 
init("0",0)	
--		snapshot("attack_v.png",670,281,781,293)		
		
--409 593  520 506
		
attackx,attacky=findImageInRegionFuzzy("attack_v.png",80,200,150,1400,1900,0) 

		
click(attackx,attacky)
mSleep(500)
click(attackx+119,attacky-87)