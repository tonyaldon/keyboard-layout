.PHONY: all links clean_links

all: links

BACKUP = .backup

links:
	@# file "evdev.xml"
	@if [ -f $(BACKUP)/evdev.xml ]; \
	then echo "[file: evdev.xml] You've already made a backup"; \
	else mkdir $(BACKUP); \
	cp /usr/share/X11/xkb/rules/evdev.xml $(BACKUP)/evdev.xml; \
	echo "[file: evdev.xml] backup file has been created"; \
	fi; \
	rm -rf /usr/share/X11/xkb/rules/evdev.xml; \
	ln -s xkb/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	# file "takbl"; \
	if [ -f /usr/share/X11/xkb/symbols/takbl ]; \
	then echo "[file: takbl] this keyboald layout already exist in directory:"; \
	echo "/usr/share/X11/xkb/symbols/"; \
	else ln -s xkb/takbl /usr/share/X11/xkb/symbols/takbl; \
	fi

clean_links:
	@rm -f /usr/share/X11/xkb/rules/evdev.xml; \
	cp $(BACKUP)/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	rm -f /usr/share/X11/xkb/symbols/takbl; \
	rm -rf $(BACKUP)
