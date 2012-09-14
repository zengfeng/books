package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	public class Removal extends Sprite
	{
		private var count:int = 20;
		private var balls:Array;
		
		
		public function Removal()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			balls = new Array();
			for(var i:int = 0; i < count; i++)
			{
				var ball:Ball = new Ball(10);
				ball.x = Math.random() * stage.stageWidth;
				ball.y = Math.random() * stage.stageHeight;
				ball.vx = Math.random() * 2 - 1;
				ball.vy = Math.random() * 2 - 1;
				addChild(ball);
				balls.push(ball);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			for(var i:Number = balls.length - 1; i > 0; i--)
			{
				var ball:Ball = Ball(balls[i]);
				ball.x += ball.vx;
				ball.y += ball.vy;
				if(ball.x - ball.radius > stage.stageWidth ||
				   ball.x + ball.radius < 0 ||
				   ball.y - ball.radius > stage.stageHeight ||
				   ball.y + ball.radius < 0)
				{
					removeChild(ball);
					balls.splice(i, 1);
					if(balls.length <= 0)
					{
						removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					}
				}

			}
		}
	}
}
