state("Rage64")
{
	int levelTimeMsec : 0x02289A88;
	string40 levelName : 0x41ACD90;
}

state("Rage")
{
	int levelTimeMsec : 0x010621C0;
	string40 levelName : 0x01062114;
}

init
{
	refreshRate = 60;

	vars.previousTimeMsec = 0;
	vars.levelBaseTimeMsec = 0;

	vars.startRemovalMsec = 38320; // Time between first level loading and player gaining control
	vars.endRemovalMsec = 28640; // Time between the end button is pressed and the last level change
}

update
{
	if(current.levelTimeMsec == 0 && old.levelTimeMsec != 0)
	{
		vars.previousTimeMsec += old.levelTimeMsec;
	}
	else if(old.levelTimeMsec == 0 && current.levelTimeMsec != 0)
	{
		vars.previousTimeMsec -= vars.levelBaseTimeMsec;
		vars.levelBaseTimeMsec = current.levelTimeMsec;
	}
}

start
{
	vars.previousTimeMsec = -vars.startRemovalMsec;
	vars.levelBaseTimeMsec = current.levelTimeMsec;

	return (old.levelTimeMsec == 160 && current.levelTimeMsec == 0);
}

split
{
	return ((old.levelTimeMsec == 0 && current.levelTimeMsec != 0) && (vars.levelBaseTimeMsec == 160));
}

isLoading
{
	return true;
}

gameTime
{
	if(old.levelName == "authority_base" && current.levelName == "subway_town")
	{
		vars.previousTimeMsec -= vars.endRemovalMsec;
	}

	return TimeSpan.FromMilliseconds(vars.previousTimeMsec + current.levelTimeMsec - vars.levelBaseTimeMsec);
}
