package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class PointHitTest extends Sprite
	{
		private var ball:Ball;
		
		public function PointHitTest()
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
		}
		
		private function onEnterFrame(event:Event):void
		{
			if(ball.hitTestPoint(mouseX, mouseY))
			{
				trace("hit");
			}
		}
	}
}
