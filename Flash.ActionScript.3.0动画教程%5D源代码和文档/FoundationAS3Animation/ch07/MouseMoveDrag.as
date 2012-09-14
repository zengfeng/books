package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MouseMoveDrag extends Sprite
	{
		private var ball:Ball;
		
		public function MouseMoveDrag()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball();
			ball.x = 100;
			ball.y = 100;
			addChild(ball);
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			ball.x = mouseX;
			ball.y = mouseY;
		}
	}
}
