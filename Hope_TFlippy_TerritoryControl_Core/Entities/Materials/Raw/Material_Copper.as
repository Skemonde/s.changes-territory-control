void onInit(CBlob@ this)
{	
	this.maxQuantity = 1000;
	this.set_u8("death_threshold", 50);
	this.getCurrentScript().runFlags |= Script::remove_after_this;
}