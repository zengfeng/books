package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Spring4 extends Sprite
	{
		private var ball:Ball;
		private var spring:Number = 0.1;
		private var targetX:Number = stage.stageWidth / 2;
		private var targetY:Number = stage.stageHeight / 2;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var friction:Number = 0.95;
		
		public function Spring4()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball();
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = mouseX - ball.x;
			var dy:Number = mouseY - ball.y;
			var ax:Number = dx * spring;
			var ay:Number = dy * spring;
			vx += ax;
			vy += ay;
			vx *= friction;
			vy *= friction;
			ball.x += vx;
			ball.y += vy;
		}
	}
}
