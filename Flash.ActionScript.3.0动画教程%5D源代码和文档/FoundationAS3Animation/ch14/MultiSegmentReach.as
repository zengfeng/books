package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;

	public class MultiSegmentReach extends Sprite
	{
		private var segments:Array;
		private var numSegments:uint = 6;
		
		public function MultiSegmentReach()
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
			segment.x = stage.stageWidth / 2;
			segment.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var target:Point = reach(segments[0], mouseX, mouseY);
			for(var i:uint = 1; i < numSegments; i++)
			{
				var segment:Segment = segments[i];
				target = reach(segment, target.x, target.y);
			}
			for(i = numSegments - 1; i > 0; i--)
			{
				var segmentA:Segment = segments[i];
				var segmentB:Segment = segments[i - 1];
				position(segmentB, segmentA);
			}
		}
		
		private function reach(segment:Segment, xpos:Number, ypos:Number):Point
		{
			var dx:Number = xpos - segment.x;
			var dy:Number = ypos - segment.y;
			var angle:Number = Math.atan2(dy, dx);
			segment.rotation = angle * 180 / Math.PI;
			
			var w:Number = segment.getPin().x - segment.x;
			var h:Number = segment.getPin().y - segment.y;
			var tx:Number = xpos - w;
			var ty:Number = ypos - h;
			return new Point(tx, ty);
		}
		
		private function position(segmentA:Segment, segmentB:Segment):void
		{
			segmentA.x = segmentB.getPin().x;
			segmentA.y = segmentB.getPin().y;
		}
	}
}
