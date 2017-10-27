package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var p1:Player;
	var plataforma:FlxSprite;
	var plataformaDesaparece:FlxSprite;
	var deathTrap:FlxSprite;
	private var maxTime:Float = 4;
	private var timer:Float = 0;
	
	
	override public function create():Void
	{
		super.create();
		/*deathTrap = new FlxSprite(100, 50);
		deathTrap.makeGraphic(100, 20, 0xFF734552);
		deathTrap.acceleration.y = 1500;*/
		
		/*plataformaDesaparece = new FlxSprite(0, 150);
		plataformaDesaparece.makeGraphic(100, 20, 0xFF500000);
		plataformaDesaparece.immovable = true;
		plataformaDesaparece.kill();*/
		
		plataforma = new FlxSprite(0, 200);
		plataforma.makeGraphic(2000, 20, 0xFF000080);
		plataforma.immovable = true;
		
		p1 = new Player(100, 100);
		p1.makeGraphic(32, 32, 0xFFFF004D);
		
		add(p1);
		add(plataforma);
		//add(plataformaDesaparece);
		//add(deathTrap);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		timer += elapsed;
		/*if (timer >= 2) 
		{
			plataformaDesaparece.revive();
			
			if (timer >= maxTime) 
			{
				plataformaDesaparece.kill();
				timer = 0;
			}
		}
		
		FlxG.collide(deathTrap, plataforma);
		
		if (FlxG.collide(p1, deathTrap)) 
		{
			p1.kill();
		}*/
		
		FlxG.collide(p1, plataforma);
		
		//FlxG.collide(p1, plataformaDesaparece);
	}
}