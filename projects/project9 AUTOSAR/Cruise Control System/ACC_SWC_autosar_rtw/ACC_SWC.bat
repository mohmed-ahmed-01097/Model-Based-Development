
call "setup_mingw.bat"

cd .

if "%1"=="" ("G:\MATLAB~3\bin\win64\gmake"  -f ACC_SWC.mk all) else ("G:\MATLAB~3\bin\win64\gmake"  -f ACC_SWC.mk %1)
@if errorlevel 1 goto error_exit

exit /B 0

:error_exit
echo The make command returned an error of %errorlevel%
exit /B 1