package
{
	import flash.display.Graphics;
	
	public class Triangle
	{
		private var pointA:Point3D;
		private var pointB:Point3D;
		private var pointC:Point3D;
		private var color:uint;
		
		public function Triangle(a:Point3D, b:Point3D, c:Point3D, color:uint)
		{
			pointA = a;
			pointB = b;
			pointC = c;
			this.color = color;
		}
		
		public function draw(g:Graphics):void
		{
			g.beginFill(color, .5);
			g.moveTo(pointA.screenX, pointA.screenY);
			g.lineTo(pointB.screenX, pointB.screenY);
			g.lineTo(pointC.screenX, pointC.screenY);
			g.lineTo(pointA.screenX, pointA.screenY);
			g.endFill();
		}
	}
}