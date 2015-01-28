package  
{
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Spritemap;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Base extends Entity
	{
		protected var _sprSwordguy:Spritemap;
		
		public function Base(xPos:int,yPos:int,img:Class,t:String) 
		{
			_sprSwordguy = new Spritemap(img, 32, 32);
			_sprSwordguy.add("A", [0], 20, true);
			_sprSwordguy.add("B", [1], 20, true);
			graphic = _sprSwordguy;
			x = xPos;
			y = yPos;
			setHitbox(32, 32);
			type = t;
			
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
			
			if (_sprSwordguy.currentAnim!="B") 
			{
				Opt.coins += 100;
				_sprSwordguy.play("B");
			}
		}
		override public function update():void 
		{
			
			super.update();
		}
		
		
	}

}