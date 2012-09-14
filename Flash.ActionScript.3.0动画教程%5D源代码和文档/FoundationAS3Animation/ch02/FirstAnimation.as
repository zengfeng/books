package {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class FirstAnimation extends Sprite {
		private var ball:Sprite;

		public function FirstAnimation() {
			init();
		}
		private function init():void {
			ball = new Sprite();
			addChild(ball);
			ball.graphics.beginFill(0xff0000);
			ball.graphics.drawCircle(0, 0, 40);
			ball.x = 20;
			ball.y = stage.stageHeight / 2;
			ball.addEventListener(Event.ENTER_FRAME, onEnterFrame);          
		}
		private function onEnterFrame(event:Event):void {
			ball.x++;
		}
	}
}
