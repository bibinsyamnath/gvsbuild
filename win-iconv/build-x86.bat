:: run this from a VS x86 command prompt
@echo off

SET PACKAGE_NAME=win-iconv-0.0.6

set ICONV_SRC=%cd%
set ICONV_DEST=%cd%-x86
del CMakeCache.txt
rmdir /q /s CMakeFiles
set PATH=%PATH%;%ProgramFiles(x86)%\CMake 2.8\bin
cmake -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%ICONV_DEST% -DCMAKE_BUILD_TYPE=Release
nmake clean
nmake
echo.Press return when ready to install!
pause

nmake install
mkdir %ICONV_DEST%\share
mkdir %ICONV_DEST%\share\doc
mkdir %ICONV_DEST%\share\doc\win-iconv
copy COPYING %ICONV_DEST%\share\doc\win-iconv
nmake clean

cd %ICONV_DEST%
set PATH=%PATH%;%ProgramFiles%\7-zip
del ..\%PACKAGE_NAME%-x86.7z
7z a ..\%PACKAGE_NAME%-x86.7z *
cd %ICONV_SRC%
rmdir /q /s %ICONV_DEST%

echo.Finished!
pause
