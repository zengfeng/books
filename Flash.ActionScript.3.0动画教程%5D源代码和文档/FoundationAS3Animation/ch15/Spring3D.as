package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;

	public class Spring3D extends Sprite
	{
		private var ball:Ball3D;
		private var tx:Number;
		private var ty:Number;
		private var tz:Number;
		private var spring:Number = .1;
		private var friction:Number = .94;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Spring3D()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			ball = new Ball3D();
			addChild(ball);
			
			tx = Math.random() * 500 - 250;
			ty = Math.random() * 500 - 250;
			tz = Math.random() * 500

			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = tx - ball.xpos;
			var dy:Number = ty - ball.ypos;
			var dz:Number = tz - ball.zpos;
			ball.vx += dx * spring;
			ball.vy += dy * spring;
			ball.vz += dz * spring;
			ball.xpos += ball.vx;
			ball.ypos += ball.vy;
			ball.zpos += ball.vz;
			ball.vx *= friction;
			ball.vy *= friction;
			ball.vz *= friction;
			
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
		
		private function onMouseDown(event:MouseEvent):void
		{
			tx = Math.random() * 500 - 250;
			ty = Math.random() * 500 - 250;
			tz = Math.random() * 500
		}
	}
}
