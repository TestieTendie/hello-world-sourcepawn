<h1 align="center">Hello, World! Sourcemod Plugins</h1>

This repository contains different versions of a SourceMod plugin that prints "Hello, World!" to the chat box in various ways. Each version represents an increasing level of complexity.

<h2 align="center">hello-world.sp</h2>

This is the simplest version of the plugin. It prints "Hello, World!" to the chat box for all players at the start of a game and specifically for the new player each time a player joins a game.


**OnMapStart:** This function is triggered at the start of a game. It sends the "Hello, World!" message to all players.

**OnPlayerTeam:** This function is triggered each time a player joins a game. It sends the "Hello, World!" message to the joining player.

<h2 align="center">chat-hello-world.sp</h2>

This version adds the ability for players to trigger the "Hello, World!" message by typing "!hello" into the chat box.

```Because command processing is done before the messages are shown, this version sends the "Hello, World! message above the user's message.```

**ChatCommand:** This function is triggered each time a player sends a chat message. If the message is "!hello", the function sends the "Hello, World!" message to the player who sent the chat message.

<h2 align="center">delayed-chat-hello-world.sp</h2>

This version adds a delay to the chat command, so that the "Hello, World!" message appears after the player's "!hello" message in the chat box.

**ChatCommand:** This function works the same way as in the previous version, but now it creates a timer when the player types "!hello".

**PrintHello:** This function is triggered by the timer created in ChatCommand. It sends the "Hello, World!" message to the player who triggered the timer.

<h2 align="center">named-delayed-chat-hello-world.sp</h2>

This version contains the plugin's name and other details for identification, currently our plugin showed only by its filename when entering the ```sm plugins list``` command in the server console, now it has a full set of information.

**myinfo:** This plugin has a `myinfo` struct that provides the name, author, description, version, and URL of the plugin.

<h1 align="center">How to Use</h1>

- Clone this repository.
- [Compile](https://wiki.alliedmods.net/Compiling_SourceMod_Plugins) the .sp files using the SourcePawn compiler. [Spider Online Compiler here](https://spider.limetech.io/)
- Place the compiled .smx files into your SourceMod plugins directory.
- Restart the server or load the plugins using the SourceMod console commands.

Remember, these plugins require a game server running SourceMod to function. Be sure to check the SourceMod documentation for more information on how to set up and manage your plugins.
