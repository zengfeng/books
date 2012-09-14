package
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	public class EmbedAsset extends Sprite
	{
		[Embed(source="picture.jpg")]
		private var Image:Class;
		
		public function EmbedAsset()
		{
			init();
		}
		
		private function init():void
		{
			var img:Bitmap = new Image();
			addChild(img);
		}
	}
}
