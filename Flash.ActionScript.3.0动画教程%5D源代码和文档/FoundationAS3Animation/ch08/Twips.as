package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Twips extends Sprite
	{
		public function Twips()
		{
			init();
		}
		
		private function init():void
		{
			var sprite:Sprite;
			sprite = new Sprite();
			addChild(sprite);
			sprite.x = 0;
			var targ:Number = 100;
			for(var i:Number=0;i<20;i++)
			{
				ftrace(i + ": " + sprite.x);
				sprite.x += (targ - sprite.x) * .5;
			}
		}
	}
}
