package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MouseEvents extends Sprite {
		public function MouseEvents() {
			init();
		}
		private function init():void
		{
			var sprite:Sprite = new Sprite();
			addChild(sprite);
			sprite.graphics.beginFill(0xff0000);
			sprite.graphics.drawCircle(0, 0, 50);
			sprite.x = stage.stageWidth / 2;
			sprite.y = stage.stageHeight / 2;
			
			sprite.addEventListener(MouseEvent.CLICK, onMouseEvent);
			sprite.addEventListener(MouseEvent.DOUBLE_CLICK, onMouseEvent);
			sprite.addEventListener(MouseEvent.MOUSE_DOWN, onMouseEvent);
			sprite.addEventListener(MouseEvent.MOUSE_MOVE, onMouseEvent);
			sprite.addEventListener(MouseEvent.MOUSE_OUT, onMouseEvent);
			sprite.addEventListener(MouseEvent.MOUSE_OVER, onMouseEvent);
			sprite.addEventListener(MouseEvent.MOUSE_UP, onMouseEvent);
			sprite.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseEvent);
			sprite.addEventListener(MouseEvent.ROLL_OUT, onMouseEvent);
			sprite.addEventListener(MouseEvent.ROLL_OVER, onMouseEvent);
		}
		public function onMouseEvent(event:MouseEvent):void
		{
			Logger.info(event.type);
		}
	}
}