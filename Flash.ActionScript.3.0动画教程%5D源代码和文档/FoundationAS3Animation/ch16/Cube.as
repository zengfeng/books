package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class Cube extends Sprite
	{
		private var points:Array;
		private var triangles:Array;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Cube()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			points = new Array();
			// front four corners
			points[0] = new Point3D(-100, -100, -100);
			points[1] = new Point3D( 100, -100, -100);
			points[2] = new Point3D( 100,  100, -100);
			points[3] = new Point3D(-100,  100, -100);
			// back four corners
			points[4] = new Point3D(-100, -100,  100);
			points[5] = new Point3D( 100, -100,  100);
			points[6] = new Point3D( 100,  100,  100);
			points[7] = new Point3D(-100,  100,  100);
			for(var i:uint = 0; i < points.length; i++)
			{
				points[i].setVanishingPoint(vpX, vpY);
				points[i].setCenter(0, 0, 200);
			}
			
			triangles = new Array();
			// front
			triangles[0] = new Triangle(points[0], points[1], points[2], 0x6666cc);
			triangles[1] = new Triangle(points[0], points[2], points[3], 0x6666cc);
			// top
			triangles[2] = new Triangle(points[0], points[5], points[1], 0x66cc66);
			triangles[3] = new Triangle(points[0], points[4], points[5], 0x66cc66);
			//back
			triangles[4] = new Triangle(points[4], points[6], points[5], 0xcc6666);
			triangles[5] = new Triangle(points[4], points[7], points[6], 0xcc6666);
			// bottom
			triangles[6] = new Triangle(points[3], points[2], points[6], 0xcc66cc);
			triangles[7] = new Triangle(points[3], points[6], points[7], 0xcc66cc);
			// right
			triangles[8] = new Triangle(points[1], points[5], points[6], 0x66cccc);
			triangles[9] = new Triangle(points[1], points[6], points[2], 0x66cccc);
			// left
			triangles[10] = new Triangle(points[4], points[0], points[3], 0xcccc66);
			triangles[11] = new Triangle(points[4], points[3], points[7], 0xcccc66);
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
