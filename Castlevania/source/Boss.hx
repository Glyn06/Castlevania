package;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
enum BossEstado{
	Descansando;
	Moviendose;
	Atacando;
}
 
class Boss extends Enemy 
{
	private var estado:BossEstado;
	private var vida:Int;
	private var time:Int = 0;
	private var change:Int = 64;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		estado = BossEstado.Descansando;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		switch (estado) 
		{
			case Descansando:
				makeGraphic(64, 64, 0xff80FFFF);
				time += 1;
				if (time >= change) 
				{
					time = 0;
					estado = BossEstado.Moviendose;
				}
				
			case Moviendose:
				time += 1;
				if (time < change) 
				{
					velocity.x = -100;
				}
				if (time >= change) 
				{
					velocity.x = 0;
					time = 0;
					makeGraphic(64, 64, 0xffffffff);
					estado = BossEstado.Atacando;
				}
				
			case Atacando:
				time += 1;
				if (time == 3) 
				{
					makeGraphic(64, 64, 0xff324159);
				}
				if (time >= change) 
				{
					time = 0;
					estado = BossEstado.Descansando;
				}
		}
	}
	
}