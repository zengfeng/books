package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Easing2 extends Sprite
	{
		private var ball:Ball;
		private var easing:Number = 0.2;
		private var targetX:Number = stage.stageWidth / 2;
		private var targetY:Number = stage.stageHeight / 2;
		
		public function Easing2()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball();
			addChild(ball);
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			ball.startDrag();
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			ball.stopDrag();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var vx:Number = (targetX - ball.x) * easing;
			var vy:Number = (targetY - ball.y) * easing;
			ball.x += vx;
			ball.y += vy;
		}
	}
}
