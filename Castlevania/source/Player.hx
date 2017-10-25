package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Glyn & Alexander
 */
class Player extends FlxSprite 
{
	private var ataquePlayer:FlxSprite;
	private var timeAttackMax:Float = 0.5;
	private var timeAttack:Float = 0;
	private var startCooldown:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		acceleration.y = 1500;
	}
	
	override public function update(elapsed:Float):Void
	{	
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
		
		if (FlxG.keys.justPressed.J && startCooldown==false) 	//"""""""ATAQUE""""""""
		{
			if (facing==16) //WEIRD STTUFF HERE ASK CID FOR HELP
			{
				ataquePlayer = new FlxSprite(x+width, y);
				ataquePlayer.makeGraphic(20, 5, 0xFF00FFFF);
				FlxG.state.add(ataquePlayer);
				startCooldown = true;
			}
			else
			{
				ataquePlayer = new FlxSprite(x-20, y);
				ataquePlayer.makeGraphic(20, 5, 0xFF00FFFF);
				FlxG.state.add(ataquePlayer);
				startCooldown = true;
			}
		}
		
		if (startCooldown == true)    //Cooldown y destruccion para los ataques
		{
			timeAttack += elapsed;
			if (timeAttack >= 0.17) //cooldown
			{
				ataquePlayer.destroy();
			}
			if (timeAttack >= timeAttackMax) 
			{
				startCooldown = false;
				timeAttack = 0;
			}
		}
		
		super.update(elapsed);
	}
}