package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;

/**
 * ...
 * @author Glyn & Alexander
 */
enum SpecialWeapon{
	None;
	Knife;
	Axe;
}
 
class Player extends FlxSprite 
{
	public var barra(get, null):FlxBar;
	public var ataquePlayer(get, null):FlxSprite;
	private var timeAttackMax:Float = 0.5;
	private var timeAttack:Float = 0;
	public var specialAttack(get, null):FlxSprite;
	public var weapon(default, set):SpecialWeapon;
	private var startCooldown:Bool = false;
	public var vida:Int = 16;
	public var ammo(default, set):Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		barra = new FlxBar(x, y, LEFT_TO_RIGHT, 100, 10, this, "vida", 0, 16, true);
		barra.createColoredEmptyBar(0xff000000, true, 0xffffffff);
		FlxG.state.add(barra);
		weapon = SpecialWeapon.None;
		
		ataquePlayer = new FlxSprite(x+width, y);
		ataquePlayer.makeGraphic(20, 5, 0xFF00FFFF);
		FlxG.state.add(ataquePlayer);
		ataquePlayer.kill();
		
		specialAttack = new FlxSprite(x + width, y);
		specialAttack.makeGraphic(16, 16, 0xff0000FF);
		FlxG.state.add(specialAttack);
		specialAttack.kill();
	}
	
	override public function update(elapsed:Float):Void
	{
		if (vida <= 0)
			kill();
		
		if (isTouching(FlxObject.FLOOR)) //setear veolocidad x a 0 cuando este en el piso
		{
			velocity.x = 0;
		}
		
		if (FlxG.keys.pressed.D && isTouching(FlxObject.FLOOR)) //mov der
		{
			velocity.x = 200;
			setFacingFlip(FlxObject.RIGHT, true, false);
			facing = 16;
		}
		
		if (FlxG.keys.pressed.A && isTouching(FlxObject.FLOOR)) //mov izq
		{
			velocity.x = -200;
			setFacingFlip(FlxObject.LEFT, false, true);
			facing = 15;
		}
		
		if (FlxG.keys.justPressed.K && isTouching(FlxObject.FLOOR)) //salto
		{
			velocity.y = -500;
		}
		else if (!isTouching(FlxObject.FLOOR))
		{
			acceleration.y = 1500;
		}
		
		if (FlxG.keys.justPressed.J && startCooldown==false && !FlxG.keys.pressed.W) 	//"""""""ATAQUE""""""""
		{
			if (facing==16) //WEIRD STTUFF HERE ASK CID FOR HELP
			{
				ataquePlayer.revive();
				startCooldown = true;
			}
			else
			{
				ataquePlayer.revive();
				startCooldown = true;
			}
		}
		else if (FlxG.keys.pressed.W && FlxG.keys.justPressed.J) 
		{
			if (ammo !=0) 
			{
				switch(weapon){
					case None:
						trace("nope");
					
					case Knife: //KNIFE
						
					if (facing == 16) 
					{
						ammo--;
						specialAttack.acceleration.y = 0;
						specialAttack.reset(x,y);
						specialAttack.velocity.x = 500;
					}
					else
					{
						ammo--;
						specialAttack.acceleration.y = 0;
						specialAttack.reset(x-width,y);
						specialAttack.velocity.x = -500;
					}
					case Axe:  //AXE
						
					if (facing == 16) 
					{
						ammo--;
						specialAttack.reset(x,y);
						specialAttack.velocity.y = -500;
						specialAttack.velocity.x = 100;
						specialAttack.acceleration.y = 1000;
					}
					else
					{
						ammo--;
						specialAttack.reset(x+width,y);
						specialAttack.velocity.y = -500;
						specialAttack.velocity.x = -100;
						specialAttack.acceleration.y = 1000;
					}	
				}
			}
		}
		
		if (ataquePlayer.alive) 
		{
			if (facing == 16) 
				ataquePlayer.x = x + width;
			else
				ataquePlayer.x = x - 20;
			
			ataquePlayer.y = y;
		}
		
		if (startCooldown == true)    //Cooldown y destruccion para los ataques
		{
			timeAttack += elapsed;
			if (timeAttack >= 0.17) //cooldown
			{
				ataquePlayer.kill();
			}
			if (timeAttack >= timeAttackMax) 
			{
				startCooldown = false;
				timeAttack = 0;
			}
		}
		
		super.update(elapsed);
	}
	
	function get_ataquePlayer():FlxSprite 
	{
		return ataquePlayer;
	}
	
	function set_vida(value:Int):Int 
	{
		return vida = value;
	}
	
	function set_ammo(value:Int):Int 
	{
		return ammo = value;
	}
	
	function get_specialAttack():FlxSprite 
	{
		return specialAttack;
	}
	
	function set_weapon(value:SpecialWeapon):SpecialWeapon 
	{
		return weapon = value;
	}
	
	function get_barra():FlxBar 
	{
		return barra;
	}
}