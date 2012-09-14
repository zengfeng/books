package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Reparenting extends Sprite {
		private var parent1:Sprite;
		private var parent2:Sprite;
		private var ball:Sprite;

		public function Reparenting() {
			init();
		}
		private function init():void {
			parent1 = new Sprite();
			addChild(parent1);
			parent1.graphics.lineStyle(1, 0);
			parent1.graphics.drawRect(-50, -50, 100, 100);
			parent1.x = 60;
			parent1.y = 60;
			
			parent2 = new Sprite();
			addChild(parent2);
			parent2.graphics.lineStyle(1, 0);
			parent2.graphics.drawRect(-50, -50, 100, 100);
			parent2.x = 170;
			parent2.y = 60;
			
			ball = new Sprite();
			parent1.addChild(ball);
			ball.graphics.beginFill(0xff0000);
			ball.graphics.drawCircle(0, 0, 40);
			ball.addEventListener(MouseEvent.CLICK, onBallClick);
		}
		
		public function onBallClick(event:MouseEvent):void
		{
			parent2.addChild(ball);
		}
	}
}
