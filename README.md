# AC_Template
Athena company's template for zeus missions

Mission file provides an example of the setup required by the features
## Zeus documentation
[Google Document](https://docs.google.com/document/d/1GAnN8WRpHunJGwsFCwL98DVxpv7MkVnK6a6cgLG1p1o/edit?usp=sharing)

## Features

- Unit-Tracker

	Serverside script which updates squadleaders positions on the map for their side

- Single rally(respawn) system

	Single rally serving as a teleport & respawn point, which can be moved by the leader of a predetermined group.

	The action to move the rally is on a cooldown and the group bound to the rally can be changed mid mission using the debug.
	```
	missionNamespace setVariable ["groupRally", "your group name here", true];
	```

- Arsenal/Rearm box

	- Arsenals list all the loadouts defined, give the option to change their ACE role and can save each person's individual loadout.

	- Rearms are single use and load the user's personnal saved loadout.

- FOB teleport system

	FOB's are a shorthand for any object whose purpose is to be a teleport destination. FOB's can be reached using a teleport pole in the same fashion as the rally.

- Preset loadouts

	- Loadouts can edited from the loadouts.sqf script file which uses [the Unit Loadout Array](https://community.bistudio.com/wiki/Unit_Loadout_Array) and requires the loadoutoverride variable to be set.

	- Alternatively one can edit the loadouts from the editor by changing the gear of the the preplaced units (marked by a comment). These can be deleted (except the spawn loadout) or created to suit your needs. To make new loadouts copy the initfield over to the new object and change the _name variable in it.
## Customization
Most of the variables you can change are available in the [init server file](Zeus_AC_Template.Stratis/InitServer.sqf) 

## Functions 

[Function](Zeus_AC_Template.Stratis/functions) files contain scripts used in the template as well as file headers which briefly explain how to use them
