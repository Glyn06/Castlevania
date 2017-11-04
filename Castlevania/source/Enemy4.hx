package;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class Enemy4 extends Enemy 
{
	private var timetojump:Int = 3;
	private var itsNOW:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		velocity.x = -50;	
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		itsNOW += 1;
		if (itsNOW >= timetojump) 
		{
			acceleration.y = -10;
		}
		if (itsNOW <= timetojump+3) 
		{
			acceleration.y = -10;
		}
	}
	
}