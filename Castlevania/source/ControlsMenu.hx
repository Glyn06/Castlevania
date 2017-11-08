package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author Glyn & Alexander
 */
class ControlsMenu extends FlxState 
{
	private var texto:FlxText;
	
	override public function create():Void 
	{
		texto = new FlxText (10, 16, 0, "Ataque: J", 16);
		add(texto);
		texto = new FlxText (10, 48, 0, "Movimiento: A y D", 16);
		add(texto);
		texto = new FlxText (10, 64, 0, "Salto: K", 16);
		add(texto);
		texto = new FlxText (10, 32, 0, "Ataque Especial: W + J", 16);
		add(texto);
		texto = new FlxText (10, 90, 0, "-La barra verde es tu vida", 8);
		add(texto);
		texto = new FlxText (10, 106, 0, "-La barra roja es la vida del boss", 8);
		add(texto);
		texto = new FlxText (10, FlxG.height*0.75, 0, "Presiona K para volver", 16);
		add(texto);
		texto = new FlxText (10, FlxG.height*0.75, 0, "Presiona K para volver", 16);
		add(texto);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.K) 
		{
			FlxG.switchState(new Menu());
		}
	}
}