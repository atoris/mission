package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.utils.Draw;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Cop extends Man
	{
		private var spr:Sprite;
		private var _time:int=16;
		private var _delay:int = 30;
		private const _DIST:int = 128;
		private var _pointToPlayer:Point;
		public static const TYPE:String = "COP";
		public function Cop(xPos:int,yPos:int) 
		{
			super(xPos,yPos,new Image(Res.COP),TYPE);
			_pointToPlayer = new Point();
			
		}
		override public function update():void 
		{
			super.update();
			
			_bUpdate=Boom.activate(x,y,Player.pos.x,Player.pos.y,Opt.COP_DIST) 
			
			
			if (_bUpdate && !Opt.pause) 
			{
				if (_time< _delay) 
				{
					_time++;
				}else {
					FP.world.add(new CopBullet(x, y));
					_time = 0;
				}
				
			}
			
		}
		override public function render():void 
		{
			if (_bUpdate && Opt.debug) 
			{
				Draw.circle(x, y, Opt.COP_DIST, 0x008000);
			}
			super.render();
		}
		
	}

}