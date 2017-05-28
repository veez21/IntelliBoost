# IntelliBoost
Stretch your android's battery life and oil the gears in your Android! 
This mod is full of shell scripts that can be flashed in recovery.

- [XDA Thread](https://forum.xda-developers.com/android/software/mod-intelliboost-stretch-battery-life-t3613437)

- [G+ Page](https://plus.google.com/u/0/communities/103694585129460218696)

# Goal
- To ensure maximal battery life and a overall increase in smoothness and performnce (without degrading battery life)
- Best for people who have horrrible battery life on For mid-ranged/flagship devices (Nexus 6p, Note 3, Mi Max, s6 etc...)
- Support will be added soon for cheapscate devices (1ghz processor, 1gb ram)
- Dynamism(able to intelligently adapt to whatever change variable, and provide the best value based on the given set of imput data) in every aspect(lmk, fast charge values etc), and ensure most stuff are quick and on-the-fly(apply changes without rebooting)

## Methodology
- Optimise android values using shell scripts (Bash) and many others (build.prop tweaks...etc)

## Requirement
- Custom recovery
- Custom kernel
- A working Brain

## Features
List will be coming up soon!
Logs are in /data/intelliboost/logs (/data is not the "Internal storage" of most file explorers! Youn need to go to the root partion, then data)

Profiles (can be activated through UI)
- Battery profile => will not be made. This is beacause the multitasking profile is already biased to battery, and further degaration in performace will only cause much much more lags and a overall instability, and a unenjoyable use of your phone
- System-wide constant stablility, smoothness, battery efficent and reasonable performance(multitasking profile)
- No crashes in games that take up a horrible amount of procesing and graphics, totally no lag on system, constant smooth 60fps, (performance profile)

Upcoming stuff
- Shell script in /system/bin that allows more customisation and more interactive with a GUI. An app may be implemented if i have time
- Dynamic update binary to detect ram or processor speed and decide on what profile to install(battery/ performance)
- Much more governer tweaks for the sake of saving battery (considering to merge govtuner source)
- Improved script structure for better and more efficient execution (and dynamic!)
- Improved script values (setprop, etc...)
- OneTime initialisation of preferences as a shell script to apply values that are completely optional

## Contribution
Spot an error/bug/wrong value/spelling errors? Please send me a fork then send me a pull request!
*Any contribution is welcome, and very much appreciated*

### FAQ (Freaking Annoying Questions)
Q: How to update?
- Just flash the new zip. The old scripts will be automatically cleared and replaced

Q: Why cant you make a version with good performance and good battery?
- Performance is the enemy of Battery. Making them kiss and make up is impossible

Q: Can I use your scripts?
- Ask for permission (XDA PM). PLease state your purpose too (whatcha gonna do with the scripts) You have to ask for permission. No response means no.
