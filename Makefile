.PHONY: all links clean_links install remove

all: links

BACKUP = .backup

links:
	@if [ ! -f $(BACKUP)/evdev.xml ]; then \
	  mkdir $(BACKUP); \
	  sudo cp /usr/share/X11/xkb/rules/evdev.xml $(BACKUP)/evdev.xml; \
	  echo "[.backup/evdev.xml] backup file has been created"; \
	fi; \
	if [ ! $$(ls -i /usr/share/X11/xkb/rules/evdev.xml | cut -f1 -d" " ) \
	  -eq $$(ls -i xkb/evdev.xml | cut -f1 -d" " ) ]; then \
	  sudo rm -rf /usr/share/X11/xkb/rules/evdev.xml; \
	  sudo ln xkb/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	  echo "[/usr/share/X11/xkb/rules/evdev.xml => xkb/evdev.xml] hard link has been created"; \
	fi; \
	if [ ! -f /usr/share/X11/xkb/symbols/takbl ]; then \
	  sudo ln xkb/takbl /usr/share/X11/xkb/symbols/takbl; \
	  echo "[/usr/share/X11/xkb/symbols/takbl => xkb/takbl] hard link has been created"; \
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
