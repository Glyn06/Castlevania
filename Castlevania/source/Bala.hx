package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class Bala extends FlxSprite
{
	private var killMyself:Float = 3;
	private var iWill:Float = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		iWill += elapsed;
		velocity.x = -500;
		
		if (iWill>=killMyself) 
		{
			destroy();
			iWill = 0;
		}
	}
	
}