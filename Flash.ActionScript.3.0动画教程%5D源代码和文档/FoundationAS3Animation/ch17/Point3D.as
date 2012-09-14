package
{
	public class Point3D
	{
		public var fl:Number = 250;
		private var vpX:Number = 0;
		private var vpY:Number = 0;
		private var cX:Number = 0;
		private var cY:Number = 0;
		private var cZ:Number = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public function Point3D(x:Number=0, y:Number=0, z:Number=0)
		{
			this.x = x;
			this.y = y;
			this.z = z;
		}
		
		public function setVanishingPoint(vpX:Number, vpY:Number):void
		{
			this.vpX = vpX;
			this.vpY = vpY;
		}
		
		public function setCenter(cX:Number, cY:Number, cZ:Number=0):void
		{
			this.cX = cX;
			this.cY	 = cY;
			this.cZ = cZ;
		}
		
		public function get screenX():Number
		{
			var scale:Number = fl / (fl + z + cZ);
			return vpX + (cX + x) * scale;
		}
		
		public function get screenY():Number
		{
			var scale:Number = fl / (fl + z + cZ);
			return vpY + (cY + y) * scale;
		}
		
		public function rotateX(angleX:Number):void
		{
			var cosX:Number = Math.cos(angleX);
			var sinX:Number = Math.sin(angleX);
			
			var y1:Number = y * cosX - z * sinX;
			var z1:Number = z * cosX + y * sinX;
			
			y = y1;
			z = z1;
		}
		
		public function rotateY(angleY:Number):void
		{
			var cosY:Number = Math.cos(angleY);
			var sinY:Number = Math.sin(angleY);
			
			var x1:Number = x * cosY - z * sinY;
			var z1:Number = z * cosY + x * sinY;
			
			x = x1;
			z = z1;
		}
		
		public function rotateZ(angleZ:Number):void
		{
			var cosZ:Number = Math.cos(angleZ);
			var sinZ:Number = Math.sin(angleZ);
			
			var x1:Number = x * cosZ - y * sinZ;
			var y1:Number = y * cosZ + x * sinZ;
			
			x = x1;
			y = y1;
		}
	}
}