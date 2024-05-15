@echo off
setlocal enabledelayedexpansion
set "file=%APPDATA%\Future_Fragments\ffdata_slot_1.sav"
set "achievementfile=%APPDATA%\Future_Fragments\ffData_global.sav"


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
    set specialflag=elpprog4:1 firepprog2:1 elpprogp2nopac:1 p6m2:1 p2m4.map:1 elpprog6:1 elpprog2:1 firepprog4:1 earthpprog4:1 icepprog2:1 earthpprog6:1 icepprog4:1 ffppuS3:1 earthpprog2:1 elpprog1:1 firepprog3:1 elpprog5:1 ffppu3:1 elpprogp1nopac:1 firepprog5:1 elpprogp3nopac:1 elpprog3:1 firepprog1:1 elpprogp5nopac:1 earthpprog1:1 icepprog3:1 earthpprog5:1 ducklings:0 icepprog1:1 earthpprog3:1 icepprog5:1 p1m1.map:1 ducklings:0
    set specialflag_Modify=specialFlags=
    set csflag=SVieIceHub1st:1 PathVineDestroyed:6 EarthPath1Done:1 chamber2doneflag:1 lastfriendflag:1 SVieFireHub1st:1 FirePath4Done:1 chamber6doneflag:1 FayeIceP2M2PosPlus:1 FayeEarthP4M4:1 SVieFireBossVent1st:1 EarthPath6Done:1 prematureleaving:1 p5m2flag:1 FirePath3Done:1 IcePath1Done:1 2ndfriendflag:1 SeeFayePreFire:1 1stfriendflag:1 FirstTimeBackFire:1 firePreboss:1 FayeElecP2M2:1 SVieFireScenes:2 FayeReputation:1 kc_botspider:2 FirstMapArrived:1 alphafriendfragment:1 chamber3doneflag:1 respawn_count:5 ReadDatabankPreFire:1 FireBossLossReturn:1 FayeIceP2M2:1 fragmentcount:1 Rusegarn1st:1 FragmentAppearB:1 FayeFireP2M3NeuPlus:1 FayeEarthP4M4PosPlus:1 FayeIceP2M2Pos1Plus:1 P5M4Pit:1 FireVentsOpened:5 kc_total:15 p4m2secbot:1 EarthPath3Done:1 kc_botsecurity:2 ReturnedToFirePad2nd:1 FayeFireP2M3:1 IcePath4Done:1 EarthPath4Done:1 p4m1flag:1 fragment_count:1 FirePath1Done:1 securitybottutflag:1 ADMNSpawnerFirst:1 FacilityCurious:1 IcePath3Done:1 earthDoorOpen:1 p3m4flag:1 chamber4doneflag:1 kc_botjumper:4 p2m2flag:1 DisplayObj:1 attack_total:301 FirePath2Done:1 kc_electricgrunt:7 p1m1secbot:1 FireBossLoss:1 SVieFireBossVentPre:1 FirePath5Done:1 IceCrownFound:5 prefireswitchtimer:54 securityp1m1crushed:1 chamber1doneflag:1 EarthPath5Done:1 chamber5doneflag:1 chamberscompletedflag:7 IcePath2Done:1 EarthPath2Done:1 securityp2m4crushed:1 3rdfriendflag:1 IcePath5Done:1 OpeningSequence:1 p6m2secbot:1 TaskerAware:1 FayeElecP2M2PosPlus:1 protectfriendsflag:1 securitybottutcheck:1
    set csflag_modify=csFlags=
    set icepuzzle="p4m3.map[0]:410|730|-174.53|730|810|-820.30|1210|1130|4118.98|1610|250|5881.76|1050|490|1989.68|730|330|1117.01|730|-70|5497.79|,p2m1.map[0]:650|1229|-733.04|1450|970|-1256.64|570|730|1309.00|1227|1320|-6981.32|250|988|1256.64|1850|410|5061.45|1975|786|3455.75|,p1ff.map[0]:1610|570|628.32|1008|410|1256.64|410|730|314.16|650|730|-157.08|730|730|4712.39|970|730|-1570.80|810|1370|-1099.56|1450|1530|4450.59|3690|1530|4712.39|,FiretoIce3.map[0]:2410|170|7452.56|2090|410|2199.11|,p2m4.map[0]:1370|890|-3926.99|1450|1690|2478.37|730|970|7068.58|810|1690|3769.91|250|1690|1570.80|250|-150|0|,p1ff.map[1]:2368|729|-5026.55|2250|1130|2827.43|,p5m2.map[0]:1530|250|0|1521|822|3141.59|890|1050|1884.96|-150|1050|1570.80|1930|730|1884.96|1290|730|1570.80|890|570|1256.64|-150|570|1570.80|,p3m5.map[1]:2010|570|-1570.80|330|490|1291.54|170|1130|2897.25|-139|1372|2181.66|,p3m5.map[0]:890|970|698.13|330|490|820.30|170|1130|2897.25|-139|1372|2181.66|"
    set icepuzzle_modify=29=
    set databank=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419
    set databank_modify=18=
    set databank_read=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419
    set databank_read_modify=30=
    set achievements=2E01000023000000010000000A0000006163685F466972655F45010000000A0000006163685F466972655F44010000000A0000006163685F466972655F4301000000090000006163685F4963655F4401000000090000006163685F4963655F4501000000090000006163685F4963655F4601000000090000006163685F4963655F49010000000E0000006163685F456C6563747269635F47010000000E0000006163685F456C6563747269635F49010000000E0000006163685F456C6563747269635F4A010000000B0000006163685F45617274685F45010000000B0000006163685F45617274685F49010000000A0000006163685F466972655F46010000000A0000006163685F466972655F41010000000A0000006163685F466972655F4201000000090000006163685F4963655F4701000000090000006163685F4963655F4201000000090000006163685F4963655F41010000000E0000006163685F456C6563747269635F41010000000E0000006163685F456C6563747269635F42010000000B0000006163685F45617274685F42010000000B0000006163685F45617274685F41010000000A0000006163685F466972655F4A010000000A0000006163685F466972655F48010000000A0000006163685F466972655F47010000000E0000006163685F456C6563747269635F43010000000E0000006163685F456C6563747269635F44010000000B0000006163685F45617274685F4401000000090000006163685F456E645F4501000000090000006163685F456E645F4701000000090000006163685F456E645F4801000000090000006163685F456E645F4A01000000090000006163685F456E645F49010000000E0000006163685F456C6563747269635F48010000000A0000006163685F466972655F49
    set achievements_modify=1=

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
        goto speed_patch_3
    ) else (
        echo Speedrun script is broke.
        goto game_over
    )
)
:speed_patch_3
if defined icepuzzle (
    set "new_icepuzzle=!icepuzzle!"
    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,3!"=="%icepuzzle_modify%" (
            echo %icepuzzle_modify%!new_icepuzzle!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        goto speed_patch_4
    ) else (
        echo Speedrun icepuzzle broke.
        goto game_over
    )
)
:speed_patch_4
if defined databank (
    set "new_databank="!databank!""
    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,3!"=="%databank_modify%" (
            echo %databank_modify%!new_databank!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        goto speed_patch_5
    ) else (
        echo Speedrun databanks broke.
        goto game_over
    )
)
:speed_patch_5
if defined databank_read (
    set "new_databank_read="!databank_read!""
    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%file%"') do (
        set "line=%%a"
        if "!line:~0,3!"=="%databank_read_modify%" (
            echo %databank_read_modify%!new_databank_read!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%file%" > nul
    
    if defined updated (
        goto speed_patch_6
    ) else (
        echo Speedrun databanks read broke.
        goto game_over
    )
)
:speed_patch_6
if defined achievements (
    set "new_achievements="!achievements!""
    set "updated="
    
    (for /f "tokens=* delims=" %%a in ('type "%achievementfile%"') do (
        set "line=%%a"
        if "!line:~0,2!"=="%achievements_modify%" (
            echo %achievements_modify%!new_achievements!
            set "updated=1"
        ) else (
            echo !line!
        )
    )) > temp.txt
    
    move /y temp.txt "%achievementfile%" > nul
    
    if defined updated (
        echo Speedrun mode enabled.
        goto game_over
    ) else (
        echo Achievements Broke.
        goto game_over
    )
)


:game_over
goto choice
