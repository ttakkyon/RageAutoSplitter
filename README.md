# RageSplit
LiveSplit Auto Split Script for Rage. Uses a game timer that omits loading time, menu time etc. The script also does automatic splits when entering new levels, automatically starts the timer when entering game from main menu and negates the start and end cutscene time from the run time.

This timer stays as compatible as possible with the old timing method (the games reported play time) while removing the flaw of floored second values at each game load. It's also possible to create and load saves during runs with this timer, which normally would revert the play time to the saved state with the old method.

Remember to put the *Compare Against* option in LiveSplit to *Game Time* to display the correct timer.

Currently supported versions:
- 64-bit (1.1700.354669) and 32-bit (1.1700.342015) - [[Steam](http://store.steampowered.com/app/9200)]
