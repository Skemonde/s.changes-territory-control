
void onInit(CBlob@ this)
{
  if (isServer())
  {
    this.set_u8('decay step', 14);
  }

	this.set_u8("death_threshold", 50);
  this.maxQuantity = 2000;

  this.getCurrentScript().runFlags |= Script::remove_after_this;
}
