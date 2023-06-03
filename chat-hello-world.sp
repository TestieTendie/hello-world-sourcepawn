#include <sourcemod>

public void OnPluginStart()
{
    // Hook to the event when the client is put in the game
    HookEvent("player_team", OnPlayerTeam);

    // Register chat command
    RegConsoleCmd("say", ChatCommand);
    RegConsoleCmd("say_team", ChatCommand);
}

public void OnMapStart()
{
    // Print "Hello, world!" in chat for all players in the beginning of the game
    PrintToChatAll("Hello, world!");
}

public Action OnPlayerTeam(Event event, const char[] name, bool dontBroadcast)
{
    // Get the client index
    int client = GetClientOfUserId(event.GetInt("userid"));

    // If the client is valid and is not an AI
    if(client > 0 && !IsFakeClient(client))
    {
        // Print "Hello, world!" in chat for the joining player
        PrintToChat(client, "Hello, world!");
    }
    return Plugin_Continue;
}

public Action ChatCommand(int client, int args)
{
    // Get the message from the client
    char sArg1[100];
    GetCmdArg(1, sArg1, sizeof(sArg1));

    if(StrEqual(sArg1, "!hello"))
    {
        // If the client typed "!hello" in chat, print "Hello, world!" to them
        PrintToChat(client, "Hello, world!");
    }
    return Plugin_Continue;
}
