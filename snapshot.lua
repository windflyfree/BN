function click(x,y) 	
	touchDown(x,y)
	mSleep(50)
	touchUp(x,y)
	mSleep(150)
end

mSleep(5000) 
init("0",0)	
	--snapshot("in_v.png",1178,129,1178+20,129+20)		
		
--409 593  520 506
		
attackx,attacky=findImageInRegionFuzzy("in_v.png",80,0,0,1536-1,2048-1,0) 

		
dialog(attackx..attacky,5)
