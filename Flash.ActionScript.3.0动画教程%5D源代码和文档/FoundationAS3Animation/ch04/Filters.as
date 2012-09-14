package
{
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	public class Filters extends Sprite
	{
		public function Filters()
		{
			init();
		}
		
		private function init():void
		{
			var sprite:Sprite = new Sprite();
			sprite.graphics.lineStyle(2);
			sprite.graphics.beginFill(0xffff00);
			sprite.graphics.drawRect(100, 100, 100, 100);
			sprite.graphics.endFill()
			addChild(sprite);
			
			//var blur:BlurFilter = new BlurFilter(5, 5, 3);
			//var filters:Array = new Array();
			//filters.push(blur);
			//sprite.filters = filters;
			
			// shortcut a little:
			//var blur:BlurFilter = new BlurFilter(5, 5, 3);
			//var filters:Array = [blur];
			//sprite.filters = filters;
			
			// shortcut a lot:
			//var blur:BlurFilter = new BlurFilter(5, 5, 3);
			//sprite.filters = [blur];
			
			// bare minimum!
			sprite.filters = [new BlurFilter(5, 5, 3)];
		}
	}
}
