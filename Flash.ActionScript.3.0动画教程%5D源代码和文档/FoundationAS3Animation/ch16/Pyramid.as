package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class Pyramid extends Sprite
	{
		private var points:Array;
		private var triangles:Array;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Pyramid()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			points = new Array();
			points[0] = new Point3D(   0, -200,    0);
			points[1] = new Point3D( 200,  200, -200);
			points[2] = new Point3D(-200,  200, -200);
			points[3] = new Point3D(-200,  200,  200);
			points[4] = new Point3D( 200,  200,  200);
			for(var i:uint = 0; i < points.length; i++)
			{
				points[i].setVanishingPoint(vpX, vpY);
				points[i].setCenter(0, 0, 200);
			}
			
			triangles = new Array();
			triangles[0] = new Triangle(points[0], points[1], points[2], 0x6666cc);
			triangles[1] = new Triangle(points[0], points[2], points[3], 0x66cc66);
			triangles[2] = new Triangle(points[0], points[3], points[4], 0xcc6666);
			triangles[3] = new Triangle(points[0], points[4], points[1], 0x66cccc);
			triangles[4] = new Triangle(points[1], points[3], points[2], 0xcc66cc);
			triangles[5] = new Triangle(points[1], points[4], points[3], 0xcc66cc);
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
