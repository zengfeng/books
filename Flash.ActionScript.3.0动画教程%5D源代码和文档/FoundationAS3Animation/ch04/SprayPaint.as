package
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	
	public class SprayPaint extends Sprite
	{
		private var canvas:BitmapData;
		private var color:uint;
		private var size:Number = 50;
		private var density:Number = 50;
		
		public function SprayPaint()
		{
			init();
		}
		
		private function init():void
		{
			canvas = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0x00000000);
			var bmp:Bitmap = new Bitmap(canvas);
			bmp.filters = [new BlurFilter(2, 2, 3)];
			addChild(bmp);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			color = Math.random() * 0xffffff + 0xff000000;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onMouseUp(event:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event:Event):void
		{
			for(var i:int = 0; i < density; i++)
			{
				var angle:Number = Math.random() * Math.PI * 2;
				var radius:Number = Math.random() * size;
				var xpos:Number = mouseX + Math.cos(angle) * radius;
				var ypos:Number = mouseY + Math.sin(angle) * radius;
				canvas.setPixel32(xpos, ypos, color);
			}
		}
	}
}
