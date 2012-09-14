package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class Random7 extends Sprite
	{
		private var numDots:uint = 300;
		private var maxRadius:Number = 50;
		private var iterations:uint = 6;
		
		public function Random7()
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
				var xpos:Number = 0;
				for(var j:uint = 0; j < iterations; j++)
				{
					xpos += Math.random() * stage.stageWidth;
				}
				dot.x = xpos / iterations;

				var ypos:Number = 0;
				for(j = 0; j < iterations; j++)
				{
					ypos += Math.random() * stage.stageHeight;
				}
				dot.y = ypos / iterations;
				addChild(dot);
			}
		}
	}
}
