package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.geom.Point;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Barrel extends Entity
	{
		public static const TYPE:String = "BARELL";
		private var _sprSwordguy:Spritemap;
		public static var pos:Point = new Point();
		private var _boolDead:Boolean;
		private var _timeBoom:int = 30;
		public function Barrel(xPos:int,yPos:int) 
		{
			x = xPos;
			y = yPos;
			_sprSwordguy = new Spritemap(Res.BARREL, 32, 32);
			_sprSwordguy.add("A", [0], 20, true);
			_sprSwordguy.add("B", [1], 20, true);
			graphic = _sprSwordguy
			type = TYPE;
			setHitbox(32, 32);
			pos.x = x;
			pos.y = y;
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
			super.render();
			
				if (_sprSwordguy.currentAnim=="B") 
				{
					Draw.circle(x + 16, y + 16, Opt.distBarrel, 0xFF0000);
					
					FP.world.remove(this);
					
				}
			
			
		}
		public function destroy():void 
		{
			if (!_boolDead) 
			{
				_boolDead = true;
				_sprSwordguy.play("B");
				//setHitbox(24,32);
				setOrigin(-12,-16);
				//boolBoom = true;
				for (var i:int = 0; i < Opt.arrMan.length; i++) 
				{
					Opt.arrMan[i].kill(TYPE, x, y);
				}
				for (var j:int = 0; j < Opt.arrCops.length; j++) 
				{
					Opt.arrCops[j].kill(TYPE, x, y);
				}
				for (var k:int = 0; k < Opt.arrGuns.length; k++) 
				{
					Opt.arrGuns[k].kill(TYPE, x, y);
				}
				for (var m:int = 0; m < Opt.arrBaseCops; m++) 
				{
					Opt.arrBaseCops[m].kill(TYPE, x, y);
				}
				for (var l:int = 0; l < Opt.arrBarrel.length;l++) 
				{
					Opt.arrBarrel[l].kill(TYPE, x, y);
					//trace("zzzzzzzzzzzz");
				}
				Opt.player.kill(TYPE, x, y);
			}
		}
	}

}