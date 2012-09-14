package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class CurveThroughPoint extends Sprite
	{
		private var x0:Number = 100;
		private var y0:Number = 200;
		private var x1:Number;
		private var y1:Number;
		private var x2:Number = 300;
		private var y2:Number = 200;

		public function CurveThroughPoint()
		{
			init();
		}
		
		private function init():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			x1 = mouseX * 2 - (x0 + x2) / 2;
			y1 = mouseY * 2 - (y0 + y2) / 2;
			graphics.clear();
			graphics.lineStyle(1);
			graphics.moveTo(x0, y0);
			graphics.curveTo(x1, y1, x2, y2);
		}
	}
}
