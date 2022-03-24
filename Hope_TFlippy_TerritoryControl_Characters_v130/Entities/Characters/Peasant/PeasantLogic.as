// Peasant logic
#include "RunnerCommon.as";

void onInit(CBlob@ this)
{
	this.Tag("neutral");
	this.Tag("human");
	
	this.set_u8("mining_hardness", 1);
	this.set_u32("build delay", 8);

	this.set_u32("timer", 0);
}

void onTick(CBlob@ this)
{
	if (this.get_u32("timer") > 1) this.set_u32("timer", this.get_u32("timer") - 1);

	RunnerMoveVars@ moveVars;
	if (!this.get("moveVars", @moveVars))
	{
		return;
	}

	if (this.hasTag("glued") && this.get_u32("timer") > 1)
	{
		moveVars.walkFactor *= 0.4f;
		moveVars.jumpFactor *= 0.5f;
	}
}

f32 onHit(CBlob@ this, Vec2f worldPoint, Vec2f velocity, f32 damage, CBlob@ hitterBlob, u8 customData)
{
	CPlayer@ player=this.getPlayer();
	if (this.hasTag("invincible") || (player !is null && player.freeze)) 
	{
		return 0;
	}
	return damage;
}