package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class RotationalVelocity extends Sprite
	{
		private var arrow:Arrow;
		private var vr:Number = 5;
		
		public function RotationalVelocity()
		{
			init();
		}
		
		private function init():void
		{
			arrow = new Arrow();
			addChild(arrow);
			arrow.x = stage.stageWidth / 2;
			arrow.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(event:Event):void
		{
			arrow.rotation += vr;
		}
	}
}
