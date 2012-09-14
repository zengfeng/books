package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class Lines3D2 extends Sprite
	{
		private var points:Array;
		private var numPoints:uint = 50;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Lines3D2()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			points = new Array();
			for(var i:uint = 0; i < numPoints; i++)
			{
				var point:Point3D = new Point3D(Math.random() * 200 - 100,
												Math.random() * 200 - 100,
												Math.random() * 200 - 100);
				point.setVanishingPoint(vpX, vpY);
				points.push(point);
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
		}
	}
}
