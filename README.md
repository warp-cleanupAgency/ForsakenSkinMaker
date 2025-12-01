# ForsakenSkinMaker
An easy to use forsaken skin maker (clientsided) (PC ONLY)

Welcome to the Forsaken Skin Maker!

# Introduction
You don't need any lua experience for this, only basic knowledge of how dex works and how roblox animation IDs/model IDs/model publishing works, all the functions are premade for you and you only have to use them!
This is OPEN SOURCE so the code is open, and you can add extra skin behavior code into your script if you know what you're doing. I don't care if you don't credit me for your skins, im making this out of passion.

# How To Use

First, Insert this line of code into the top of your screen and add some sort of seperator such as ----------------------
loadstring(game:HttpGet("https://raw.githubusercontent.com/warp-cleanupAgency/ForsakenSkinMaker/refs/heads/main/skinfunctions.lua", true))()

after you insert that into the script, you can make your skin
[[!!BEFORE YOU START MAKING YOUR SCRIPT, MAKE A RIG IN STUDIO THAT IS COMPLETELY UNANCHORED AND ISNT WELDED TO ANYTHING EXTERNAL!!]]
Right click on the Rig in explorer, click Save/Export and Save To Roblox, once its done, itll show you the creator dashboard url, scroll down in creator dashboard and find the Distribute To Marketplace option. Enable it as it is NEEDED for it to get loaded in! Then copy the id (ex. 4915219921, without the rbxassetid://, formatted as a NUMBER)

HOW YOUR SCRIPT SHOULD START AFTER PASTING IN THE LOADSTRING
loadstring goes here yada yada
-----------------------------------
local user = game.Players.LocalPlayer.Character --this makes it so YOURE the skin user!
local Actor = CreateRig(user, game:GetObjects(the id, formatted as number, not string)[1]) --this loads the rig using getObjects, and makes it into a variable and sets up the rig using my FUNCTION!
--Right now the rig isn't animated, so... we need to use the Animate function. Example:
--Animation Priorities from Lowest to Highest: Core (Lowest), Idle, Movement, Action, Action2, Action3, Action4 (Highest)
Animate(user, Actor, {
   { --Idle
	Old = "rbxassetid://70639889347646", --The original animation that plays on the killer (get it using infyield copyanimid or killer configs)
	New = "rbxassetid://106883884364210", --The animation you replace it with. If you want an animation to stay the same, just dont touch it and dont make anything from it. If you want all animations to be the same, use an empty table ex. Animate(user, Actor, {})
	Priority = Enum.AnimationPriority.Idle --The priority of the animation.
   },
   { --Walk
	Old = "rbxassetid://125580704385106",
	New = "rbxassetid://131203472525014",
	Priority = Enum.AnimationPriority.Movement
   },
   { --Run
	Old = "rbxassetid://117829808188202",
	New = "rbxassetid://93106765808091",
	Priority = Enum.AnimationPriority.Movement
   }
})
--Now if you want terror radius im gonna write on that soon but rn im assuming ur not doing custom terror radius or your skin is a survivor.
