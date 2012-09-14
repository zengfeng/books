package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class ExtrudedA extends Sprite
	{
		private var points:Array;
		private var triangles:Array;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function ExtrudedA()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			points = new Array();
			points[0] = new Point3D( -50, -250,  -50);
			points[1] = new Point3D(  50, -250,  -50);
			points[2] = new Point3D( 200,  250,  -50);
			points[3] = new Point3D( 100,  250,  -50);
			points[4] = new Point3D(  50,  100,  -50);
			points[5] = new Point3D( -50,  100,  -50);
			points[6] = new Point3D(-100,  250,  -50);
			points[7] = new Point3D(-200,  250,  -50);
			points[8] = new Point3D(   0, -150,  -50);
			points[9] = new Point3D(  50,    0,  -50);
			points[10] = new Point3D( -50,   0,  -50);
			
			points[11] = new Point3D( -50, -250,  50);
			points[12] = new Point3D(  50, -250,  50);
			points[13] = new Point3D( 200,  250,  50);
			points[14] = new Point3D( 100,  250,  50);
			points[15] = new Point3D(  50,  100,  50);
			points[16] = new Point3D( -50,  100,  50);
			points[17] = new Point3D(-100,  250,  50);
			points[18] = new Point3D(-200,  250,  50);
			points[19] = new Point3D(   0, -150,  50);
			points[20] = new Point3D(  50,    0,  50);
			points[21] = new Point3D( -50,    0,  50);
			for(var i:uint = 0; i < points.length; i++)
			{
				points[i].setVanishingPoint(vpX, vpY);
				points[i].setCenter(0, 0, 200);
			}
			
			triangles = new Array();
			triangles[0] =new Triangle(points[0],   points[1],  points[8],  0x6666cc);
			triangles[1] =new Triangle(points[1],   points[9],  points[8],  0x6666cc);
			triangles[2] =new Triangle(points[1],   points[2],  points[9],  0x6666cc);
			triangles[3] =new Triangle(points[2],   points[4],  points[9],  0x6666cc);
			triangles[4] =new Triangle(points[2],   points[3],  points[4],  0x6666cc);
			triangles[5] =new Triangle(points[4],   points[5],  points[9],  0x6666cc);
			triangles[6] =new Triangle(points[9],   points[5],  points[10], 0x6666cc);
			triangles[7] =new Triangle(points[5],   points[6],  points[7],  0x6666cc);
			triangles[8] =new Triangle(points[5],   points[7],  points[10], 0x6666cc);
			triangles[9] =new Triangle(points[0],   points[10], points[7],  0x6666cc);
			triangles[10] = new Triangle(points[0], points[8],  points[10], 0x6666cc);
			
			triangles[11] = new Triangle(points[11], points[19], points[12], 0xcc6666);
			triangles[12] = new Triangle(points[12], points[19], points[20], 0xcc6666);
			triangles[13] = new Triangle(points[12], points[20], points[13], 0xcc6666);
			triangles[14] = new Triangle(points[13], points[20], points[15], 0xcc6666);
			triangles[15] = new Triangle(points[13], points[15], points[14], 0xcc6666);
			triangles[16] = new Triangle(points[15], points[20], points[16], 0xcc6666);
			triangles[17] = new Triangle(points[20], points[21], points[16], 0xcc6666);
			triangles[18] = new Triangle(points[16], points[18], points[17], 0xcc6666);
			triangles[19] = new Triangle(points[16], points[21], points[18], 0xcc6666);
			triangles[20] = new Triangle(points[11], points[18], points[21], 0xcc6666);
			triangles[21] = new Triangle(points[11], points[21], points[19], 0xcc6666);
			
			triangles[22] = new Triangle(points[0],  points[11], points[1],  0xcccc66);
			triangles[23] = new Triangle(points[11], points[12], points[1],  0xcccc66);
			triangles[24] = new Triangle(points[1],  points[12], points[2],  0xcccc66);
			triangles[25] = new Triangle(points[12], points[13], points[2],  0xcccc66);
			triangles[26] = new Triangle(points[3],  points[2],  points[14], 0xcccc66);
			triangles[27] = new Triangle(points[2],  points[13], points[14], 0xcccc66);
			triangles[28] = new Triangle(points[4],  points[3],  points[15], 0xcccc66);
			triangles[29] = new Triangle(points[3],  points[14], points[15], 0xcccc66);
			triangles[30] = new Triangle(points[5],  points[4],  points[16], 0xcccc66);
			triangles[31] = new Triangle(points[4],  points[15], points[16], 0xcccc66);
			triangles[32] = new Triangle(points[6],  points[5],  points[17], 0xcccc66);
			triangles[33] = new Triangle(points[5],  points[16], points[17], 0xcccc66);
			triangles[34] = new Triangle(points[7],  points[6],  points[18], 0xcccc66);
			triangles[35] = new Triangle(points[6],  points[17], points[18], 0xcccc66);
			triangles[36] = new Triangle(points[0],  points[7],  points[11], 0xcccc66);
			triangles[37] = new Triangle(points[7],  points[18], points[11], 0xcccc66);
			
			triangles[38] = new Triangle(points[8],  points[9],  points[19], 0xcccc66);
			triangles[39] = new Triangle(points[9],  points[20], points[19], 0xcccc66);
			triangles[40] = new Triangle(points[9],  points[10], points[20], 0xcccc66);
			triangles[41] = new Triangle(points[10], points[21], points[20], 0xcccc66);
			triangles[42] = new Triangle(points[10], points[8],  points[21], 0xcccc66);
			triangles[43] = new Triangle(points[8],  points[19], points[21], 0xcccc66);
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
