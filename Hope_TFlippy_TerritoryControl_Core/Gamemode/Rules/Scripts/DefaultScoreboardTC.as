
// set kills, deaths and assists

#include "AssistCommon.as";

void onBlobDie(CRules@ this, CBlob@ blob)
{
	if (!this.isGameOver() && !this.isWarmup())	//Only count kills, deaths and assists when the game is on
	{
		if (blob !is null)
		{
			CPlayer@ killer = blob.getPlayerOfRecentDamage();
			CPlayer@ victim = blob.getPlayer();
			CPlayer@ helper = getAssistPlayer(victim, killer);

			if (helper !is null)
			{
				helper.setAssists(helper.getAssists() + 1);
			}

			if (victim !is null)
			{
				victim.setDeaths(victim.getDeaths() + 1);
				// temporary until we have a proper score system
				victim.setScore(100 * (f32(victim.getKills()) / f32(victim.getDeaths() + 1)));
                victim.setAssists(0);
             
				if (killer !is null) //requires victim so that killing trees matters
				{
					if (killer.getTeamNum() != blob.getTeamNum())
					{
						killer.setKills(killer.getKills() + 1);
						// temporary until we have a proper score system
						killer.setScore(100 * (f32(killer.getKills()) / f32(killer.getDeaths() + 1)));
                        killer.setAssists(killer.getAssists() + 1);
						announceKills(killer);
					}
				}

			}
		}
	}
}

void announceKills(CPlayer@ player)
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
			if (isClient())
			{
				Sound::Play("FirstBlood.ogg");
				client_AddToChat(playerName + " got the first kill!", SColor(255, 255, 0, 0));
			}
        }
        return;
    }

    switch(player.getAssists()) 
    {
        case 5:
            Sound::Play("Unstoppable.ogg");
			if (isClient())
			{
				client_AddToChat(playerName + " murdered 5 in a row !", SColor(255, 255, 0, 0));
			}
            break;
        case 10:
            Sound::Play("HolyShit.ogg");
			if (isClient())
			{
				client_AddToChat(playerName + " has slayed 10 in a row, be careful !", SColor(255, 255, 0, 0));
			}
            break;
        case 20:
            Sound::Play("GodLike.ogg");
			if (isClient())
			{
				client_AddToChat(playerName + " exterminated 20 souls, may God help us !", SColor(255, 255, 0, 0));
			}
            break;
        case 30:
            Sound::Play("MonsterKill.ogg");
			if (isClient())
			{
				client_AddToChat(playerName + " wiped out the server with a 30 killstreak, it's over !", SColor(255, 255, 0, 0));
			}
            break;
    }
}