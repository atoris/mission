package  
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import flash.display.Sprite;
	import net.flashpunk.utils.Draw;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Dynamite extends Entity
	{
		public static const TYPE:String = "DYNAMITE";
		private var _sprSwordguy:Spritemap;
		private var _speed:int = 6;
		private var _boom:Boolean;
		private var _xMax:int;
		private var _yMax:int;
		private var _rotate:Number;
		private var _mcR:Number;
		private var _point:int = 144;
		public static var pos:Point = new Point();
		//private var _player:Player;
		public var boolBoom:Boolean = false;
		private var _circle:Sprite;
		public function Dynamite(xPos,yPos,xMax,yMax) 
		{
			_sprSwordguy = new Spritemap(Res.DYNAMITE, 24, 32);
			_sprSwordguy.add("stop", [0], 20, true);
			_sprSwordguy.add("boom", [1], 20, true);
			graphic = _sprSwordguy;
			type = TYPE;
			x = xPos;
			y = yPos;
			_xMax = xMax;
			_yMax = yMax;
			_mcR = Math.atan2(y -  _yMax,  x - _xMax) / Math.PI * 180 - 90;
			
			_rotate = (_mcR-90) * Math.PI/180;
			
			setHitbox(12, 16);
			setOrigin(-12,-16);
		}
		override public function update():void 
		{
			pos.x = x;
			pos.y = y;
			_point -= _speed;
			if (_point>0) 
			{
				x += Math.cos(_rotate)*_speed;
				y += Math.sin(_rotate)*_speed;
			}else {
				destroy();
			}
			if (collide(Level.TYPE,x,y)) 
			{
				destroy();
			}
			
			super.update();
		}
		public function destroy():void 
		{
			_sprSwordguy.play("boom");
			setHitbox(24,32);
			setOrigin(-12,-16);
			for (var i:int = 0; i < Opt.arrMan.length; i++) 
			{
				Opt.arrMan[i].kill(TYPE,x,y);
			}
			for (var j:int = 0; j < Opt.arrCops.length; j++) 
			{
				Opt.arrCops[j].kill(TYPE,x,y);
			}
			for (var k:int = 0; k < Opt.arrGuns.length; k++) 
			{
				Opt.arrGuns[k].kill(TYPE,x,y);
			}
			for (var l:int = 0; l < Opt.arrBarrel.length;l++) 
			{
				
				Opt.arrBarrel[l].kill(TYPE,x,y);
			}
			for (var m:int = 0; m < Opt.arrBaseCops.length; m++) 
			{
				Opt.arrBaseCops[m].kill(TYPE,x,y);
			}
			Opt.player.kill(TYPE, x, y);
			
		}
		override public function render():void 
		{
			super.render();
			if (_sprSwordguy.currentAnim=="boom") 
			{
				//_circle = new Sprite();
				Draw.circle(x + 8, y + 8, Opt.distDynamite, 0xFF0000);
				//FP.world.recycle(this);
				FP.world.remove(this);
			}
		}
		
	}

}