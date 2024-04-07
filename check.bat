@ECHO OFF
color 7
echo                                            x - :k:[92m Utility Program [0m:c: - x

:: NET SESSION displays information about all active sessions on a computer.
:: 2>&1 :redirect both the standard output (stdout) and standard error (stderr) streams of a command to the same destination
:: >nul: This part of the command redirects the standard output (stdout) of the command to the special file nul, which is essentially a black hole where output is discarded. This effectively suppresses any output that would normally be printed to the console..
::check admin right by dirty hack
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo                                                    [31m-: Sudo Mode :-[0m
    goto:farfrom
) ELSE (
    echo                                                   -:[94m Normal Mode [0m:-
)
echo[
:: display date and time
echo %date% %time%
echo Something just fell from the sky! - oh, its %username% from %COMPUTERNAME% device!
:choice
    echo[
    echo    Press 1 = Read News
    echo    Press 2 = Summon Python Program
    echo    Press 3 = Utility Program
    echo    [90mPress 0 = Leave[0m
    echo[
    :brain
    set /P brn=Feed me just Number so, I can work for you!! [1-3]:
    if /I "%brn%" EQU "1" ( goto :newsSection
    ) else if  /I "%brn%" EQU "2" ( goto :chkifpy
    ) else if  /I "%brn%" EQU "3" ( goto :farfrom
    ) else if  /I "%brn%" EQU "0" ( goto :exitProgram
    ) else (goto :choice)

:newsSection
    echo[
    echo I am here because you want to see World News
    start "Edge" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://www.cnbc.com/world/ https://www.setopati.com/ https://www.onlinekhabar.com/ https://www.ratopati.com/ https://ekantipur.com/ https://www.sciencealert.com/ https://www.insider.com/asia/ https://news.google.com/topstories/
    goto :END

:exitProgram
    echo [92mExiting Utility Program[0m
    :: Wait for some second before closing
    ping -n 3 127.0.0.1 > nul
    exit

:farfrom
    echo[
    NET SESSION >nul 2>&1
    IF %ERRORLEVEL% EQU 0 (
        echo                                  [31m---- Feels like %username% device needs some medic kit! -----[0m
    ) ELSE (
        echo                                  [92m---- Feels like %username% device needs some medic kit! -----[0m
    )
    echo[
    echo    Press 1 = Install/Update software through chocolatey
    echo    Press 2 = Generate Battery report
    echo    Press 3 = Repair a Windows image
    echo    Press 4 = Reset Network settings
    echo    Press 5 = Repair System files
    echo    [90mPress 0 = Depart[0m
   :farbox
        set /P drs= Which kit would you like to proceed with? [1-5]:

    if /I "%drs%" EQU "1" (
    goto :choco
    ) else if /I "%drs%" EQU "2" (
    goto :battReport
    ) else if /I "%drs%" EQU "3" (
    goto :repairPc
    ) else if /I "%drs%" EQU "4" (
    goto :repairNet
    ) else if /I "%drs%" EQU "5" (
    goto :repairSys
    ) else if /I "%drs%" EQU "0" (
    goto:choice
    ) else (
    goto :farfrom
    )
    :choco
        echo OFF
        :: check intenet connection by pinging at google.com
        Ping www.google.com -n 2 -w 1000 >NUL 2>&1
        if not "%errorlevel%" == "0" (
        echo[
        echo [31mPlease, check your internet connection[0m
        echo [31mSoftware can't be downloaded without the internet.[0m
        goto:farfrom)
        NET SESSION >nul 2>&1
        IF %ERRORLEVEL% EQU 0 (
            echo[
            echo Admin user detected!
            echo Installing Chocolatey Please be patient...
            echo This should only take another few minutes or less, and then you'll be good to go!
            :: Boiler code https://community.chocolatey.org/courses/installation/installing?method=install-using-powershell-from-cmdexe
            powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
            echo Sweet Chocolatey is ready to serve you!
        ) ELSE (
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
        goto :chocoOne
        ) else if /I "%fun%" EQU "2" (
         goto :chocoTwo
        ) else if /I "%fun%" EQU "3" (
         goto :chocoThree
        ) else if /I "%fun%" EQU "4" (
         goto :chocoFour
        ) else if /I "%fun%" EQU "4" (
         goto :chocoFive
        ) else if /I "%fun%" EQU "6" (
         goto :chocoSix
        ) else if /I "%fun%" EQU "7" (
         goto :chocoSeven
        ) else if /I "%fun%" EQU "8" (
         goto :chocoEight
        ) else if /I "%fun%" EQU "9" (
         goto :chocoNine
        ) else if /I "%fun%" EQU "10" (
         goto :chocoTen
        ) else if /I "%fun%" EQU "11" (
         goto :chocoEleven
        ) else if /I "%fun%" EQU "12" (
         goto :chocoTwelve
        ) else if /I "%fun%" EQU "13" (
         goto :chocoThirteen
        ) else if /I "%fun%" EQU "14" (
         goto :chocoFourteen
        ) else if /I "%fun%" EQU "15" (
         goto :chocoFifteen
        ) else if /I "%fun%" EQU "16" (
         goto :chocoSixteen
        ) else if /I "%fun%" EQU "17" (
         goto :chocoSeventeen
        ) else if /I "%fun%" EQU "18" (
         goto :chocoEighteen
        ) else if /I "%fun%" EQU "19" (
         goto :chocoNineteen
        ) else if /I "%fun%" EQU "20" (
         goto :chocoTwenty
        ) else if /I "%fun%" EQU "21" (
         goto :chocoTwentyone
        ) else if /I "%fun%" EQU "22" (
         goto :chocoTwentytwo
        ) else if /I "%fun%" EQU "23" (
         goto :chocoTwentythree
        ) else if /I "%fun%" EQU "24" (
         goto :chocoTwentyfour
        ) else if /I "%fun%" EQU "25" (
         goto :chocoTwentyfive
        ) else if /I "%fun%" EQU "26" (
         goto :chocoTwentysix
        ) else if /I "%fun%" EQU "27" (
         goto :chocoTwentyseven
        ) else if /I "%fun%" EQU "28" (
         goto :chocoTwentyeight
        ) else if /I "%fun%" EQU "29" (
         goto :chocoTwentynine
        ) else if /I "%fun%" EQU "30" (
         goto :chocoThirty
        ) else if /I "%fun%" EQU "31" (
         goto :chocoThirtyOne
        ) else if /I "%fun%" EQU "32" (
         goto :chocoThirtyTwo
        ) else if /I "%fun%" EQU "33" (
         goto :chocoThirtyThree
        ) else if /I "%fun%" EQU "34" (
         goto :chocoThirtyFour
        ) else if /I "%fun%" EQU "35" (
         goto :chocoThirtyFive
        ) else if /I "%fun%" EQU "36" (
         goto :chocoThirtySix
        ) else if /I "%fun%" EQU "37" (
         goto :chocoThirtySeven
        ) else if /I "%fun%" EQU "38" (
         goto :chocoThirtyEight
        ) else if /I "%fun%" EQU "39" (
         goto :chocoThirtyNine
        ) else if /I "%fun%" EQU "40" (
         goto :chocoFourty
        ) else if /I "%fun%" EQU "100" (
         goto :chocohundred
        ) else if /I "%fun%" EQU "200" (
         goto :chocotwohundred
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
        :chocoOne
            choco install googlechrome -y
            goto:choco
        :chocoTwo
            choco install brave -y
            goto:choco
        :chocoThree
            choco install firefox -y
            goto:choco
        :chocoFour
            choco install spotify -y
            goto:choco
        :chocoFive
            choco install calibre -y
            goto:choco
        :chocoSix
            choco install obs-studio.install -y
            goto:choco
        :chocoSeven
            choco install vscode -y
            goto:choco
        :chocoEight
            choco install sublimetext4 -y
            goto:choco
        :chocoNine
            choco install notepadplusplus.install -y
            goto:choco
        :chocoTen
            choco install git.install -y
            goto:choco
        :chocoEleven
            choco install ffmpeg -y
            goto:choco
        :chocoTwelve
            choco install qbittorrent -y
            goto:choco
        :chocoThirteen
            choco install malwarebytes -y
            goto:choco
        :chocoFourteen
            choco install winrar -y
            goto:choco
        :chocoFifteen
            choco install 7zip.install -y
            goto:choco
        :chocoSixteen
            choco install googledrive -y
            goto:choco
        :chocoSeventeen
            choco install virtualbox -y
            goto:choco
        :chocoEighteen
            choco install discord.install -y
            goto:choco
        :chocoNineteen
            choco install k-litecodecpackfull -y
            goto:choco
        :chocoTwenty
            choco install vlc -y
            goto:choco
        :chocoTwentyone
            choco install office365proplus -y
            goto:choco
        :chocoTwentytwo
            choco install libreoffice-fresh -y
            goto:choco
        :chocoTwentythree
            choco install zoom -y
            goto:choco
        :chocoTwentyfour
            choco install microsoft-teams.install -y
            goto:choco
        :chocoTwentyfive
            choco install viber -y
            goto:choco
        :chocoTwentysix
            choco install telegram.install -y
            goto:choco
        :chocoTwentyseven
            choco install whatsapp -y
            goto:choco
        :chocoTwentyeight
            choco install  youtube-dl -y
            goto:choco
        :chocoTwentynine
            choco install blender -y
            goto:choco
        :chocoThirty
            choco install python3 -y
            goto:choco
        :chocoThirtyOne
            choco install stretchly -y
            goto:choco
        :chocoThirtyTwo
            choco install greenshot -y
            goto:choco
        :chocoThirtyThree
            choco install crystaldiskinfo -y
            goto:choco
        :chocoThirtyFour
            choco install adobereader -y
            goto:choco
        :chocoThirtyFive
            choco install autohotkey.install -y
            goto:choco
        :chocoThirtySix
            choco install irfanview -y
            goto:choco
        :chocoThirtySeven
            choco install audacity -y
            goto:choco
        :chocoThirtyEight
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
            goto :chocothirtyeight
            )
            :intelgra
                choco install intel-graphics-driver
                goto:choco
            :nvidiagra
                choco install nvidia-display-driver
                goto:choco
        :chocoThirtyNine
            choco install pdf24 -y
            goto:choco
        :chocoFourty
            choco install atom -y
            goto:choco

        :chocohundred
            choco install winrar -y
            choco install vlc -y
            choco install firefox -y
            choco install 7zip.install -y
            choco install office365proplus -y
            choco install zoom -y
            choco install sublimetext4 -y
            choco install spotify -y
            goto:choco

        :chocotwohundred
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

    :battReport
        echo[
        echo Generating battery report of your %COMPUTERNAME% device !
        cd %USERPROFILE%\Desktop
        powercfg /batteryreport
        echo[
        echo [92mSaved at %USERPROFILE%\Desktop[0m
        %SystemRoot%\explorer.exe %USERPROFILE%\Desktop
        goto:farfrom

    :repairNet
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
    :repairPc
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
    :repairSys
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

    :errorKit
        echo[
        echo You are playing it wrong, press only one digit! [1-5]
        goto:farfrom

:pyProj
    echo[
    echo                                         [92m---- %username% spawned into snake island ----[0m
    echo[
    echo    Press 1 = Download Youtube Videos/Music/Playlists
    echo    Press 2 = Download Books from Libgen
    echo    Press 3 = Generate QRcode
    echo    [90mPress 0 = Depart[0m
        set /P pyt= Welcome, press the secret key to lunch *.py:
    if /I "%pyt%" EQU "1" (
    goto :ytDown
    ) else if /I "%pyt%" EQU "2" (
    goto:libgenBooks
    ) else if /I "%pyt%" EQU "3" (
    goto:qrCode
    ) else if /I "%pyt%" EQU "0" (
    goto:choice
    ) else (
    goto :pyProj
    )
    :ytDown
        @echo off
        echo[
        echo I'm here because you want to download Youtube Videos
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python youtube.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyProj
    :qrCode
        @echo off
        echo[
        echo I'm here because you want to Generate QRcode
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python qrcode.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyProj
    :libgenBooks
        @echo off
        echo[
        echo I'm here because you want to download books from Libgen
        cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0\modules & python libgen.py & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
        pause
        goto:pyProj

:chkPIP
    @echo off
    pip --version >NUL 2>&1
    IF  %ERRORLEVEL% EQU 0 (
    echo [92mInstalling the required requirements for the python script to work[0m
    echo[
    cmd /k "cd %~dp0\venv\Scripts & activate & cd /d %~dp0 & pip install -U -r requirements.txt & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
    echo [92mSuccessfully installed and updated requirements![0m
    echo[
    echo                         [92mKx-----  Python is found lurking around, so I'll lend you my power -----Cx[0m
    goto:pyProj
    ) ELSE (
    echo Donwloading get-pip.py from bootstrap.pypa.io/get-pip.py
    echo [92mInstalling pip and requirements for the python script to work[0m
    echo[
    cmd /k "cd %~dp0\venv\Scripts & activate & cd /d  %~dp0 & curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py & python get-pip.py & python -m pip install -U pip & cd /d %~dp0 & pip install -U -r requirements.txt & cd /d%~dp0\venv\Scripts & deactivate.bat & exit"
    echo [92mSuccessfully installed pip and required requirements![0m
    echo[
    echo                         [92mKx-----  Python is found lurking around, so I'll lend you my power -----Cx[0m
    goto:pyProj
    )

:chekInt
    Ping www.google.com -n 2 -w 1000 >NUL 2>&1
    if not "%errorlevel%" == "0" (
    echo[
    echo             [31mKx---- Some of the features might not work as the device is not connected to the internet ----Cx[0m
    goto:pyProj)
    goto:chkPIP

:venvreqimnt
    @echo off
    :: %~dp0 will expand to the drive letter and path where the batch script is located.
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
    goto:chekInt

:chkifpy
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



::  %~dp0
::  %0 refers to the current batch script file.
::  %~ removes any surrounding quotation marks (if present).
::  d expands to the drive letter.
::  p expands to the path.
::  0 refers to the location of the batch script file.