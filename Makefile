.PHONY: all links clean_links install remove

all: links

BACKUP = .backup

links:
	@if [ ! -f $(BACKUP)/evdev.xml ]; then \
	  mkdir $(BACKUP); \
	  sudo cp /usr/share/X11/xkb/rules/evdev.xml $(BACKUP)/evdev.xml; \
	  echo "[.backup/evdev.xml] backup file has been created"; \
	fi; \
	sudo rm -rf /usr/share/X11/xkb/rules/evdev.xml; \
	sudo ln xkb/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	if [ ! -f /usr/share/X11/xkb/symbols/takbl ]; then \
	  sudo ln xkb/takbl /usr/share/X11/xkb/symbols/takbl; \
	fi

install: links
	@setxkbmap -layout takbl

clean_links:
	@if [ -f $(BACKUP)/evdev.xml ]; then \
	  sudo rm -f /usr/share/X11/xkb/rules/evdev.xml; \
	  sudo cp $(BACKUP)/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	  rm -rf $(BACKUP); \
	fi; \
	sudo rm -f /usr/share/X11/xkb/symbols/takbl;

remove: clean_links
	@setxkbmap -layout us
