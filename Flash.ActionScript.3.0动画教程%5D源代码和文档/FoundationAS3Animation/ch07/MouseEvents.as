package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MouseEvents extends Sprite
	{
		public function MouseEvents()
		{
			init();
		}
		
		private function init():void
		{
			var ball:Ball = new Ball();
			ball.x = 100;
			ball.y = 100;
			addChild(ball);
			
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBall);
			ball.addEventListener(MouseEvent.MOUSE_UP, onMouseUpBall);
			ball.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveBall);

			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownStage);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpStage);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveStage);
		}
		
		private function onMouseDownBall(event:MouseEvent):void
		{
			trace("mouse down - ball");
		}
		
		private function onMouseUpBall(event:MouseEvent):void
		{
			trace("mouse up - ball");
		}
		
		private function onMouseMoveBall(event:MouseEvent):void
		{
			trace("mouse move - ball");
		}
		
		private function onMouseDownStage(event:MouseEvent):void
		{
			trace("mouse down - stage");
		}
		
		private function onMouseUpStage(event:MouseEvent):void
		{
			trace("mouse up - stage");
		}
		
		private function onMouseMoveStage(event:MouseEvent):void
		{
			trace("mouse move - stage");
		}
		
	}
}
