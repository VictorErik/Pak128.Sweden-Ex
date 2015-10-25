# Just run
#   make clean all archives
# to get fresh and ready to deploy .tbz2 and .zip archives
#
# Change THIS to change the version string encoded in the pak file
VERSION_STRING = "pak128.Sweden v.0.1"
#
#
#
MAKEOBJ ?= ./makeobj

DESTDIR  ?= .
PAKDIR   ?= $(DESTDIR)/pak128.Sweden-Ex
DESTFILE ?= simupak128.Sweden-Ex

# Dirs for simutranslator
TR_DIRS :=

OUTSIDE :=
OUTSIDE += Landscape/Outside
TR_DIRS += Landscape/Outside

DIRS32 :=
#DIRS32 += boats/holds
#TR_DIRS += boats/holds

DIRS64 :=
DIRS64 += Base/misc_GUI_64
TR_DIRS += Base/misc_GUI_64

DIRS128 :=
DIRS128 += Landscape/Grounds
TR_DIRS += Landscape/Grounds
DIRS128 += Landscape/Trees
TR_DIRS += Landscape/Trees
DIRS128 += Landscape/Rivers
TR_DIRS += Landscape/Rivers
DIRS128 += Way/Maglev
TR_DIRS += Way/Maglev
DIRS128 += Way/Tramway
TR_DIRS += Way/Tramway
DIRS128 += Way/Air
TR_DIRS += Way/Air
DIRS128 += Way/Monorail
TR_DIRS += Way/Monorail
DIRS128 += Way/Crossings
TR_DIRS += Way/Crossings
DIRS128 += Way/Powerlines
TR_DIRS += Way/Powerlines
DIRS128 += Way/Road
TR_DIRS += Way/Road
DIRS128 += Way/Rail
TR_DIRS += Way/Rail
DIRS128 += Way/Narrowgauge
TR_DIRS += Way/Narrowgauge
DIRS128 += Way/WayObjects/Rail\ Signals
TR_DIRS += Way/WayObjects/Rail\ Signals
DIRS128 += Way/WayObjects/Street\ Signs
TR_DIRS += Way/WayObjects/Street\ Signs
DIRS128 += Way/WayObjects/Catenarys
TR_DIRS += Way/WayObjects/Catenarys
DIRS128 += Base/Misc_GUI
TR_DIRS += Base/Misc_GUI
DIRS128 += Base/Big\ Logo
TR_DIRS += Base/Big\ Logo
DIRS128 += Vehicles/Rail\ Vehicles/Locomotives
TR_DIRS += Vehicles/Rail\ Vehicles/Locomotives
DIRS128 += Vehicles/Rail\ Vehicles/Passenger\ Carriages
TR_DIRS += Vehicles/Rail\ Vehicles/Passenger\ Carriages
DIRS128 += Vehicles/Rail\ Vehicles/Goods\ Wagons
TR_DIRS += Vehicles/Rail\ Vehicles/Goods\ Wagons
DIRS128 += Vehicles/Rail\ Vehicles/Multiple\ Unit-Railcars
TR_DIRS += Vehicles/Rail\ Vehicles/Multiple\ Unit-Railcars
DIRS128 += Good
TR_DIRS += Good
DIRS128 += Buildings/Factories
TR_DIRS += Buildings/Factories
DIRS128 += Buildings/Player\ buildings
TR_DIRS += Buildings/Player\ buildings
DIRS128 += Buildings/Special\ buildings
TR_DIRS += Buildings/Special\ buildings
DIRS128 += Buildings/City\ buildings
TR_DIRS += Buildings/City\ buildings

DIRS192 := 
#DIRS192 += boats/boats192
#DIRS192 += air/air192

DIRS224 := 
#DIRS224 += boats/boats224

DIRS256 := 
#DIRS256 += air/air256

DIRS := $(OUTSIDE) $(DIRS32) $(DIRS64) $(DIRS128) $(DIRS192) $(DIRS224) $(DIRS256)


.PHONY: $(DIRS) copy tar zip simutranslator

all: copy $(DIRS)

archives: tar zip

tar: $(DESTFILE).tbz2
zip: $(DESTFILE).zip

$(DESTFILE).tbz2: $(PAKDIR)
	@echo "===> TAR $@"
	@tar cjf $@ $(DESTDIR)

$(DESTFILE).zip: $(PAKDIR)
	@echo "===> ZIP $@"
	@zip -rq $@ $(DESTDIR)

copy:
	@echo "===> COPY"
	@cp -pr Text/* $(PAKDIR)/

$(DIRS32):
	@echo "===> PAK32 $@"
	@mkdir -p $(PAKDIR)
	@$(MAKEOBJ) quiet PAK32 $(PAKDIR)/ "$@/" > /dev/null

$(DIRS64):
	@echo "===> PAK64 $@"
	@mkdir -p $(PAKDIR)
	@$(MAKEOBJ) quiet PAK $(PAKDIR)/ "$@/" > /dev/null

$(DIRS128):
	@echo "===> PAK128 $@"
	@mkdir -p $(PAKDIR)
	@$(MAKEOBJ) quiet PAK128 $(PAKDIR)/ "$@/" > /dev/null

$(DIRS192):
	@echo "===> PAK192 $@"
	@mkdir -p $(PAKDIR)
	@$(MAKEOBJ) quiet PAK192 $(PAKDIR)/ "$@/" > /dev/null

$(DIRS224):
	@echo "===> PAK224 $@"
	@mkdir -p $(PAKDIR)
	@$(MAKEOBJ) quiet PAK224 $(PAKDIR)/ "$@/" > /dev/null

$(DIRS256):
	@echo "===> PAK256 $@"
	@mkdir -p $(PAKDIR)
	@$(MAKEOBJ) quiet PAK256 $(PAKDIR)/ "$@/" > /dev/null

$(OUTSIDE):
	@echo "===> OUTSIDE with REVISION and grounds"
	@mkdir -p $(PAKDIR)
	@$(MAKEOBJ) quiet PAK128 $(PAKDIR)/ $@/ > /dev/null
#	@echo -e -n "Obj=ground\nName=Outside\ncopyright=$(VERSION_STRING)" >$@/outsiderev.dat
#	@svnversion >>$@/outsiderev.dat
#	@echo -e "Image[0][0]=images/ls-water-outside-128.0.0\n-" >>$@/outsiderev.dat
#	@$(MAKEOBJ) PAK128 $(PAKDIR)/ $@/outsiderev.dat > /dev/null
#	@rm $@/outsiderev.dat

clean:
	@echo "===> CLEAN"
	@rm -fr $(PAKDIR) $(DESTFILE).tbz2 $(DESTFILE).zip simutranslator/*.zip

# -----------
# Everything after this point in the Makefile is designed for
# the generation of zip files to upload to simutranslator
# written by Nathanael Nerode
# -----------

# The following image files are too large for simutranslator.
OVERSIZE_IMAGES :=
OVERSIZE_IMAGES += attractions/images/cur/football-ground-lg.png
OVERSIZE_IMAGES += attractions/images/cur/cricket-ground-sm.png
OVERSIZE_IMAGES += boats/images/clan-line-steamer.png
OVERSIZE_IMAGES += boats/images/handysize.png


# For each zip file to generate,
# (1) Use 'find' to get everything under the directory;
# (2) But exclude everything in 'blends';
# (3) And only collect files with .dat and .png endings;
# (4) Then use zip, but exclude "known bad" image files.

simutranslator/%.zip:
	FILE_LIST=`find -path ./$*/\* \! -path ./$*/blends/\* \( -name \*.dat -o -name \*.png \)` ; \
	zip -r $@ $$FILE_LIST -x $(OVERSIZE_IMAGES)

# Special case: Program texts
simutranslator/program_texts.zip:
	zip $@ simutranslator/*.dat

# Convert the list of TR_DIRS to a list of TR_ZIPFILES
TR_ZIPFILES := $(patsubst %,simutranslator/%.zip, $(TR_DIRS) )

# Finally, depend on all the individual zipfiles.
simutranslator: $(TR_ZIPFILES)

# Potential problems.
# - The entire attractions folder may be too big to do in one go.
# - separate out the stone attractions?
STONE_ATTRACTIONS :=
STONE_ATTRACTIONS += attractions/stone-attractions.dat
STONE_ATTRACTIONS += attractions/images/cur/stone-attractions.png 
STONE_ATTRACTIONS += attractions/images/cur/stone-attractions-snow.png
# - The entire boats folder may also be too big
# - separate out the large boats?
# - The entire trains folder may ALSO be too big
