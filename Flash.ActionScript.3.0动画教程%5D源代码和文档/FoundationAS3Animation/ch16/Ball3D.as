package {
	import flash.display.Sprite;
	
	public class Ball3D extends Sprite {
		public var radius:Number;
		private var color:uint;
		public var xpos:Number = 0;
		public var ypos:Number = 0;
		public var zpos:Number = 0;
		public var vx:Number = 0;
		public var vy:Number = 0;
		public var vz:Number = 0;
		public var mass:Number = 1;
		
		public function Ball3D(radius:Number=40, color:uint=0xff0000) {
			this.radius = radius;
			this.color = color;
			init();
		}
		public function init():void {
			graphics.lineStyle(0);
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();
		}
	}
}