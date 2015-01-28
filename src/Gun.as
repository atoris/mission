package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Gun extends Entity
	{
		public static const TYPE:String = "GUN";
		private var _bUpdate:Boolean;
		private var _pointToPlayer:Point;
		private static const _DIST:int = 128;
		private var _time:int=4;
		private var _delay:int = 8;
		private var _img:Image;
		private var _mcR:Number;
		private var _rotate:Number;
		private var _sprSwordguy:Spritemap;
		private var _boolDead:Boolean;
		
		public function Gun(xPos:int,yPos:int) 
		{
			x = xPos+16;
			y = yPos+16;
			//_img = new Image(Res.GUN);
			
			
			_sprSwordguy = new Spritemap(Res.GUN, 32, 32);
			_sprSwordguy.add("A", [0], 20, true);
			_sprSwordguy.add("B", [1], 20, true);
			graphic = _sprSwordguy;
			
			//graphic = _img;
			
			_sprSwordguy.originX = 16;
			_sprSwordguy.originY = 16;
			setHitbox(32, 32);
			type = TYPE;
			_pointToPlayer = new Point();
		}
		override public function update():void 
		{
			
			if(!_boolDead){
				
				_bUpdate=Boom.activate(x,y,Player.pos.x,Player.pos.y,Opt.GUN_DIST) ;
				
				
				if (_bUpdate && !Opt.pause) 
				{
					_sprSwordguy.angle = -Math.atan2(Opt.player.y - y, Opt.player.x - x) * 180 / Math.PI;
					if (_time< _delay) 
					{
						_time++;
					}else {
						FP.world.add(new CopBullet(x, y));
						_time = 0;
					}
					
				}
			}
			super.update();
		}
		private function destroy():void 
		{
			
			_sprSwordguy.play("B");
			_boolDead = true;
		}
		public function kill(str:String, xPos:int = 0, yPos:int = 0 ):void {
			if (str == Player.TYPE) 
			{
				if (Boom.activate(x,y,xPos,yPos,Opt.distBoom)) {
					destroy();
				}
			}
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
		override public function render():void 
		{
			if (_bUpdate && Opt.debug) 
			{
				Draw.circle(x, y, Opt.GUN_DIST, 0x008000);
			}
			super.render();
		}
		
	}

}