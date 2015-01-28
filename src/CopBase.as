package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Atoris
	 */
	public class CopBase extends Base
	{
		public static const TYPE:String = "COP_BASE";
		private var _ranSpawn:int;
		private var _ranMaxSpawn:int;
		
		public function CopBase(xPos:int,yPos:int) 
		{
			super(xPos, yPos, Res.B2, "COP_BASE");
			spawn();
			_ranMaxSpawn = Opt.random(180, 720);
			_ranSpawn = _ranMaxSpawn;
			layer = 2;
		}
		override public function update():void 
		{
			if (_ranSpawn>0) 
			{
				_ranSpawn--;
			}else {
				_ranSpawn = _ranMaxSpawn;
				spawn();
			}
			super.update();
		}
		private function spawn():void 
		{
			//trace(Opt.numEntity);
			if (Opt.numEntity<Opt.MAX_ENTITY && !Opt.pause && _sprSwordguy.currentAnim!="B") 
			{
				
				var cop:Cop = new Cop(x,y);
				FP.world.add(cop);
				Opt.arrCops.push(cop);
				Opt.numEntity++;
				
			}
			
			
		}
		
	}

}