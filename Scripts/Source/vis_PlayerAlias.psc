Scriptname vis_PlayerAlias Extends ReferenceAlias
{Handles a check to remove the spells/effects after some reports of them not removing properly came in}

Actor Property PlayerREF Auto;
vis_Util Property util Auto;
Keyword Property zad_DeviousBlindfold Auto;

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	
	If !PlayerREF.WornHasKeyword(zad_DeviousBlindfold)
		util.EndSpells();
	EndIf
	
EndEvent 