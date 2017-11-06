package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class DeathTrap extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		acceleration.y = 750;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (isTouching(FlxObject.CEILING) || isTouching(FlxObject.FLOOR)) 
		{
			acceleration.y *=-1;
		}
		super.update(elapsed);
	}
	
}