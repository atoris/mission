package  
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class Game extends World
	{
		
		private var _man:Citizen;
		private var _cop:Cop;
		
		private var _mouse:Image;
		private var _level:Level;
		private var _coinsTxt:Text;
		
		private var _numCops:int = 0;
		private var _numMan:int = 0;
		private var _cBase:CopBase;
		private var _gun:Gun;
		private var _boolStartGame:Boolean;
		private var _txtStart:Text;
		private var _menu:Entity;
		private var _boolMenu:Boolean;
		private var _barrel:Barrel;
		private var _palyer:Player;
		
		public static var particle:ParticleController;
		public function Game() 
		{
			_menu = new Menu();
			add(_menu);
			_txtStart = new Text("PRESS SPACE TO START");
			_txtStart.x = 640 / 2-_txtStart.width/2;
			_txtStart.y= 480 / 2-_txtStart.height/2;
			addGraphic(_txtStart);
			//_mouse = new Image(Res.MOUSE);
			//addGraphic(_mouse);
			
		}
		
		
		private function startGame():void 
		{
			Opt.arrMan = new Array();
			Opt.arrCops = new Array();
			Opt.arrBaseCops = new Array();
			Opt.arrGuns = new Array();
			Opt.arrBarrel = new Array();
			addWall();
			addBarrel();
			addBase();
			addGun();
			addMan();
			
			
			_coinsTxt = new Text("COINS: " + Opt.coins,4,18);
			addGraphic(_coinsTxt);
			_coinsTxt.scrollX = 0;
			_coinsTxt.scrollY = 0;
		}
		
		private function addBarrel():void 
		{
			for (var i:int = 0; i < Level.arrLevel.length; i++) 
			{
				for (var j:int = 0; j < Level.arrLevel[i].length; j++) 
				{
					if ( Level.arrLevel[i][j]==9) 
					{
						_barrel = new Barrel(j * 32, i * 32);
						add(_barrel);
						Opt.arrBarrel.push(_barrel);
						
					}
					
				}
			}
		}
		
		private function addGun():void 
		{
			for (var i:int = 0; i < Level.arrLevel.length; i++) 
			{
				for (var j:int = 0; j < Level.arrLevel[i].length; j++) 
				{
					if ( Level.arrLevel[i][j]==5) 
					{
						_gun = new Gun(j * 32, i * 32);
						add(_gun);
						Opt.arrGuns.push(_gun);
					}
				}
			}
		}
		private function addMan():void 
		{
			_palyer = new Player(200, 400);
			add(_palyer);
			Opt.player = _palyer;
			
			for (var k:int = 0; k < Level.arrLevel.length; k++) 
			{
				for (var l:int = 0; l < Level.arrLevel[k].length; l++) 
				{
					
					
					if ( Level.arrLevel[k][l]==0 || Level.arrLevel[k][l]==6 || Level.arrLevel[k][l]==7 || Level.arrLevel[k][l]==5) 
					{
						
						var ran:int = Opt.random(0, 20);
						if (Level.arrLevel[k][l]==7) 
						{
							_cop = new Cop(l * 32, k * 32) ;
							add(_cop);
							Opt.arrCops.push(_cop)
							Opt.numEntity++;
						}
						if (ran==5||ran==12 || Level.arrLevel[k][l]==6) 
						{
							_man = new Citizen(l * 32, k * 32);
							
							add(_man);
							Opt.arrMan.push(_man)
							
						}
						
					}
					
				}
			}
		}
		
		private function addBase():void 
		{
			for (var i:int = 0; i < Level.arrLevel.length; i++) 
			{
				for (var j:int = 0; j < Level.arrLevel[i].length; j++) 
				{
					
					if ( Level.arrLevel[i][j]==4) 
					{
						_cBase = new CopBase(j * 32, i * 32);
						
						add(_cBase);
						Opt.arrBaseCops.push(_cBase);
					}
				}
			}
		}
		
		private function addWall():void 
		{
			add(new Level());
		}
		override public function update():void 
		{
			if (_boolStartGame) 
			{
				_coinsTxt.text="COINS: " + Opt.coins;
			}else {
				if (Input.pressed(Key.SPACE)) 
				{
					if (!_boolMenu) 
					{
						remove(_menu);
						_txtStart.visible = false;
						_boolStartGame = true;
						startGame();
					}
					
				}
				
			}
			
			//_mouse.x = mouseX - _mouse.width/2+9;
			//_mouse.y = mouseY - _mouse.height / 2+9;
			//Input.mouseCursor = "hide";
			super.update();
		}
	}

}