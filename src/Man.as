package  
{
	import flash.display.Graphics;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.Ease;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Man extends Entity
	{
		public static const TYPE:String = "MAN";
		
		private var _ranX:int;
		private var _ranY:int;
		//private var _time:Timer;
		//private var _pos:Point=new Point();
		
		private var _speed:int = 1;
		
		//private var _pc:ParticleController;
		private var _emitter:Emitter;
		protected var _g:Image;
		protected var _bUpdate:Boolean;
		private var _mLeft:Boolean;
		private var _mRight:Boolean;
		private var _mDown:Boolean;
		private var _mUp:Boolean;
		
		private var _randTime:int;
		
		private var _xMax:int;
		private var _yMax:int;
		private var _rotate:Number;
		private var _mcR:Number;
		private var _boolDead:Boolean;
		public function Man(xPos:int,yPos:int,gr:Image,_type:String) 
		{
			
			_g = gr;
			x = xPos;
			y = yPos;
			type = _type;
			setHitbox(24, 32);
			_emitter = new Emitter(new BitmapData(3, 3, false, 0xFF0000), 3, 3);
			_emitter.newType("explosion", [0]);
			_emitter.setMotion("explosion", 0, 100, 2, 360, -40, 1, Ease.quadOut);
			_emitter.setAlpha("explosion", 1, 0.1);
			graphic = new Graphiclist(_g, _emitter);
			ranPutch();
			
		}
		
		private function ranPutch():void 
		{
			
			_randTime = Opt.random(30, 120);
			
			
			_xMax = Opt.random(x-100, x+100);
			_yMax = Opt.random(y-100, y+100);
			
			_mcR =Math.atan2(y -  _yMax,  x - _xMax) / Math.PI * 180 - 90;
			
			_rotate = (_mcR-90) * Math.PI/180;
			
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
		public function destroy():void {
			if(!_boolDead){
				if (type==Cop.TYPE) 
				{
					Opt.coins += 2;
				}
				if (type==Citizen.TYPE) 
				{
					Opt.coins += 1;
				}
				_boolDead = true;
				//
				FP.world.remove(this);
			}
			
		}
		override public function update():void 
		{
			if (onCamera) 
			{
				if (_randTime>0 && !Opt.pause) 
				{
					_randTime--;
					var xSpeed:Number = Math.cos(_rotate) * _speed;
					var ySpeed:Number = Math.sin(_rotate) * _speed;
					if (xSpeed > 0 && _mRight) 
					{
						x += xSpeed;
					}
					if (xSpeed < 0 && _mLeft) 
					{
						x += xSpeed;
					}
					if (ySpeed > 0 && _mDown) 
					{
						y += ySpeed;
					}
					if (ySpeed < 0 && _mUp) 
					{
						y += ySpeed;
					}
					
					
				}else {
					ranPutch();
				}
				
				//trace(moveCollideX(Game.level),moveCollideY(Game.level));
				if (collide(Level.TYPE, x + 1, y)) 
				{
					_mRight = false;
					ranPutch();
				}else {
					_mRight=true;
				}
				if (collide(Level.TYPE, x - 1, y)) 
				{
					_mLeft = false;
					ranPutch();
				}else {
					_mLeft=true;
				}
				if (collide(Level.TYPE, x, y-1)) 
				{
					_mUp = false;
					ranPutch();
				}else {
					_mUp=true;
				}
				if (collide(Level.TYPE, x, y+1)) 
				{
					_mDown = false;
					ranPutch();
				}else {
					_mDown=true;
				}
			}
			
			super.update();
		}
		
		
	}

}