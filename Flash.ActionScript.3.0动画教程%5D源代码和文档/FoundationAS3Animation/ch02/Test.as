package {
	import flash.display.Sprite;    
	public class Test extends Sprite {       
		public function Test() {          
			init();       
		}       
		private function init():void {          
			graphics.beginFill(0xff0000);          
			graphics.drawEllipse(100, 100, 100, 100);          
			graphics.endFill();
		}
	}
}
