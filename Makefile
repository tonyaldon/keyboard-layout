.PHONY: all links clean_links install remove

all: links

BACKUP = .backup

links:
	@# file "evdev.xml"
	@if [ -f $(BACKUP)/evdev.xml ]; then \
	  echo "[file: evdev.xml] You've already made a backup"; \
	else \
	  mkdir $(BACKUP); \
	  cp /usr/share/X11/xkb/rules/evdev.xml $(BACKUP)/evdev.xml; \
	  echo "[file: evdev.xml] backup file has been created"; \
	fi; \
	rm -rf /usr/share/X11/xkb/rules/evdev.xml; \
	ln xkb/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	# file "takbl"; \
	if [ -f /usr/share/X11/xkb/symbols/takbl ]; then \
	  echo "[file: takbl] this keyboald layout already exist in directory:"; \
	  echo "/usr/share/X11/xkb/symbols/"; \
	else \
	  ln xkb/takbl /usr/share/X11/xkb/symbols/takbl; \
	fi

install: links
	@setxkbmap -layout takbl

clean_links:
	@rm -f /usr/share/X11/xkb/rules/evdev.xml; \
	cp $(BACKUP)/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	rm -f /usr/share/X11/xkb/symbols/takbl; \
	rm -rf $(BACKUP)

remove: clean_links
	@setxkbmap -layout us
