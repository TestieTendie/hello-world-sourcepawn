#include <sourcemod>

public Plugin pluginInfo =
{
    name = "Delayed Chat Hello World Plugin",
    author = "Testie Tendie",
    description = "Prints 'Hello, world!' in chat on game start, on player join and on '!hello' chat command",
    version = "1.0",
    url = "http://www.testietendie.xyz/"
};

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
        // If the client typed "!hello" in chat, create a timer to delay the "Hello, world!" message
        CreateTimer(0.5, PrintHello, GetClientUserId(client), TIMER_FLAG_NO_MAPCHANGE);
    }
    return Plugin_Continue;
}

public Action PrintHello(Handle timer, any userid)
{
    // Get the client index from the user ID
    int client = GetClientOfUserId(userid);

    // If the client is valid and is not an AI
    if(client > 0 && !IsFakeClient(client))
    {
        // Print "Hello, world!" in chat for the client
        PrintToChat(client, "Hello, world!");
    }

    return Plugin_Handled;
}
