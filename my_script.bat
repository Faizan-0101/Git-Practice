@echo off
if "%~2" == "" (
    echo Usage: %0 ^<branch_name^> ^<commit_message^>
    exit /b 1
)

set branch_name=%1
set commit_message=%2

:: Check if there are changes to commit
git status | findstr /R "^."

:: If there are changes, commit and push
if %errorlevel% == 0 (
    git add .
    git commit -m "%commit_message%"
    git push origin %branch_name%
) else (
    echo No changes to commit.
)

exit /b 0