package {
	import flash.display.Sprite;
	
	public class Tree extends Sprite {
		public var xpos:Number = 0;
		public var ypos:Number = 0;
		public var zpos:Number = 0;
		
		public function Tree() {
			init();
		}
		public function init():void {
			graphics.lineStyle(0, 0xffffff);
			graphics.lineTo(0, -140 - Math.random() * 20);
			graphics.moveTo(0, -30 - Math.random() * 30);
			graphics.lineTo(Math.random() * 80 - 40, -100 - Math.random() * 40);
			graphics.moveTo(0, -60 - Math.random() * 40);
			graphics.lineTo(Math.random() * 60 - 30, -110 - Math.random() * 20);
		}
	}
}