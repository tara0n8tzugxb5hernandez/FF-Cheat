@echo off
setlocal enabledelayedexpansion
set "file=%APPDATA%\Future_Fragments\ffdata_slot_1.sav"


:choice
echo What do you want to modify?
echo 1. Ideals
echo 2. Level.
echo 3. Powerups.
echo 4. All level progress, skip forced dialogue.
set /p main_choice="What's your decision: "

if "%main_choice%"=="1" goto Ideals
if "%main_choice%"=="2" goto Levels
if "%main_choice%"=="3" goto Powerups
if "%main_choice%"=="4" goto Speedrun


:Ideals
echo Which Ideal do you want to modify?
echo 1. Kindness
echo 2. Hatred
echo 3. Justice
echo 4. Optimism
echo 5. Pessimism
echo 6. Pacifism
echo 7. Violence
echo 8. Sexuality
set /p ideal_choice="Enter the number corresponding to the Ideal you want to modify: "

if "%ideal_choice%"=="1" (
    set ideal=Kindness
    set modify=10=
    goto patch
)

if "%ideal_choice%"=="2" (
    set ideal=Hatred
    set modify=11=
    goto patch
)

if "%ideal_choice%"=="3" (
    set ideal=Justice
    set modify=12=
    goto patch
)

if "%ideal_choice%"=="4" (
    set ideal=Optimism
    set modify=13=
    goto patch
)

if "%ideal_choice%"=="5" (
    set ideal=Pessimism
    set modify=14=
    goto patch
)

if "%ideal_choice%"=="6" (
    set ideal=Pacifism
    set modify=15=
    goto patch
)

if "%ideal_choice%"=="7" (
    set ideal=Violence
    set modify=16=
    goto patch
)

if "%ideal_choice%"=="8" (
    set ideal=Sexuality
    set modify=17=
    goto patch
)

:patch
if defined ideal (
    set /p new_value="Enter the new value for %ideal%, the max is 998: "
    
    rem Add quotation marks to the new value
    set "new_value="!new_value!""

    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,3!"=="%modify%" (
            echo %modify%!new_value!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        echo %ideal% has been updated.
        goto game_over
    ) else (
        echo Unable to find %ideal% for modification.
        goto game_over
    )
) else (
    echo Invalid Ideal choice.
    goto game_over
)

:Levels
echo Which level do you want to go to?
echo 1. Fire
echo 2. Ice
echo 3. Electric
echo 4. Earth
echo 5. The End
set /p level_choice="Level: "

if "%level_choice%"=="1" (
    set modify=0=
    set level=0
    goto level_patch
)
if "%level_choice%"=="2" (
    set modify=0=
    set level=1
    goto level_patch
)
if "%level_choice%"=="3" (
    set modify=0=
    set level=2
    goto level_patch
)
if "%level_choice%"=="4" (
    set modify=0=
    set level=3
    goto level_patch
)
if "%level_choice%"=="5" (
    set modify=0=
    set level=4
    goto level_patch
)
:level_patch
if defined level (    
    rem Add quotation marks to the new value
    set "newlevel="!level!""
    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,2!"=="%modify%" (
            echo %modify%!newlevel!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        echo Level has been updated.
        goto game_over
    ) else (
        echo That's wrong.
        goto game_over
    )
) else (
    echo That's not a level.
    goto game_over
)

:Powerups
echo What do you want?
echo 1. Unlock all
echo 2. Lock all
set /p power_choice="Make up your mind: "

if "%power_choice%"=="1" (
    set powers=111111111111111111111111111111111111111111111111111
    set modify=7=
    goto powerup_patch
)
if "%power_choice%"=="2" (
    set powers=000000000000000000000000000000000000000000000000000
    set modify=7=
    goto powerup_patch
)

:powerup_patch
if defined power_choice (
    set "powers="!powers!""
        (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,2!"=="%modify%" (
            echo %modify%!powers!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        echo Level has been updated.
        goto game_over
    ) else (
        echo That's wrong.
        goto game_over
    )
) else (
    echo That's not a level.
    goto game_over
)

:Speedrun
echo Skip all progress and forced dialogue?
echo 1. Yes
echo 2. No
set /p Speed_choice="Option: "

if "%Speed_choice%"=="1" (
    set specialflag=elpprog4:1 firepprog2:1 elpprogp2nopac:1 p2m4.map:1 elpprog6:1 elpprog2:1 firepprog4:1 earthpprog4:1 icepprog2:1 earthpprog6:1 icepprog4:1 ffppuS3:1 earthpprog2:1 elpprog1:1 firepprog3:1 elpprog5:1 ffppu3:1 elpprogp1nopac:1 firepprog5:1 elpprogp3nopac:1 elpprog3:1 firepprog1:1 elpprogp5nopac:1 earthpprog1:1 icepprog3:1 earthpprog5:1 ducklings:0 icepprog1:1 earthpprog3:1 icepprog5:1 p1m1.map:1 ducklings:0
    set specialflag_Modify=specialFlags=
    set csflag=SVieIceHub1st:1 PathVineDestroyed:6 EarthPath1Done:1 chamber2doneflag:1 lastfriendflag:1 SVieFireHub1st:1 FirePath4Done:1 chamber6doneflag:1 FayeIceP2M2PosPlus:1 FayeEarthP4M4:1 SVieFireBossVent1st:1 EarthPath6Done:1 prematureleaving:1 p5m2flag:1 FirePath3Done:1 IcePath1Done:1 2ndfriendflag:1 SeeFayePreFire:1 1stfriendflag:1 FirstTimeBackFire:1 firePreboss:1 FayeElecP2M2:1 SVieFireScenes:2 FayeReputation:1 kc_botspider:2 FirstMapArrived:1 alphafriendfragment:1 chamber3doneflag:1 respawn_count:5 ReadDatabankPreFire:1 FireBossLossReturn:1 FayeIceP2M2:1 fragmentcount:1 Rusegarn1st:1 FragmentAppearB:1 FayeFireP2M3NeuPlus:1 FayeEarthP4M4PosPlus:1 FayeIceP2M2Pos1Plus:1 P5M4Pit:1 FireVentsOpened:5 kc_total:15 p4m2secbot:1 EarthPath3Done:1 kc_botsecurity:2 ReturnedToFirePad2nd:1 FayeFireP2M3:1 IcePath4Done:1 EarthPath4Done:1 p4m1flag:1 fragment_count:1 FirePath1Done:1 securitybottutflag:1 ADMNSpawnerFirst:1 FacilityCurious:1 IcePath3Done:1 earthDoorOpen:1 p3m4flag:1 chamber4doneflag:1 kc_botjumper:4 p2m2flag:1 DisplayObj:1 attack_total:301 FirePath2Done:1 kc_electricgrunt:7 p1m1secbot:1 FireBossLoss:1 SVieFireBossVentPre:1 FirePath5Done:1 IceCrownFound:5 prefireswitchtimer:54 securityp1m1crushed:1 chamber1doneflag:1 EarthPath5Done:1 chamber5doneflag:1 chamberscompletedflag:7 IcePath2Done:1 EarthPath2Done:1 securityp2m4crushed:1 3rdfriendflag:1 IcePath5Done:1 OpeningSequence:1 p6m2secbot:1 TaskerAware:1 FayeElecP2M2PosPlus:1 protectfriendsflag:1 securitybottutcheck:1
    set csflag_modify=csFlags=
    goto speed_patch
)

if "%Speed_choice%"=="2" (
    goto game_over
)


:speed_patch
if defined specialflag (
    set "new_specialflag="!specialflag!""
    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,13!"=="%specialflag_modify%" (
            echo %specialflag_modify%!new_specialflag!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        goto speed_patch_2
    ) else (
        echo Error in the Speedrun patch.
        goto game_over
    )
)
:speed_patch_2
if defined csflag (
    set "new_csflag="!csflag!""
    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,8!"=="%csflag_modify%" (
            echo %csflag_modify%!new_csflag!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        echo Speedrun mode Enabled.
        goto game_over
    ) else (
        echo Speedrun script is broke.
        goto game_over
    )
)


:game_over
goto choice
