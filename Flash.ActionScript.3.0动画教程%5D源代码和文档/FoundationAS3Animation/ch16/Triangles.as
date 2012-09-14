package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class Triangles extends Sprite
	{
		private var points:Array;
		private var triangles:Array;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Triangles()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			points = new Array();
			points[0] = new Point3D( -50, -250, 100);
			points[1] = new Point3D(  50, -250, 100);
			points[2] = new Point3D( 200,  250, 100);
			points[3] = new Point3D( 100,  250, 100);
			points[4] = new Point3D(  50,  100, 100);
			points[5] = new Point3D( -50,  100, 100);
			points[6] = new Point3D(-100,  250, 100);
			points[7] = new Point3D(-200,  250, 100);
			points[8] = new Point3D(   0, -150, 100);
			points[9] = new Point3D(  50,    0, 100);
			points[10] = new Point3D(-50,    0, 100);
			for(var i:uint = 0; i < points.length; i++)
			{
				points[i].setVanishingPoint(vpX, vpY);
				points[i].setCenter(0, 0, 200);
			}
			
			triangles = new Array();
			triangles[0] =  new Triangle(points[0], points[1], points[8], 0xffcccc);
			triangles[1] =  new Triangle(points[1], points[9], points[8], 0xffcccc);
			triangles[2] =  new Triangle(points[1], points[2], points[9], 0xffcccc);
			triangles[3] =  new Triangle(points[2], points[4], points[9], 0xffcccc);
			triangles[4] =  new Triangle(points[2], points[3], points[4], 0xffcccc);
			triangles[5] =  new Triangle(points[4], points[5], points[9], 0xffcccc);
			triangles[6] =  new Triangle(points[9], points[5], points[10], 0xffcccc);
			triangles[7] =  new Triangle(points[5], points[6], points[7], 0xffcccc);
			triangles[8] =  new Triangle(points[5], points[7], points[10], 0xffcccc);
			triangles[9] =  new Triangle(points[0], points[10],points[7], 0xffcccc);
			triangles[10] = new Triangle(points[0], points[8], points[10], 0xffcccc);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var angleX:Number = (mouseY - vpY) * .001;
			var angleY:Number = (mouseX - vpX) * .001;
			for(var i:uint = 0; i < points.length; i++)
			{
				var point:Point3D = points[i];
				point.rotateX(angleX);
				point.rotateY(angleY);
			}
			
			graphics.clear();
			for(i = 0; i < triangles.length; i++)
			{
				triangles[i].draw(graphics);
			}
		}
	}
}
