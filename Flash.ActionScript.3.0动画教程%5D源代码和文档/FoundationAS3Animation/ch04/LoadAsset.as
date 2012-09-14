package
{
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	public class LoadAsset extends Sprite
	{
		public function LoadAsset()
		{
			init();
		}
		
		private function init():void
		{
			var loader:Loader = new Loader();
			addChild(loader);
			loader.load(new URLRequest("picture.jpg"));
		}
	}
}
