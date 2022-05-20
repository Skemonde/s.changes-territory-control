
void onInit(CBlob@ this)
{
  this.maxQuantity = 500;

	this.set_u8("death_threshold", 25);
  this.getCurrentScript().runFlags |= Script::remove_after_this;
}
