@echo off

echo Compile pak128.Sweden-Ex!
echo =========================
echo.
echo This batch compiles to folder simutrans/pak128.
echo It requires the file makeobj.exe to be in the same
echo folder as this file pak128.bat.
echo.
if not exist .\makeobj.exe goto abort

md Pak128.Sweden-Ex
del err.txt

rem delete old data

cd Pak128.Sweden-Ex
del *.pak
del config\*.tab
del text\*.tab
del text\*.txt
del text\*.zip
del doc\*.txt
del sound\*.wav
del sound\*.tab

cd ..



xcopy /E Text\*.* Pak128.Sweden-Ex\
copy Credits.txt Pak128.Sweden-Ex\Text\doc\*.*

echo Packing Misc-files
echo ==================

CD base\Big Logo
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD..\Misc_GUI_64
..\..\makeobj PAK64 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD..\Misc_GUI
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD..\Smokes
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..
CD ..

echo Packing Good
echo ============

rem packing Good
CD Good
..\makeobj PAK128 ../Pak128.Sweden-Ex/ ./ >>..\err.txt
CD ..


echo Packing Landscape
echo =================
rem packing Landskape
CD Landscape\Grounds
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Outside
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Rivers
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Trees
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt


CD ..
CD ..


echo Packing Ways
echo ============
rem packing ways

CD Way\Crossings
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Air
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Maglev
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Monorail
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Narrowgauge
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Powelines
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Rail
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Road
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Sea
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Wayobjects\Catenarys
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt
CD ..\Rail Signals
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt
CD ..\Street Signs
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..
CD ..
CD ..

echo Packing Buildings
echo =================
rem packing Buildings

CD Buildings\City Buildings
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Factories
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Player buildings
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

rem - Prepared for more special buildings!
CD ..\Special buildings
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..
CD ..

echo Packing Vehicles
echo ================
rem packing vehicles

CD Vehicles\Rail Vehicles\Goods Wagons
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..\Locomotives
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..\Multiple Unit-Railcars
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..\Passenger Carriages
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..
CD ..
rem Other types of vehicles here!!!

CD ..

echo =====
echo DONE!
echo =====

goto end

:abort
echo ERROR: makeobj.exe was not found in current folder.
pause

:end

