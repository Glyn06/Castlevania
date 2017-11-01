package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var p1:Player;
	var plataforma:FlxSprite;
	var plataformaDesaparece:FlxSprite;
	var deathTrap:FlxSprite;
	private var maxTime:Float = 4;
	private var timer:Float = 0;
	private var tilemap:FlxTilemap;
	private var enemyGroup:FlxTypedGroup<Enemy>;
	
	
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
		
		enemyGroup = new FlxTypedGroup<Enemy>();
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level_1__oel);
		tilemap = loader.loadTilemap(AssetPaths.asdfsadffsa__png, 16, 16, "tiles");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		loader.loadEntities(placeEntities, "entities");
		
		/*plataforma = new FlxSprite(0, 200);
		plataforma.makeGraphic(2000, 20, 0xFF000080);
		plataforma.immovable = true;*/
		
		add(tilemap);
		add(p1);
		add(enemyGroup);
		//add(plataforma);
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
		
		FlxG.collide(p1, tilemap);
		FlxG.collide(enemyGroup, tilemap);
		
		//FlxG.collide(p1, plataformaDesaparece);
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var X:Int = Std.parseInt(entityData.get("x"));
		var Y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName)
		{
			case "Player":
				p1 = new Player(X, Y);
				p1.makeGraphic(32, 32, 0xffff0000);
			case "Enemy_1":
				var e:Enemy = new Enemy(X, Y);
				e.makeGraphic(32, 32, 0xff00ff00);
				enemyGroup.add(e);
		}
	}
}