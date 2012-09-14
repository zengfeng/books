package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class Random4 extends Sprite
	{
		private var numDots:uint = 300;
		private var maxRadius:Number = 50;
		
		public function Random4()
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
				var radius:Number = Math.sqrt(Math.random()) * maxRadius;
				var angle:Number = Math.random() * (Math.PI * 2);
				dot.x = stage.stageWidth / 2 + Math.cos(angle) * radius;
				dot.y = stage.stageHeight / 2 + Math.sin(angle) * radius;
				addChild(dot);
			}
		}
	}
}
