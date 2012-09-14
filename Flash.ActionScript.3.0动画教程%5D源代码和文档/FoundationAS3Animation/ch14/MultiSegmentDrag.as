package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class MultiSegmentDrag extends Sprite
	{
		private var segments:Array;
		private var numSegments:uint = 50;
		
		public function MultiSegmentDrag()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			segments = new Array();
			for(var i:uint = 0; i < numSegments; i++)
			{
				var segment:Segment = new Segment(50, 10);
				addChild(segment);
				segments.push(segment);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			drag(segments[0], mouseX, mouseY);
			for(var i:uint = 1; i < numSegments; i++)
			{
				var segmentA:Segment = segments[i];
				var segmentB:Segment = segments[i - 1];
				drag(segmentA, segmentB.x, segmentB.y);
			}
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
