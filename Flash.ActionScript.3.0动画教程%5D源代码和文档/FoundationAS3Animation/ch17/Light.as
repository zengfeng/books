package
{
	public class Light
	{
		public var x:Number;
		public var y:Number;
		public var z:Number;
		private var _brightness:Number;
		
		public function Light(x:Number = -100, y:Number = -100, z:Number = -100, brightness:Number = 1)
		{
			this.x = x;
			this.y = y;
			this.z = z;
			this.brightness = brightness;
		}
		
		public function set brightness(b:Number):void
		{
			_brightness = Math.max(b, 0);
			_brightness = Math.min(_brightness, 1);
		}
		
		public function get brightness():Number
		{
			return _brightness;
		}
	}
}