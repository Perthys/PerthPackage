# PerthPackage

Basically a way for me to cache packages into my workspace aswell as the global env 
and use es6 javascript import syntax aswell
gonna have built in packages aswell as ones that you can import using get 

```lua
local PerthPackage = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/PerthPackage/main/main.lua'))()

PerthPackage:Init("CacheStorageName")

import "Maid" as ""

local MyMaid = Maid.new();

MyMaid:AddTask(Instance.new("Part"))
MyMaid:DoCleaning()


```
