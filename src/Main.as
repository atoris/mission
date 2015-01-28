package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(640, 480, 30);
			FP.screen.color = 0x808080;
			
			//FP.world = new Menu();
			FP.world = new Game();
		}
		override public function init():void 
		{
			FP.console.enable();
			super.init();
		}
	}
	
}