package;

import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite 
{

	public function new(x:Int, y:Int) 
	{
		super(x, y);
		
		acceleration.y = 1500;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (isTouching(FlxObject.FLOOR))
			velocity.x = -50;
		else
		{
			velocity.x = 0;
			acceleration.y = 1500;
		}
		super.update(elapsed);
	}
	
}