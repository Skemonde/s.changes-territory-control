//Announcer for killstreaks and first kill

void AnnounceKills(CPlayer@ player)
{
    string playerName = player.getUsername();
    bool hasFirstKill;

    if (player.getKills() == 1)
    {
        for (u8 i = 0; i < getPlayersCount(); i++)
	    {
		    CPlayer@ p = getPlayer(i);
		    if (p.getKills() > 0 && p.getUsername() != playerName) 
            {
                hasFirstKill = true;
                break;
            }
	    }

        if (!hasFirstKill)
        {
            client_AddToChat(playerName + " got the first kill!", SColor(255, 255, 0, 0));
            if (isClient()) 
            {
                Sound::Play("FirstBlood.ogg");
            }
        }
        return;
    }

    switch(player.getAssists()) 
    {
        case 5:
            client_AddToChat(playerName + " murdered 5 in a row !", SColor(255, 255, 0, 0));
            if (isClient()) 
            {
                Sound::Play("Unstoppable.ogg");
            }
            break;
        case 10:
            client_AddToChat(playerName + " has slayed 10 in a row, be careful !", SColor(255, 255, 0, 0));
            if (isClient()) 
            {
                Sound::Play("HolyShit.ogg");
            }
            break;
        case 20:
            client_AddToChat(playerName + " exterminated 20 souls, may God help us !", SColor(255, 255, 0, 0));
            if (isClient())
            {
                Sound::Play("GodLike.ogg");
            }
            break;
        case 30:
            client_AddToChat(playerName + " wiped out the server with a 30 killstreak, it's over !", SColor(255, 255, 0, 0));
            if (isClient())
            {
                Sound::Play("MonsterKill.ogg");
            }
            break;
    }
}