package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class Player extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		acceleration.y = 1500;
	}
	
	override public function update(elapsed:Float):Void
	{
		if (isTouching(FlxObject.FLOOR)) //setear veolocidad x a 0 cuando este en el piso
		{
			velocity.x = 0;
		}
		
		if (FlxG.keys.pressed.D && isTouching(FlxObject.FLOOR)) //mov der
		{
			velocity.x = 200;
		}
		
		if (FlxG.keys.pressed.A && isTouching(FlxObject.FLOOR)) //mov izq
		{
			velocity.x = -200;
		}
		
		if (FlxG.keys.justPressed.K && isTouching(FlxObject.FLOOR)) //salto
		{
			velocity.y = -500;
		}
		else if (!isTouching(FlxObject.FLOOR))
		{
			acceleration.y = 1500;
		}
		
		super.update(elapsed);
	}
}