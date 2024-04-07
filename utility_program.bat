@ECHO OFF
:: ** _______________________________________________________________________________________________ **
::
::                                      Welcome to the good morning project
::
::      Github Project link : https://github.com/aaisalu/Morning
::      If any bug or issue found please feel free to create a Isuue or submit pull request
::      Feel free to contribute.
::      Email: kcpra7@proton.me
::
:: ** _______________________________________________________________________________________________ **

::Thanks for the cool ascii banner manytools.org
color 7
for /f "delims=:" %%A in ("%time%") do if %%A LSS 12 (
echo[
echo          .d8888b.                         888       888b     d888                           d8b
echo         .88P  Y88b                        888       8888b   d8888                           Y8P
echo        .888    888                        888       88888b.d88888
echo        .888         .d88b.   .d88b.   .d88888       888Y88888P888  .d88b.  888d888 88888b.  888 88888b.   .d88b.
echo        .888  88888 d88""88b d88""88b d88" 888       888 Y888P 888 d88""88b 888P"   888 "88b 888 888 "88b d88P"88b
echo         888    888 888  888 888  888 888  888       888  Y8P  888 888  888 888     888  888 888 888  888 888  888
echo         Y88b  d88P Y88..88P Y88..88P Y88b 888       888   "   888 Y88..88P 888     888  888 888 888  888 Y88b 888
echo          "Y8888P88  "Y88P"   "Y88P"   "Y88888       888       888  "Y88P"  888     888  888 888 888  888  "Y88888
echo                                                                                                               888
echo                                                                                                          Y8b d88P
echo                                                                                                           "Y88P"
) else if %%A LSS 18 (
echo[
echo[
echo                .oOOOo.                   o          Oo    oooo
echo               .O     o                  O          o  O   O
echo               o                         o         O    o  o     O
echo               O                         o        oOooOoOo OoO  oOo
echo               O   .oOOo .oOo. .oOo. .oOoO        o      O o     o    .oOo. `OoOo. 'OoOo. .oOo. .oOo.  ooOoo
echo               o.      O O   o O   o o   O        O      o O     O    OooO'  o      o   O O   o O   o  o   O
echo                O.    oO o   O o   O O   o        o      O o     o    O      O      O   o o   O o   O  O   o
echo                 `OooO'  `OoO' `OoO' `OoO'o       O.     O O     ooo  `OoO'  o      o   O `OoO' `OoO'  o   O
echo[
) else if %%A LSS 22 (
echo[
echo        .d8888b.                         888       8888888888                            d8b
echo       .88P  Y88b                        888       888                                   Y8P
echo      .888    888                        888       888
echo      .888         .d88b.   .d88b.   .d88888       8888888    888  888  .d88b.  88888b.  888 88888b.   .d88b.
echo      .888  88888 d88""88b d88""88b d88" 888       888        888  888 d8P  Y8b 888 "88b 888 888 "88b d88P"88b
echo       888    888 888  888 888  888 888  888       888        Y88  88P 88888888 888  888 888 888  888 888  888
echo        88b  d88P Y88..88P Y88..88P Y88b 888       888         Y8bd8P  Y8b.     888  888 888 888  888 Y88b 888
echo        "Y8888P88  "Y88P"   "Y88P"   "Y88888       8888888888   Y88P    "Y8888  888  888 888 888  888  "Y88888
echo                                                                                                           888
echo                                                                                                      Y8b d88P
echo                                                                                                       "Y88P"
) else (
echo[
echo         ::::::::   ::::::::   ::::::::  :::::::::       ::::    ::: ::::::::::: ::::::::  :::    ::: :::::::::::
echo        :+:    :+: :+:    :+: :+:    :+: :+:    :+:      :+:+:   :+:     :+:    :+:    :+: :+:    :+:     :+:
echo        +:+        +:+    +:+ +:+    +:+ +:+    +:+      :+:+:+  +:+     +:+    +:+        +:+    +:+     +:+
echo        :#:        +#+    +:+ +#+    +:+ +#+    +:+      +#+ +:+ +#+     +#+    :#:        +#++:++#++     +#+
echo        +#+   +#+# +#+    +#+ +#+    +#+ +#+    +#+      +#+  +#+#+#     +#+    +#+   +#+# +#+    +#+     +#+
echo        #+#    #+# #+#    #+# #+#    #+# #+#    #+#      #+#   #+#+#     #+#    #+#    #+# #+#    #+#     #+#
echo         ########   ########   ########  #########       ###    #### ########### ########  ###    ###     ###
)
echo                                    x - :k:[92m https://github.com/aaisalu/Morning [0m:c: - x
:: Thanks to mlocati for batch color at https://bit.ly/3zEJDj6

::check admin right
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo                                                      [31m-: Sudo Mode :-[0m
    goto:farfrom
) ELSE (
    echo                                                    -:[94m Normal Mode [0m:-
)

echo[
echo %date% %time%
:: Some of welcome message are of github.com/AnimeKaizoku/SaitamaRobot from modules\sql\welcome_sql.py
echo Something just fell from the sky! - oh, its %username% from %COMPUTERNAME% device!

rem echo Copy this code to lunch Firefox browser :  start "Firefox" "C:\Program Files\Mozilla Firefox\firefox.exe"
rem echo Copy this code to lunch Chrome  browser :   start "Chrome"  "C:\Program Files\Google\Chrome\Application\chrome.exe"

:choice
    echo[
    echo    Press 1 = Start your day with Updated News Sources
    echo    Press 2 = Beep..Beep Boop! It's Stock Time
    echo    Press 3 = Travel to Folders
    echo    Press 4 = Summon *.py
    echo    Press 5 = Dress up
    echo    [90mPress 0 = Leave[0m
    echo[
    :brain
    set /P brn=Feed me just Number so, I can work for you!! [1-5]:
    if /I "%brn%" EQU "1" ( goto :somewhere
    ) else if  /I "%brn%" EQU "2" ( goto :lilfar
    ) else if  /I "%brn%" EQU "3" ( goto :bitfar
    ) else if  /I "%brn%" EQU "4" ( goto :chkifpy
    ) else if  /I "%brn%" EQU "5" ( goto :farfrom
    ) else if  /I "%brn%" EQU "0" ( goto :saybye
    ) else (goto :choice)

:somewhere
    echo[
    echo                :::::::::  :::    ::: :::        :::        :::::::::: ::::::::::: ::::::::::: ::::    :::
    echo                :+:    :+: :+:    :+: :+:        :+:        :+:            :+:         :+:     :+:+:   :+:
    echo                +:+    +:+ +:+    +:+ +:+        +:+        +:+            +:+         +:+     :+:+:+  +:+
    echo                +#++:++#+  +#+    +:+ +#+        +#+        +#++:++#       +#+         +#+     +#+ +:+ +#+
    echo                +#+    +#+ +#+    +#+ +#+        +#+        +#+            +#+         +#+     +#+  +#+#+#
    echo                #+#    #+# #+#    #+# #+#        #+#        #+#            #+#         #+#     #+#   #+#+#
    echo                #########   ########  ########## ########## ##########     ###     ########### ###    ####
    echo                                 [92m---- %username% Just teleported into the chat from Jungle!-----[0m
    echo[
    echo    Press 1 = World News
    echo    Press 2 = Tech News
    echo    Press 3 = Stock News
    echo    [90mPress 0 = Depart[0m
   :ConfirmBox
        set /P nws= Which News type do you want to be updated with? [1/2/3]:

    if /I "%nws%" EQU "1" (
    goto :WorldNews
    ) else if /I "%nws%" EQU "2" (
    goto :TechNews
    ) else if /I "%nws%" EQU "3" (
    goto :StockNews
    ) else if /I "%nws%" EQU "0" (
    goto:choice
    ) else ( goto :InERROR
    )
    :WorldNews
        echo[
        echo I am here because you want to see World News
    	start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://www.bizshala.com/ https://merolagani.com/ https://www.cnbc.com/world/ https://www.setopati.com/ https://www.onlinekhabar.com/ https://www.ratopati.com/ https://ekantipur.com/ https://www.sciencealert.com/ https://www.insider.com/asia/ https://news.google.com/topstories/
        echo[
        echo [31mPlease! Don't close this Window.[0m
        echo Please! Wait for 2 min for the next wave of news to lunch
        ping -n 120 127.0.0.1 > nul
    	start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://www.bloomberg.com/asia  https://www.theguardian.com/international https://www.businessinsider.com/sai https://www.vice.com/en https://www.thehimalayantimes.com/ https://www.hamropatro.com/news https://annapurnapost.com/ https://www.bbc.com/news/world https://nepsealpha.com/
        goto :END
        rem goto :ConfirmBox
    	rem start /min "" explorer.exe shell:AppsFolder\Microsoft.ZuneMusic_8wekyb3d8bbwe!Microsoft.ZuneMusic
    	rem pause

    :TechNews
        echo[
        echo I am here because you want to see Tech News
    	start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://news.ycombinator.com/ https://hackersonlineclub.com/ https://www.theverge.com/ https://www.xda-developers.com/ https://www.bleepingcomputer.com/ https://www.maketecheasier.com/   https://www.makeuseof.com/

        echo[
        echo [31mPlease! Don't close this Window.[0m
        echo Please! Wait for 2 min for the next wave of news to lunch
        ping -n 120 127.0.0.1 > nul

        start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://www.androidauthority.com/ https://www.gadgetbytenepal.com/ https://mspoweruser.com/ https://beebom.com/  https://www.techpana.com/ ttps://www.androidpolice.com/ https://www.windowscentral.com/blog

        echo[
        echo [31mPlease! Don't close this Window.[0m
        echo Please! Wait for 2 min for the final wave of news to lunch
        ping -n 120 127.0.0.1 > nul

    	start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://www.pcmag.com/  https://www.computerworld.com/in/category/windows/ https://www.linuxtoday.com/ https://thehackernews.com/
        goto :END

    :StockNews
        echo[
        echo I am here because you want to see Stock News
    	start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" http://www.nepalstock.com/news/category/0 https://merolagani.com/ https://nepsealpha.com/ https://www.bizshala.com/ https://newweb.nepalstock.com.np/ https://www.sharebazarnepal.com.np/  https://www.sharesansar.com/ https://www.nepalipaisa.com/ https://merocapital.com/
        goto :END

    :InERROR
        echo[
        echo Looks like someone having a hard time selecting a digit: [1/2/3].
        goto :somewhere
    exit

:saybye
    echo [92mCheck for update at https://github.com/aaisalu/Morning[0m
    ping -n 3 127.0.0.1 > nul
    exit

:lilfar
    echo[
    echo        **********                       ** **                        **      **
    echo        ////**///                       /**//            *****       /**     /**
    echo           /**     ******  ******       /** ** *******  **///**      /**     /**  ******  **   ** ******  ******
    echo           /**    //**//* //////**   ******/**//**///**/**  /**      /********** **////**/**  /**//**//* **////
    echo           /**     /** /   *******  **///**/** /**  /**//******      /**//////**/**   /**/**  /** /** / //*****
    echo           /**     /**    **////** /**  /**/** /**  /** /////**      /**     /**/**   /**/**  /** /**    /////**
    echo           /**    /***   //********//******/** ***  /**  *****       /**     /**//****** //******/***    ******
    echo           //     ///     ////////  ////// // ///   //  /////        //      //  //////   ////// ///    //////
    echo[
    echo                 [92m:--   Roses are red, violets are blue, %username% joined this chat to trade with you   --:[0m
    echo[
    echo    Press 1 = Start your business
    echo    Press 2 = Summon up Bot to apply IPO!
    echo    [90mPress 0 = Depart[0m
    rem echo    Press 3 = Wake Bot to check IPO
        set /P stk= Welcome, press the secret key to activate script:
    if /I "%stk%" EQU "1" (
    goto:tradestk
    ) else if /I "%stk%" EQU "2" (
    goto:aplyipo
    ) else if /I "%stk%" EQU "0" (
    goto:choice
    ) else (
    goto:lilfar
    )
    :tradestk
        echo I'm here because it's Business hrs
        rem start "Firefox" "C:\Program Files\Mozilla Firefox\firefox.exe" https://tms51.nepsetms.com.np/login http://www.nepalstock.com/news/category/0 https://meroshare.cdsc.com.np/#/login https://newweb.nepalstock.com.np/ https://nepsealpha.com/trading/chart
        start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://tms51.nepsetms.com.np/login http://www.nepalstock.com/news/category/0 https://meroshare.cdsc.com.np/#/login https://mail.google.com/mail/u/0/#inbox https://newweb.nepalstock.com.np/ https://nepsealpha.com/trading/chart
        echo Opening your Excel balance sheet
        %SystemRoot%\explorer.exe "D:\excel Files\hello.xlsx"
        goto:choice
    :aplyipo
        echo[
        echo             .d8888b.   .d88888b.   .d88888b.  8888888b.       888     888     888  .d8888b.  888    d8P
        echo            d88P  Y88b d88P" "Y88b d88P" "Y88b 888  "Y88b      888     888     888 d88P  Y88b 888   d8P
        echo            888    888 888     888 888     888 888    888      888     888     888 888    888 888  d8P
        echo            888        888     888 888     888 888    888      888     888     888 888        888d88K
        echo            888  88888 888     888 888     888 888    888      888     888     888 888        8888888b
        echo            888    888 888     888 888     888 888    888      888     888     888 888    888 888  Y88b
        echo            Y88b  d88P Y88b. .d88P Y88b. .d88P 888  .d88P      888     Y88b. .d88P Y88b  d88P 888   Y88b
        echo             "Y8888P88  "Y88888P"   "Y88888P"  8888888P"       88888888 "Y88888P"   "Y8888P"  888    Y88b
        echo[
        echo                                   :---  Hola %username%, beware of super users ---:
        echo[
        echo Bot on construction it'll be alive someday but today isn't that day!
        ping -n 2 127.0.0.1 > nul
        goto :choice
    :InWrong
        echo[
        echo Goodbye %username% ! It's gonna be lonely without ya.,
        goto :choice

:bitfar
    echo[
    echo                    ::::::::::: :::     :::    ::: ::::::::::       ::::::::  :::::::::: ::::::::::
    echo                        :+:   :+: :+:   :+:   :+:  :+:             :+:    :+: :+:        :+:
    echo                        +:+  +:+   +:+  +:+  +:+   +:+             +:+    +:+ +:+        +:+
    echo                        +#+ +#++:++#++: +#++:++    +#++:++#        +#+    +:+ :#::+::#   :#::+::#
    echo                        +#+ +#+     +#+ +#+  +#+   +#+             +#+    +#+ +#+        +#+
    echo                        #+# #+#     #+# #+#   #+#  #+#             #+#    #+# #+#        #+#
    echo                        ### ###     ### ###    ### ##########       ########  ###        ###
    echo[
    echo                              [92m--- Brace yourselves...Activating Jasmine flying carpet ---[0m
    echo[
    echo    Press 1 = Downloads Folder
    echo    Press 2 = Pictures Folder
    echo    Press 3 = Music Folder
    echo    Press 4 = Documents Folder
    echo    [90mPress 0 = Depart[0m

   :SUREBOX
        set /P tvl= Which folder do you want to Travel? [1-4]:

    if /I "%tvl%" EQU "1" (
    goto :Fnpy
    ) else if /I "%tvl%" EQU "2" (
    goto :Fncmd
    )  else if /I "%tvl%" EQU "3" (
    goto :Fnexcel
    ) else if /I "%tvl%" EQU "4" (
    goto :Fnproj
    ) else if /I "%tvl%" EQU "0" (
    goto:choice
    ) else (
    goto :InValid
    )
    :: You can add you own custom folder to open as eg: D:\office\projectfolder
    :Fnpy
        echo Traveling to Downloads Folder
        %SystemRoot%\explorer.exe %USERPROFILE%\Downloads
        goto :END
    :Fncmd
        echo Traveling to Pictures Folder
        %SystemRoot%\explorer.exe %USERPROFILE%\Pictures
        goto :END
    :Fnexcel
        echo Traveling to Music Folder
        %SystemRoot%\explorer.exe %USERPROFILE%\Music
        goto :END
    :Fnproj
        echo Traveling to Documents Folder
        %SystemRoot%\explorer.exe %USERPROFILE%\Documents
        goto :END
    :InValid
        echo Use your jet ticket wisely. [1-4]
        goto :bitfar
    exit

:farfrom
    echo[
    echo                       :::::::::  :::::::::  :::::::::: ::::::::   ::::::::       :::    ::: :::::::::
    echo                       :+:    :+: :+:    :+: :+:       :+:    :+: :+:    :+:      :+:    :+: :+:    :+:
    echo                       +:+    +:+ +:+    +:+ +:+       +:+        +:+             +:+    +:+ +:+    +:+
    echo                       +#+    +:+ +#++:++#:  +#++:++#  +#++:++#++ +#++:++#++      +#+    +:+ +#++:++#+
    echo                       +#+    +#+ +#+    +#+ +#+              +#+        +#+      +#+    +#+ +#+
    echo                       #+#    #+# #+#    #+# #+#       #+#    #+# #+#    #+#      #+#    #+# #+#
    echo                       #########  ###    ### ########## ########   ########        ########  ###
    echo[
    NET SESSION >nul 2>&1
    IF %ERRORLEVEL% EQU 0 (
        echo                                  [31m---- Feels like %username% device needs some medic kit! -----[0m
    ) ELSE (
        echo                                  [92m---- Feels like %username% device needs some medic kit! -----[0m
    )
    echo[
    echo    Press 1 = Install/Update software through chocolatey
    echo    Press 2 = Fly to the soft_links/extensions
    echo    Press 3 = Generate Battery report
    echo    Press 4 = Repair a Windows Image
    echo    Press 5 = Reset Network settings
    echo    Press 6 = Repair system files
    echo    [90mPress 0 = Depart[0m
   :farbox
        set /P drs= Which kit would you like to proceed with? [1-6]:

    if /I "%drs%" EQU "1" (
    goto :choco
    ) else if /I "%drs%" EQU "2" (
    goto :websoft
    ) else if /I "%drs%" EQU "0" (
    goto:choice
    ) else if /I "%drs%" EQU "3" (
    goto :battreport
    ) else if /I "%drs%" EQU "4" (
    goto :repairpc
    ) else if /I "%drs%" EQU "5" (
    goto :repairnet
    ) else if /I "%drs%" EQU "6" (
    goto :repairsys
    ) else (
    goto :farfrom
    )
    :websoft
        echo[
        echo                       :::       ::: :::::::::: :::::::::       :::::::::: :::     :::   :::
        echo                       :+:       :+: :+:        :+:    :+:      :+:        :+:     :+:   :+:
        echo                       +:+       +:+ +:+        +:+    +:+      +:+        +:+      +:+ +:+
        echo                       +#+  +:+  +#+ +#++:++#   +#++:++#+       :#::+::#   +#+       +#++:
        echo                       +#+ +#+#+ +#+ +#+        +#+    +#+      +#+        +#+        +#+
        echo                        #+#+# #+#+#  #+#        #+#    #+#      #+#        #+#        #+#
        echo                         ###   ###   ########## #########       ###        ########## ###
        echo                                       [92m:-- Fasten your seatbelt, %username% --:[0m
        echo[
        echo This tab opens links to software and extension on your browser.
        echo I suggest you install software from chocolatey fast and simple.
        echo[
        echo    Press 1 = Fly to the web of Basic kit software
        echo    Press 2 = Fly to the web of Intermediate kit software
        echo    Press 3 = Fly to the browser extensions page
        echo    [90mPress 0 = Depart[0m
            set /P wb= Welcome, Which web of software do you want to fly ?[1-3]:
        if /I "%wb%" EQU "1" (
        goto :basic
        ) else if /I "%wb%" EQU "2" (
         goto :mediate
        ) else if /I "%wb%" EQU "3" (
         goto :webext
        ) else if /I "%wb%" EQU "0" (
         goto :farfrom
        ) else (
        goto :websoft
        )
        :basic
            echo[
            echo Flying to respective links of Basic kit software
            start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" http://www.mozilla.org/en-US/  https://discord.com/download http://bit.ly/2WZMML0 https://www.sublimetext.com/download http://obsproject.com/download http://www.google.com/chrome/ http://www.zoom.us/download https://www.videolan.org/vlc/download-windows.en_GB.html http://calibre-ebook.com/download http://www.7-zip.org/download.html  http://bit.ly/3Et0NB0 https://bit.ly/3OMQuMW
            goto:websoft
        :mediate
            echo[
            echo Flying to respective links of Intermediate kit software
            start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://bit.ly/3bhyTPG https://intel.ly/3bklcQ3 http://www.qbittorrent.org/download.php http://www.virtualbox.org/ http://github.com/hovancik/stretchly/releases  https://git-scm.com/downloads http://www.python.org/downloads/  http://codecguide.com/download_kl.htm http://bit.ly/3nikTZx  http://code.visualstudio.com/download
            goto:websoft
        :webext
            echo[
            echo            :::::::::: :::    ::: ::::::::::: :::::::::: ::::    :::  :::::::: ::::::::::: ::::::::   ::::::::
            echo            :+:        :+:    :+:     :+:     :+:        :+:+:   :+: :+:    :+:    :+:    :+:    :+: :+:    :+:
            echo            +:+         +:+  +:+      +:+     +:+        :+:+:+  +:+ +:+           +:+    +:+    +:+ +:+
            echo            +#++:++#     +#++:+       +#+     +#++:++#   +#+ +:+ +#+ +#++:++#++    +#+    +#+    +:+ +#++:++#++
            echo            +#+         +#+  +#+      +#+     +#+        +#+  +#+#+#        +#+    +#+    +#+    +#+        +#+
            echo            #+#        #+#    #+#     #+#     #+#        #+#   #+#+# #+#    #+#    #+#    #+#    #+# #+#    #+#
            echo            ########## ###    ###     ###     ########## ###    ####  ######## ########### ########   ########
            echo                                           [92m:-- We've been expecting you %username% --:[0m
            echo[
            echo Please! Choose your browser preferences where you want to install extensions.
            echo    Press 1 = Chromium Browser
            echo    Press 2 = Mozilla Firefox
            echo    [90mPress 0 = Depart[0m
                set /P ext= Welcome, Which browser do you use ?[1/2]:
            if /I "%ext%" EQU "1" (
            goto :chromiumbrow
            ) else if /I "%ext%" EQU "2" (
             goto :mozibrow
            ) else if /I "%ext%" EQU "0" (
             goto :websoft
            ) else (
            goto :webext
            )
            :chromiumbrow
                start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://bit.ly/3Q8ZGg5 https://bit.ly/3de69b9 https://privacybadger.org/
                goto:webext
            :mozibrow
                start "Firefox" "C:\Program Files\Mozilla Firefox\firefox.exe"  https://mzl.la/3Q8ZMEt  https://mzl.la/3JDTxWQ  https://mzl.la/3bDNDIL https://privacybadger.org/
                goto:webext
    :choco
        echo OFF
        Ping www.google.com -n 2 -w 1000 >NUL 2>&1
        if not "%errorlevel%" == "0" (
        echo[
        echo [31mPlease, check your internet connection[0m
        echo [31mSoftware can't be downloaded without the internet.[0m
        goto:farfrom)
        :: Thanks to @blak3r for check admin rights stackoverflow.com/a/8995407
        NET SESSION >nul 2>&1
        IF %ERRORLEVEL% EQU 0 (
            echo[
            echo Admin user detected!
            echo Installing Chocolatey Please be patient...
            echo This should only take another few minutes or less, and then you'll be good to go!
            echo[
            echo             .d8888b.  888                                888          888
            echo            d88P  Y88b 888                                888          888
            echo            888    888 888                                888          888
            echo            888        88888b.   .d88b.   .d8888b .d88b.  888  8888b.  888888 .d88b.  888  888
            echo            888        888 "88b d88""88b d88P"   d88""88b 888     "88b 888   d8P  Y8b 888  888
            echo            888    888 888  888 888  888 888     888  888 888 .d888888 888   88888888 888  888
            echo            Y88b  d88P 888  888 Y88..88P Y88b.   Y88..88P 888 888  888 Y88b. Y8b.     Y88b 888
            echo             "Y8888P"  888  888  "Y88P"   "Y8888P "Y88P"  888 "Y888888  "Y888 "Y8888   "Y88888
            echo                                                                                           888
            echo                                                                                      Y8b d88P
            echo                                                                                       "Y88P"
            powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
            echo Sweet Chocolatey is ready to serve you!
        ) ELSE (
            echo[
            echo             d8888b. db    db d8b   db       .d8b.  .d8888.       .d8b.  d8888b. .88b  d88. d888888b d8b   db
            echo             88  `8D 88    88 888o  88      d8' `8b 88'  YP      d8' `8b 88  `8D 88'YbdP`88   `88'   888o  88
            echo             88oobY' 88    88 88V8o 88      88ooo88 `8bo.        88ooo88 88   88 88  88  88    88    88V8o 88
            echo             88`8b   88    88 88 V8o88      88~~~88   `Y8b.      88~~~88 88   88 88  88  88    88    88 V8o88
            echo             88 `88. 88b  d88 88  V888      88   88 db   8D      88   88 88  .8D 88  88  88   .88.   88  V888
            echo             88   YD ~Y8888P' VP   V8P      YP   YP `8888Y'      YP   YP Y8888D' YP  YP  YP Y888888P VP   V8P
            echo[
            echo                      [31m------------------  ERROR: ADMINISTRATOR PRIVILEGES REQUIRED  -------------------[0m
            echo This script must be run as administrator to work as it installs the chocolatey to install software
            echo[
            echo As the task can't be run without the Administrator privileges
            echo [92mDo you want to open the script with the Administrator privileges?[0m
            pause
            ::Thanks to Ir Relevant & ceztko for admin prevlge stackoverflow.com/a/24665214
            Net session >nul 2>&1
            if not '%errorlevel%' == '0' (
                PowerShell start -verb runas '%~0' &exit /b)
            cd %~dp0
        )
        :: Thanks Chocolatey for being it so amazing chocolatey.org
        echo[
        echo                                                         Welcome To The
        echo                                                 Chocolatey Packages Repository
        echo                                   Select the corresponding number to the software to install!
        echo[
        echo       [1] Chrome            [9] Notepad++        [17] VirtualBox            [25] Viber          [33] CrystalDiskInfo
        echo       [2] Brave            [10] Git              [18] Discord               [26] Telegram       [34] Adobe Acrobat
        echo       [3] Firefox          [11] FFmpeg           [19] K-Lite Codec Pack     [27] WhatsApp       [35] AutoHotkey
        echo       [4] Spotify          [12] qBittorrent      [20] VLC media player      [28] Youtube-dl     [36] IrfanView
        echo       [5] Calibre          [13] Malwarebytes     [21] Office 365            [29] Blender        [37] Audacity
        echo       [6] OBS Studio       [14] WinRAR           [22] Libreoffice           [30] Python         [38] Graphics
        echo       [7] VScode           [15] 7-Zip            [23] Zoom Meetings         [31] Stretchly      [39] PDF24
        echo       [8] Sublime Text     [16] Google Drive     [24] Microsoft Teams       [32] Greenshot      [40] Atom
        echo       _____________________________________________________________________________________________________________
        echo                                                Install Recommended Software [100]
        echo                      Firefox,WinRAR,7-Zip,VLC media player,Zoom Meetings,Sublime Text,Spotify,Office 365
        echo                                     ___________________________________________________________
        echo[
        echo                                                  Install Basic Software [200]
        echo                         Visual Studio Code, Discord, Telegram, qBittorrent,OBS project, git ,Calibre
        echo                                                __________________________________
        echo[
        rem echo                                                      Uninstall choco [9841]
        echo                                                     Update all software [00]
        echo                                                             Exit [0]
        echo[
            set /P fun= Welcome, Which of the software would you like to taste? [1-40]:
        if /I "%fun%" EQU "1" (
        goto :loveOne
        ) else if /I "%fun%" EQU "2" (
         goto :loveTwo
        ) else if /I "%fun%" EQU "3" (
         goto :loveThree
        ) else if /I "%fun%" EQU "4" (
         goto :loveFour
        ) else if /I "%fun%" EQU "4" (
         goto :loveFive
        ) else if /I "%fun%" EQU "6" (
         goto :loveSix
        ) else if /I "%fun%" EQU "7" (
         goto :loveSeven
        ) else if /I "%fun%" EQU "8" (
         goto :loveEight
        ) else if /I "%fun%" EQU "9" (
         goto :loveNine
        ) else if /I "%fun%" EQU "10" (
         goto :loveTen
        ) else if /I "%fun%" EQU "11" (
         goto :loveEleven
        ) else if /I "%fun%" EQU "12" (
         goto :loveTwelve
        ) else if /I "%fun%" EQU "13" (
         goto :loveThirteen
        ) else if /I "%fun%" EQU "14" (
         goto :loveFourteen
        ) else if /I "%fun%" EQU "15" (
         goto :loveFifteen
        ) else if /I "%fun%" EQU "16" (
         goto :loveSixteen
        ) else if /I "%fun%" EQU "17" (
         goto :loveSeventeen
        ) else if /I "%fun%" EQU "18" (
         goto :loveEighteen
        ) else if /I "%fun%" EQU "19" (
         goto :loveNineteen
        ) else if /I "%fun%" EQU "20" (
         goto :loveTwenty
        ) else if /I "%fun%" EQU "21" (
         goto :loveTwentyone
        ) else if /I "%fun%" EQU "22" (
         goto :loveTwentytwo
        ) else if /I "%fun%" EQU "23" (
         goto :loveTwentythree
        ) else if /I "%fun%" EQU "24" (
         goto :loveTwentyfour
        ) else if /I "%fun%" EQU "25" (
         goto :loveTwentyfive
        ) else if /I "%fun%" EQU "26" (
         goto :loveTwentysix
        ) else if /I "%fun%" EQU "27" (
         goto :loveTwentyseven
        ) else if /I "%fun%" EQU "28" (
         goto :loveTwentyeight
        ) else if /I "%fun%" EQU "29" (
         goto :loveTwentynine
        ) else if /I "%fun%" EQU "30" (
         goto :loveThirty
        ) else if /I "%fun%" EQU "31" (
         goto :loveThirtyOne
        ) else if /I "%fun%" EQU "32" (
         goto :loveThirtyTwo
        ) else if /I "%fun%" EQU "33" (
         goto :loveThirtyThree
        ) else if /I "%fun%" EQU "34" (
         goto :loveThirtyFour
        ) else if /I "%fun%" EQU "35" (
         goto :loveThirtyFive
        ) else if /I "%fun%" EQU "36" (
         goto :loveThirtySix
        ) else if /I "%fun%" EQU "37" (
         goto :loveThirtySeven
        ) else if /I "%fun%" EQU "38" (
         goto :loveThirtyEight
        ) else if /I "%fun%" EQU "39" (
         goto :loveThirtyNine
        ) else if /I "%fun%" EQU "40" (
         goto :loveFourty
        ) else if /I "%fun%" EQU "100" (
         goto :lovehundred
        ) else if /I "%fun%" EQU "200" (
         goto :lovetwohundred
        ) else if /I "%fun%" EQU "00" (
         goto :updateall
        ) else if /I "%fun%" EQU "0" (
         goto :farfrom
        ) else (
        goto :bitterchoco
        )
        :chocogui
            echo[
            echo Installing choco GUI for software management
            choco install chocolateygui -y
            echo chocolatey GUI is installed sucessfully !
            echo[
            goto:choco
        :loveOne
            choco install googlechrome -y
            goto:choco
        :loveTwo
            choco install brave -y
            goto:choco
        :loveThree
            choco install firefox -y
            goto:choco
        :loveFour
            choco install spotify -y
            goto:choco
        :loveFive
            choco install calibre -y
            goto:choco
        :loveSix
            choco install obs-studio.install -y
            goto:choco
        :loveSeven
            choco install vscode -y
            goto:choco
        :loveEight
            choco install sublimetext4 -y
            goto:choco
        :loveNine
            choco install notepadplusplus.install -y
            goto:choco
        :loveTen
            choco install git.install -y
            goto:choco
        :loveEleven
            choco install ffmpeg -y
            goto:choco
        :loveTwelve
            choco install qbittorrent -y
            goto:choco
        :loveThirteen
            choco install malwarebytes -y
            goto:choco
        :loveFourteen
            choco install winrar -y
            goto:choco
        :loveFifteen
            choco install 7zip.install -y
            goto:choco
        :loveSixteen
            choco install googledrive -y
            goto:choco
        :loveSeventeen
            choco install virtualbox -y
            goto:choco
        :loveEighteen
            choco install discord.install -y
            goto:choco
        :loveNineteen
            choco install k-litecodecpackfull -y
            goto:choco
        :loveTwenty
            choco install vlc -y
            goto:choco
        :loveTwentyone
            choco install office365proplus -y
            goto:choco
        :loveTwentytwo
            choco install libreoffice-fresh -y
            goto:choco
        :loveTwentythree
            choco install zoom -y
            goto:choco
        :loveTwentyfour
            choco install microsoft-teams.install -y
            goto:choco
        :loveTwentyfive
            choco install viber -y
            goto:choco
        :loveTwentysix
            choco install telegram.install -y
            goto:choco
        :loveTwentyseven
            choco install whatsapp -y
            goto:choco
        :loveTwentyeight
            choco install  youtube-dl -y
            goto:choco
        :loveTwentynine
            choco install blender -y
            goto:choco
        :loveThirty
            choco install python3 -y
            goto:choco
        :loveThirtyOne
            choco install stretchly -y
            goto:choco
        :loveThirtyTwo
            choco install greenshot -y
            goto:choco
        :loveThirtyThree
            choco install crystaldiskinfo -y
            goto:choco
        :loveThirtyFour
            choco install adobereader -y
            goto:choco
        :loveThirtyFive
            choco install autohotkey.install -y
            goto:choco
        :loveThirtySix
            choco install irfanview -y
            goto:choco
        :loveThirtySeven
            choco install audacity -y
            goto:choco
        :loveThirtyEight
            echo[
            echo [1] Intel  Graphics DCH
            echo [2] Nvidia Graphics DCH
            echo [0] Exit
            set /P drv= Welcome, Which Graphics do you want to install?:
            if /I "%drv%" EQU "1" (
            goto:intelgra
            ) else if /I "%drv%" EQU "2" (
            goto :nvidiagra
            ) else if /I "%drv%" EQU "0" (
            goto :choco
            ) else (
            goto :lovethirtyeight
            )
            :intelgra
                choco install intel-graphics-driver
                goto:choco
            :nvidiagra
                choco install nvidia-display-driver
                goto:choco
        :loveThirtyNine
            choco install pdf24 -y
            goto:choco
        :loveFourty
            choco install atom -y
            goto:choco

        :lovehundred
            choco install winrar -y
            choco install vlc -y
            choco install firefox -y
            choco install 7zip.install -y
            choco install office365proplus -y
            choco install zoom -y
            choco install sublimetext4 -y
            choco install spotify -y
            goto:choco

        :lovetwohundred
            choco install vscode -y
            choco install discord -y
            choco install telegram -y
            choco install git -y
            choco install obs-studio -y
            choco install calibre -y
            choco install qbittorrent -y
            goto:choco
        :updateall
            choco upgrade all -y
            goto:choco
        :uninstallchoco
            echo No way!
            goto:choco
        :bitterchoco
            echo "Ops! Don't you like to have choco bar? "
            goto:choco

    :battreport
        echo[
        echo Generating battery report of your %COMPUTERNAME% device !
        cd %USERPROFILE%\Desktop
        powercfg /batteryreport
        echo[
        echo [92mSaved at %USERPROFILE%\Desktop[0m
        %SystemRoot%\explorer.exe %USERPROFILE%\Desktop
        goto:farfrom

    :repairnet
        NET SESSION >nul 2>&1
        IF %ERRORLEVEL% EQU 0 (
            echo[
            echo It resets your network devices and network stack
            echo This should only take another few minutes or less, and then you'll be good to go!
            echo Ref: https://intel.ly/3OP6luA
            echo[
            pause
            ipconfig /release
            ipconfig /flushdns
            ipconfig /renew
            netsh int ip reset
            netsh winsock reset
            echo[
            echo Please! Restart your pc
            goto:farfrom
        ) ELSE (
            echo OFF
            echo[
            echo             d8888b. db    db d8b   db       .d8b.  .d8888.       .d8b.  d8888b. .88b  d88. d888888b d8b   db
            echo             88  `8D 88    88 888o  88      d8' `8b 88'  YP      d8' `8b 88  `8D 88'YbdP`88   `88'   888o  88
            echo             88oobY' 88    88 88V8o 88      88ooo88 `8bo.        88ooo88 88   88 88  88  88    88    88V8o 88
            echo             88`8b   88    88 88 V8o88      88~~~88   `Y8b.      88~~~88 88   88 88  88  88    88    88 V8o88
            echo             88 `88. 88b  d88 88  V888      88   88 db   8D      88   88 88  .8D 88  88  88   .88.   88  V888
            echo             88   YD ~Y8888P' VP   V8P      YP   YP `8888Y'      YP   YP Y8888D' YP  YP  YP Y888888P VP   V8P
            echo[
            echo                     [31m------------------  ERROR: ADMINISTRATOR PRIVILEGES REQUIRED  -------------------[0m
            echo This script must be run as administrator to work as it resets your network devices and network stack
            echo[
            echo If you're seeing this, then right click on this script and select "Run As Administrator".
            echo[
            echo As the task can't be run without the Administrator privileges
            echo [92mDo you want to open the script with the Administrator privileges?[0m
            pause
            Net session >nul 2>&1
            if not '%errorlevel%' == '0' (
                PowerShell start -verb runas '%~0' &exit /b)
            cd %~dp0 )
    :repairpc
        echo OFF
        NET SESSION >nul 2>&1
        IF %ERRORLEVEL% EQU 0 (
            echo[
            echo The Deployment Image Servicing and Management tool can be used to scan and repair potential issues with the .wim store in Windows that may impact system files.
            echo This should take 10-20 minutes to run, but depending on circumstances it can potentially take over an hour.
            echo Ref: https://dell.to/3d2EqtO or https://bit.ly/3BUBZDZ
            echo[
            pause
            Dism /Online /Cleanup-Image /ScanHealth
            Dism /Online /Cleanup-Image /RestoreHealth
            ::for offline repair
            rem Dism /Image:C:\offline /Cleanup-Image /RestoreHealth /Source:c:\test\mount\windows
            rem Dism /Online /Cleanup-Image /CheckHealth
            echo Please! Restart your pc
            echo[
            goto:farfrom
        ) ELSE (
            echo[
            echo             d8888b. db    db d8b   db       .d8b.  .d8888.       .d8b.  d8888b. .88b  d88. d888888b d8b   db
            echo             88  `8D 88    88 888o  88      d8' `8b 88'  YP      d8' `8b 88  `8D 88'YbdP`88   `88'   888o  88
            echo             88oobY' 88    88 88V8o 88      88ooo88 `8bo.        88ooo88 88   88 88  88  88    88    88V8o 88
            echo             88`8b   88    88 88 V8o88      88~~~88   `Y8b.      88~~~88 88   88 88  88  88    88    88 V8o88
            echo             88 `88. 88b  d88 88  V888      88   88 db   8D      88   88 88  .8D 88  88  88   .88.   88  V888
            echo             88   YD ~Y8888P' VP   V8P      YP   YP `8888Y'      YP   YP Y8888D' YP  YP  YP Y888888P VP   V8P
            echo[
            echo                     [31m------------------  ERROR: ADMINISTRATOR PRIVILEGES REQUIRED  -------------------[0m
            echo This script must be run as administrator to work as it uses DISM to Repair a Windows image
            echo[
            echo If you're seeing this, then right click on this script and select "Run As Administrator".
            echo[
            echo As the task can't be run without the Administrator privileges
            echo [92mDo you want to open the script with the Administrator privileges?[0m
            pause
            Net session >nul 2>&1
            if not '%errorlevel%' == '0' (
                PowerShell start -verb runas '%~0' &exit /b)
            cd %~dp0
        )
    :repairsys
        echo OFF
        NET SESSION >nul 2>&1
        IF %ERRORLEVEL% EQU 0 (
            echo[
            echo System File Checker is a utility in Microsoft Windows that allows users to scan for and restore corrupted Windows system files.
            echo It may take several minutes for the command operation to be completed.
            echo Ref: https://bit.ly/3zOXDHr or https://bit.ly/3BUBZDZ
            echo[
            pause
            sfc /scannow
            echo[
            echo SFC scan completed!
            goto:farfrom
        ) ELSE (
            echo[
            echo             d8888b. db    db d8b   db       .d8b.  .d8888.       .d8b.  d8888b. .88b  d88. d888888b d8b   db
            echo             88  `8D 88    88 888o  88      d8' `8b 88'  YP      d8' `8b 88  `8D 88'YbdP`88   `88'   888o  88
            echo             88oobY' 88    88 88V8o 88      88ooo88 `8bo.        88ooo88 88   88 88  88  88    88    88V8o 88
            echo             88`8b   88    88 88 V8o88      88~~~88   `Y8b.      88~~~88 88   88 88  88  88    88    88 V8o88
            echo             88 `88. 88b  d88 88  V888      88   88 db   8D      88   88 88  .8D 88  88  88   .88.   88  V888
            echo             88   YD ~Y8888P' VP   V8P      YP   YP `8888Y'      YP   YP Y8888D' YP  YP  YP Y888888P VP   V8P
            echo[
            echo                     [31m------------------  ERROR: ADMINISTRATOR PRIVILEGES REQUIRED  -------------------[0m
            echo This script must be run as administrator to work as it allows users to scan for and restore corrupted Windows system files.
            echo[
            echo If you're seeing this, then right click on this script and select "Run As Administrator".
            echo[
            echo As the task can't be run without the Administrator privileges
            echo [92mDo you want to open the script with the Administrator privileges?[0m
            pause
            Net session >nul 2>&1
            if not '%errorlevel%' == '0' (
                PowerShell start -verb runas '%~0' &exit /b)
            cd %~dp0
        )

    :Errorkit
        echo[
        echo You are playing it wrong, press only one digit! [1-5]
        goto:farfrom

:pyproj
    echo[
    echo             :::       :::    ::: ::::    :::  ::::::::  :::    :::                       :::::::::  :::   :::
    echo             :+:       :+:    :+: :+:+:   :+: :+:    :+: :+:    :+:       :+:     :+:     :+:    :+: :+:   :+:
    echo             +:+       +:+    +:+ :+:+:+  +:+ +:+        +:+    +:+         +:+ +:+       +:+    +:+  +:+ +:+
    echo             +#+       +#+    +:+ +#+ +:+ +#+ +#+        +#++:++#++      +#++:++#++:++    +#++:++#+    +#++:
    echo             +#+       +#+    +#+ +#+  +#+#+# +#+        +#+    +#+         +#+ +#+       +#+           +#+
    echo             #+#       #+#    #+# #+#   #+#+# #+#    #+# #+#    #+#       #+#     #+# #+# #+#           #+#
    echo             ########## ########  ###    ####  ########  ###    ###                   ### ###           ###
    echo                                         [92m---- %username% spawned into snake island ----[0m
    echo[
    echo    Press 1 = Download Youtube Videos/Music/Playlists                Press 7 = Misc Projects
    echo    Press 2 = Create a Temporary email                               Press 8 = Download Books
    echo    Press 3 = Internet Speedtest
    echo    Press 4 = Upload Files
    echo    Press 5 = Generate QRcode
    echo    Press 6 = Shrink URL
    echo    [90mPress 0 = Depart[0m
        set /P pyt= Welcome, press the secret key to lunch *.py:
    if /I "%pyt%" EQU "1" (
    goto :ytdown
    ) else if /I "%pyt%" EQU "2" (
    goto:tempmail
    ) else if /I "%pyt%" EQU "3" (
    goto:spedtest
    ) else if /I "%pyt%" EQU "4" (
    goto :uploadfiles
    ) else if /I "%pyt%" EQU "5" (
    goto:qrcode
    ) else if /I "%pyt%" EQU "6" (
    goto:shortenurl
    ) else if /I "%pyt%" EQU "7" (
    goto:miscapi
    ) else if /I "%pyt%" EQU "8" (
    goto:libgenbooks
    ) else if /I "%pyt%" EQU "0" (
    goto:choice
    ) else (
    goto :pyproj
    )
    :ytdown
        @echo off
        echo[
        echo I'm here because you want to download Youtube Videos
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python youtube.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyproj
    :qrcode
        @echo off
        echo[
        echo I'm here because you want to Generate QRcode
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python qrcode.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyproj
    :spedtest
        @echo off
        echo[
        echo I'm here because you want to test your internet speed through CLI
        cmd /k "cd %~dp0\venv\Scripts & activate & speedtest-cli --secure --share & deactivate.bat & exit"
        pause
        goto:pyproj
    :shortenurl
        @echo off
        echo[
        echo I'm here because you want shrink links.
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python shorten_ulvis.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyproj
    :tempmail
        @echo off
        echo[
        echo I'm here because you want create a temporary disposable Email Address
        echo[
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python tempmail.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyproj
    :uploadfiles
        @echo off
        echo[
        echo I'm here because you want to upload your files to the cloud
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python anonupload.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyproj
    :libgenbooks
        @echo off
        echo[
        echo I'm here because you want to download books from Libgen
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python libgen.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyproj
    :miscapi
        @echo off
        echo[
        echo                        ------------   --------   ----    ---- ------------ ----    ----
        echo                        ************  **********  ****   ****  ************ *****   ****
        echo                        ------------ ----    ---- ----  ----   ----         ------  ----
        echo                            ****     ***      *** *********    ************ ************
        echo                            ----     ---      --- ---------    ------------ ------------
        echo                            ****     ****    **** ****  ****   ****         ****  ******
        echo                            ----      ----------  ----   ----  ------------ ----   -----
        echo                            ****       ********   ****    **** ************ ****    ****
        echo                                      [92m---- Hey %username%, show me your token ----[0m
        echo[
        echo    Press 1 = Bitly URL Shortener
        echo    Press 2 = Calculate love
        echo    Press 3 = Currency converter
        echo    Press 4 = Scrap IMDb Movies
        echo    [90mPress 0 = Depart[0m
            set /P msa= Welcome, Which API project would you like to use ?[1-4]:
        if /I "%msa%" EQU "1" (
        goto:shortenurlbitly
        ) else if /I "%msa%" EQU "2" (
         goto:lovecalculate
        ) else if /I "%msa%" EQU "3" (
         goto:cashconvert
        ) else if /I "%msa%" EQU "4" (
         goto:scrapimdb
        ) else if /I "%msa%" EQU "0" (
         goto:pyproj
        ) else (
        goto:miscapi
        )
        :shortenurlbitly
            @echo off
            echo[
            echo I'm here because you want shorten links from Bitly
            cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python shorten.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
            pause
            goto:miscapi
        :lovecalculate
            @echo off
            echo[
            echo I'm here because you want calculate your love percentage
            cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python lovers.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
            pause
            goto:miscapi
        :cashconvert
            @echo off
            echo[
            echo I'm here because you want convert Currency
            cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python cash.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
            pause
            goto:miscapi
        :scrapimdb
            echo[
            echo Activating spider script to crawl a site to scrap information
            :: Thanks to Ashish Gupta user2350219
            :: ref from stackoverflow.com/a/30927921
            cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python imdb.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
            pause
            goto:miscapi

:chkpip
    @echo off
    pip --version >NUL 2>&1
    IF  %ERRORLEVEL% EQU 0 (
    echo [92mInstalling the required requirements for the python script to work[0m
    echo[
    cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0 & pip install -U -r requirements.txt & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
    echo [92mSuccessfully installed and updated requirements![0m
    echo[
    echo                         [92mKx-----  Python is found lurking around, so I'll lend you my power -----Cx[0m
    goto:pyproj
    ) ELSE (
    echo Donwloading get-pip.py from bootstrap.pypa.io/get-pip.py
    echo [92mInstalling pip and requirements for the python script to work[0m
    echo[
    cmd /k "cd %~dp0\venv\Scripts & activate & cd /d  %~dp0 & curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py & python get-pip.py & python -m pip install -U pip & cd /d %~dp0 & pip install -U -r requirements.txt & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
    echo [92mSuccessfully installed pip and required requirements![0m
    echo[
    echo                         [92mKx-----  Python is found lurking around, so I'll lend you my power -----Cx[0m
    goto:pyproj
    )

:chekint
    Ping www.google.com -n 2 -w 1000 >NUL 2>&1
    if not "%errorlevel%" == "0" (
    echo[
    echo             [31mKx---- Some of the features might not work as the device is not connected to the internet ----Cx[0m
    goto:pyproj)
    goto:chkpip

:venvreqimnt
    @echo off
    cd %~dp0\
    if not exist "%~dp0\venv\Scripts\activate" (
    echo Creating venv for your *.py
    cd %~dp0\
    echo Changed directory to %~dp0
    echo[
    echo Please be patient...
    echo This should only take another few minutes or less, and then you'll be good to go!
    python -m venv venv
    echo Initialization of venv completed!!
    )
    goto:chekint

:chkifpy
    :: Thanks to Drej user1536175 ref from stackoverflow.com/a/26241114
    @echo off
    python --version >NUL 2>&1
    IF  %ERRORLEVEL% EQU 0 (
    echo [92mPython detected!![0m
    goto:venvreqimnt
    ) ELSE (
    echo[
    echo [31mLooks like python is not installed on your pc[0m
    echo Please,Install python to run this script!
    echo Download from: https://www.python.org/downloads
    echo[
    echo [31mOr Press any key to enter the chocolatey section and then press 30 to install python[0m
    pause
    goto:choco
    )

:lazyme
    echo somewhere over the rainbow
    goto:choice
