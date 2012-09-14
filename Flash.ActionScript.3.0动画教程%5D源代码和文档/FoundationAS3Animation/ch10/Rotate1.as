package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;

	public class Rotate1 extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 0;
		private var radius:Number = 150;
		private var vr:Number = .05;
		
		public function Rotate1()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			ball = new Ball();
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			trace(x);
			
			trace(stage.stageWidth / 2);
			ball.x = stage.stageWidth / 2 + Math.cos(angle) * radius;
			trace(ball.x);
			ball.y = stage.stageHeight / 2 + Math.sin(angle) * radius;
			angle += vr;
		}
	}
}