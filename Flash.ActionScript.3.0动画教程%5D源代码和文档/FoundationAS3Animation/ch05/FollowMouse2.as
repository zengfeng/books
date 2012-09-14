package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class FollowMouse2 extends Sprite
	{
		private var arrow:Arrow;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var force:Number = 0.5;
		
		public function FollowMouse2()
		{
			init();
		}
		
		private function init():void
		{
			arrow = new Arrow();
			addChild(arrow);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = mouseX - arrow.x;
			var dy:Number = mouseY - arrow.y;
			var angle:Number = Math.atan2(dy, dx);
			arrow.rotation = angle * 180 / Math.PI;
			var ax:Number = Math.cos(angle) * force;
			var ay:Number = Math.sin(angle) * force;
			vx += ax;
			vy += ay;
			arrow.x += vx;
			arrow.y += vy;
		}
	}
}
