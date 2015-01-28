package  
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class Opt 
	{
		public static var coins:int = 0;
		public static var numDynamite:int = 1;
		public static var distDynamite:int = 28;
		public static var distBoom:int = 48;
		public static var distBarrel:int = 64;
		public static var hart:int = 1;
		public static var maxHart:int = 1;
		public static var player:Player;
		public static var arrMan:Array;
		public static var arrCops:Array;
		public static var arrBaseCops:Array;
		public static var arrGuns:Array;
		public static var arrBarrel:Array;
		public static const MAX_ENTITY:int = 400;
		public static var numEntity:int = 0;
		public static var pause:Boolean;
		public static const COP_DIST:int = 128;
		public static const GUN_DIST:int = 160;
		public static var debug:Boolean = false;
		public function Opt() 
		{
			
		}
		public static function random(minNum:int, maxNum:int):int 
		{
			return (int(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	}

}