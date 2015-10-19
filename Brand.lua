BrandMenu = Menu ("Brand", "Brand")
BrandMenu:SubMenu("Combo", "Combo")
BrandMenu.Combo:Boolean("Q", "Use Q", true)
BrandMenu.Combo:Boolean("W", "Use W", true)
BrandMenu.Combo:Boolean("E", "Use E", true)
BrandMenu.Combo:Boolean("R", "Use R", true)

BrandMenu:SubMenu("Drawings", "Drawings")
BrandMenu.Drawings:Boolean("Q", "Draw Q Range", true)
BrandMenu.Drawings:Boolean("W", "Draw W Range", true)
BrandMenu.Drawings:Boolean("E", "Draw E Range", true)
BrandMenu.Drawings:Boolean("R", "Draw R Range", true)



OnLoop(function(MyHero)

local Qrange = GetCastRange(myHero,_Q)
local Wrange = GetCastRange(myHero, _W)
local Erange = GetCastRange(myHero, _E)
local Rrange = GetCastRange(myHero, _R)

  if  IOW:Mode() == "Combo" then
      local target = GetCurrentTarget()
	  local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1400,300,Qrange,60,true,false)
	  local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1100,251,Rrange,70,false,false)
	  local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1300,251,Wrange,70,false,false)
	  
	  
	  	 	 if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, Qrange) and GoS:GetDistance(myHero, target) <= Qrange and BrandMenu.Combo.Q:Value() then
	 
	 CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
	 end
	 
	 
	   if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, Wrange) and GoS:GetDistance(myHero, target) <= Wrange and BrandMenu.Combo.W:Value() then
	 CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
	 end
	 
	  
	  	  if CanUseSpell(myHero,_E) == READY and BrandMenu.Combo.E:Value() and GoS:ValidTarget(target, Erange) and GoS:GetDistance(myHero, target) <= Erange then
	 CastTargetSpell(target,_E)
	 end
	 
	 
	   	  if CanUseSpell(myHero,_R) == READY and BrandMenu.Combo.R:Value() and GoS:ValidTarget(target, Rrange) and GoS:GetDistance(myHero, target) <= Rrange then
	 CastTargetSpell(target,_R)
	 end
	 

             

end

   if BrandMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Qrange,1,100,0xff00ff00) end
   if BrandMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Wrange,1,100,0xff00ff00) end
   if BrandMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Erange,1,100,0xff00ff00) end
   if BrandMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Rrange,1,100,0xff00ff00) end
   
end
)
