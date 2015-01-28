package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class Player extends Entity
	{
		public static const TYPE:String = "PLAYER";
		private var _sprSwordguy:Spritemap;
		private var _speed:int = 4;
		private var _boom:Boolean;
		public static var pos:Point = new Point();
		private var _kLeft:Boolean;
		private var _kRight:Boolean;
		private var _kDown:Boolean;
		private var _kUp:Boolean;
		//public static var menuMagazine:MenuMagazine;
		//public var boolMagazine:Boolean;
		//public static var boolStart:Boolean;
		public function Player(xPos:int,yPos:int) 
		{
			_sprSwordguy = new Spritemap(Res.PLAYER, 24, 32);
			_sprSwordguy.add("A", [0], 20, true);
			_sprSwordguy.add("B", [1], 20, true);
			graphic = _sprSwordguy;
			type = TYPE;
			x = 200;
			y = 400;
			pos.x = x;
			pos.y = y;
			setHitbox(24, 32);
			//boolMagazine = false;
			
			Opt.pause = false;
		}
		public function setStart():void {
			x = 200;
			y = 400;
			_boom = false;
			_sprSwordguy.play("A");
			
		}
		override public function update():void 
		{
			
			pos.x = x;
			pos.y = y;
			FP.world.camera.x = x-640/2;
			FP.world.camera.y = y - 480 / 2;
			
			//FP.camera.x = x - FP.halfWidth;
			//FP.camera.y = y - FP.halfHeight;
			if (!_boom) 
			{
				_sprSwordguy.play("stop");
				
				if (Input.check(Key.W) && _kUp) 
				{
					y -= _speed;
				}
				if (Input.check(Key.S)&&_kDown) 
				{
					y += _speed;
				}
				if (Input.check(Key.A) && _kLeft) 
				{
					x -= _speed;
				}
				if (Input.check(Key.D) && _kRight) 
				{
					x += _speed;
				}
			}
			
			if (Input.mousePressed) 
			{
				//trace("------------------------");
				FP.world.add(new Dynamite(x,y,FP.world.mouseX,FP.world.mouseY));
			}
			if (Input.pressed(Key.SPACE) ) 
			{
				destroy();
			}
			var bulletCops:CopBullet = collide(CopBullet.TYPE, x, y) as CopBullet;
			if (bulletCops) 
			{
				bulletCops.destroy();
				
				destroy();
				
			}
			
			_kRight = !collide(Level.TYPE, x + 1, y);
			_kLeft = !collide(Level.TYPE, x - 1, y);
			_kDown = !collide(Level.TYPE, x, y + 1);
			_kUp = !collide(Level.TYPE, x, y - 1);
			
			
			super.update();
		}
		public  function kill(str:String, xPos:int = 0, yPos:int = 0 ):void {
			
			if (str == Dynamite.TYPE) 
			{
				if (Boom.activate(x,y,xPos, yPos,Opt.distDynamite)) {
					destroy();
				}
			}
			if (str == Barrel.TYPE) 
			{
				if (Boom.activate(x,y,xPos, yPos,Opt.distBarrel)) {
					destroy();
				}
			}
			
		}
		public function destroy():void {
			
			if (!Opt.debug) {
				_sprSwordguy.play("B");
				
				for (var i:int = 0; i < Opt.arrMan.length; i++) 
				{
					Opt.arrMan[i].kill(TYPE,x,y);
				}
				for (var j:int = 0; j < Opt.arrCops.length; j++) 
				{
					Opt.arrCops[j].kill(TYPE,x,y);
				}
				for (var k:int = 0; k < Opt.arrBaseCops.length; k++) 
				{
					Opt.arrBaseCops[k].kill(TYPE,x,y);
				}
				for (var l:int = 0; l < Opt.arrBarrel.length; l++) 
				{
					Opt.arrBarrel[l].kill(TYPE,x,y);
				}
				//FP.world.remove(this);
				//FP.world.add(new Player(200,400));
				_boom = true
				setStart();
			}
		}
	}

}