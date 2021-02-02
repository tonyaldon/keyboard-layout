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

To install `takbl` keyboard layout and active it, run the following commands:

	git clone https://github.com/tonyaldon/keyboard-layout
	cd keyboard-layout
	make install

[warning] This will change the important system file `evdev.xml`
after having made a backup. Make sure you agree with this.

If you want to remove the `takbl` keyboard layout installation, run the command:

	make remove

If you just want to switch back to your previous layout, use `setxkbmap` command. For
instance, with the `us` qwerty keyboard layout, run the command:

	setxkbmap -layout us

To see all the keyboard layouts available, list the files in the directory
`/usr/share/X11/xkb/symbols/` by running the command:

	ls /usr/share/X11/xkb/symbols/

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
