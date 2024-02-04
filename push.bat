@echo off

REM Check Git status
git status

REM Add changes 
git add .

REM Prompt for commit message
set /p commitMessage=Enter commit message: 

REM Commit changes with the provided message
git commit -m "%commitMessage%"

REM Push to the repository
git push

REM Pause to keep the console window open (optional)
pause
