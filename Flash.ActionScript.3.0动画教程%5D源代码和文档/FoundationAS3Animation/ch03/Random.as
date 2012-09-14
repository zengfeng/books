package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Random extends Sprite {
		private var ball:Ball;
		private var angleX:Number = 0;
		private var angleY:Number = 0;
		private var centerX:Number = 200;
		private var centerY:Number = 200;
		private var range:Number = 50;
		private var xspeed:Number = .07;
		private var yspeed:Number = .11;
		
		public function Random()	{
			init();
		}
		private function init():void {
			ball = new Ball();
			addChild(ball);
			ball.x = 0;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		public function onEnterFrame(event:Event):void {
			ball.x = centerX + Math.sin(angleX) * range;
			ball.y = centerY + Math.sin(angleY) * range;
			angleX += xspeed;
			angleY += yspeed;
		}
	}
}