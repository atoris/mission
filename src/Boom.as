package  
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class Boom 
	{
		
		public function Boom() 
		{
			
		}
		
		public static function activate(x1:Number,y1:Number,x2:Number,y2:Number,dist:int):Boolean 
		{
			var r:Number = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
			var bool:Boolean = (r < dist)?true:false;
			return bool;
		}
		
	}

}