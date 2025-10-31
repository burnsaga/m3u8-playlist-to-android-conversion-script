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

:: Run PowerShell with inline script
powershell -NoProfile -ExecutionPolicy Bypass -Command "$musicBase = '%MUSIC_BASE_PATH%'; $inputFile = '%INPUT_FILE%'; $outputFile = '%OUTPUT_FILE%'; $content = [System.IO.File]::ReadAllLines($inputFile, [System.Text.Encoding]::UTF8); $output = @(); foreach ($line in $content) { if ($line -match '^[A-Z]:\\') { $newLine = $line -replace '^[A-Z]:', ''; $pattern = [regex]::Escape($musicBase); $newLine = $newLine -replace $pattern, ''; $newLine = $newLine.Replace('\', '/'); $newLine = $newLine.TrimStart('/'); $newLine = $newLine -replace '^music/', ''; $output += $newLine } else { $output += $line } }; [System.IO.File]::WriteAllLines($outputFile, $output, [System.Text.Encoding]::UTF8)"

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