package {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;

	public class Walking5 extends Sprite
	{
		private var segment0:Segment;
		private var segment1:Segment;
		private var segment2:Segment;
		private var segment3:Segment;
		private var speedSlider:SimpleSlider;
		private var thighRangeSlider:SimpleSlider;
		private var thighBaseSlider:SimpleSlider;
		private var calfRangeSlider:SimpleSlider;
		private var calfOffsetSlider:SimpleSlider;
		private var cycle:Number = 0;
		
		public function Walking5()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			segment0 = new Segment(100, 30);
			addChild(segment0);
			segment0.x = 200;
			segment0.y = 100;
			
			segment1 = new Segment(100, 20);
			addChild(segment1);
			segment1.x = segment0.getPin().x;
			segment1.y = segment0.getPin().y;
			
			segment2 = new Segment(100, 30);
			addChild(segment2);
			segment2.x = 200;
			segment2.y = 100;
			
			segment3 = new Segment(100, 20);
			addChild(segment3);
			segment3.x = segment2.getPin().x;
			segment3.y = segment2.getPin().y;
			
			speedSlider = new SimpleSlider(0, 0.3, 0.12);
			addChild(speedSlider);
			speedSlider.x = 10;
			speedSlider.y = 10;
			
			thighRangeSlider = new SimpleSlider(0, 90, 45);
			addChild(thighRangeSlider);
			thighRangeSlider.x = 30;
			thighRangeSlider.y = 10;
			
			thighBaseSlider = new SimpleSlider(0, 180, 90);
			addChild(thighBaseSlider);
			thighBaseSlider.x = 50;
			thighBaseSlider.y = 10;
			
			calfRangeSlider = new SimpleSlider(0, 90, 45);
			addChild(calfRangeSlider);
			calfRangeSlider.x = 70;
			calfRangeSlider.y = 10;
			
			calfOffsetSlider = new SimpleSlider(-3.14, 3.14, -1.57);
			addChild(calfOffsetSlider);
			calfOffsetSlider.x = 90;
			calfOffsetSlider.y = 10;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			walk(segment0, segment1, cycle);
			walk(segment2, segment3, cycle + Math.PI);
			cycle += speedSlider.value;
		}
		
		private function walk(segA:Segment, segB:Segment, cyc:Number):void
		{
			var angleA:Number = Math.sin(cyc) *
								thighRangeSlider.value + 
								thighBaseSlider.value;
			var angleB:Number = Math.sin(cyc + calfOffsetSlider.value) *
								calfRangeSlider.value +
								calfRangeSlider.value;
			segA.rotation = angleA;
			segB.rotation = segA.rotation + angleB;
			segB.x = segA.getPin().x;
			segB.y = segA.getPin().y;
		}

	}
}
