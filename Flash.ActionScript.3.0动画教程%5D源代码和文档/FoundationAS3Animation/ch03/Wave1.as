package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Wave1 extends Sprite {
		private var ball:Ball;
		private var angle:Number = 0;
		private var centerY:Number = 200;
		private var range:Number = 50;
		private var xspeed:Number = 1;
		private var yspeed:Number = .05;
		
		public function Wave1()	{
			init();
		}
		private function init():void {
			ball = new Ball();
			addChild(ball);
			ball.x = 0;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		public function onEnterFrame(event:Event):void {
			ball.x += xspeed;
			ball.y = centerY + Math.sin(angle) * range;
			angle += yspeed;
		}
	}
}