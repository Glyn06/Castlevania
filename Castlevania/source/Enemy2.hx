package;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class Enemy2 extends Enemy 
{
    private var timeToAttack:Float = 3;
	private var iWillAttack:Float = 0;
	public var bullet(get, null):Bala;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		iWillAttack += elapsed;
		if (iWillAttack >= timeToAttack) 
		{
			bullet = new Bala(x, y);
			bullet.makeGraphic(16, 16, 0xff133113);
			FlxG.state.add(bullet);
			iWillAttack = 0;
		}
	}
	
	function get_bullet():Bala 
	{
		return bullet;
	}
	
}