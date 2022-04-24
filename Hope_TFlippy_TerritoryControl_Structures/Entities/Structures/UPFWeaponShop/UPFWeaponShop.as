//script by Xeno(PURPLExeno), sprites by Skemonde(TheCustomerMan)

#include "Requirements.as";
#include "ShopCommon.as";
#include "Descriptions.as";
#include "CheckSpam.as";
#include "CTFShopCommon.as";
#include "MakeMat.as";

void onInit(CBlob@ this)
{
	this.set_TileType("background tile", CMap::tile_castle_back);

	this.getSprite().SetZ(-50); 
	this.getShape().getConsts().mapCollisions = false;

	this.Tag("builder always hit");
	this.Tag("change team on fort capture");

	addTokens(this); 

	this.set_Vec2f("shop offset", Vec2f(0, 0));
	this.set_Vec2f("shop menu size", Vec2f(4, 7));
	this.set_string("shop description", "UPF Weapon Shop");
	this.set_u8("shop icon", 21);
 
    {
		ShopItem@ s = addShopItem(this, "Low Caliber Ammunition (20)", "$icon_pistolammo$", "mat_pistolammo-20", "Bullets for pistols and SMGs.");
		AddRequirement(s.requirements, "coin", "", "Coins", 50);

		s.spawnNothing = true;
	}
	{
		ShopItem@ s = addShopItem(this, "High Caliber Ammunition (10)", "$icon_rifleammo$", "mat_rifleammo-10", "Bullets for rifles. Effective against armored targets.");
		AddRequirement(s.requirements, "coin", "", "Coins", 80);

		s.spawnNothing = true;
	}
	{
		ShopItem@ s = addShopItem(this, "Shotgun Shells (4)", "$icon_shotgunammo$", "mat_shotgunammo-4", "Shotgun Shells for... Shotguns.");
		AddRequirement(s.requirements, "coin", "", "Coins", 70);

		s.spawnNothing = true;
	}
	{
		ShopItem@ s = addShopItem(this, "Machine Gun Ammunition (50)", "$icon_gatlingammo$", "mat_gatlingammo-50", "Ammunition used by the machine gun.");
		AddRequirement(s.requirements, "coin", "", "Coins", 90);

		s.spawnNothing = true;
	}
	    {
		ShopItem@ s = addShopItem(this, "Grenade (2)", "$icon_grenade$", "mat_grenade-2", "A small, timed explosive device used by grenade launchers.");
		AddRequirement(s.requirements, "coin", "", "Coins", 100);

		s.spawnNothing = true;
	}
    {
		ShopItem@ s = addShopItem(this, "Binoculars", "$icon_binoculars$", "binoculars", "Commanding officer should have a pair of binoculars if they want to see what happens on a battlefield!");
		AddRequirement(s.requirements, "coin", "", "Coins", 200);

		s.spawnNothing = true;
	}
	{
        ShopItem@ s = addShopItem(this, "UPF Cock 19", "$cock$", "cock", "Buffed version of fuger.");
		AddRequirement(s.requirements, "coin", "", "Coins", 500);
        AddRequirement(s.requirements, "blob", "fuger", "Fuger", 1);
        AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 16);
	    AddRequirement(s.requirements, "blob",  "mat_steelingot", "Steel Ingot", 8);
		
        s.spawnNothing = true;
    }
    {
        ShopItem@ s = addShopItem(this, "UPF Cock 19 M79", "$cockl$", "cockl", "Want to get a laser pointer on your gun to look cool? Here you go!");
        AddRequirement(s.requirements, "blob", "cock", "UPF Cock 19", 1);
		AddRequirement(s.requirements, "blob", "mat_mithril", "Mithril", 50);
		
        s.spawnNothing = true;
    }
    {     
		ShopItem@ s = addShopItem(this, "UPF PDW", "$pdw$", "pdw", "UPF PDW. Used for shooting holes into humans.");
		AddRequirement(s.requirements, "coin", "", "Coins", 700);
		AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 12);
		AddRequirement(s.requirements, "blob",  "mat_steelingot", "Steel Ingot", 16);

		s.spawnNothing = true;
	}
    {
        ShopItem@ s = addShopItem(this, "UPF Carbine", "$carbine$", "carbine", "UPF Carbine. Used to penetrate humans from afar.");
		AddRequirement(s.requirements, "coin", "", "Coins", 1000);
        AddRequirement(s.requirements, "blob",  "mat_steelingot", "Steel Ingot", 14);
        AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 10);

		s.spawnNothing = true;
    }
    {
        ShopItem@ s = addShopItem(this, "UPF TAR-21", "$tar$", "tar", "Strong automatic rifle for killing peasants.");
		AddRequirement(s.requirements, "coin", "", "Coins", 750);
        AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 12);
		AddRequirement(s.requirements, "blob", "mat_steelingot", "Steel Ingot", 16);
        AddRequirement(s.requirements, "blob", "sar", "UPF SAR-12", 1);

		s.spawnNothing = true;
    }
	{    ShopItem@ s = addShopItem(this, "UPF TAR-21 M79", "$tarl$", "tarl", "Want to get a laser pointer on your gun to look cool? Here you go!");
        AddRequirement(s.requirements, "blob", "tar", "UPF TAR-21", 1);
		AddRequirement(s.requirements, "blob", "mat_mithril", "Mithril", 50);
    
        s.spawnNothing = true;
	}
    {
        ShopItem@ s = addShopItem(this, "UPF XM8", "$xm$", "xm", "Strong automatical rifle.");
		AddRequirement(s.requirements, "coin", "", "Coins", 1500);
        AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 16);
		AddRequirement(s.requirements, "blob", "mat_steelingot", "Steel Ingot", 24);
        AddRequirement(s.requirements, "blob", "assaultrifle", "UPF Assault Rifle", 1);
		
        s.spawnNothing = true;
    }
    {
        ShopItem@ s = addShopItem(this, "UPF XM8 M36", "$xmas$", "xmas", "A heavy UPF machinegun.");
		AddRequirement(s.requirements, "coin", "", "Coins", 2000);
        AddRequirement(s.requirements, "blob", "xm", "UPF XM8", 1);
		AddRequirement(s.requirements, "blob", "carbine", "UPF Carbine", 1);
        AddRequirement(s.requirements, "blob", "mat_steelingot", "Steel Ingot", 36);
		AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 24);
        
        s.spawnNothing = true;
    }
	{
        ShopItem@ s = addShopItem(this, "UPF Suppressed AK-47", "$silencedak$", "silencedak", "Reassemble two very good guns into better one! Uses highcal rounds.");
        AddRequirement(s.requirements, "blob", "silencedrifle", "UPF Suppressed Rifle", 1);
		AddRequirement(s.requirements, "blob", "bnak", "AK-47", 1);
		
        s.spawnNothing = true;
    }
    {
		ShopItem@ s = addShopItem(this, "UPF Suppressed Rifle", "$silencedrifle$", "silencedrifle", "A rifle with a suppressor. Used for assassination of humans.");
		AddRequirement(s.requirements, "coin", "", "Coins", 1250);
		AddRequirement(s.requirements, "blob",  "mat_steelingot", "Steel Ingot", 12);
		AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 16);

		s.spawnNothing = true;
	}
    {
		ShopItem@ s = addShopItem(this, "UPF AMR-13", "$bamr$", "bamr", "AMR's bigger brother.");
		AddRequirement(s.requirements, "coin", "", "Coins", 4000);
        AddRequirement(s.requirements, "blob", "amr", "AMR-127", 1);
		AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 24);
		AddRequirement(s.requirements, "blob", "mat_steelingot", "Steel Ingot", 36);
		
        s.spawnNothing = true;
	}
	{     
		ShopItem@ s = addShopItem(this, "RPG", "$rpg$", "rpg", "RPG");
		AddRequirement(s.requirements, "coin", "", "Coins", 3000);
		AddRequirement(s.requirements, "blob", "mat_ironingot", "Iron Ingot", 40);
		AddRequirement(s.requirements, "blob",  "mat_steelingot", "Steel Ingot", 10);

		s.customButton = true;
		s.buttonwidth = 2;
		s.buttonheight = 1;

		s.spawnNothing = true;
	}
	{
        ShopItem@ s = addShopItem(this, "Ruhm the Sniper Machine Gun", "$ruhm$", "ruhm", "Have you heard of infernal stone? Finest scientists from UPF have shed both blood and tears to find a way to use it!");
		AddRequirement(s.requirements, "coin", "", "Coins", 7000);
		AddRequirement(s.requirements, "blob", "sniper", "UPF Sniper Rifle", 1);
		AddRequirement(s.requirements, "blob", "minigun", "UPF Megagun", 1);
		AddRequirement(s.requirements, "blob", "infernalstone", "Infernal Stone", 1);

		s.customButton = true;
		s.buttonwidth = 4;
		s.buttonheight = 1;
		
		s.spawnNothing = true;
    }
}    

void onChangeTeam(CBlob@ this, const int oldTeam)
{
	addTokens(this);
}

void addTokens(CBlob@ this)
{
	int teamnum = this.getTeamNum();
	if (teamnum > 6) teamnum = 7;

	AddIconToken("$bamr$", "Amr13.png", Vec2f(44, 11), 0, teamnum);
	AddIconToken("$tar$", "Tar21.png", Vec2f(21, 11), 0, teamnum);
	AddIconToken("$xm$", "Xm8.png", Vec2f(28, 11), 0, teamnum);
	AddIconToken("$xmas$", "Xm8M36.png", Vec2f(28, 11), 0, teamnum);
	AddIconToken("$cock$", "Cock19.png", Vec2f(11, 9), 0, teamnum);
    AddIconToken("$silencedrifle$", "SilencedRifle.png", Vec2f(32, 16), 0, teamnum); 
    AddIconToken("$pdw$", "PDW.png", Vec2f(16, 8), 0, teamnum);
    AddIconToken("$carbine$", "Carbine.png", Vec2f(24, 8), 0, teamnum);
    AddIconToken("$mat_pistolammo$", "Material_PistolAmmo.png", Vec2f(16, 16), 0, teamnum);
    AddIconToken("$cockl$", "Cock19M79.png", Vec2f(11, 9), 0, teamnum);
    AddIconToken("$tarl$", "Tar21M79.png", Vec2f(21, 11), 0, teamnum);
}

void GetButtonsFor(CBlob@ this, CBlob@ caller)
{
	this.set_bool("shop available", this.isOverlapping(caller));
}

void onCommand(CBlob@ this, u8 cmd, CBitStream @params)
{
	if(cmd == this.getCommandID("shop made item"))
	{
		this.getSprite().PlaySound("ConstructShort");

		u16 caller, item;

		if(!params.saferead_netid(caller) || !params.saferead_netid(item))
			return;

		string name = params.read_string();
		CBlob@ callerBlob = getBlobByNetworkID(caller);

		if (callerBlob is null) return;

		if (isServer())
		{
			CPlayer@ ply = callerBlob.getPlayer();
			if (ply !is null)
			{
				tcpr("[PBI] " + ply.getUsername() + " has purchased " + name);
			}
		
			string[] spl = name.split("-");

			if (spl[0] == "coin")
			{
				CPlayer@ callerPlayer = callerBlob.getPlayer();
				if (callerPlayer is null) return;

				callerPlayer.server_setCoins(callerPlayer.getCoins() +  parseInt(spl[1]));
			}
			else if (name.findFirst("mat_") != -1)
			{
				CPlayer@ callerPlayer = callerBlob.getPlayer();
				if (callerPlayer is null) return;

				CBlob@ mat = server_CreateBlob(spl[0], callerBlob.getTeamNum(), this.getPosition());

				if (mat !is null)
				{
					mat.Tag("do not set materials");
					mat.server_SetQuantity(parseInt(spl[1]));
					if (!callerBlob.server_PutInInventory(mat))
					{
						mat.setPosition(callerBlob.getPosition());
					}
				}
			}
			else
			{
				CBlob@ blob = server_CreateBlob(spl[0], callerBlob.getTeamNum(), this.getPosition());

				if (blob is null) return;
				if (callerBlob.getPlayer() !is null && name == "nuke")
				{
					blob.SetDamageOwnerPlayer(callerBlob.getPlayer());
				}

				if (!blob.hasTag("vehicle"))
				{
					if (!blob.canBePutInInventory(callerBlob))
					{
						callerBlob.server_Pickup(blob);
					}
					else if (callerBlob.getInventory() !is null && !callerBlob.getInventory().isFull())
					{
						callerBlob.server_PutInInventory(blob);
					}
				}
			}
		}
	}
}

void onDie(CBlob@ this)
{
	if (isServer()) server_CreateBlob("bp_weapons", this.getTeamNum(), this.getPosition());
}