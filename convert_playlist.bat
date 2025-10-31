@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Configuration - Update this path to match your setup
set "MUSIC_BASE_PATH=O:\music"

:: Check if input file is provided
if "%~1"=="" (
    echo Usage: %~nx0 input.m3u8
    echo.
    echo Example: %~nx0 "my_playlist.m3u8"
    exit /b 1
)

set "INPUT_FILE=%~1"
set "OUTPUT_FILE=%~dpn1_fixed%~x1"

:: Check if input file exists
if not exist "!INPUT_FILE!" (
    echo Error: Input file "!INPUT_FILE!" not found.
    exit /b 1
)

echo Converting playlist...
echo Input:  !INPUT_FILE!
echo Output: !OUTPUT_FILE!
echo.

:: Create temporary PowerShell script
set "PS_SCRIPT=%TEMP%\convert_m3u8.ps1"

> "!PS_SCRIPT!" echo $musicBase = '%MUSIC_BASE_PATH%'
>> "!PS_SCRIPT!" echo $inputFile = '%INPUT_FILE%'
>> "!PS_SCRIPT!" echo $outputFile = '%OUTPUT_FILE%'
>> "!PS_SCRIPT!" echo.
>> "!PS_SCRIPT!" echo $content = [System.IO.File]::ReadAllLines($inputFile, [System.Text.Encoding]::UTF8)
>> "!PS_SCRIPT!" echo.
>> "!PS_SCRIPT!" echo $output = @()
>> "!PS_SCRIPT!" echo foreach ($line in $content) {
>> "!PS_SCRIPT!" echo     if ($line -match '^[A-Z]:\\') {
>> "!PS_SCRIPT!" echo         $newLine = $line -replace '^[A-Z]:', ''
>> "!PS_SCRIPT!" echo         $pattern = [regex]::Escape($musicBase)
>> "!PS_SCRIPT!" echo         $newLine = $newLine -replace $pattern, ''
>> "!PS_SCRIPT!" echo         $newLine = $newLine.Replace('\', '/')
>> "!PS_SCRIPT!" echo         $newLine = $newLine.TrimStart('/')
>> "!PS_SCRIPT!" echo         $output += $newLine
>> "!PS_SCRIPT!" echo     } else {
>> "!PS_SCRIPT!" echo         $output += $line
>> "!PS_SCRIPT!" echo     }
>> "!PS_SCRIPT!" echo }
>> "!PS_SCRIPT!" echo.
>> "!PS_SCRIPT!" echo [System.IO.File]::WriteAllLines($outputFile, $output, [System.Text.Encoding]::UTF8)

:: Run PowerShell script
powershell -NoProfile -ExecutionPolicy Bypass -File "!PS_SCRIPT!"

:: Clean up temp script
del "!PS_SCRIPT!" >nul 2>&1

if exist "!OUTPUT_FILE!" (
    echo.
    echo Conversion complete!
    echo Converted playlist saved to: !OUTPUT_FILE!
    echo.
    echo Next steps:
    echo 1. Transfer the playlist file to your Android device
    echo 2. Make sure your music files are organized the same way on Android
    echo 3. Open the playlist in VLC on your Android device
) else (
    echo.
    echo Error: Conversion failed.
    exit /b 1
)

endlocal