package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class MultiBounce3D extends Sprite
	{
		private var balls:Array;
		private var numBalls:uint = 50;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		private var top:Number = -100;
		private var bottom:Number = 100;
		private var left:Number = -100;
		private var right:Number = 100;
		private var front:Number = 100;
		private var back:Number = -100;
		
		public function MultiBounce3D()
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
	}
}
