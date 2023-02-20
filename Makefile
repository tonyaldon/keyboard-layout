.PHONY: all links clean_links install remove

all: links

BACKUP = .backup

link_evdev:
	@if [ ! -f $(BACKUP)/evdev.xml ]; then \
	  sudo cp /usr/share/X11/xkb/rules/evdev.xml $(BACKUP)/evdev.xml; \
	  echo "[.backup/evdev.xml] backup file has been created"; \
	fi; \
	if [ ! $$(ls -i /usr/share/X11/xkb/rules/evdev.xml | cut -f1 -d" " ) \
	  -eq $$(ls -i usr/share/X11/xkb/rules/evdev.xml | cut -f1 -d" " ) ]; then \
	  sudo rm -rf /usr/share/X11/xkb/rules/evdev.xml; \
	  sudo ln usr/share/X11/xkb/rules/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	  echo "[/usr/share/X11/xkb/rules/evdev.xml => ./usr/share/X11/xkb/rules/evdev.xml] hard link has been created"; \
	fi

link_etc_default_keyboard:
	@if [ ! -f $(BACKUP)/keyboard ]; then \
	  sudo cp /etc/default/keyboard $(BACKUP)/keyboard; \
	  echo "[.backup/keyboard] backup file has been created"; \
	fi; \
	if [ ! $$(ls -i /etc/default/keyboard | cut -f1 -d" " ) \
	  -eq $$(ls -i etc/default/keyboard | cut -f1 -d" " ) ]; then \
	  sudo rm -rf /etc/default/keyboard; \
	  sudo ln etc/default/keyboard /etc/default/keyboard; \
	  echo "[/etc/default/keyboard => ./etc/default/keyboard] hard link has been created"; \
	fi

link_etc_gdm3_custom:
	@if [ ! -f $(BACKUP)/custom.conf ]; then \
	  sudo cp /etc/gdm3/custom.conf $(BACKUP)/custom.conf; \
	  echo "[.backup/custom.conf] backup file has been created"; \
	fi; \
	if [ ! $$(ls -i /etc/gdm3/custom.conf | cut -f1 -d" " ) \
	  -eq $$(ls -i etc/gdm3/custom.conf | cut -f1 -d" " ) ]; then \
	  sudo rm -rf /etc/gdm3/custom.conf; \
	  sudo ln -s 	$(shell pwd)/etc/gdm3/custom.conf /etc/gdm3/custom.conf; \
	  echo "[/etc/gdm3/custom.conf => "$(shell pwd)"/etc/gdm3/custom.conf] symbolic link has been created"; \
	fi

links: link_evdev link_etc_default_keyboard link_etc_gdm3_custom
	@if [ ! -d $(BACKUP) ]; then mkdir $(BACKUP); fi;
	@if [ ! -f /usr/share/X11/xkb/symbols/takbl ]; then \
	  sudo ln usr/share/X11/xkb/symbols/takbl /usr/share/X11/xkb/symbols/takbl; \
	  echo "[/usr/share/X11/xkb/symbols/takbl => ./usr/share/X11/xkb/symbols/takbl] hard link has been created"; \
	fi

install: links
	@setxkbmap -layout takbl

clean_link_evdev:
	@if [ -f $(BACKUP)/evdev.xml ]; then \
	  sudo rm -f /usr/share/X11/xkb/rules/evdev.xml; \
	  sudo cp $(BACKUP)/evdev.xml /usr/share/X11/xkb/rules/evdev.xml; \
	  rm -rf $(BACKUP)/evdev.xml; \
	fi

clean_link_etc_default_keyboard:
	@if [ -f $(BACKUP)/keyboard ]; then \
	  sudo rm -f /etc/default/keyboard; \
	  sudo cp $(BACKUP)/keyboard /etc/default/keyboard; \
	  rm -rf $(BACKUP)/keyboard; \
	fi

clean_link_etc_gdm3_custom:
	@if [ -f $(BACKUP)/custom.conf ]; then \
	  sudo rm -f /etc/gdm3/custom.conf; \
	  sudo cp $(BACKUP)/custom.conf /etc/gdm3/custom.conf; \
	  rm -rf $(BACKUP)/custom.conf; \
	fi

clean_links: clean_link_evdev clean_link_etc_default_keyboard clean_link_etc_gdm3_custom
	@sudo rm -f /usr/share/X11/xkb/symbols/takbl

remove: clean_links
	@setxkbmap -layout us
