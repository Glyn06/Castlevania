package;

import flixel.FlxObject;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
enum BossEstado{
	Patron1;
	Patron2;
	Patron3;
}
 
class Boss extends Enemy 
{
	private var estado:BossEstado;
	private var tiempo:Int = 0;
	private var deMatar:Int = 96;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		estado = BossEstado.Patron1;
		acceleration.y = 0;
		velocity.x = -100;
	}
	
	override public function update(elapsed:Float):Void 
	{
		switch (estado) 
		{
			case Patron1:
				if (isTouching(FlxObject.LEFT)) 
				{
					velocity.y = -100;
					velocity.x = 0;
				}
				if (isTouching(FlxObject.UP)) 
				{
					velocity.x = 100;
					velocity.y = 0;
				}
				if (isTouching(FlxObject.RIGHT)) 
				{
					velocity.y = 100;
					velocity.x = 0;
				}
				if (isTouching(FlxObject.FLOOR)) 
				{
					velocity.y = -100;
					velocity.x = -100;
					estado = BossEstado.Patron2;
				}
				
			case Patron2:
				if (isTouching(FlxObject.LEFT)) 
				{
					velocity.y = 0;
					velocity.x = 0;
					acceleration.y = 750;
				}
				if (isTouching(FlxObject.FLOOR)) 
				{
					acceleration.x = 750;
					acceleration.y = 0;
				}
				if (isTouching(FlxObject.RIGHT)) 
				{
					estado = BossEstado.Patron3;
				}
				
			case Patron3:
				tiempo += 1;
				if (tiempo >= deMatar) 
				{
					acceleration.y = -1500;
					tiempo = 0;
				}
				if (isTouching(FlxObject.CEILING)) 
				{
					acceleration.y *=-1;
				}
				if (isTouching(FlxObject.FLOOR)) 
				{
					acceleration.y = 0;
					acceleration.x = 0;
					velocity.x = -100;
					velocity.y = 0;
					estado = BossEstado.Patron1;
				}
		}
		
		super.update(elapsed);
	}
	
}