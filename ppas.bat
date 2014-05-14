@echo off
SET THEFILE=HelloWorld.exe
echo Linking %THEFILE%
C:\lazarus\fpc\2.6.2\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections  -s --subsystem windows --entry=_WinMainCRTStartup   --base-file base.$$$ -o HelloWorld.exe link.res
if errorlevel 1 goto linkend
dlltool.exe -S C:\lazarus\fpc\2.6.2\bin\x86_64-win64\as.exe -D HelloWorld.exe -e exp.$$$ --base-file base.$$$ 
if errorlevel 1 goto linkend
C:\lazarus\fpc\2.6.2\bin\x86_64-win64\ld.exe -b pei-x86-64  -s --subsystem windows --entry=_WinMainCRTStartup  -o HelloWorld.exe link.res exp.$$$
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
