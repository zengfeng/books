package
{
	import flash.display.Graphics;
	
	public class Triangle
	{
		private var pointA:Point3D;
		private var pointB:Point3D;
		private var pointC:Point3D;
		private var color:uint;
		public var light:Light;
		
		public function Triangle(a:Point3D, b:Point3D, c:Point3D, color:uint)
		{
			pointA = a;
			pointB = b;
			pointC = c;
			this.color = color;
		}
		
		public function draw(g:Graphics):void
		{
			if(isBackFace())
			{
				return;
			}
			g.beginFill(getAdjustedColor());
			g.moveTo(pointA.screenX, pointA.screenY);
			g.lineTo(pointB.screenX, pointB.screenY);
			g.lineTo(pointC.screenX, pointC.screenY);
			g.lineTo(pointA.screenX, pointA.screenY);
			g.endFill();
		}
		
		private function getAdjustedColor():uint
		{
			var red:Number = color >> 16;
			var green:Number = color >> 8 & 0xff;
			var blue:Number =color & 0xff;
			
			var lightFactor:Number = getLightFactor();
			
			red *= lightFactor;
			green *= lightFactor;
			blue *= lightFactor;
			
			return red << 16 | green << 8 | blue;
		}
		
		private function getLightFactor():Number
		{
			var ab:Object = new Object();
			ab.x = pointA.x - pointB.x;
			ab.y = pointA.y - pointB.y;
			ab.z = pointA.z - pointB.z;
			
			var bc:Object = new Object();
			bc.x = pointB.x - pointC.x;
			bc.y = pointB.y - pointC.y;
			bc.z = pointB.z - pointC.z;
			
			var norm:Object = new Object();
			norm.x = (ab.y * bc.z) - (ab.z * bc.y);
			norm.y = -((ab.x * bc.z) - (ab.z * bc.x));
			norm.z = (ab.x * bc.y) - (ab.y * bc.x);
			
			var dotProd:Number = norm.x * light.x + 
								 norm.y * light.y + 
								 norm.z * light.z;
			
			var normMag:Number = Math.sqrt(norm.x * norm.x + 
										   norm.y * norm.y +
										   norm.z * norm.z);
			
			var lightMag:Number = Math.sqrt(light.x * light.x +
											light.y * light.y +
											light.z * light.z);
			
			return (Math.acos(dotProd / (normMag * lightMag)) / Math.PI)
					* light.brightness;
		}
		
		private function isBackFace():Boolean
		{
			// see http://www.jurjans.lv/flash/shape.html
			var cax:Number = pointC.screenX - pointA.screenX;
			var cay:Number = pointC.screenY - pointA.screenY;
			
			var bcx:Number = pointB.screenX - pointC.screenX;
			var bcy:Number = pointB.screenY - pointC.screenY;
			
			return cax * bcy > cay * bcx;
		}
		
		public function get depth():Number
		{
			var zpos:Number = Math.min(pointA.z, pointB.z);
			zpos = Math.min(zpos, pointC.z);
			return zpos;
		}
	}
}