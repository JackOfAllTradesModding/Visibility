Scriptname vis_Wrapper extends activemagiceffect  
{Handles the "magic." Ha Ha Ha. I entertain myself.}

Spell Property vis_LifeWrapperSpell Auto
Spell Property vis_DeadWrapperSpell Auto
Actor Property PlayerREF Auto

vis_MCM Property config Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (config.bLife)
		PlayerREF.AddSpell(vis_LifeWrapperSpell, False);
		vis_LifeWrapperSpell.Cast(PlayerREF, PlayerREF);
	EndIf
	
	If (config.bDead)
		PlayerREF.AddSpell(vis_DeadWrapperSpell, False);
		vis_DeadWrapperSpell.Cast(PlayerREF, PlayerREF);
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	PlayerREF.DispelSpell(vis_LifeWrapperSpell)
	PlayerREF.DispelSpell(vis_DeadWrapperSpell)
EndEvent 