package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.geom.Rectangle;

	public class MultiAngleBounce extends Sprite
	{
		private var ball:Ball;
		private var lines:Array;
		private var numLines:uint = 5;
		private var gravity:Number = 0.3;
		private var bounce:Number = -0.6;
		
		public function MultiAngleBounce()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			ball = new Ball(20);
			addChild(ball);
			ball.x = 100;
			ball.y = 50;
			
			// create five lines
			lines = new Array();
			for(var i:uint = 0; i < numLines; i++)
			{
				var line:Sprite = new Sprite();
				line.graphics.lineStyle(1);
				line.graphics.moveTo(-50, 0)
				line.graphics.lineTo(50, 0);
				addChild(line);
				lines.push(line);
			}
			
			// position and rotate them
			lines[0].x = 100;
			lines[0].y = 100;
			lines[0].rotation = 30;
			
			lines[1].x = 100;
			lines[1].y = 230;
			lines[1].rotation = 45;
			
			lines[2].x = 250;
			lines[2].y = 180;
			lines[2].rotation = -30;
			
			lines[3].x = 150;
			lines[3].y = 330;
			lines[3].rotation = 10;
			
			lines[4].x = 230;
			lines[4].y = 250;
			lines[4].rotation = -30;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			// normal motion code
			ball.vy += gravity;
			ball.x += ball.vx;
			ball.y += ball.vy;
			
			// bounce off ceiling, floor and walls
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
			
			// check each line
			for(var i:uint = 0; i < numLines; i++)
			{
				checkLine(lines[i]);
			}
		}
		
		private function checkLine(line:Sprite):void
		{
			// get the bounding box of the line
			var bounds:Rectangle = line.getBounds(this);
			if(ball.x > bounds.left && ball.x < bounds.right)
			{
				
				// get angle, sine and cosine
				var angle:Number = line.rotation * Math.PI / 180;
				var cos:Number = Math.cos(angle);
				var sin:Number = Math.sin(angle);
				
				// get position of ball, relative to line
				var x1:Number = ball.x - line.x;
				var y1:Number = ball.y - line.y;
				
				// rotate coordinates
				var y2:Number = cos * y1 - sin * x1;
				
				// rotate velocity
				var vy1:Number = cos * ball.vy - sin * ball.vx;
				
				// perform bounce with rotated values
				if(y2 > -ball.height / 2 && y2 < vy1)
				{
					// rotate coordinates
					var x2:Number = cos * x1 + sin * y1;
					
					// rotate velocity
					var vx1:Number = cos * ball.vx + sin * ball.vy;
				
					y2 = -ball.height / 2;
					vy1 *= bounce;
					
					// rotate everything back;
					x1 = cos * x2 - sin * y2;
					y1 = cos * y2 + sin * x2;
					ball.vx = cos * vx1 - sin * vy1;
					ball.vy = cos * vy1 + sin * vx1;
					ball.x = line.x + x1;
					ball.y = line.y + y1;
				}
			}
		}
	}
}