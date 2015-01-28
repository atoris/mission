package  
{
	/**
	 * ...
	 * @author Atoris
	 */
	import net.flashpunk.graphics.Image;
	import flash.geom.Point;
	public class Citizen extends Man
	{
		public static const TYPE:String = "CITIZEN";
		
		public function Citizen(xPos:int,yPos:int) 
		{
			
			super(xPos, yPos,new Image(Res.MAN_01),TYPE);
			
		}
		
		
	}

}