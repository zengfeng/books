package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class Square3D extends Sprite
	{
		private var points:Array;
		private var numPoints:uint = 4;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Square3D()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			points = new Array();
			points[0] = new Point3D(-100, -100,  100);
			points[1] = new Point3D( 100, -100,  100);
			points[2] = new Point3D( 100,  100,  100);
			points[3] = new Point3D(-100,  100,  100);
			for(var i:uint = 0; i < numPoints; i++)
			{
				points[i].setVanishingPoint(vpX, vpY);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var angleX:Number = (mouseY - vpY) * .001;
			var angleY:Number = (mouseX - vpX) * .001;
			for(var i:uint = 0; i < numPoints; i++)
			{
				var point:Point3D = points[i];
				point.rotateX(angleX);
				point.rotateY(angleY);
			}
			
			graphics.clear();
			graphics.lineStyle(0);
			graphics.moveTo(points[0].screenX, points[0].screenY);
			for(i = 1; i < numPoints; i++)
			{
				graphics.lineTo(points[i].screenX, points[i].screenY);
			}
			graphics.lineTo(points[0].screenX, points[0].screenY);
		}
	}
}
