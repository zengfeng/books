package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	
	public class AnimatedFilters extends Sprite
	{
		private var filter:DropShadowFilter;
		private var sprite:Sprite;
		
		public function AnimatedFilters()
		{
			init();
		}
		
		private function init():void
		{
			sprite = new Sprite();
			sprite.graphics.lineStyle(2);
			sprite.graphics.beginFill(0xffff00);
			sprite.graphics.drawRect(-50, -50, 100, 100);
			sprite.graphics.endFill();
			sprite.x = 200;
			sprite.y = 200;
			addChild(sprite);
			
			filter = new DropShadowFilter(0, 0, 0, 1, 20, 20, .3);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = mouseX - sprite.x;
			var dy:Number = mouseY - sprite.y;
			
			filter.distance = -Math.sqrt(dx * dx + dy * dy) / 10;
			filter.angle = Math.atan2(dy, dx) * 180 / Math.PI;
			sprite.filters = [filter];
		}
	}
}
