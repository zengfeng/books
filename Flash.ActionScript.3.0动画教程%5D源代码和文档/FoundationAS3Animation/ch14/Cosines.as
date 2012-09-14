package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;

	public class Cosines extends Sprite
	{
		private var segment0:Segment;
		private var segment1:Segment;
		
		public function Cosines()
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
			var dx:Number = mouseX - segment1.x;
			var dy:Number = mouseY - segment1.y;
			var dist:Number = Math.sqrt(dx * dx + dy * dy);
			
			var a:Number = 100;
			var b:Number = 100;
			var c:Number = Math.min(dist, a + b);
			
			var B:Number = Math.acos((b * b - a * a - c * c) / (-2 * a * c));
			var C:Number = Math.acos((c * c - a * a - b * b) / (-2 * a * b));
			var D:Number = Math.atan2(dy, dx);
			var E:Number = D + B + Math.PI + C;
			
			segment1.rotation = (D + B) * 180 / Math.PI;
			
			segment0.x = segment1.getPin().x;
			segment0.y = segment1.getPin().y;
			segment0.rotation = E * 180 / Math.PI;
		}
	}
}
