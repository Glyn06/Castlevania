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
	private var healthGroup:FlxTypedGroup<FlxSprite>;
	private var ammoGroup:FlxTypedGroup<FlxSprite>;
	private var k:FlxSprite = new FlxSprite(160, 192);
	private var ax:FlxSprite = new FlxSprite(144, 192);
	var e2:Enemy2;
	
	
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
		healthGroup = new FlxTypedGroup<FlxSprite>();
		ammoGroup = new FlxTypedGroup<FlxSprite>();
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level_1__oel);
		tilemap = loader.loadTilemap(AssetPaths.asdfsadffsa__png, 16, 16, "tiles");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		loader.loadEntities(placeEntities, "entities");
		
		/*plataforma = new FlxSprite(0, 200);
		plataforma.makeGraphic(2000, 20, 0xFF000080);
		plataforma.immovable = true;*/
		k.makeGraphic(16, 16, 0xff400040);
		ax.makeGraphic(16, 16, 0xffffffff);
		
		add(k);
		add(ax);
		add(tilemap);
		add(p1);
		add(enemyGroup);
		add(healthGroup);
		add(ammoGroup);
		//add(plataforma);
		//add(plataformaDesaparece);
		//add(deathTrap);
		
		camera.follow(p1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
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
		FlxG.collide(e2, tilemap);
	if (FlxG.overlap(p1, enemyGroup)) //colision player vs enemigos
			p1.vida -= 2;
	if (FlxG.overlap(p1, e2.bullet))
			p1.vida -= 2;
			
		FlxG.overlap(enemyGroup, p1.ataquePlayer, playerAttackCollide);
		FlxG.overlap(enemyGroup, p1.specialAttack, playerAttackCollide);
		if (FlxG.overlap(e2, p1.ataquePlayer))
		{
			e2.kill();
		}
		if (FlxG.overlap(e2, p1.specialAttack))
		{
			e2.kill();
		}
		FlxG.overlap(healthGroup, p1, playerHealthCollide);
		FlxG.overlap(ammoGroup, p1, playerAmmoCollide);
		
	if (FlxG.overlap(k, p1)) 
			p1.weapon = Knife;
	if (FlxG.overlap(ax, p1))
			p1.weapon = Axe;
		
		
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
				var e:Enemy1 = new Enemy1(X, Y);
				e.makeGraphic(32, 32, 0xff00ff00);
				enemyGroup.add(e);
			case "Enemy_2":
				e2 = new Enemy2(X, Y);
				e2.makeGraphic(32, 32, 0xffFF80FF);
				FlxG.state.add(e2);
			case "Enemy_3":
				var e3:Enemy3 = new Enemy3(X, Y);
				e3.makeGraphic(32, 32, 0xff123456);
				enemyGroup.add(e3);
			case "Enemy_4":
				var e4:Enemy4 = new Enemy4(X, Y);
				e4.makeGraphic(16, 16, 0xff131124);
				enemyGroup.add(e4);
			case "Health":
				var h:FlxSprite = new FlxSprite(X, Y);
				h.makeGraphic(16, 16, 0xffFFFF00);
				healthGroup.add(h);
			case "Ammo":
				var a:FlxSprite = new FlxSprite(X, Y);
				a.makeGraphic(16, 16, 0xff0000FF);
				ammoGroup.add(a);
		}
	}
	
	private function playerAttackCollide(e:Enemy1, p:Player):Void
	{
		enemyGroup.remove(e, true);
	}
	
	private function playerHealthCollide(h:FlxSprite, p:Player):Void
	{
		healthGroup.remove(h, true);
		if (p1.vida < 16 && p1.vida != 15)
			p1.vida += 2;
		else if (p1.vida == 15) 
		{
			p1.vida++;
		}
	}
	
	function playerAmmoCollide(a:FlxSprite, p:Player):Void 
	{
		ammoGroup.remove(a, true);
		p1.ammo +=30;
	}
}