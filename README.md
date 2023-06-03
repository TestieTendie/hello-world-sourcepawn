# Hello, World! Sourcemod Plugins
This repository contains different versions of a SourceMod plugin that prints "Hello, World!" to the chat box in various ways. Each version represents an increasing level of complexity.

### hello-world.sp
This is the simplest version of the plugin. It prints "Hello, World!" to the chat box for all players at the start of a game and specifically for the new player each time a player joins a game.

**OnMapStart:** This function is triggered at the start of a game. It sends the "Hello, World!" message to all players.

**OnPlayerTeam:** This function is triggered each time a player joins a game. It sends the "Hello, World!" message to the joining player.

### chat-hello-world.sp
This version adds the ability for players to trigger the "Hello, World!" message by typing "!hello" into the chat box.
```Because command processing is done before the messages are shown, this version sends the "Hello, World! message above the user's message.```
**ChatCommand:** This function is triggered each time a player sends a chat message. If the message is "!hello", the function sends the "Hello, World!" message to the player who sent the chat message.

### delayed-chat-hello-world.sp
This version adds a delay to the chat command, so that the "Hello, World!" message appears after the player's "!hello" message in the chat box.

**ChatCommand:** This function works the same way as in the previous version, but now it creates a timer when the player types "!hello".

**PrintHello:** This function is triggered by the timer created in ChatCommand. It sends the "Hello, World!" message to the player who triggered the timer.

How to Use
Clone this repository.
Compile the .sp files using the SourcePawn compiler.
Place the compiled .smx files into your SourceMod plugins directory.
Restart the server or load the plugins using the SourceMod console commands.
Remember, these plugins require a game server running SourceMod to function. Be sure to check the SourceMod documentation for more information on how to set up and manage your plugins.
