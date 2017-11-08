package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author Glyn & Alexander
 */
class Continue extends FlxState 
{
	private var texto:FlxText;
	
	override public function create():Void 
	{
		FlxG.sound.pause();
		
		texto = new FlxText (0, 30, 0, "Presiona P para intentar de nuevo", 8);
		add(texto);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.P) 
		{
			FlxG.switchState(new BossState());
		}
	}
	
}