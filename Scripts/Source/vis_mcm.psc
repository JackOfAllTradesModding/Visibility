ScriptName VIS_MCM Extends SKI_ConfigBase
{MCM for Visibility}

Bool Property bLife Auto;
Bool Property bDead Auto;
Bool Property bOther Auto;

Float Property fLife Auto;
Float Property fDead Auto;
Float Property fOther Auto;

vis_Util Property util Auto;

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
	AddSliderOptionST("LifeSlider", "Range", fLife, "{1}");
	AddToggleOptionST("DetectDead", "Detect Dead", bDead);
	AddSliderOptionST("DeadSlider", "Range", fDead, "{1}");
	;AddToggleOptionST("DetectOther", "Detect Others", bOther);
	;AddSliderOptionST("OtherSlider", "Range", fOther, "{1}");
	
EndEvent 

State DetectLife
	Event OnSelectST()
		bLife = !bLife;
		SetToggleOptionValueST(bLife);
	EndEvent
	
	Event OnDefaultST()
		bLife = True;
		SetToggleOptionValueST(bDead);
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Toggles the detection of living actors, daedra, and automatons");
	EndEvent
EndState 

State LifeSlider
	Event OnSliderOpenST()
		SetSliderDialogStartValue(fLife)
		SetSliderDialogDefaultValue(150)
		SetSliderDialogRange(20, 300)
		SetSliderDialogInterval(10)
	EndEvent
	
	Event OnSliderAcceptST(Float val)
		fLife = val;
		util.ResetSpells();
		SetSliderOptionValueST(fLife);		
	EndEvent
	
	Event OnDefaultST()
		fLife = 150;
		util.ResetSpells();
		SetSliderOptionValueST(fLife);		
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Sets the range of the detect Life effect. Note: Indoors is this -50 and Outdoors is this +50");
	EndEvent
EndState

State DetectDead
	Event OnSelectST()
		bDead = !bDead;
		SetToggleOptionValueST(bDead);
	EndEvent
	
	Event OnDefaultST()
		bDead = True;
		SetToggleOptionValueST(bDead);
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Toggles the detect dead effect");
	EndEvent
EndState 

State DeadSlider
	Event OnSliderOpenST()
		SetSliderDialogStartValue(fDead)
		SetSliderDialogDefaultValue(150)
		SetSliderDialogRange(20, 300)
		SetSliderDialogInterval(10)
	EndEvent
	
	Event OnSliderAcceptST(Float val)
		fDead = val;
		util.ResetSpells();
		SetSliderOptionValueST(fDead);		
	EndEvent
	
	Event OnDefaultST()
		fDead = 150;
		util.ResetSpells();
		SetSliderOptionValueST(fDead);		
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Sets the range of the detect Dead effect. Note: Indoors is this -50 and Outdoors is this +50");
	EndEvent
EndState

State DetectOther
	Event OnSelectST()
		bOther = !bOther;
		SetToggleOptionValueST(bOther);
	EndEvent
	
	Event OnDefaultST()
		bOther = True;
		SetToggleOptionValueST(bOther);
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Toggles the detection of Daedra and Automatons");
	EndEvent
EndState 