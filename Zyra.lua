local ZyraMenu = Menu("Zyra", "Zyra")
PrintChat("Zyra Nirude LOADED")
ZyraMenu:SubMenu("Combo", "Combo")
ZyraMenu.Combo:Boolean("Q", "Use Q", true)
ZyraMenu.Combo:Boolean("W", "Use W", true)
ZyraMenu.Combo:Boolean("E", "Use E", true)

ZyraMenu:SubMenu("Ultimate", "Ultimate")
ZyraMenu.Ultimate:Boolean("R", "Use R", true)

ZyraMenu:SubMenu("Drawings", "Drawings")
ZyraMenu.Drawings:Boolean("Q", "Draw Q Range", true)
ZyraMenu.Drawings:Boolean("W", "Draw W Range", true)
ZyraMenu.Drawings:Boolean("E", "Draw E Range", true)

OnLoop(function(MyHero)
local Qrange = GetCastRange(myHero,_Q)
local Erange = GetCastRange(myHero, _E)
local Wrange = GetCastRange(myHero, _W)
local Rrange = GetCastRange(myHero, _R)

if IOW:Mode() == "Combo" then

local target = GetCurrentTarget()
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,500,Qrange-30,80,false,false)
local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,300,Wrange,80,false,true)
local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,300,Erange,80,false,false)

if CanUseSpell(myHero, _W) == READY and CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, Erange) and ZyraMenu.Combo.W:Value() then
                CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
	        end

if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, Qrange) and ZyraMenu.Combo.Q:Value() then
                CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
	        end
			
			
if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, Erange) and ZyraMenu.Combo.E:Value() then
                CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
				CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
				end	
            end
 
	 for i,enemy in pairs(GoS:GetEnemyHeroes()) do 
	local target = GetCurrentTarget()
	local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),600,2000,Rrange,80,false,false)
  
if CanUseSpell(myHero,_R) == READY and GoS:ValidTarget(enemy, Rrange) and ZyraMenu.Ultimate.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_W) + 560 + 1.0*(GetBonusAP(myHero)))) then
CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)   
	 end
	 end
	 
		if ZyraMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Qrange,1,100,0xff00ff00) end
		if ZyraMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Erange,1,100,0xff00ff00) end
		if ZyraMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,Wrange,1,100,0xff00ff00) end

end)
