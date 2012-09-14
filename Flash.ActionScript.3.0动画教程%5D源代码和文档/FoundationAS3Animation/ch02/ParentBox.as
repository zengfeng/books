package {
	import flash.display.Sprite;
	
	public class ParentBox extends Sprite {
		public function ParentBox()
		{
			init();
		}
		private function init():void
		{
			graphics.lineStyle(1, 0);
			graphics.drawRect(-50, -50, 100, 100);
		}
	}
}