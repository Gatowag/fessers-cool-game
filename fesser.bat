@ECHO OFF

::allows variables to update inside loops
SETLOCAL ENABLEDELAYEDEXPANSION

TITLE FESSER'S COOL GAME

::variables that might be customized
set /a "progress=0"
set /a "deaths=0"
set /a "percent=100"
set /a "ending1=0"
set /a "ending2=0"
set /a "ending3=0"
set /a "ending4=0"
set /a "ending5=0"
set /a "ending6=0"
set calc_match=get calculator
set scrt_match=go away bad guys
set scrt_match_caps=GO AWAY BAD GUYS
set healthbar=[     ]

call :welcome

:welcome
	echo   Congratulations on completing your first day of ACOUSTICS 01
	echo   at Janneman State^^! This is not an accredited course.
	echo:
	echo   We learned so much today, so I have a reward for you.
	echo:
	echo    ______________________________________________________
	echo   ^|    __      __      __      __      __      __        ^|
	echo   ^|___/__\____/__\____/__\____/__\____/__\____/__\_______^|
	echo   ^|       \__/    \__/    \__/    \__/    \__/    \__/   ^|
	echo   ^|______________________________________________________^|
	echo:
	echo:
	echo Would you like to play a game? [Y/N]
	choice /c YNX /n /m "> "

	::if user wants to play the game
	if %ERRORLEVEL% == 1 (
		cls
		call :difficulty_setting
	)
	::if the user does not want to play the game
	if %ERRORLEVEL% == 2 (
		cls
		echo   This is the ultimate expression of cowardace.
		echo:
		echo Press any key to exit.
		echo:
		pause>nul
		exit
	)
	REM if X is pressed: clear screen and close
	if  %ERRORLEVEL% == 3 (
		cls
		exit
	)

::this keeps cmd open so the user can see the logs after the task is finished
pause
::close cmd when key is pressed
goto :eof

:play_again
	echo:
	echo:
	if !progress! geq 5 (
		echo Give it one last go? [Y/N]
		choice /c YNX /n /m "> "
	) else (
		echo Would you like to play again? [Y/N]
		choice /c YNX /n /m "> "
	)

	::if user wants to play the game
	if %ERRORLEVEL% == 1 (
		cls
		call :difficulty_setting
	)
	::if the user does not want to play the game
	if %ERRORLEVEL% == 2 (
		cls
		set /a "percent=16*progress"
		if not !percent! == 96 (
			echo   You only completed !percent!%% of the game.
			echo   No achievement has been rewarded.
		) else (
			echo   You did complete !percent!%% of the game,
			echo   however you never found the true ending.
		)
		echo:
		echo Press any key to exit.
		echo:
		pause>nul
		exit
	)
	REM if X is pressed: clear screen and close
	if  %ERRORLEVEL% == 3 (
		cls
		exit
	)

:newprogress
	set /a "progress=ending1+ending2+ending3+ending4+ending5+ending6"
	set /a "deaths+=1"
	exit /b

:healthbar
	if !progress! == 0 set healthbar=[______]
	if !progress! == 1 set healthbar=[-     ]
	if !progress! == 2 set healthbar=[--    ]
	if !progress! == 3 set healthbar=[---   ]
	if !progress! == 4 set healthbar=[----  ]
	if !progress! == 5 set healthbar=[----- ]
	if !progress! == 6 set healthbar=[++++++]
	
	echo ENDINGS: !healthbar!
	echo:
	exit /b

:difficulty_setting
	TITLE ACADEMIA SIMULATOR 0.1a
	echo Please choose a difficulty setting for your game.
	echo:
	
	if !ending1! == 0 (
		echo   [E] EASY
	) else (
		echo   [ ] EASY
	)
	echo   This is for players who believe in the dream of higher education institutions.
	echo:
	set /a "hard_endings=ending2+ending3+ending4+ending5"
	if !hard_endings! == 4 (
		echo   [ ] HARD
	) else (
		echo   [H] HARD
	)
	echo   This is for normal people.
	echo:
	if !progress! == 5 (
		echo   [C] CHEAT
		echo   This is for players who can't get past the grue.
	)
	echo:
	
	echo What do you choose?
	choice /c EHCX /n /m "> "
	
	if %ERRORLEVEL% == 1 (
		cls
		call :good_ending
		exit /b
	)
	if %ERRORLEVEL% == 2 (
		cls
		call :game_start
		exit /b
	)
	if %ERRORLEVEL% == 3 (
		cls
		if !progress! == 0 (
			call :stats
			exit /b
		) else (
			call :cheater
			exit /b
		)
	)
	if %ERRORLEVEL% == 4 (
		cls
		exit
	)

:good_ending
	set /a "ending1=1"
	call :newprogress
	call :healthbar
	echo   You win^^!
	echo:
	echo   You walk outside with no student loans.
	echo   A recruiter hires you on the spot; no luck involved. You earned it^^!
	echo   You completed the life-long task of learning^^! You know everything now.
	echo   You have no existential dread and everybody loves you.
	echo:
	echo   THE END
	echo   Thanks for playing.

	call :play_again
	exit /b

::ask user for layout preferences
:game_start
	call :healthbar
	echo   You find yourself in a recently abandoned classroom.
	echo   You stuff some heavy books into your backpack.
	echo   They're the most expensive books you own and you've never read them.
	echo:
	echo   There are three doors to leave this room.
	echo:
	echo      ___==__________________
	echo     ^|       _________       ^|
	echo     ^|      [_________]      ^|
	echo    ^|^|                       ^|^|
	echo     ^|                       ^|
	echo     ^|  [ ] [ ] [ ] [ ] [ ]  ^|
	echo     ^|  [ ] [X] [ ] [ ] [ ]  ^|
	echo     ^|  [ ] [ ] [ ] [ ] [ ]  ^|
	echo     ^|  [ ] [ ] [ ] [ ] [ ]  ^|
	echo     ^|                       ^|
	echo      -----------------------
	echo:
	if !ending2! == 0 (
		echo   [N] go North
	) else (
		echo   [ ] go North
	)
	if !ending3! == 0 (
		echo   [W] go West
	) else (
		echo   [ ] go West
	)
	if !ending4! == 0 (
		echo   [E] go East
	) else (
		echo   [ ] go East
	)
	if !ending5! == 0 (
		if !hard_endings! == 3 (
			echo   [?]
		)
	) else (
		echo   [ ] go away bad guys
	)
	
	echo:
	echo:
	echo Where do you go?
	choice /c NWE9X /n /m "> "
	REM if N is pressed: clear screen, run :custom_dimensions, and eventually close :customizations
	if  %ERRORLEVEL% == 1 (
		cls
		call :north
		exit /b
	)
	REM if W is pressed: clear screen, run: custom_banner, and eventually close :customizations
	if  %ERRORLEVEL% == 2 (
		cls
		call :west
		exit /b
	)
	REM if E is pressed: clear screen, run: custom_color, and eventually close :customizations
	if  %ERRORLEVEL% == 3 (
		cls
		call :east
		exit /b
	)
	REM if E is pressed: clear screen, run: custom_color, and eventually close :customizations
	if  %ERRORLEVEL% == 4 (
		cls
		echo input the code:

		call :secret_loop
	)
	REM if X is pressed: clear screen and close
	if  %ERRORLEVEL% == 5 (
		cls
		exit
	)
		
	exit /b

:secret_loop
	set /p "secret=> "
	if !secret! == !scrt_match! (
		cls
		call :secret
		exit /b
	) else if !secret! == !scrt_match_caps! (
		cls
		call :secret
		exit /b
	) else if !secret! == x (
		cls
		exit
	) else (
		echo Code is incorrect, access denied.
		echo:
		call :secret_loop
		exit /b
	)

	echo   Command not recognized.
	echo:
	call :secret_loop

:north
	set /a "ending2=1"
	call :newprogress
	call :healthbar
	echo   You turn the doorknob, but the door doesn't budge.
	echo   Damn budget cuts^^!
	echo:
	echo   You start to panic because you've got an exam in your next class.
	echo   You can't afford to be late.
	echo:
	echo   The door still won't open. You're aggressively jostling it.
	echo   All the noise attracts a grue. It eats you and steals your scholarship.
	echo:
	echo   You never learned the true spirit of academia,
	echo   but the grue got a Masters in business and is now a big shot CEO.
	echo:
	echo   GAME OVER
	echo   Thanks for playing.
	
	call :play_again
	exit /b

:west
	set /a "ending3=1"
	call :newprogress
	call :healthbar
	echo   You exit through the West door.
	echo   Your backpack vanishes as you walk through the Arch.
	echo   ... it was a Holodeck episode^^!
	echo:
	echo   Usually there are some folks roaming about this deck,
	echo   but it's unusually desolate.
	echo   You realize the ship is on red alert -- and you're a red shirt.
	echo   You tap your combadge but nobody responds.
	echo:
	echo   Forgetting to turn in your homework is the last of your worries^^!
	echo:
	echo   Somebody transports next to you. IT'S A GRUE^^!
	echo   You try to do that ridiculous Kirk punch but it's wildly ineffective.
	echo   The grue eats you, effortlessly.
	echo:
	echo   Maybe if you didn't spend so much time in the holodeck
	echo   you could have avoided this agonizing death entirely.
	echo:
	echo   GAME OVER
	echo   Thanks for playing.

	call :play_again
	exit /b

:east
	call :healthbar
	echo   You walk directly into the East door.
	echo   You thought it was a push but it's a pull.
	echo   Classic academic blunder^^!
	echo:
	echo   On the other side, you find yourself standing on a theatre stage. It's dark,
	echo   but you can tell that the seats are filled. The audience falls silent.
	echo:
	echo   A spotlight whips across the room.
	echo   It lands on a marble pedestal, shining brilliantly on a used graphing calculator.
	echo:
	echo     __________________
	echo   / o o o o o o  ---  ^|
	echo   ^| o o o o o o ^|   ^| ^|
	echo   ^| o o o o  .  ^|   ^| ^|
	echo   \ o o o o -+-  ---  ^|
	echo    ----------'--------
	echo:
	echo   Type 'get calculator' to get it.
	echo:
	echo:
	call :calc_loop

:calc_loop
	set /p "command=> "
	if !command! == !calc_match! (
		cls
		call :east2
		exit /b
	) else if !command! == x (
		cls
		exit
	)

	echo   Command not recognized.
	echo:
	call :calc_loop

:east2
	set /a "ending4=1"
	call :newprogress
	call :healthbar
	echo   You grab the calculator. The crowd erupts into a standing ovation^^!
	echo   With every new equation you chart onto the graph,
	echo   the audience hoots and hollers even louder.
	echo:
	echo   You've never felt so alive before.
	echo   Your hands are trembling from the adrenaline.
	echo   You don't even notice that the text on screen is fading.
	echo:
	echo   Your batteries have run dry.
	echo   The audience is confused and starting to turn on you.
	echo   You begin sweating. You're not sure how to proceed.
	echo:
	echo   You gesture for stage hands to run fresh batteries on stage,
	echo   but your sweaty hands lose grip on the calculator.
	echo   It drops to the stage in slow motion, the sudden silence
	echo   makes the clatter all the more agonizing. As you look up,
	echo   the house lights fade on.
	echo:
	echo   Only now do you realize the entire audience is made of grues.
	echo   Grues viciously respect maths. Everybody knows this.
	echo   You try to flee backstage, but the crew pushes you back.
	echo   You now realize they were just keeping the grues complacent.
	echo:
	echo   As the grues swarm the stage, you dive for the calculator and mash.
	echo   With its last moment of charge, you divide by 0.
	echo   The grues frenzy and eat you alive. They protect the calculator
	echo   from any further injustice by your hand.
	echo:
	echo   GAME OVER
	echo   Thanks for playing.

	call :play_again
	exit /b
	
:cheater
	set /a "ending6=1"
	call :newprogress
	call :healthbar
	echo   You hit tilde to show the console.
	echo   You activate noclip mode. Despicable.
	echo:
	echo   As you effortlessly pass through the walls of the room,
	echo   you see uncountable grues. They lurk in every corner^^!
	echo:
	echo   How is it that you've never seen a *real* grue,
	echo   yet so many torment you here? So unrealistic.
	echo:
	echo   You activate god mode and give yourself unlimited ammo.
	echo   You spend 10 minutes obliterating every grue you can find.
	echo:
	echo   It was satisfying at first, but the novelty quickly wears off.
	echo   THIS is what it means to cheat on my assignments.
	echo   ALWAYS REMEMBER THAT^^!
	echo:
	echo   You get the dopamine hit, sure, but you rob yourself of personal growth.
	echo   The spirit of academia is the hardship of enduring constant grue attacks,
	echo   and students...
	echo:
	echo   I am the grue.
	echo:
	echo   GAME OVER
	echo   Thanks for playing.
	
	echo:
	echo Press [F] for stats.
	choice /c F /n /m "> "
	
	if %ERRORLEVEL% == 1 (
		cls
		call :stats
		exit /b
	)

:stats
	cls
	call :healthbar
	set /a "percent=16*progress"
	echo   [######### ] 98%% of players died honorably to a grue.
	echo   [####      ] 35%% of players shamefully cheated.
	echo   [#         ] 2%% of players accidentally entered cheat mode early and
	echo   ............ realized they can just skip straight to this screen.
	echo:
	echo   You died !deaths! times.
	echo:
	if !percent! == 96 (
		echo   You have completed 100%% of the game^^!
		echo   This is the true ending.
	) else if !percent! == 0 (
		echo   "You cheated not only the game, but yourself. You didn't grow.
		echo   You didn't improve. You took a shortcut and gained nothing.
		echo   You experienced a hollow victory. Nothing was risked and nothing was gained.
		echo   It's sad that you don't know the difference."
	) else (
		echo   You have completed !percent!%% of the game.
		echo   There is more to discover.
	)
	echo:
	echo Press any key to exit.
	pause>nul
	exit

:secret
	cls
	set /a "ending5=1"
	call :newprogress
	call :healthbar
	echo   You stand on your desk and shout at the top of your lungs,
	echo   G O   A W A Y   B A D   G U Y S ^^!
	echo:
	echo   You see grotesque silhouettes behind every door scatter.
	echo   You feel powerful; that line's never actually worked before^^!
	echo:
	echo   You now realize how simple it's always been to defend yourself.
	echo   You open a self-defense dojo where you teach people
	echo   how to yell "Go away bad guys^!" at various attackers.
	echo:
	echo   You're riding high on the success until a grue enrolls in your class.
	echo   You struggle to put aside your prejudice against it.
	echo   Another instructor has to take over the class.
	echo:
	echo   It's late, you're walking back to your car when you hear a voice.
	echo   It growls, "Hey^! Hey you^!" You're stopped mid-step, stunned, keys in hand.
	echo   As you slowly turn toward the voice--it whispers
	echo   "go away bad guy."
	echo:
	echo   You run like you've never run before. You never stop running.
	echo:
	echo   GAME OVER
	echo   Thanks for playing.
	set /a "ending5=1"
	call :play_again
	exit /b