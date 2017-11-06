package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class Enemy3 extends Enemy 
{
	public function new(?X:Int=0, ?Y:Int=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (isTouching (FlxObject.FLOOR) || isTouching (FlxObject.CEILING)) 
			acceleration.y *= -1;
		
		super.update(elapsed);
	}
	
}