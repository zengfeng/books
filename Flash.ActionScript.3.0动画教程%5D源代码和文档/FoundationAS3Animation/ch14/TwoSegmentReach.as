package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;

	public class TwoSegmentReach extends Sprite
	{
		private var segment0:Segment;
		private var segment1:Segment;
		
		public function TwoSegmentReach()
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
			segment1.x = stage.stageWidth / 2;
			segment1.y = stage.stageHeight / 2;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var target:Point = reach(segment0, mouseX, mouseY);
			reach(segment1, target.x, target.y);
			segment0.x = segment1.getPin().x;
			segment0.y = segment1.getPin().y;
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
	}
}
