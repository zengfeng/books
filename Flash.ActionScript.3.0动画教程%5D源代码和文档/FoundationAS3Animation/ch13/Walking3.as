package {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;

	public class Walking3 extends Sprite
	{
		private var segment0:Segment;
		private var segment1:Segment;
		private var cycle:Number = 0;
		private var offset:Number = -Math.PI / 2;
		
		public function Walking3()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			segment0 = new Segment(100, 20);
			addChild(segment0);
			segment0.x = 200;
			segment0.y = 100;
			
			segment1 = new Segment(100, 20);
			addChild(segment1);
			segment1.x = segment0.getPin().x;
			segment1.y = segment0.getPin().y;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			cycle += .05;
			var angle0:Number = Math.sin(cycle) * 45 + 90;
			var angle1:Number = Math.sin(cycle + offset) * 45 + 45;
			segment0.rotation = angle0;
			segment1.rotation = segment0.rotation + angle1;
			segment1.x = segment0.getPin().x;
			segment1.y = segment0.getPin().y;
		}
	}
}
