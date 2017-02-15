state("Rage64")
{
	int levelTimeMsec : 0x02289A88;
}

state("Rage")
{
	int levelTimeMsec : 0x010621C0;
}

init
{
	refreshRate = 60;

	vars.previousTimeMsec = 0;
	vars.levelBaseTimeMsec = 0;
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
	vars.previousTimeMsec = 0;
	vars.levelBaseTimeMsec = current.levelTimeMsec;
	return true;
}

split
{
	return (old.levelTimeMsec == 0 && current.levelTimeMsec != 0) && (vars.levelBaseTimeMsec == 160);
}

isLoading
{
	return true;
}

gameTime
{
	return TimeSpan.FromMilliseconds(vars.previousTimeMsec + current.levelTimeMsec - vars.levelBaseTimeMsec);
}
