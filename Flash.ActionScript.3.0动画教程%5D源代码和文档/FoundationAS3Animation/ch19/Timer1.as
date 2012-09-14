package {
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Timer1 extends Sprite
	{
		private var timer:Timer;
		
		public function Timer1()
		{
			init();
		}
		
		private function init():void
		{
			timer = new Timer(30);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(timer:TimerEvent):void
		{
			trace("timer!");
		}
	}
}
