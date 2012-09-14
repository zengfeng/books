package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Bubbles2 extends Sprite
	{
		private var balls:Array;
		private var numBalls:Number = 30;
		private var bounce:Number = -0.5;
		private var spring:Number = 0.05;
		private var gravity:Number = 0.1;
		
		
		public function Bubbles2()
		{
			init();
		}
		
		private function init():void
		{
			balls = new Array();
			
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball = new Ball(Math.random() * 30 + 20, Math.random() * 0xffffff);
				ball.x = Math.random() * stage.stageWidth;
				ball.y = Math.random() * stage.stageHeight;
				ball.vx = Math.random() * 6 - 3;
				ball.vy = Math.random() * 6 - 3;
				addChild(ball);
				balls.push(ball);
			}
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);			
		}
		
		private function onEnterFrame(event:Event):void
		{
			for(var i:uint = 0; i < numBalls - 1; i++)
			{
				var ball0:Ball = balls[i];
				for(var j:uint = i + 1; j < numBalls; j++)
				{
					var ball1:Ball = balls[j];
					var dx:Number = ball1.x - ball0.x;
					var dy:Number = ball1.y - ball0.y;
					var dist:Number = Math.sqrt(dx * dx + dy * dy);
					var minDist:Number = ball0.radius + ball1.radius;
					if(dist < minDist)
					{
						var angle:Number = Math.atan2(dy, dx);
						var tx:Number = ball0.x + dx / dist * minDist;
						var ty:Number = ball0.y + dy / dist * minDist;
						var ax:Number = (tx - ball1.x) * spring;
						var ay:Number = (ty - ball1.y) * spring;
						ball0.vx -= ax;
						ball0.vy -= ay;
						ball1.vx += ax;
						ball1.vy += ay;
					}
				}
			}
			
			for(i = 0; i < numBalls; i++)
			{
				var ball:Ball = balls[i];
				move(ball);
			}
		}
		
		private function move(ball:Ball):void
		{
			ball.vy += gravity;
			ball.x += ball.vx;
			ball.y += ball.vy;
			if(ball.x + ball.radius > stage.stageWidth)
			{
				ball.x = stage.stageWidth - ball.radius;
				ball.vx *= bounce;
			}
			else if(ball.x - ball.radius < 0)
			{
				ball.x = ball.radius;
				ball.vx *= bounce;
			}
			if(ball.y + ball.radius > stage.stageHeight)
			{
				ball.y = stage.stageHeight - ball.radius;
				ball.vy *= bounce;
			}
			else if(ball.y - ball.radius < 0)
			{
				ball.y = ball.radius;
				ball.vy *= bounce;
			}
		}
	}
}
