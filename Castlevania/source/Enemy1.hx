package;
import flixel.FlxObject;

/**
 * ...
 * @author Glyn & Alexander
 */
class Enemy1 extends Enemy 
{

public function new(x:Int, y:Int) 
	{
		super(x, y);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (isTouching(FlxObject.FLOOR))
			velocity.x = -50;
		else
			velocity.x = 0;
		super.update(elapsed);
	}
	
}