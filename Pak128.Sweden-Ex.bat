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
..\..\makeobj merge cursor.Se_Cursors.pak cursor*.pak
..\..\makeobj merge symbol.Se_Symbols.pak symbol*.pak
..\..\makeobj merge menu.Se_Menus.pak menu*.pak
copy misc.Se_Misc_GUI.pak ..\..\Pak128.Sweden-Ex\*.*
copy cursor.Se_Cursors.pak ..\..\Pak128.Sweden-Ex\*.*
copy Symbol.Se_Symbols.pak ..\..\Pak128.Sweden-Ex\*.*
copy menu.Se_Menus.pak ..\..\Pak128.Sweden-Ex\*.*
del *.pak

CD ..
CD ..

rem packing Good
CD Good
..\makeobj PAK128 ../Pak128.Sweden-Ex/good.Se_Allgoods.pak ./ >>..\err.txt
CD ..

rem packing Landskape
CD Landscape\Grounds
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/ground.Outside.pak ./ >>..\..\err.txt

CD ..\Rivers
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllRivers.pak ./ >>..\..\err.txt

CD ..\Trees
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllTrees.pak ./ >>..\..\err.txt


CD ..
CD ..

rem packing ways

CD Way\Crossings
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllCrossings.pak ./ >>..\..\err.txt
CD ..\Air
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllAirWays.pak ./ >>..\..\err.txt
CD ..\Maglev
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllMaglevWays.pak ./ >>..\..\err.txt
CD ..\Monorail
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllMonorailWays.pak ./ >>..\..\err.txt
CD ..\Narrowgauge
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllNarrowgaugeWays.pak ./ >>..\..\err.txt
CD ..\Powelines
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllPowerlines.pak ./ >>..\..\err.txt
CD ..\Rail
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllRailWays.pak ./ >>..\..\err.txt
CD ..\Road
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllRoadWays.pak ./ >>..\..\err.txt
CD ..\Sea
..\..\makeobj PAK128 ../../Pak128.Sweden-Ex/way.Se_AllSeaWays.pak ./ >>..\..\err.txt
CD ..\Wayobjects\Catenarys
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/wayobj.Se_AllCatenarys.pak ./ >>..\..\..\err.txt
CD ..\Rail Signals
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/wayobj.Se_AllRailSignals.pak ./ >>..\..\..\err.txt
CD ..\Street Signs
..\..\..\makeobj PAK128 ../../../Pak128.Sweden-Ex/wayobj.Se_AllStreetsigns.pak ./ >>..\..\..\err.txt

CD ..
CD ..
CD ..

rem packing Buildings

CD Buildings\Normal Buildings
..\..\makeobj PAK128 ../ ./ >>..\..\err.txt
CD ..\Modular Buildings
..\..\makeobj PAK128 ../ ./ >>..\..\err.txt
CD ..\Stationextensions
..\..\makeobj PAK128 ../extension.pak ./ >>..\..\err.txt
CD ..\Stations
..\..\makeobj PAK128 ../Stops.pak ./ >>..\..\err.txt
CD ..\Townhalls
..\..\makeobj PAK128 ../ ./ >>..\..\err.txt

CD ..
..\makeobj merge building.Se_AllFactories.pak factory*.pak
..\makeobj merge building.Se_AllRES.pak *RES*.pak
..\makeobj merge building.Se_AllCOM.pak *COM*.pak
..\makeobj merge building.Se_AllIND.pak *IND*.pak
..\makeobj merge building.Se_AllTownhalls.pak *TOW*.pak
..\makeobj merge building.Se_AllMonuments.pak *MON*.pak
..\makeobj merge building.Se_AllCuriosities.pak *CUR*.pak
..\makeobj merge building.Se_AllHeadquarters.pak *HQ*.pak
..\makeobj merge building.Se_AllDepots.pak *depot*.pak
..\makeobj merge building.Se_AllStationextensions.pak *extension*.pak
..\makeobj merge building.Se_AllStops.pak *stop*.pak
..\makeobj merge fields.Se_AllFields.pak *field*.pak

copy *Se_All*.pak ..\Pak128.Sweden-Ex\*.*
del *.pak

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
..\..\..\makeobj merge vehicle.AllRailVehicles.pak *.pak ./ >>..\..\..\err.txt
copy vehicle.AllRailVehicles.pak ..\..\..\Pak128.Sweden-Ex\*.*
del *.pak

CD ..
CD ..
rem Other types of vehicles here!!!

CD ..


