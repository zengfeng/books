package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ChainArray extends Sprite
	{
		private var balls:Array;
		private var numBalls:Number = 5;
		private var spring:Number = 0.1;
		private var friction:Number = 0.8;
		private var gravity:Number = 5;
		
		public function ChainArray()
		{
			init();
		}
		
		private function init():void
		{
			balls = new Array();
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball = new Ball(20);
				addChild(ball);
				balls.push(ball);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		
		private function onEnterFrame(event:Event):void
		{
			graphics.clear();
			graphics.lineStyle(1);
			graphics.moveTo(mouseX, mouseY);
			moveBall(balls[0], mouseX, mouseY);
			graphics.lineTo(balls[0].x, balls[0].y);
			
			for(var i:uint = 1; i < numBalls; i++)
			{
				var ballA:Ball = balls[i-1];
				var ballB:Ball = balls[i];
				moveBall(ballB, ballA.x, ballA.y);
				graphics.lineTo(ballB.x, ballB.y);
			}
		}
		
		private function moveBall(ball:Ball, targetX:Number, targetY:Number):void
		{
			ball.vx += (targetX - ball.x) * spring;
			ball.vy += (targetY - ball.y) * spring;
			ball.vy += gravity;
			ball.vx *= friction;
			ball.vy *= friction;
			ball.x += ball.vx;
			ball.y += ball.vy;
		}
	}
}
