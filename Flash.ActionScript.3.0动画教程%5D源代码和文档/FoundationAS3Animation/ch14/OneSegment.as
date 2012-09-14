package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class OneSegment extends Sprite
	{
		private var segment0:Segment;
		
		public function OneSegment()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			segment0 = new Segment(100, 20);
			addChild(segment0);
			segment0.x = stage.stageWidth / 2;
			segment0.y = stage.stageHeight / 2;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = mouseX - segment0.x;
			var dy:Number = mouseY - segment0.y;
			var angle:Number = Math.atan2(dy, dx);
			segment0.rotation = angle * 180 / Math.PI;
		}
	}
}
