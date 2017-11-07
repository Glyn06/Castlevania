package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class Enemy extends FlxSprite 
{
	public var boss:Bool;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		acceleration.y = 1500;
		boss = false;
	}
	
}