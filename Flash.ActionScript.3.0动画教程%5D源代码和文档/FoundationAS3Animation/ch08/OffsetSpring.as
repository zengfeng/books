package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class OffsetSpring extends Sprite
	{
		private var ball:Ball;
		private var spring:Number = 0.1;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var friction:Number = 0.95;
		private var springLength:Number = 100;
		
		public function OffsetSpring()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball(20);
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = ball.x - mouseX;
			var dy:Number = ball.y - mouseY;
			var angle:Number = Math.atan2(dy, dx);
			var targetX:Number = mouseX + Math.cos(angle) * springLength;
			var targetY:Number = mouseY + Math.sin(angle) * springLength;
			vx += (targetX - ball.x) * spring;
			vy += (targetY - ball.y) * spring;
			vx *= friction;
			vy *= friction;
			ball.x += vx;
			ball.y += vy;
			graphics.clear();
			graphics.lineStyle(1);
			graphics.moveTo(ball.x, ball.y);
			graphics.lineTo(mouseX, mouseY);
		}
	}
}
