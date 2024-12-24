@echo off

:: Check if the correct command is provided
if "%1" NEQ "uninstall" (
    echo Invalid command. Use: Digest uninstall [rush|fast]
    exit /b
)

:: Check if the second argument is provided
if "%2"=="" (
    echo Please specify the compiler to uninstall: rush or fast.
    exit /b
)

set /p admin_name="Enter the administrator name of the computer: "

if "%2"=="rush" (
    echo Uninstalling Rush...
    if exist "C:\Users\%admin_name%\.rush" (
        rmdir /s /q "C:\Users\%admin_name%\.rush"
        echo Deleted C:\Users\%admin_name%\.rush
    ) else (
        echo Directory C:\Users\%admin_name%\.rush does not exist.
    )

    if exist "C:\Users\user\AppData\Roaming\rush" (
        rmdir /s /q "C:\Users\user\AppData\Roaming\rush"
        echo Deleted C:\Users\user\AppData\Roaming\rush
    ) else (
        echo Directory C:\Users\user\AppData\Roaming\rush does not exist.
    )

    echo Rush uninstalled successfully.
    exit /b
)

if "%2"=="fast" (
    echo Uninstalling Fast...

    if exist "C:\Users\user\AppData\Local\Fast" (
        rmdir /s /q "C:\Users\user\AppData\Local\Fast"
        echo Deleted C:\Users\user\AppData\Local\Fast
    ) else (
        echo Directory C:\Users\user\AppData\Local\Fast does not exist.
    )

    echo Fast uninstalled successfully.
    exit /b
)

:: If an invalid compiler is specified
echo Invalid compiler specified. Use: rush or fast.
