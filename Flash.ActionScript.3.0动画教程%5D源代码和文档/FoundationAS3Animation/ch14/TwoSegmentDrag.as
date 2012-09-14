package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class TwoSegmentDrag extends Sprite
	{
		private var segment0:Segment;
		private var segment1:Segment;
		
		public function TwoSegmentDrag()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			segment0 = new Segment(100, 20);
			addChild(segment0);
			
			segment1 = new Segment(100, 20);
			addChild(segment1);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			drag(segment0, mouseX, mouseY);
			drag(segment1, segment0.x, segment0.y);
		}
		
		private function drag(segment:Segment, xpos:Number, ypos:Number):void
		{
			var dx:Number = xpos - segment.x;
			var dy:Number = ypos - segment.y;
			var angle:Number = Math.atan2(dy, dx);
			segment.rotation = angle * 180 / Math.PI;
			
			var w:Number = segment.getPin().x - segment.x;
			var h:Number = segment.getPin().y - segment.y;
			segment.x = xpos - w;
			segment.y = ypos - h;
		}
	}
}
