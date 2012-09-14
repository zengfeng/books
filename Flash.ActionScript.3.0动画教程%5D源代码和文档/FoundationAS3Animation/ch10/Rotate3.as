package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;

	public class Rotate3 extends Sprite
	{
		private var balls:Array;
		private var numBalls:uint = 10;
		private var vr:Number = .05;
		
		public function Rotate3()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			balls = new Array();
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball = new Ball();
				balls.push(ball);
				addChild(ball);
				ball.x = Math.random() * stage.stageWidth;
				ball.y = Math.random() * stage.stageHeight;
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var angle:Number = (mouseX - stage.stageWidth / 2) * .001;
			var cos:Number = Math.cos(angle);
			var sin:Number = Math.sin(angle);
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball = balls[i];
				var x1:Number = ball.x - stage.stageWidth / 2;
				var y1:Number = ball.y - stage.stageHeight / 2;
				var x2:Number = cos * x1 - sin * y1;
				var y2:Number = cos * y1 + sin * x1;
				ball.x = stage.stageWidth / 2 + x2;
				ball.y = stage.stageHeight / 2 + y2;
			}
		}
	}
}