# About

`keyboard-layout` pools all the needed files to set up my custom
[XKB](https://wiki.archlinux.org/index.php/X_keyboard_extension)
keyboard layout (`takbl`) on Linux Ubuntu.



You can install `takbl` following the step describe in
 [Installation](#installation) section.

In [Learning a new keyboard layout](#learning-a-new-keyboard-layout)
section I answer to the questions:
- [How to learn a new keyboard layout?](#how-to-learn-a-new-keyboard-layout) and,
- [Why does picking the right keyboard layout matter?](#why-does-picking-the-right-keyboard-layout-matter).

In [My understanding of XKB](#my-understanding-of-xkb) section,
you can read about how does `XKB` work and how can you make your own `XKB`
keyboard layout.

# Layouts

## takbl basic

<p align="center">
  <figure>
  <img src="takbl-basic.svg" alt="Tony Aldon basic keyboard layout " title="Tony Aldon (kbl basic)">
  </figure>
<p/>

## takbl Spanish variant

<p align="center">
  <figure>
  <img src="takbl-basic-es.svg" alt="Tony Aldon basic keyboard layout " title="Tony Aldon (kbl Spanish)">
  </figure>
<p/>

## takbl French variant

<p align="center">
  <figure>
  <img src="takbl-basic-fr.svg" alt="Tony Aldon basic keyboard layout " title="Tony Aldon (kbl French)">
  </figure>
<p/>

# Motivation

1. I want a keyboard layout that fits my needs (I mostly use my
   keyboard to write **CODE**).
2. After typing all day long, my hands and fingers use to hurt me.
   This is principaly due to the use of the **PINKY** on the keys
   `Backspace`, `Control`, `Enter`, `Shift` and `Tab`.
   [TypeMatrix](http://www.typematrix.com/) does a great job in this
   area putting `Backspace` and `Enter` in the center of the
   keyboard.  But It's not enougth when you're writing code because
   you want the `Tab` key in the center (_is there anyone who writes
   code without code completion or snippet expansion almost always
   bound to the `Tab` key?_).  Moreover, `TypeMatrix` put the symbols
   `[` `]` `(` `)` `{` `}` in the edges, which is bad when you
   write code.
3. When you write code, you use the symbols `[` `]` `(` `)` `{`
   `}` constantly, **SO** they **CAN'T** be at the edges of your
   keyboard layout.  This is why I discarded the keyboard layouts
   [QWERTY](https://en.wikipedia.org/wiki/QWERTY) and
   [DVORAK](https://en.wikipedia.org/wiki/Dvorak_keyboard_layout)
   (also due to the **PINKY** problem of the keys `Backspace`,
   `Control`, ... described above).
4. As I'm French, I had a look on
  [BÉPO](https://en.wikipedia.org/wiki/B%C3%89PO).  Two things are
  good in the layout: 1) the symbols `[` `]` `(` `)` `{` `}` are
  not at the edges (accessible with key-chords using `Alt Gr` key), and 2)
  the punctuation symbols `.` `:` `,` `;` are at the center of the
  keyboard.  However I discarded it because of the **PINKY** problem
  of the keys `Backspace`, `Control` ... described above.
5. In addition, I want to access to the symbols `_` `'` `"` `/`
   `|` `\` `%` `@` `#` `=` `$` `~` `<` `>` `+` `*` `-`
   `^` `!` `?` without moving my hands.

# Learning a new keyboard layout

In that section I'm talking to programmers but I'm sure that those
thoughts can be applied to anyone that works in an area that involves
a heavy use of the keyboard.

## How to learn a new keyboard layout?

I imagine that there is a lot of literature on _how to learn a new
keyboard layout_.  For sure, there exists a lot more literature about
_how to learn anything_.  At the end of the day, I think the only
**truth about learning** is: **the more you practice the better you'll
get**.

So if you want to learn a new keyboard layout, don't hesitate too much,
just spend time on it with passion and that will pay off.

To be clearer, these are the _rules_ I follow that you can apply,
if you want, whatever keyboard layout you choose to adopt:
1. be clear on the reasons you choose this layout and not another,
2. pick any application that helps you practice your typing (accuracy,
   speed and fluidity).  I use
   [klavaro](https://klavaro.sourceforge.io/en/index.html).  It is
   simple and customizable.  As they said in the home page: _Klavaro
   is libre software that intends to be keyboard and language
   independent..._,
3. practice everyday as much as you can,
4. be patient this will pay off for the rest of your programmer life.

## Why does picking the right keyboard layout matter?

Assuming that you're an average programmer.  Usually, you're going to
**write code**:
- 5 days a week,
- 5 hours a day (the rest is for readings and meetings),
- at least during 10 years (if it's not 40 or more).

You're going to use your keyboard **13,000 HOURS** (5 x 5 x 52 x 10)
during those 10 years of programming.  This corresponds to **541 DAYS**
(13000 / 24).

**THINK ABOUT THAT!**

When I did the math a couple of years ago, I thought it was worth
spending a few days to think about my keyboard layout and worth
spending a couple of weeks to learn it.  This is a ridiculous amount
of time compare to **541 DAYS**.

# Installation

This configuration works on Ubuntu 22.04 LTS.

Note that we have to use `Xorg` instead of the default `Wayland`.

To install `takbl` keyboard layout, run the following commands:

```
git clone https://github.com/tonyaldon/keyboard-layout
cd keyboard-layout
make install
```

Then you have to RESTART your computer so that Ubuntu 22.04 starts
using `Xorg` (instead of `Wayland`) which is necessary for this X11
keyboard setup.

If you want to remove `takbl` keyboard layout installation, run the
command:

```
make remove
```

Note that when you run `make install`, 4 things happen:

1. A backup of the files `/usr/share/X11/xkb/rules/evdev.xml`,
   `/etc/default/keyboard` and `/etc/gdm3/custom.conf` is made in the
   directory `.backup`,

2. `Wayland` is disable in order to force the login screen to use
   `Xorg` by making the following symbolic link:

        /etc/gdm3/custom.conf => ./etc/gdm3/custom.conf

3. The keyboard layout `takbl` is installed by making the following
   hardlinks:

        /usr/share/X11/xkb/rules/evdev.xml => ./usr/share/X11/xkb/rules/evdev.xml
        /usr/share/X11/xkb/symbols/takbl => ./usr/share/X11/xkb/symbols/takbl

4. The keyboard layout `takbl` becomes the default keyboard layout by
   making the following hardlink:

        /etc/default/keyboard => ./etc/default/keyboard

If you want to know more about `XKB`, you can read the section [My
understanding of XKB](#my-understanding-of-xkb)

# Variants

`takbl` is **designed** to be used to **write code**.  However
sometimes, I write some _Spanish_ or _French_.  For that reason, I
added two variants `takbl es` and `takbl fr` to the basic layout
`takbl.`

- For the _Spanish_ layout, I added the following characters: `á` `é`
  `í` `ó` `ú` `ü` `ñ` `¿` `¡`.
- For the _French_ layout, I added the following characters: `à` `â`
  `æ` `é` `è` `ê` `ë` `î` `ï` `ô` `œ` `ù` `û` `ü` `ÿ` `ç`.

Not that when you load a variant you lose some characters very useful
when you're programming but not when you are writing standard text.
It doesn't bother me because:
1. I'm neither a French nor a Spanish novel writer, I write code and code
   documentation and when I write some Spanish or French I'm not
   writing code.
2. I almost always write inside
   [emacs](https://www.gnu.org/software/emacs/) where I have a key
   binding with which I can switch quickly between the keyboard
   layout `takbl` and its variants `takbl es` and `takbl fr`.
3. By the way, there is always a **TRADEOFF**.

To switch between `takbl` and its variants, you can run the following
commands:

```
setxkbmap -layout takbl              # basic
setxkbmap -layout takbl -variant es  # Spanish
setxkbmap -layout takbl -variant fr  # French
```

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

To see all the available keyboard layouts, list the files in the directory
`/usr/share/X11/xkb/symbols/` by running the command:

```
ls /usr/share/X11/xkb/symbols/
```

### Why does XKB choose to load the rules in the file `evdev.xml` and not `base.xml`?

I don't know, but in the documention we can read that *On Linux
systems, the `evdev` rules are most commonly used, on other systems
the `base` rules are used*.

So like me if you're running Linux Ubuntu, the rules `XKB` loads are
in the file `/usr/share/X11/xkb/rules/evdev.xml`.  And if you are
using `setxkbmap` to load keyboard layouts, running one of those
following command lines leads to the same result (loading the US
QUERTY keyboard layout):

```
setxkbmap -layout us
setxkbmap -rules evdev -layout us
```

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

If you want to have some informations on your current `XKB` settings ,
run the commands:

    setxkbmap -query
    setxkbmap -query -verbose 10

## Make your own XKB keyboard layout

In this section, I'll describe how I made `takbl` keyboard layout.

1. In the file `/usr/share/X11/xkb/rules/evdev.xml` I added the
   following snippet as a child of the node `<layoutList>`:

   ``` xml
   <layout>
     <configItem>
       <name>takbl</name>
       <shortDescription>TA</shortDescription>
       <description>Tony Aldon (kbl basic form)</description>
       <languageList>
         <iso639Id>fra</iso639Id>
       </languageList>
     </configItem>
     <variantList>
       <variant>
         <configItem>
           <name>es</name>
           <description>Tony Aldon (kbl Spanish)</description>
         </configItem>
       </variant>
       <variant>
         <configItem>
           <name>fr</name>
           <description>Tony Aldon (kbl French)</description>
         </configItem>
       </variant>
     </variantList>
   </layout>
   ```

   This declares a new default keyboard layout named `takbl`
   (`<name>takbl</name>`) and two variants `es` (`<name>es</name>`)
   and `fr` (`<name>fr</name>`).

2. Now when `xkb` loads `takbl`, it looks for the file
   `/usr/share/X11/xkb/symbols/takbl` where the default layout `takbl`
   and its variants `es` and `fr` are defined by describing the
   mappings between `keycode names` and `keysymbols`:

   ```
   default partial alphanumeric_keys
   xkb_symbols "basic" {

      // map keycode names with keysymbols
      // this is what defined your keyboard layout

      // Second row
      key <AD01> { [ w, W             ] }; // w W
      key <AD02> { [ b, B,  parenleft ] }; // b B (
      key <AD03> { [ n, N, parenright ] }; // n N )

      // ...
   }

   partial alphanumeric_keys
   xkb_symbols "es" {

       include "takbl(basic)"

      // map keycode names with keysymbols
      // it uses "basic" layout defined aboved overwriting
      // with the mappings you define here

      // Second row
      key <AD01> { [ w, W,     oacute,     Oacute ] }; // w W ó Ó
      key <AD02> { [ b, B, udiaeresis, Udiaeresis ] }; // b B ü Ü
      key <AD03> { [ n, N,     eacute,     Eacute ] }; // n N é É

      // ...
   }

   partial alphanumeric_keys
   xkb_symbols "fr" {

       include "takbl(basic)"

      // map keycode names with keysymbols
      // it uses "basic" layout defined aboved overwriting
      // with the mappings you define here

      // Second row
      key <AD01> { [ w, W, ecircumflex, Ecircumflex ] }; // w W ê Ê
      key <AD02> { [ b, B,      egrave,      Egrave ] }; // b B è È
      key <AD03> { [ n, N,      eacute,      Eacute ] }; // n N é É

      // ...
   }
   ```

3. To map `keycode names` and `keysymbols` when you define your
   keyboard layout, you need to know the mapping between `keycode
   names` and `keycodes` and the `keysymbols` `XKB` uses.

4. You can find the mapping between `keycode names` and `keycodes` in
   the directory `/usr/share/X11/xkb/keycodes` and in our case,
   specificaly in the file `/usr/share/X11/xkb/keycodes/evdev`:

   ```
   default xkb_keycodes "evdev" {
       minimum = 8;
       maximum = 255;

       // ...

       <TAB> = 23;
       <AD01> = 24;
       <AD02> = 25;
       <AD03> = 26;
       <AD04> = 27;
       <AD05> = 28;
       <AD06> = 29;
       <AD07> = 30;
       <AD08> = 31;
       <AD09> = 32;
       <AD10> = 33;
       <AD11> = 34;
       <AD12> = 35;
       <BKSL> = 51;
       alias <AC12> = <BKSL>;
       <RTRN> = 36;

       // ...

   }
   ```

   `<TAB>` is the `keycode name` of the `keycode 23`.

5. You can find the list of all the `keysymbols` in the file
   `/usr/include/X11/keysymdef.h`:

   ``` C
   /* ... */

   #define XK_5                             0x0035  /* U+0035 DIGIT FIVE */
   #define XK_6                             0x0036  /* U+0036 DIGIT SIX */
   #define XK_7                             0x0037  /* U+0037 DIGIT SEVEN */
   #define XK_8                             0x0038  /* U+0038 DIGIT EIGHT */
   #define XK_9                             0x0039  /* U+0039 DIGIT NINE */
   #define XK_colon                         0x003a  /* U+003A COLON */
   #define XK_semicolon                     0x003b  /* U+003B SEMICOLON */
   #define XK_less                          0x003c  /* U+003C LESS-THAN SIGN */
   #define XK_equal                         0x003d  /* U+003D EQUALS SIGN */
   #define XK_greater                       0x003e  /* U+003E GREATER-THAN SIGN */
   #define XK_question                      0x003f  /* U+003F QUESTION MARK */
   #define XK_at                            0x0040  /* U+0040 COMMERCIAL AT */
   #define XK_A                             0x0041  /* U+0041 LATIN CAPITAL LETTER A */
   #define XK_B                             0x0042  /* U+0042 LATIN CAPITAL LETTER B */
   #define XK_C                             0x0043  /* U+0043 LATIN CAPITAL LETTER C */
   #define XK_D                             0x0044  /* U+0044 LATIN CAPITAL LETTER D */
   #define XK_E                             0x0045  /* U+0045 LATIN CAPITAL LETTER E */

   /* ... */

   ```

6. Normally, with the 5 items above, you should be able to start
   making your own keyboard layout.

## More reading

1. To understand the basics of `XKB` configuration, read
   [XKB Config](https://www.x.org/releases/current/doc/xorg-docs/input/XKB-Config.html)
   from [x.org](https://www.x.org).
1. Find more information about `keycodes`, `keysymbols` and `XKB` in this
   [basics part](https://www.charvolant.org/doug/xkb/html/node3.html)
   of the article
   [An Unreliable Guide to XKB Configuration description](https://www.charvolant.org/doug/xkb/html/xkb.html) from
   Doug Palmer.
3. If you want to modify or to make your own keyboard layout, have a
   look on
   [X keyboard extension (wiki)](https://wiki.archlinux.org/index.php/X_keyboard_extension)
   part of the [ArchWiki](https://wiki.archlinux.org/).
4. If you want a step by step explanation of `XKB`, you can read
   [A simple humble but comprehensive guide to XKB](https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450)
   from Damiano Venturin.

# Contact

Do you have any question or suggestion? Please, feel free to:
* leave me a message on twitter <a
href="http://www.twitter.com/tonyaldon">@tonyaldon</a>
* or to email me at tony.aldon.adm@gmail.com.

**Speaking with your computer always starts by typing
characters. Speak clearly. Have a better life.**
