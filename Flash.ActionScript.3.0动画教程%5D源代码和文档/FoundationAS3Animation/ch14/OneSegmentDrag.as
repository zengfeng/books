package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class OneSegmentDrag extends Sprite
	{
		private var segment0:Segment;
		
		public function OneSegmentDrag()
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
			
			var w:Number = segment0.getPin().x - segment0.x;
			var h:Number = segment0.getPin().y - segment0.y;
			segment0.x = mouseX - w;
			segment0.y = mouseY - h;
		}
	}
}
