

--             category  ,page  ,pos  ,number
home_units = { 
	       {cat="vehicles",page=1,pos=15,num=1}, 
		   {cat="critters",page=0,pos=1,num=2},       -- mammoth
          {cat="aircraft",page=0,pos=16,num=3},
		  {cat="critters",page=0,pos=1,num=2} 
		  }            -- aero jetpack trooper

	  


home_a_seq={  -- unit location,wp,getskill(what skill，how many mark?)
    {row=1,col=3,wpx=Skill_x,wpy=getSkill(2,1),drag=false,time=0}, 
	{row=1,col=2,wpx=Skill_x,wpy=getSkill(3,2),drag=false,time=0},
    {row=1,col=4,wpx=Skill_x,wpy=getSkill(3,2),drag=false,time=0},  
	{row=2,col=3,wpx=Skill_x,wpy=getSkill(1,1),drag=false,time=0}, 
	{row=1,col=1,wpx=Skill_x,wpy=getSkill(3,2),drag=false,time=0}, 
	{row=1,col=5,wpx=Skill_x,wpy=getSkill(3,2),drag=false,time=0},  
	{row=2,col=2,wpx=Skill_x,wpy=getSkill(1,1),drag=false,time=0}, 
    {row=2,col=4,wpx=Skill_x,wpy=getSkill(1,1),drag=false,time=0}    
}   


