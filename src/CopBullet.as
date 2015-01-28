package  
{
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class CopBullet extends Entity
	{
		private var _xMax:int;
		private var _yMax:int;
		private var _rotate:Number;
		private var _mcR:Number;
		public static const TYPE:String = "BULLET";
		private var _speed:int = 8;
		private var _dist:int = 256;
		
		public function CopBullet(xPos:int,yPos:int) 
		{
			
			graphic = new Image(Res.BULLET);
			x = xPos;
			y = yPos;
			type = TYPE;
			setHitbox(2, 4);
			setOrigin( -1, -2);
			
			_xMax = Player.pos.x;
			_yMax = Player.pos.y;
			_mcR = Math.atan2(y -  _yMax,  x - _xMax) / Math.PI * 180 - 90;
			
			_rotate = (_mcR-90) * Math.PI/180;
			
		}
		override public function update():void 
		{
			if (_dist>0) 
			{
				x += Math.cos(_rotate)*_speed;
				y += Math.sin(_rotate)*_speed;
				_dist -= _speed;
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
			FP.world.remove(this);
		}
	}

}