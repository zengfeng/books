package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MultiSpring extends Sprite
	{
		private var ball:Ball;
		private var handles:Array;
		private var spring:Number = 0.1;
		private var friction:Number = 0.8;
		private var numHandles:Number = 3;
		
		public function MultiSpring()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball(20);
			addChild(ball);
			
			handles = new Array();
			for(var i:uint = 0; i < numHandles; i++)
			{
				var handle:Ball = new Ball(10, 0x0000ff);
				handle.x = Math.random() * stage.stageWidth;
				handle.y = Math.random() * stage.stageHeight;
				handle.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
				addChild(handle);
				handles.push(handle);
			}
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(MouseEvent.MOUSE_UP, onRelease);
		}
		
		private function onEnterFrame(event:Event):void
		{
			for(var i:uint = 0; i < numHandles; i++)
			{
				var handle:Ball = handles[i] as Ball;
				var dx:Number = handle.x - ball.x;
				var dy:Number = handle.y - ball.y;
				ball.vx += dx * spring;
				ball.vy += dy * spring;
			}
			
			ball.vx *= friction;
			ball.vy *= friction;
			ball.x += ball.vx;
			ball.y += ball.vy;
			
			graphics.clear();
			graphics.lineStyle(1);
			for(i = 0; i < numHandles; i++)
			{
				graphics.moveTo(ball.x, ball.y);
				graphics.lineTo(handles[i].x, handles[i].y);
			}
		}
		
		private function onPress(event:MouseEvent):void
		{
			event.target.startDrag();
		}
		
		private function onRelease(event:MouseEvent):void
		{
			event.target.stopDrag();
		}
	}
}
