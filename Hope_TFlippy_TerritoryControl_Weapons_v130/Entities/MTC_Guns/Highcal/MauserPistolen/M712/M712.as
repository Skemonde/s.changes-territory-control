#include "GunCommon.as";

void onInit(CBlob@ this)
{
	GunSettings settings = GunSettings();

	//General
	//settings.CLIP = 0; //Amount of ammunition in the gun at creation
	settings.TOTAL = 20; //Max amount of ammo that can be in a clip
	settings.FIRE_INTERVAL = 1.800; //Time in between shots
	settings.RELOAD_TIME = 45; //Time it takes to reload (in ticks)
	settings.AMMO_BLOB = "mat_rifleammo"; //Ammunition the gun takes

	//Bullet
	//settings.B_PER_SHOT = 2; //Shots per bullet | CHANGE B_SPREAD, otherwise both bullets will come out together
	settings.B_SPREAD = 10; //the higher the value, the more 'uncontrollable' bullets get
	settings.B_GRAV = Vec2f(0, 0.003); //Bullet gravity drop
	settings.B_SPEED = 80; //Bullet speed, STRONGLY AFFECTED/EFFECTS B_GRAV
	settings.B_TTL = 12; //TTL = 'Time To Live' which determines the time the bullet lasts before despawning
	settings.B_DAMAGE = 2.250f; //1 is 1 heart
	settings.B_TYPE = HittersTC::shotgun; //Type of bullet the gun shoots | hitter

	//Recoil
	settings.G_RECOIL = -7; //0 is default, adds recoil aiming up
	settings.G_RANDOMX = true; //Should we randomly move x
	settings.G_RANDOMY = true; //Should we randomly move y, it ignores g_recoil
	settings.G_RECOILT = 3; //How long should recoil last, 10 is default, 30 = 1 second (like ticks)
	settings.G_BACK_T = 2; //Should we recoil the arm back time? (aim goes up, then back down with this, if > 0, how long should it last)

	//Sound
	settings.FIRE_SOUND = "MauserPistolFire.ogg"; //Sound when shooting
	settings.RELOAD_SOUND = "M712Reload.ogg"; //Sound when reloading

	//Offset
	settings.MUZZLE_OFFSET = Vec2f(-17, -4); //Where the muzzle flash appears

	this.set("gun_settings", @settings);
	
	//Custom
	this.set_f32("scope_zoom", 0.050f);
	this.set_f32("CustomShootVolume", 1.5f);
	//this.set_u8("CustomPenetration", 2);
	this.set_f32("CustomBulletLength", 9.0f);
	
	CSprite@ sprite = this.getSprite();
	sprite.RewindEmitSound();
	sprite.SetEmitSound("KEAK_CARRADINE");
	sprite.SetEmitSoundSpeed(1);
	sprite.SetEmitSoundVolume(0.400);
	sprite.SetEmitSoundPaused(false);
}

void onDetach(CBlob@ this, CBlob@ detached, AttachmentPoint @attachedPoint)
{
	CSprite@ sprite = this.getSprite();
	sprite.SetEmitSoundPaused(true);
}

void onAttach(CBlob@ this, CBlob@ attached, AttachmentPoint @attachedPoint)
{
	CSprite@ sprite = this.getSprite();
	sprite.SetEmitSoundPaused(false);
}

void onDie(CBlob@ this)
{
	CSprite@ sprite = this.getSprite();
	sprite.SetEmitSound("");
}