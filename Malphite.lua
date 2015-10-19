PrintChat("Malphite Nirude LOADED")
MalphiteMenu = Menu("Malphite", "Malphite")
MalphiteMenu:SubMenu("Combo", "Combo")
MalphiteMenu.Combo:Boolean("Q", "Use Q", true)
MalphiteMenu.Combo:Boolean("W", "Use W", true)
MalphiteMenu.Combo:Boolean("E", "Use E", true)
MalphiteMenu.Combo:Boolean("R", "Use R", true)


MalphiteMenu:SubMenu("Drawings", "Drawings")
MalphiteMenu.Drawings:Boolean("Q", "Draw Q Range", true)
MalphiteMenu.Drawings:Boolean("E", "Draw E Range", true)
MalphiteMenu.Drawings:Boolean("R", "Draw R Range", true)

OnLoop(function(MyHero)

local Qrange = GetCastRange(myHero,_Q)
local Erange = GetCastRange(myHero, _E)
local Rrange = GetCastRange(myHero, _R)

   if  IOW:Mode() == "Combo" then
    local target = GetCurrentTarget()
	local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,251,Rrange,70,false,false)
   
    if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, Rrange) and GoS:GetDistance(myHero, target) <= Rrange and MalphiteMenu.Combo.R:Value() then
	CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
	end
	
	 if CanUseSpell(myHero,_W) == READY and MalphiteMenu.Combo.W:Value() and GoS:ValidTarget (target, Erange) then
	 CastSpell(_W)
	 end
	 

   if CanUseSpell(myHero,_Q) == READY and MalphiteMenu.Combo.Q:Value() and GoS:ValidTarget (target, Qrange) then
                                        CastTargetSpell(target,_Q)
                                end
								
								 if CanUseSpell(myHero,_E) == READY and MalphiteMenu.Combo.E:Value() and GoS:ValidTarget (target, Erange) then
								 CastSpell(_E)
								 
								 end
   end

   
   
   if MalphiteMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Qrange,1,100,0xff00ff00) end
   if MalphiteMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Erange,1,100,0xff00ff00) end
   if MalphiteMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Rrange,1,100,0xff00ff00) end
   
end

)
