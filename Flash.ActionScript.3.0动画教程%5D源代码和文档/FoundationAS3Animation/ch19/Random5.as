package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class Random5 extends Sprite
	{
		private var numDots:uint = 300;
		private var maxRadius:Number = 50;
		
		public function Random5()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			for(var i:uint = 0; i < numDots; i++)
			{
				var dot:Ball = new Ball(1, 0);
				var x1:Number = Math.random() * stage.stageWidth;
				var x2:Number = Math.random() * stage.stageWidth;
				dot.x = (x1 + x2) / 2;
				dot.y = stage.stageHeight / 2 + Math.random() * 50 - 25;
				addChild(dot);
			}
		}
	}
}
