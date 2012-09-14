package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Perspective2 extends Sprite
	{
		private var ball:Ball;
		private var xpos:Number = 0;
		private var ypos:Number = 0;
		private var zpos:Number = 0;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Perspective2()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			ball = new Ball();
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onEnterFrame(event:Event):void
		{
			if(zpos > -fl)
			{
				xpos = mouseX - vpX;
				ypos = mouseY - vpY;
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
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.UP)
			{
				zpos += 5;
			}
			else if(event.keyCode == Keyboard.DOWN)
			{
				zpos -= 5;
			}
		}
	}
}
