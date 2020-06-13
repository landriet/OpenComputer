# OpenComputer

This version use caches to collect the needed items. Either place them like me, or change the way the robot will collect in patterns.lua.

Configuration :

SUCK_FINAL_PRODUCT : false by default. If set to true, the robot will suck the final product by itself and drop it in the chest in top of the charger otherwise it will use the vacuum by sending a redstone signal.

USE_REDSTONE_SIGNAL : true by default. If set to true, it will use the strength of the projector fiel signal to determine when the final product has been created, otherwise it will use the timer setted in each pattern to wait.

![alt text](https://github.com/landriet/OpenComputer/blob/master/field-projector/2020-06-13_13.37.19.png?raw=true)

