# About

`keyboard-layout` pools all files needed to set up my own keyboard
layout (`takbl`).

<p align="center">
	<figure>
	<img src="takbl-basic.svg" alt="Tony Aldon basic keyboard layout " title="Tony Aldon (kbl basic)">
	<figcaption>Tony Aldon (kbl basic)</figcaption>
	</figure>
<p/>

# Motivation
I wanted to have a keyboard layout that realy fit with my daily work and computer use.
With the standard existing keyboard layouts as *qwerty* or *bépo*, I used to have these problems:

1. After a typing day work, my hands and fingers hurt me,
2. The more significant keys *Tab, Return, Backspace, Control* are on
   the keyboard edges and used by the pinky,
3. I couldn't write freely:
   * impossible to switch easily between *english*, *french* (which requires characters like *é,è,ê,ù,ç,..*, and *spanish* (which requires characters like *ñ,¡,¿,...*),
   * impossible to have high focus when coding, due to the random position of vital characters as *[,],(,),{,},#,|,%,@,&,...*.

# Installation

This configuration works on linux ubuntu 18.04 LTS.

To install `takbl` keyboard layout, run the following commands:

	git clone https://github.com/tonyaldon/keyboard-layout
	cd keyboard-layout
	make install

If you want to remove the `takbl` keyboard layout installation, run
the command:

	make remove

Note that when you run `make install`, 4 things happen:
1. A backup of the files `/usr/share/X11/xkb/rules/evdev.xml` and
   `/etc/default/keyboard` is made in the directory `.backup`,
2. The keyboard layout `takbl` is installed by making the following
   hardlinks:

        /usr/share/X11/xkb/rules/evdev.xml => usr/share/X11/xkb/rules/evdev.xml
        /usr/share/X11/xkb/symbols/takbl => usr/share/X11/xkb/symbols/takbl

3. The keyboard layout `takbl` becomes the default keyboard layout by
   making the following hardlink:

        /etc/default/keyboard => etc/default/keyboard

4. And the keyboard layout `takbl` is activated for the current session.

If you want to know more about `XKB`, you can read the section [My
understanding of XKB](#my-understanding-of-xkb)

# Variants

`takbl` comes with the basic form and two variants:
1. a *spanish* variant that changes the `tild` to the `dead_tild`,
2. and a *french* variant that changes `dead_acute` to `eacute`,
   `dead_grave` to `egrave` and `bracketleft` to `agrave`.

To switch between those variant, you can run the following commands:

	setxkbmap -layout takbl              # basic
	setxkbmap -layout takbl -variant es  # spanish
	setxkbmap -layout takbl -variant fr  # french

# Contact

Do you have any question or suggestion? Please, feel free to:
* leave me a message on twitter <a
href="http://www.twitter.com/tonyaldon">@tonyaldon</a>
* or to email me at tony.aldon.adm@gmail.com.

**Speaking with your computer always starts by typing
characters. Speak clearly. Have a better life.**
