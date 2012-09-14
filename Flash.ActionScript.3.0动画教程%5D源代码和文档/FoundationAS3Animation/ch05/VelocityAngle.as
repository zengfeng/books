package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class VelocityAngle extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 45;
		private var speed:Number = 3;
		
		public function VelocityAngle()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball();
			addChild(ball);
			ball.x = 50;
			ball.y = 100;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(event:Event):void
		{
			var radians:Number = angle * Math.PI / 2;
			var vx:Number = Math.cos(angle) * speed;
			var vy:Number = Math.sin(angle) * speed;
			ball.x += vx;
			ball.y += vy;
		}
	}
}
