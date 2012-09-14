package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Acceleration2 extends Sprite
	{
		private var ball:Ball;
		private var vx:Number = 0;
		private var ax:Number = 0
		
		public function Acceleration2()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball();
			addChild(ball);
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.LEFT)
			{
				ax = -0.2;
			}
			else if(event.keyCode == Keyboard.RIGHT)
			{
				ax = 0.2;
			}
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			ax = 0;
		}
		
		private function onEnterFrame(event:Event):void
		{
			vx += ax;
			ball.x += vx;
		}
	}
}
