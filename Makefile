all: openlayers mootools

DOWNLOAD_FOLDER = .tmp
JS_FOLDER = web_dev/js
IMG_FOLDER = web_dev/images

clean:
	rm -rf $(DOWNLOAD_FOLDER)


# OpenLayers

OPENLAYERS_VERSION = 2.13.1
OPENLAYERS_NAME = OpenLayers-$(OPENLAYERS_VERSION)
OPENLAYERS_ARCHIVE = $(OPENLAYERS_NAME).tar.gz
OPENLAYERS_URL = http://openlayers.org/download/$(OPENLAYERS_ARCHIVE)
OPENLAYERS_JS_FOLDER = $(JS_FOLDER)/OpenLayers
OPENLAYERS_IMG_FOLDER = $(IMG_FOLDER)/OpenLayers

openlayers: $(JS_FOLDER)/OpenLayers/lib/OpenLayers.js

$(JS_FOLDER)/OpenLayers/lib/OpenLayers.js: $(DOWNLOAD_FOLDER)/$(OPENLAYERS_ARCHIVE)
	tar -C $(DOWNLOAD_FOLDER) -xmf $(DOWNLOAD_FOLDER)/$(OPENLAYERS_ARCHIVE)
	mkdir -p $(JS_FOLDER)/OpenLayers/
	cp -r $(DOWNLOAD_FOLDER)/$(OPENLAYERS_NAME)/lib/ $(JS_FOLDER)/OpenLayers/lib/
	cp -r $(DOWNLOAD_FOLDER)/$(OPENLAYERS_NAME)/img/ $(IMG_FOLDER)/OpenLayers

$(DOWNLOAD_FOLDER)/$(OPENLAYERS_ARCHIVE):
	wget -N -P $(DOWNLOAD_FOLDER) $(OPENLAYERS_URL)


# MooTools

MOOTOOLS_CORE_VERSION = 1.4.5
MOOTOOLS_CORE_FILE = mootools-core-$(MOOTOOLS_CORE_VERSION)-full-nocompat.js
MOOTOOLS_CORE_URL = http://mootools.net/download/get/$(MOOTOOLS_CORE_FILE)

MOOTOOLS_MORE_VERSION = 1.4.0.1
MOOTOOLS_MORE_ARCHIVE = $(MOOTOOLS_MORE_VERSION).tar.gz
MOOTOOLS_MORE_URL = https://github.com/mootools/mootools-more/archive/$(MOOTOOLS_MORE_ARCHIVE)
MOOTOOLS_MORE_FOLDER = $(DOWNLOAD_FOLDER)/mootools-more-$(MOOTOOLS_MORE_VERSION)
MOOTOOLS_MORE_COMPONENTS = \
	$(MOOTOOLS_MORE_FOLDER)/Source/More/More.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Class/Class.Occlude.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Class/Class.Refactor.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Class/Events.Pseudos.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Element/Element.Event.Pseudos.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Element/Element.Event.Pseudos.Keys.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Element/Element.Shortcuts.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Fx/Fx.Elements.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Fx/Fx.Slide.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Interface/HtmlTable.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Interface/HtmlTable.Select.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Interface/HtmlTable.Sort.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Interface/HtmlTable.Zebra.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Interface/Keyboard.Extras.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Interface/Keyboard.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Locale/Locale.de-DE.Date.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Locale/Locale.en-US.Date.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Locale/Locale.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Types/Date.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Types/Object.Extras.js \
	$(MOOTOOLS_MORE_FOLDER)/Source/Types/String.Extras.js \


mootools: mootools-core mootools-more

mootools-core: $(JS_FOLDER)/MooTools/mootools-core.js

$(JS_FOLDER)/MooTools/mootools-core.js: $(DOWNLOAD_FOLDER)/$(MOOTOOLS_CORE_FILE)
	cp $< $@

$(DOWNLOAD_FOLDER)/$(MOOTOOLS_CORE_FILE):
	wget -N --no-use-server-timestamps -P $(DOWNLOAD_FOLDER) $(MOOTOOLS_CORE_URL)


mootools-more: $(JS_FOLDER)/MooTools/mootools-more.js

$(JS_FOLDER)/MooTools/mootools-more.js: $(MOOTOOLS_MORE_FOLDER)/Source/More/More.js
	cat $(MOOTOOLS_MORE_COMPONENTS) > $@

$(MOOTOOLS_MORE_FOLDER)/Source/More/More.js: $(DOWNLOAD_FOLDER)/$(MOOTOOLS_MORE_ARCHIVE)
	tar -C $(DOWNLOAD_FOLDER) -xmf $(DOWNLOAD_FOLDER)/$(MOOTOOLS_MORE_ARCHIVE)

$(DOWNLOAD_FOLDER)/$(MOOTOOLS_MORE_ARCHIVE):
	wget -N --no-use-server-timestamps -P $(DOWNLOAD_FOLDER) $(MOOTOOLS_MORE_URL)
