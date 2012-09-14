package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.geom.ColorTransform;

	public class Collision3D extends Sprite
	{
		private var balls:Array;
		private var numBalls:uint = 20;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		private var top:Number = -200;
		private var bottom:Number = 200;
		private var left:Number = -200;
		private var right:Number = 200;
		private var front:Number = 200;
		private var back:Number = -200;
		
		public function Collision3D()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			balls = new Array();
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball3D = new Ball3D(15);
				balls.push(ball);
				ball.xpos = Math.random() * 400 - 200;
				ball.ypos = Math.random() * 400 - 200;
				ball.zpos = Math.random() * 400 - 200;
				ball.vx = Math.random() * 10 - 5;
				ball.vy = Math.random() * 10 - 5;
				ball.vz = Math.random() * 10 - 5;
				addChild(ball);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball3D = balls[i];
				move(ball);
			}
			for(i = 0; i < numBalls - 1; i++)
			{
				var ballA:Ball3D = balls[i];
				for(var j:uint = i + 1; j < numBalls; j++)
				{
					var ballB:Ball3D = balls[j];
					var dx:Number = ballA.xpos - ballB.xpos;
					var dy:Number = ballA.ypos - ballB.ypos;
					var dz:Number = ballA.zpos - ballB.zpos;
					var dist:Number = Math.sqrt(dx * dx + dy * dy + dz * dz);
					if(dist < ballA.radius + ballB.radius)
					{
						var blueTransform:ColorTransform = new ColorTransform(0, 1, 1, 1, 0, 0, 255, 0);
						ballA.transform.colorTransform = blueTransform;
						ballB.transform.colorTransform = blueTransform;
					}
				}
			}
			sortZ();
		}
		
		private function move(ball:Ball3D):void
		{
			var radius:Number =  ball.radius;
			
			ball.xpos += ball.vx;
			ball.ypos += ball.vy;
			ball.zpos += ball.vz;
			
			if(ball.xpos + radius > right)
			{
				ball.xpos = right - radius;
				ball.vx *= -1;
			}
			else if(ball.xpos - radius < left)
			{
				ball.xpos = left + radius;
				ball.vx *= -1;
			}
			if(ball.ypos + radius > bottom)
			{
				ball.ypos = bottom - radius;
				ball.vy *= -1;
			}
			else if(ball.ypos - radius < top)
			{
				ball.ypos = top + radius;
				ball.vy *= -1;
			}
			if(ball.zpos + radius > front)
			{
				ball.zpos = front - radius;
				ball.vz *= -1;
			}
			else if(ball.zpos - radius < back)
			{
				ball.zpos = back + radius;
				ball.vz *= -1;
			}
			
			if(ball.zpos > -fl)
			{
				var scale:Number = fl / (fl + ball.zpos);
				ball.scaleX = ball.scaleY = scale;
				ball.x = vpX + ball.xpos * scale;
				ball.y = vpY + ball.ypos * scale;
				ball.visible = true;
			}
			else
			{
				ball.visible = false;
			}
		}
		
		private function sortZ():void
		{
			balls.sortOn("zpos", Array.DESCENDING | Array.NUMERIC);
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball3D = balls[i];
				setChildIndex(ball, i);
			}
		}
	}
}
