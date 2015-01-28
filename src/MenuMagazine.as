package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Atoris
	 */
	public class MenuMagazine extends Entity
	{
		
		public function MenuMagazine() 
		{
			graphic = new Image(Res.M2);
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			drawRect();
		}
		override public function update():void 
		{
			if (Input.pressed(Key.SPACE)) 
			{
				FP.world.remove(this);
				Opt.pause = false;
				Opt.player.boolMagazine = false;
				Opt.player.setStart();
				trace("MenuMagazine",Opt.player.boolMagazine);
			}
			super.update();
		}
		private function drawRect():void
		{
			//FP.world.addGraphic(new Image(new BitmapData(120, 34, true, 0x000000)), 0, 0, 0);
		
		}
		
	}

}