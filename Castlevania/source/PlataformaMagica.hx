package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class PlataformaMagica extends FlxSprite 
{
	private var maxTime:Float = 4;
	private var timer:Float = 0;
	private var _x:Float = 0;
	private var _y:Float = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		_x = x;
		_y = y;
	}
	
	override public function update(elapsed:Float):Void
	{
		timer += elapsed;
		if (timer >= 2) 
		{
			reset(_x,_y);
			if (timer >= maxTime) 
			{
				reset(0, 0);
				timer = 0;
			}
		}
		super.update(elapsed);
	}
	
}