package {
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;

	public class Timer2 extends Sprite
	{
		private var timer:Timer;
		private var ball:Ball;
		
		public function Timer2()
		{
			init();
		}
		
		private function init():void
		{
			stage.frameRate = 1;
			ball = new Ball();
			ball.y = stage.stageHeight / 2;
			ball.vx = 5;
			addChild(ball);
			timer = new Timer(20);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(event:TimerEvent):void
		{
			ball.x += ball.vx;
			event.updateAfterEvent();
		}
	}
}
