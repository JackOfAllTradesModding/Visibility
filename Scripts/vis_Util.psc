Scriptname vis_Util extends Quest  
{Handles the "magic." Ha Ha Ha. I entertain myself.}

Spell Property vis_LifeWrapperSpell Auto
Spell Property vis_DeadWrapperSpell Auto

MagicEffect Property vis_LifeEnemyExt Auto
MagicEffect Property vis_LifeEnemyInt Auto
MagicEffect Property vis_LifeFriendExt Auto
MagicEffect Property vis_LifeFriendInt Auto

MagicEffect Property vis_UndeadEnemyExt Auto
MagicEffect Property vis_UndeadEnemyInt Auto
MagicEffect Property vis_UndeadFriendExt Auto
MagicEffect Property vis_UndeadFriendInt Auto

Actor Property PlayerREF Auto

vis_MCM Property config Auto

Function StartSpells()
	If (config.bLife)
		;Life enabled
		;Set Value 
		int iLife = config.fLife as int;
		vis_LifeEnemyExt.SetArea(iLife + 50);
		vis_LifeEnemyInt.SetArea(iLife - 50);
		vis_LifeFriendExt.SetArea(iLife + 50);
		vis_LifeFriendInt.SetArea(iLife - 50);
		
		PlayerREF.AddSpell(vis_LifeWrapperSpell, False);
		vis_LifeWrapperSpell.Cast(PlayerREF, PlayerREF);
	EndIf
	
	If (config.bDead)
		;Undead enabled
		;Set Value 
		int iDead = config.fDead as int;
		vis_UndeadEnemyExt.SetArea(iDead + 50);
		vis_UndeadEnemyInt.SetArea(iDead - 50);
		vis_UndeadFriendExt.SetArea(iDead + 50);
		vis_UndeadFriendInt.SetArea(iDead - 50);
		
		PlayerREF.AddSpell(vis_DeadWrapperSpell, False);
		vis_DeadWrapperSpell.Cast(PlayerREF, PlayerREF);
	EndIf
EndFunction

Function EndSpells()
	;Dispel Spells
	PlayerREF.DispelSpell(vis_LifeWrapperSpell)
	PlayerREF.DispelSpell(vis_DeadWrapperSpell)
EndFunction

Function ResetSpells()
	EndSpells();
	StartSpells();
EndFunction 