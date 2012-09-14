package {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;

	public class TwoSegments extends Sprite
	{
		private var slider0:SimpleSlider;
		private var slider1:SimpleSlider;
		private var segment0:Segment;
		private var segment1:Segment;
		
		public function TwoSegments()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			segment0 = new Segment(100, 20);
			addChild(segment0);
			segment0.x = 100;
			segment0.y = 100;
			
			segment1 = new Segment(100, 20);
			addChild(segment1);
			segment1.x = segment0.getPin().x;
			segment1.y = segment0.getPin().y;
			
			slider0 = new SimpleSlider(-90, 90, 0);
			addChild(slider0);
			slider0.x = 320;
			slider0.y = 20;
			slider0.addEventListener(Event.CHANGE, onChange);

			slider1 = new SimpleSlider(-90, 90, 0);
			addChild(slider1);
			slider1.x = 340;
			slider1.y = 20;
			slider1.addEventListener(Event.CHANGE, onChange);
		}
		
		private function onChange(event:Event):void
		{
			segment0.rotation = slider0.value;
			segment1.rotation = slider1.value;
			segment1.x = segment0.getPin().x;
			segment1.y = segment0.getPin().y;
		}
	}
}
