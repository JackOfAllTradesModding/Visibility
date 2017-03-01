ScriptName VIS_MCM Extends SKI_ConfigBase
{MCM for Visibility}

GlobalVariable Property DetectLifeTog Auto;
GlobalVariable Property DetectDeadTog Auto;
GlobalVariable Property DetectOtherTog Auto;

Bool Property bLife Auto;
Bool Property bDead Auto;
Bool Property bOther Auto;

Float Property fLife Auto;
Float Property fDead Auto;
Float Property fOther Auto;


Event OnInit()

	bLife = True;
	bDead = True;
	bOther = True;
	
	fLife = 150;
	fDead = 150;
	fOther = 150;

EndEvent

Event OnPageReset(String Page)

	SetCursorFillMode(LEFT_TO_RIGHT);
	SetCursorPosition(0);
	AddHeaderOption("Toggle Effects");
	AddEmptyOption();
	AddToggleOptionST("DetectLife", "Detect Life", bLife);
	;AddSliderOptionST("LifeSlider", "Range", fLife, "{1}");
	AddToggleOptionST("DetectDead", "Detect Dead", bDead);
	;AddSliderOptionST("DeadSlider", "Range", fDead, "{1}");
	;AddToggleOptionST("DetectOther", "Detect Others", bOther);
	;AddSliderOptionST("OtherSlider", "Range", fOther, "{1}");
	
EndEvent 

State DetectLife

	Event OnSelectST()
		bLife = !bLife;
		If (bLife)
			DetectLifeTog.SetValue(1)
		Else
			DetectLifeTog.SetValue(0)
		EndIf
	EndEvent
	
	Event OnDefaultST()
		bLife = True;
		DetectLifeTog.SetValue(1)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Toggles the detection of living actors, daedra, and automatons");
	EndEvent

EndState 

State DetectDead

	Event OnSelectST()
		bDead = !bDead;
		If (bDead)
			DetectDeadTog.SetValue(1)
		Else
			DetectDeadTog.SetValue(0)
		EndIf
	EndEvent
	
	Event OnDefaultST()
		bDead = True;
		DetectDeadTog.SetValue(1)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Toggles the detect dead effect");
	EndEvent

EndState 

State DetectOther

	Event OnSelectST()
		bOther = !bOther;
		If (bOther)
			DetectOtherTog.SetValue(1)
		Else
			DetectOtherTog.SetValue(0)
		EndIf
	EndEvent
	
	Event OnDefaultST()
		bOther = True;
		DetectOtherTog.SetValue(1)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Toggles the detection of Daedra and Automatons");
	EndEvent

EndState 