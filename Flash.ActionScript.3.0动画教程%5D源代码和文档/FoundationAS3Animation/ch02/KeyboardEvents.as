package {
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	
	public class KeyboardEvents extends Sprite {
		public function KeyboardEvents() {
			init();
		}
		private function init():void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardEvent);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyboardEvent);
		}
		public function onKeyboardEvent(event:KeyboardEvent):void {
			Logger.info(event.type);
		}
	}
}