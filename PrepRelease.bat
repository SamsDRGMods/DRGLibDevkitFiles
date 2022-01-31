@echo off
setlocal EnableDelayedExpansion

::Set active directory to the dir the bat is in
pushd %~dp0

echo Clearing temp dir
rmdir Temp /s /q
mkdir Temp\Content\

cd Temp

robocopy ..\FSD\Content\DRGLib Content\DRGLib /MIR /ns /nc /nfl /ndl /np /njh /njs

tar -a -cf DRGLibDevkitFiles.zip Content

set /p ReleaseName=Please enter a suffix for this release:

ren DRGLibDevkitFiles.zip DRGLibDevkitFiles%ReleaseName%.zip

pause