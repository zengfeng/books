package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	
	public class TransformColor extends Sprite
	{
		[Embed(source="picture.jpg")]
		public var Picture:Class;
		
		public function TransformColor()
		{
			init();
		}
		
		private function init():void
		{
			var pic:Bitmap = new Picture();
			addChild(pic);
			
			pic.transform.colorTransform = new ColorTransform(-1, -1, -1, 1, 
															  255, 255, 255, 0);
		}
	}
}
