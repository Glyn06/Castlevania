package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author Glyn & Alexander
 */
enum Donde {
	Play;
	Controls;
}
 class Menu extends FlxState 
{
	private var texto:FlxText;
	private var cursor:FlxSprite;
	private var where:Donde = Donde.Play;
	
	override public function create():Void 
	{
		cursor = new FlxSprite(FlxG.width/2 -40,140);
		cursor.makeGraphic(8, 8, 0xffffffff);
		texto = new FlxText (10, 30, 0, "Castlevania", 32);
		add(texto);
		texto = new FlxText (0, 90, 0, "By: José Quintana Martín", 16);
		add(texto);
		texto = new FlxText(40, 110, 0, "Ian Leguizamon", 16);
		add(texto);
		texto = new FlxText (FlxG.width/2 - 20,140, 0, "Play", 8);
		add(texto);
		texto = new FlxText (FlxG.width/2 - 20,160, 0, "Controls", 8);
		add(texto);
		add(cursor);
	}
	
	override public function update(elapsed:Float):Void 
	{
		switch (where) 
		{
			case Play:
				
				if (FlxG.keys.justPressed.S || FlxG.keys.justPressed.W) 
				{
					cursor.kill();
					cursor.reset(FlxG.width / 2 - 40, 160);
					where = Donde.Controls;
				}
				
				if (FlxG.keys.justPressed.J) 
				{
					FlxG.switchState(new PlayState());
				}
				
			case Controls:
				if (FlxG.keys.justPressed.S || FlxG.keys.justPressed.W) 
				{
					cursor.kill();
					cursor.reset(FlxG.width / 2 - 40, 140);
					where = Donde.Play;
				}
				
				if (FlxG.keys.justPressed.J) 
				{
					FlxG.switchState(new ControlsMenu());
				}
		}
	}
	
}