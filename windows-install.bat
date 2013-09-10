@echo off

:: Check if we have administrative rights.
:: Modified from http://stackoverflow.com/a/11995662
echo Administrative permissions required. Detecting permissions...
echo.

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrative permissions confirmed.
    echo.
) else (
    echo Failure: Current permissions inadequate.
    echo Please run this .bat as administrator.
    echo.
    pause
    exit
)

:: The vimfiles directory and the .vimrc file go in the same place:
:: C:\Users\<user>, or the USERPROFILE directory.
:: see :help runtimepath in vim for more information
set vftarget="%USERPROFILE%\vimfiles\"
set vrctarget="%USERPROFILE%\.vimrc"

:: The %~dp0 sequence gives us the current directory of the batch file.
:: The ending '\' separator is already included.
set vfsource="%~dp0"
set vrcsource="%~dp0.vimrc"

:: Let the user can see what's going on.
echo Vimfiles directory:
echo Source: %vfsource%
echo Target: %vftarget%
echo. 

echo .vimrc:
echo Source: %vrcsource%
echo Target: %vrctarget%
echo.

:: The mklink command creates junctions, which are essentially symlinks.
:: The /j option is for directory junctions.
echo Creating junctions...
mklink /j %vftarget% %vfsource%
mklink %vrctarget% %vrcsource%

pause
