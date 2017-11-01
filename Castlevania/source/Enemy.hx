package;

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
	
}