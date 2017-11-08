package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxBar;

/**
 * ...
 * @author Glyn & Alexander
 */
class BossState extends FlxState 
{
	var p1:Player;
	var boss:Boss;
	var bossBar:FlxBar;
	var stopCthuli:Int = 0;
	private var tilemap:FlxTilemap;
		
	override public function create():Void 
	{
		FlxG.sound.pause();
		FlxG.sound.playMusic(AssetPaths.Castlevania_NES_Music_Nothing_to_Lose__wav);
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.BossLevel__oel);
		tilemap = loader.loadTilemap(AssetPaths.asdfsadffsa__png, 16, 16, "tiles");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		loader.loadEntities(placeEntities, "entities");
		
		bossBar = new FlxBar(p1.x, p1.y, LEFT_TO_RIGHT, 100, 10, boss, "vida", 0, 16, true);
		bossBar.createFilledBar(0xff000000, 0xffff0000, true, 0xffffffff);
		FlxG.state.add(bossBar);
		
		add(p1);
		add(boss);
		add(tilemap);
		
		camera.follow(p1);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		FlxG.collide(p1, tilemap);
		
		p1.barra.x = p1.x -100;
		p1.barra.y = p1.y -90;
		
		bossBar.x = p1.x -100;
		bossBar.y = p1.y -80;
		
		FlxG.collide(boss, tilemap);
		
		if (FlxG.overlap(p1, boss)) //colision player vs enemigos
		{
			p1.vida -= 2;
			FlxG.sound.play(AssetPaths.Player_Hit__wav);
		}
		
		if (FlxG.overlap(boss, p1.ataquePlayer))
		{
			FlxG.sound.play(AssetPaths.Enemy_Death__wav);
			boss.vida -= 2;
			p1.ataquePlayer.kill();
		}
		if (FlxG.overlap(boss, p1.specialAttack))
		{
			FlxG.sound.play(AssetPaths.Enemy_Death__wav);
			boss.vida -= 2;
			p1.specialAttack.kill();
		}
		
		if (p1.alive == false) 
		{
			FlxG.switchState(new Continue());
		}
		if (boss.alive == false && stopCthuli == 0) 
		{
			stopCthuli++;
			FlxG.sound.pause();
			FlxG.sound.play(AssetPaths.Persona_5___Battle_Victory_Theme_Extended___wav);
		}
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
			case "Boss":
				boss = new Boss(X, Y);
				boss.makeGraphic(64, 32, 0xff80FFFF);
		}
	}
	
	
	
}