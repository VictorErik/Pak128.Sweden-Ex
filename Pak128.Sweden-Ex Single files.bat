@echo off

echo Compile pak128.Sweden-Ex!
echo =========================
echo.
echo This batch compiles to folder simutrans/pak128.
echo It requires the file Makeobj-Extended.exe to be in the same
echo folder as this file "Pak128.Sweden-Ex Single files.bat".
echo.
if not exist .\Makeobj-Extended.exe goto abort

md Pak128.Sweden-Ex
del err.txt

rem delete old data

cd Pak128.Sweden-Ex
del *.pak
del *.tab
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
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD..\Misc_GUI_64
..\..\Makeobj-Extended PAK64 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD..\Misc_GUI
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD..\Smokes
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..
CD ..

echo Packing Good
echo ============

rem packing Good
CD Good
..\Makeobj-Extended PAK128 ../Pak128.Sweden-Ex/ ./ >>..\err.txt
CD ..


echo Packing Landscape
echo =================
rem packing Landskape
CD Landscape\Grounds
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Outside
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Rivers
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Trees
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt


CD ..
CD ..


echo Packing Ways
echo ============
rem packing ways

CD Way\Air
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Bridges
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Crossings
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Maglev
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Monorail
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Narrowgauge
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Powelines
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Rail
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Road
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Sea
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Tramway
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt
CD ..\Wayobjects\Catenarys
..\..\..\Makeobj-Extended PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt
CD ..\Rail Signals
..\..\..\Makeobj-Extended PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt
CD ..\Street Signs
..\..\..\Makeobj-Extended PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..
CD ..
CD ..

echo Packing Buildings
echo =================
rem packing Buildings

CD Buildings\City Buildings
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Factories
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..\Player buildings
..\..\Makeobj-Extended PAK128 ../../Pak128.Sweden-Ex/ ./ >>..\..\err.txt

CD ..
CD ..

echo Packing Vehicles
echo ================
rem packing vehicles

CD Vehicles\Rail Vehicles\Goods Wagons
..\..\..\Makeobj-Extended PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..\Locomotives
..\..\..\Makeobj-Extended PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..\Multiple Unit-Railcars
..\..\..\Makeobj-Extended PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..\Passenger Carriages
..\..\..\Makeobj-Extended PAK128 ../../../Pak128.Sweden-Ex/ ./ >>..\..\..\err.txt

CD ..
CD ..
rem Other types of vehicles here!!!

CD ..

echo =====
echo DONE!
echo =====

goto end

:abort
echo ERROR: Makeobj-Extended.exe was not found in current folder.
pause

:end

