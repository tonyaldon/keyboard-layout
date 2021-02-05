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

# My understanding of XKB

## XKB

### How does XKB load a keyboard layout?

When you load a keyboard layout, for instance by running the command
`setxkbmap -rules evdev -layout us` (for the standard US QUERTY),
`XKB` load the rules in `/usr/share/X11/xkb/rules/evdev.xml` file and
looks for the layout `us`.  If the layout `us` is found in
`/usr/share/X11/xkb/rules/evdev.xml`, `XKB` seeks the file
`/usr/share/X11/xkb/symbols/us`.  If this file exist, the keyboard
layout defined in that file is loaded (in our case the US QUERTY
layout is loaded).

The directory `/usr/share/X11/xkb/` looks like this:

```
.
├── compat
│   ├── ...
├── geometry
│   ├── ...
├── keycodes
│   ├── ...
├── rules
│   ├── ...
│   ├── base.xml
│   ├── evdev.xml
│   ├── ...
├── symbols
│   ├── ...
│   ├── fr
│   ├── ...
│   ├── us
│   ├── ...
└── types
    ├── ...
```

### How to list all the XKB keyboard layouts?

To see all the keyboard layouts available, list the files in the directory
`/usr/share/X11/xkb/symbols/` by running the command:

	ls /usr/share/X11/xkb/symbols/

### Why does XKB choose to load the rules in the file `evdev.xml` and not `base.xml`?

I don't know, but in the documention we can read that *On Linux
systems, the `evdev` rules are most commonly used, on other systems
the `base` rules are used*.

So like me if you're running Linux Ubuntu, the rules XKB loads are
in the file `/usr/share/X11/xkb/rules/evdev.xml`.  And if you are
using `setxkbmap` to load keyboard layouts, running one of those
following command lines leads to the same result (loading the US
QUERTY keyboard layout):

	setxkbmap -layout us
	setxkbmap -rules evdev -layout us

### How to set a default keyboard layout that last across sessions?

Setting your keyboard layout with `setxkbmap` doesn't last across
sessions and as a consequency is not set when you log into your
session.

Your system load the keyboard layout set in `/etc/default/keyboard`
file.  For instance, if you use the US QUERTY keyboard layout,
`/etc/default/keyboard` file should look like this:

```
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="us"
XKBVARIANT=""
XKBOPTIONS=""

BACKSPACE="guess"
```

Now if you want to set the Spanish QUERTY keyboard layout (that is defined in the file
`/usr/share/X11/xkb/symbols/es`) as your default keyboard layout, you
just have to modify the line `XKBLAYOUT="us"` by `XKBLAYOUT="es"` in
the file `/etc/default/keyboard`, which lead to the file:

```
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="es"
XKBVARIANT=""
XKBOPTIONS=""

BACKSPACE="guess"
```


### How do I get the current XKB settings?

If you want to have some informations on your current XKB settings ,
run the commands:

    setxkbmap -query
    setxkbmap -query -verbose 10

# Contact

Do you have any question or suggestion? Please, feel free to:
* leave me a message on twitter <a
href="http://www.twitter.com/tonyaldon">@tonyaldon</a>
* or to email me at tony.aldon.adm@gmail.com.

**Speaking with your computer always starts by typing
characters. Speak clearly. Have a better life.**
