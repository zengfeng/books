package
{
	import flash.display.Sprite;
	
	public class Distance extends Sprite {
		
		public function Distance()	{
			init();
		}
		private function init():void {
			var sprite1:Sprite = new Sprite();
			addChild(sprite1);
			sprite1.graphics.beginFill(0x000000);
			sprite1.graphics.drawRect(-2, -2, 4, 4);
			sprite1.graphics.endFill();
			sprite1.x = Math.random() * stage.stageWidth;
			sprite1.y = Math.random() * stage.stageHeight;
			
			var sprite2:Sprite = new Sprite();
			addChild(sprite2);
			sprite2.graphics.beginFill(0xff0000);
			sprite2.graphics.drawRect(-2, -2, 4, 4);
			sprite2.graphics.endFill();
			sprite2.x = Math.random() * stage.stageWidth;
			sprite2.y = Math.random() * stage.stageHeight;
			
			var dx:Number = sprite1.x - sprite2.x;
			var dy:Number = sprite1.y - sprite2.y;
			var dist:Number = Math.sqrt(dx * dx + dy * dy);
			ftrace(dist);
		}
	}
}