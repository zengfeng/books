package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Wave2 extends Sprite {
		private var angle:Number = 0;
		private var centerY:Number = 200;
		private var range:Number = 50;
		private var xspeed:Number = 1;
		private var yspeed:Number = .05;
		private var xpos:Number;
		private var ypos:Number;
		
		public function Wave2()	{
			init();
		}
		private function init():void {
			xpos = 0;
			graphics.lineStyle(1, 0, 1);
			graphics.moveTo(0, centerY);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		public function onEnterFrame(event:Event):void {
			xpos += xspeed;
			angle += yspeed;
			ypos = centerY + Math.sin(angle) * range;
			graphics.lineTo(xpos, ypos);
		}
	}
}