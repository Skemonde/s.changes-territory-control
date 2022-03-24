#include "GunCommon.as";

void onInit(CBlob@ this)
{
	GunSettings settings = GunSettings();

	//General
	//settings.CLIP = 0; //Amount of ammunition in the gun at creation
	settings.TOTAL = 8; //Max amount of ammo that can be in a clip
	settings.FIRE_INTERVAL = 4; //Time in between shots
	settings.RELOAD_TIME = 15; //Time it takes to reload (in ticks)
	settings.AMMO_BLOB = "mat_pistolammo"; //Ammunition the gun takes

	//Bullet
	//settings.B_PER_SHOT = 1; //Shots per bullet | CHANGE B_SPREAD, otherwise both bullets will come out together
	settings.B_SPREAD = 4; //the higher the value, the more 'uncontrollable' bullets get
	settings.B_GRAV = Vec2f(0, 0.001); //Bullet gravity drop
	settings.B_SPEED = 90; //Bullet speed, STRONGLY AFFECTED/EFFECTS B_GRAV
	settings.B_TTL = 12; //TTL = 'Time To Live' which determines the time the bullet lasts before despawning
	settings.B_DAMAGE = 1.6f; //1 is 1 heart
	settings.B_TYPE = HittersTC::bullet_low_cal; //Type of bullet the gun shoots | hitter

	//Recoil
	settings.G_RECOIL = -7; //0 is default, adds recoil aiming up
	settings.G_RANDOMX = true; //Should we randomly move x
	settings.G_RANDOMY = false; //Should we randomly move y, it ignores g_recoil
	settings.G_RECOILT = 4; //How long should recoil last, 10 is default, 30 = 1 second (like ticks)
	settings.G_BACK_T = 3; //Should we recoil the arm back time? (aim goes up, then back down with this, if > 0, how long should it last)

	//Sound
	settings.FIRE_SOUND = "FugerFire.ogg"; //Sound when shooting
	settings.RELOAD_SOUND = "FugerReload.ogg"; //Sound when reloading

	//Offset
	settings.MUZZLE_OFFSET = Vec2f(-14, -3); //Where the muzzle flash appears

	this.set("gun_settings", @settings);

	//Custom
	this.Tag("CustomSemiAuto");
	this.set_f32("CustomBulletLength", 9.0f);
}
