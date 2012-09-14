package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Bounce3D extends Sprite
	{
		private var ball:Ball;
		private var xpos:Number = 0;
		private var ypos:Number = 0;
		private var zpos:Number = 0;
		private var vx:Number = Math.random() * 10 - 5;
		private var vy:Number = Math.random() * 10 - 5;
		private var vz:Number = Math.random() * 10 - 5;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		private var top:Number = -100;
		private var bottom:Number = 100;
		private var left:Number = -100;
		private var right:Number = 100;
		private var front:Number = 100;
		private var back:Number = -100;
		
		public function Bounce3D()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			ball = new Ball(15);
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			xpos += vx;
			ypos += vy;
			zpos += vz;
			
			var radius:Number =  ball.radius;
			if(xpos + radius > right)
			{
				xpos = right - radius;
				vx *= -1;
			}
			else if(xpos - radius < left)
			{
				xpos = left + radius;
				vx *= -1;
			}
			if(ypos + radius > bottom)
			{
				ypos = bottom - radius;
				vy *= -1;
			}
			else if(ypos - radius < top)
			{
				ypos = top + radius;
				vy *= -1;
			}
			if(zpos + radius > front)
			{
				zpos = front - radius;
				vz *= -1;
			}
			else if(zpos - radius < back)
			{
				zpos = back + radius;
				vz *= -1;
			}
			
			if(zpos > -fl)
			{
				var scale:Number = fl / (fl + zpos);
				ball.scaleX = ball.scaleY = scale;
				ball.x = vpX + xpos * scale;
				ball.y = vpY + ypos * scale;
				ball.visible = true;
			}
			else
			{
				ball.visible = false;
			}
		}
	}
}
