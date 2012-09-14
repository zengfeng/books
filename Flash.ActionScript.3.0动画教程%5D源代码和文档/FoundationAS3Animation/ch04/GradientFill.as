package
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	public class GradientFill extends Sprite
	{
		public function GradientFill()
		{
			init();
		}
		
		private function init():void
		{
			graphics.lineStyle(1);
			var colors:Array = [0xffffff, 0xff0000];
			var alphas:Array = [1, 1];
			var ratios:Array = [0, 255];
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(100, 100, 0, 0, 0);
			graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix);
			graphics.drawRect(100, 100, 100, 100);
			graphics.endFill();
		}
	}
}
