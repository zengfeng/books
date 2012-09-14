package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MousePos extends Sprite
	{
		private var sprite:Sprite;
		
		public function MousePos()
		{
			init();
		}
		private function init():void
		{
			sprite = new Sprite();
			addChild(sprite);
			sprite.graphics.beginFill(0xff0000);
			sprite.graphics.drawRect(0, 0, 100, 100);
			sprite.graphics.endFill();
			sprite.x = 100;
			sprite.y = 100;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		public function onMouseMove(event:MouseEvent):void
		{
			Logger.info("mouseX: " + mouseX + ", mouseY:" + mouseY);
			Logger.error("sprite.mouseX: " + sprite.mouseX + ", sprite.mouseY: " + sprite.mouseY);
		}
	}
}