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

xcopy /E Text\*.* Pak128.Sweden-Ex\

CD base\Big Logo
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/symbol.biglogo.pak ./ >>..\..\err.txt

CD..\Misc_GUI_64
..\..\makeobj PAK64 ../Misc_GUI/ ./ >>..\..\err.txt

CD..\Misc_GUI
..\..\makeobj PAK128 ./ >>..\..\err.txt
..\..\makeobj merge misc.Se_Misc_GUI.pak misc*.pak
..\..\makeobj merge misc.Se_Cursors.pak cursor*.pak
..\..\makeobj merge misc.Se_Symbols.pak symbol*.pak
..\..\makeobj merge misc.Se_Menus.pak menu*.pak
copy misc.Se_Misc_GUI.pak ..\..\Pak128.Sweden-Ex\*.*
copy misc.Se_Cursors.pak ..\..\Pak128.Sweden-Ex\*.*
copy misc.Se_Symbols.pak ..\..\Pak128.Sweden-Ex\*.*
copy misc.Se_Menus.pak ..\..\Pak128.Sweden-Ex\*.*
del *.pak

CD ..
CD ..

rem packing Good
CD Good
..\makeobj PAK128 ../Pak128.Sweden-Ex/misc.Se_goods.pak ./ >>..\err.txt
CD ..

rem packing Landskape
CD Landscape\Grounds
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ground.Outside.pak ./ >>..\..\err.txt

CD ..\Rivers
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_Rivers.pak ./ >>..\..\err.txt

CD ..\Trees
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_Trees.pak ./ >>..\..\err.txt


CD ..
CD ..

rem packing ways

CD Way\Crossings
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_Crossings.pak ./ >>..\..\err.txt
CD ..\Air
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AirWays.pak ./ >>..\..\err.txt
CD ..\Maglev
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_MaglevWays.pak ./ >>..\..\err.txt
CD ..\Monorail
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_MonorailWays.pak ./ >>..\..\err.txt
CD ..\Narrowgauge
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_NarrowgaugeWays.pak ./ >>..\..\err.txt
CD ..\Powelines
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_Powerlines.pak ./ >>..\..\err.txt
CD ..\Rail
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_RailWays.pak ./ >>..\..\err.txt
CD ..\Road
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_RoadWays.pak ./ >>..\..\err.txt
CD ..\Sea
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_SeaWays.pak ./ >>..\..\err.txt
CD ..\Wayobjects\Catenarys
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/wayobj.Se_Catenarys.pak ./ >>..\..\..\err.txt
CD ..\Rail Signals
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/wayobj.Se_RailSignals.pak ./ >>..\..\..\err.txt
CD ..\Street Signs
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/wayobj.Se_Streetsigns.pak ./ >>..\..\..\err.txt

CD ..
CD ..
CD ..

rem packing Buildings

CD Buildings\City Buildings
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/building.Se_Citybuildings.pak ./ >>..\..\err.txt

CD ..\Factories
..\..\makeobj PAK128 ./ >>..\..\err.txt
..\..\makeobj merge ../../Pak128.Sweden-Ex/building.Se_Fields.pak field*.pak ./ >>..\..\err.txt
..\..\makeobj merge ../../Pak128.Sweden-Ex/building.Se_Factories.pak factory*.pak ./ >>..\..\err.txt
del *.pak

CD ..\Player buildings
..\..\makeobj PAK128 ./ >>..\..\err.txt
..\..\makeobj merge ../../Pak128.Sweden-Ex/building.Se_Depots.pak *Depot*.pak ./ >>..\..\err.txt
..\..\makeobj merge ../../Pak128.Sweden-Ex/building.Se_Stations.pak *Station*.pak ./ >>..\..\err.txt
..\..\makeobj merge ../../Pak128.Sweden-Ex/building.Se_Extensions.pak *Extension*.pak ./ >>..\..\err.txt
del *.pak


rem - Prepared for more special buildings!
CD ..\Special buildings
..\..\makeobj PAK128 ./ >>..\..\err.txt
..\..\makeobj merge ../../Pak128.Sweden-Ex/building.Se_Townhalls.pak *townhall*.pak ./ >>..\..\err.txt
del *.pak

CD ..
CD ..

rem packing vehicles

CD Vehicles\Rail Vehicles\Goodscars

..\..\..\makeobj PAK128 ../Passengercars/ ./ >>..\..\..\err.txt

CD ..\Locomotives
..\..\..\makeobj PAK128 ../Passengercars/ ./ >>..\..\..\err.txt

CD ..\Motorcars
..\..\..\makeobj PAK128 ../Passengercars/ ./ >>..\..\..\err.txt

CD ..\Passengercars
..\..\..\makeobj PAK128 ./ >>..\..\..\err.txt
..\..\..\makeobj merge  ../../../Pak128.Sweden-Ex/vehicle.Se_RailVehicles.pak *.pak ./ >>..\..\..\err.txt
del *.pak

CD ..
CD ..
rem Other types of vehicles here!!!

CD ..


echo DONE
goto end

:abort
echo ERROR: makeobj.exe was not found in current folder.
pause

:end

