package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var p1:Player;
	var plataforma:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		plataforma = new FlxSprite(100, 300);
		plataforma.makeGraphic(700, 20, 0xFF000080);
		plataforma.immovable = true;
		p1 = new Player(100, 100);
		p1.makeGraphic(32, 32, 0xFFFF004D);
		
		add(p1);
		add(plataforma);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(p1, plataforma);
		
	}
}