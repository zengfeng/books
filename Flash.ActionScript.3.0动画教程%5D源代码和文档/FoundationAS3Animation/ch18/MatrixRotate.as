package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class MatrixRotate extends Sprite
	{
		private var angle:Number = 0;
		private var box:Sprite;
		
		public function MatrixRotate()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			box = new Sprite();
			box.graphics.beginFill(0xff0000);
			box.graphics.drawRect(-50, -50, 100, 100);
			box.graphics.endFill();
			addChild(box);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			angle += .05;
			var cos:Number = Math.cos(angle);
			var sin:Number = Math.sin(angle);
			box.transform.matrix = new Matrix(cos, sin,
											 -sin, cos,
											  stage.stageWidth / 2,
											  stage.stageHeight / 2);
		}
	}
}