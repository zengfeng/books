package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class Cylinder extends Sprite
	{
		private var points:Array;
		private var triangles:Array;
		private var numFaces:uint = 20;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Cylinder()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			points = new Array();
			triangles = new Array();
			
			var index:uint = 0;
			for(var i:uint = 0; i < numFaces; i++)
			{
				var angle:Number = Math.PI * 2 / numFaces * i;
				var xpos:Number = Math.cos(angle) * 200;
				var ypos:Number = Math.sin(angle) * 200;
				points[index] =     new Point3D(xpos, ypos, -100);
				points[index + 1] = new Point3D(xpos, ypos,  100);
				index += 2;
			}
			for(i = 0; i < points.length; i++)
			{
				points[i].setVanishingPoint(vpX, vpY);
				points[i].setCenter(0, 0, 200);
			}
			
			index = 0;
			for(i = 0; i < numFaces - 1; i++)
			{
				triangles[index] =     new Triangle(points[index], points[index + 3], points[index + 1], 0x6666cc);
				triangles[index + 1] = new Triangle(points[index], points[index + 2], points[index + 3], 0x6666cc);
				index += 2;
			}
			
			triangles[index] =   new Triangle(points[index], points[1], points[index + 1], 0x6666cc);
			triangles[index+1] = new Triangle(points[index], points[0], points[1], 0x6666cc);
			
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
