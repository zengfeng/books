package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.events.Event;
	
	public class SimpleSlider extends Sprite
	{
		private var _width:Number = 16;
		private var _height:Number = 100;
		private var _value:Number;
		private var _max:Number = 100;
		private var _min:Number = 0;
		private var _handle:Sprite;
		private var _back:Sprite;
		private var _backWidth:Number = 4;
		private var _handleHeight:Number = 6;
		private var _backColor:uint = 0xcccccc;
		private var _backBorderColor:uint = 0x999999;
		private var _handleColor:uint = 0xeeeeee;
		private var _handleBorderColor:uint = 0xcccccc;
		private var _handleRadius:Number = 2;
		private var _backRadius:Number = 2;
		
		public function SimpleSlider(min:Number=0, max:Number=100, value:Number=100)
		{
			_min = min;
			_max = max;
			_value = Math.min(Math.max(value, min), max)
			init();
		}
		
		private function init():void
		{
			_back = new Sprite();
			addChild(_back);
			
			_handle = new Sprite();
			addChild(_handle);
			_handle.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			
			draw();
			updatePosition();
		}
		
		private function draw():void
		{
			drawBack();
			drawHandle();
		}
		
		private function drawBack():void
		{
			_back.graphics.clear();
			_back.graphics.beginFill(_backColor);
			_back.graphics.lineStyle(0, _backBorderColor);
			_back.graphics.drawRoundRect(0, 0, _backWidth, _height, _backRadius, _backRadius);
			_back.graphics.endFill();
			_back.x = _width / 2 - _backWidth / 2;
		}
		
		private function drawHandle():void
		{
			_handle.graphics.clear();
			_handle.graphics.beginFill(_handleColor);
			_handle.graphics.lineStyle(0, _handleBorderColor);
			_handle.graphics.drawRoundRect(0, 0, _width, _handleHeight, _handleRadius, _handleRadius);
			_handle.graphics.endFill();
		}
	
		private function updatePosition():void
		{
			var handleRange:Number = _height - _handleHeight;
			var valueRange:Number = _max - _min;
			_handle.y = handleRange - (_value - _min) / valueRange * handleRange;
		}
		
		private function updateValue():void
		{
			var handleRange:Number = _height - _handleHeight;
			var valueRange:Number = _max - _min;
			_value = (handleRange - _handle.y) / handleRange * valueRange + _min;
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_handle.stopDrag();
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_handle.startDrag(false, new Rectangle(0, 0, 0, _height - _handleHeight));
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			updateValue();
		}


		
		public function invalidate():void
		{
			draw();
		}
		
		public function move(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		
		public function setSize(w:Number, h:Number):void
		{
			_width = w;
			_height = h;
			draw();
		}
		
		
		
		
		
		
		public function set backBorderColor(n:uint):void
		{
			_backBorderColor = n;
			draw();
		}
		public function get backBorderColor():uint
		{
			return _backBorderColor;
		}
		
		public function set backColor(n:uint):void
		{
			_backColor = n;
			draw();
		}
		public function get backColor():uint
		{
			return _backColor;
		}
		
		public function set backRadius(n:Number):void
		{
			_backRadius = n;
		}
		public function get backRadius():Number
		{
			return _backRadius;
		}
		
		public function set backWidth(n:Number):void
		{
			_backWidth = n;
			draw();
		}
		public function get backWidth():Number
		{
			return _backWidth;
		}
		
		public function set handleBorderColor(n:uint):void
		{
			_handleBorderColor = n;
			draw();
		}
		public function get handleBorderColor():uint
		{
			return _handleBorderColor;
		}
		
		public function set handleColor(n:uint):void
		{
			_handleColor = n;
			draw();
		}
		public function get handleColor():uint
		{
			return _handleColor;
		}
		
		public function set handleRadius(n:Number):void
		{
			_handleRadius = n;
			draw();
		}
		public function get handleRadius():Number
		{
			return _handleRadius;
		}
		
		public function set handleHeight(n:Number):void
		{
			_handleHeight = n;
			draw();
			updatePosition();
		}
		public function get handleHeight():Number
		{
			return _handleHeight;
		}
		
		override public function set height(n:Number):void
		{
			_height = n;
			draw();
		}
		override public function get height():Number
		{
			return _height;
		}
		
		public function set max(n:Number):void
		{
			_max = n;
			updatePosition();
		}
		public function get max():Number
		{
			return _max;
		}
		
		public function set min(n:Number):void
		{
			_min = n;
			updatePosition();
		}
		public function get min():Number
		{
			return _min;
		}
		
		public function set value(n:Number):void
		{
			_value = n;
			_value = Math.min(_max, Math.max(_value, _min));
			updatePosition();
		}
		public function get value():Number
		{
			return _value;
		}
		
		override public function set width(n:Number):void
		{
			_width = n;
			draw();
		}
		override public function get width():Number
		{
			return _width;
		}
	}
}