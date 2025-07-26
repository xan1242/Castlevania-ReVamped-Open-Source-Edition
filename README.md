# FORK NOTE

This fork was created originally for private use with the intention of running the game on PS Vita.

As such, I haven't kept track of changes inside this repo at all.

But I did need to massively optimize the performance of this game in order to achieve this goal.

Here's a non-exhaustive list of changes that have been made:

- Massively reduced memory usage by optimizing audio assets
- Improved memory usage by dynamic loading/unloading of texture groups and assets as needed
- Reduced amount of loaded objects and assets overall (e.g. removed textures like bgNothing and replaced them with simple background colors)
- Android version compatibility and touch controls
- Optimized various objects that are not needed to be loaded at all times
- Optimized the map tracking performance massively and made a custom class which acts more like C++ std::map to achieve it
- Optimized outline font rendering
- Changed the fntCritical font due to it causing crashes on ARMv7 due to a bug in Game Maker code which causes misaligned reads
- Included the source fonts in the repo
- Reworked some screens to be more sensibly coded
- Updated the Input plugin
- Overall much better performance

And probably much more than this.

However, this isn't without some drawbacks. Currently there are a few issues introduced:

- Verb groups need to be created for the Input plugin
- Button remapping is iffy and needs a massive rework thanks to the plugin update
- Button icons are gone due to the Input plugin update

And finally, as for the Vita port - it currently crashes on startup with the YoYo Loader.

ARMv7 build also can crash on startup on Android due to a bug in the Game Maker code which can cause a misaligned read when loading fonts at startup.

(I assume that's the same bug causing the Vita loader to crash)

--------

# Castlevania-ReVamped-Open-Source-Edition
 The Open-Source version of Castlevania ReVamped!

----------------------------------------------------------------
WHAT IS THIS?

This is the open-source edition of Castlevania ReVamped; free for use in any mods of the game, or for use as a base for other projects. This project should be modified or compiled with the most up-to-date version of Game Maker.

----------------------------------------------------------------
RULES FOR USE:

-Any mod or project using this engine must retain the original game's credits, as seen at the bottom of this document.

-Do not use this project to promote hateful or prejudiced content.

-This project may not be sold commercially unless ALL copyrighted material is replaced and proper licenses for publishing are acquired.

----------------------------------------------------------------
NEED HELP?

I am aware that I am a really bad coder. In my opinion, if the code works, then it's fine. However, I fully expect people may have questions as to how this game's engine functions and how to use it. Please direct these inquiries to the Dev Corner's #source-code-help channel in the official Castlevania ReVamped Discord server:

https://discord.com/invite/gRqkXbCeDA

This will be the quickest way to get my help!

----------------------------------------------------------------
CASTLEVANIA RE-VAMPED CREDITS

GAME DESIGN & PRODUCTION

William ''Lv.4 WALL'' Perez

FLAVOR TEXT

Ivan Perez

MAP & LAYOUT DESIGN

Lv.4 WALL

GRAPHIC ARTISTS

Hansungkee

ZeroSaberGreen

Murphmario

Mister Mike

Badbatman3

SmithyGCN

Lexou Duck

Stardust Nova

MUSICIANS

Raspberry Oatshark

Shimoine

SPECIAL THANKS

WarMachine Studios

Mr. P's Castlevania Realm

The Castlevania Dungeon

TESTING

Jack Beauchamp

Marilyn Hannan

Max Morrone

Ivan Perez

Robert ''subledger'' Hyatt

JupiterClimb

Spriven

ALL OTHER ASSETS ARE DERIVED WORK OF KONAMI

Presented by 

Lv.4 GAMES, 2024

--------------------------------
