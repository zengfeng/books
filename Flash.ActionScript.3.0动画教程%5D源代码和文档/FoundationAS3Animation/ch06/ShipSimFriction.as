package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class ShipSimFriction extends Sprite
	{
		private var ship:Ship;
		private var vr:Number = 0;
		private var thrust:Number = 0;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var friction:Number = 0.97;
		
		public function ShipSimFriction()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			ship = new Ship();
			addChild(ship);
			ship.x = stage.stageWidth / 2;
			ship.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT :
				vr = -5;
				break;
				
				case Keyboard.RIGHT :
				vr = 5;
				break;
				
				case Keyboard.UP :
				thrust = 0.2;
				ship.draw(true);
				break;
				
				default :
				break;
			}
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			vr = 0;
			thrust = 0;
			ship.draw(false);
		}
		
		private function onEnterFrame(event:Event):void
		{
			ship.rotation += vr;
			var angle:Number = ship.rotation * Math.PI / 180;
			var ax:Number = Math.cos(angle) * thrust;
			var ay:Number = Math.sin(angle) * thrust;
			vx += ax;
			vy += ay;
			vx *= friction;
			vy *= friction;
			ship.x += vx;
			ship.y += vy;
			var left:Number = 0;
			var right:Number = stage.stageWidth;
			var top:Number = 0;
			var bottom:Number = stage.stageHeight;
			if (ship.x - ship.width / 2 > right)
			{
				ship.x = left - ship.width / 2;
			}
			else if (ship.x + ship.width / 2 < left)
			{
				ship.x = right + ship.width / 2;
			}
			if (ship.y - ship.height / 2 > bottom)
			{
				ship.y = top - ship.height / 2;
			}
			else if (ship.y < top - ship.height / 2)
			{
				ship.y = bottom + ship.height / 2;
			}
		}
	}
}
