package
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class SimpleBitmap extends Sprite
	{
		public function SimpleBitmap()
		{
			init();
		}
		
		private function init():void
		{
			var myBitmapData:BitmapData = new BitmapData(100, 100, false, 0xff0000);
			var myBitmap:Bitmap = new Bitmap(myBitmapData);
			addChild(myBitmap);
		}
	}
}
