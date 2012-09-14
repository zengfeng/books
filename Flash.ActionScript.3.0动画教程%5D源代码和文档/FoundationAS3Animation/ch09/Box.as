package {
	import flash.display.Sprite;
	
	public class Box extends Sprite {
		private var w:Number;
		private var h:Number;
		private var color:uint;
		public var vx:Number = 0;
		public var vy:Number = 0;
		
		public function Box(width:Number=50, height:Number=50, color:uint=0xff0000) {
			w = width;
			h = height;
			this.color = color;
			init();
		}
		public function init():void {
			graphics.beginFill(color);
			graphics.drawRect(-w / 2, -h / 2, w, h);
			graphics.endFill();
		}
	}
}