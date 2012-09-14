package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Bobbing extends Sprite {
		private var ball:Ball;
		private var angle:Number = 0;
		private var centerY:Number = 200;
		private var range:Number = 50;
		private var speed:Number = .1;
		
		public function Bobbing()	{
			init();
		}
		private function init():void {
			ball = new Ball();
			addChild(ball);
			ball.x = stage.stageWidth / 2;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		public function onEnterFrame(event:Event):void {
			ball.y = centerY + Math.sin(angle) * range;
			angle += speed;
		}
	}
}