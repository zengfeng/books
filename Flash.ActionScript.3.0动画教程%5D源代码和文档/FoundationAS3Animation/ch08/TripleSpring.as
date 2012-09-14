package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class TripleSpring extends Sprite
	{
		private var ball0:Ball;
		private var ball1:Ball;
		private var ball2:Ball;
		private var ball0Dragging:Boolean = false;
		private var ball1Dragging:Boolean = false;
		private var ball2Dragging:Boolean = false;
		private var spring:Number = 0.05;
		private var friction:Number = 0.95;
		private var springLength:Number = 100;
		
		public function TripleSpring()
		{
			init();
		}
		
		private function init():void
		{
			ball0 = new Ball(20);
			ball0.x = Math.random() * stage.stageWidth;
			ball0.y = Math.random() * stage.stageHeight;
			ball0.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			addChild(ball0);
			
			ball1 = new Ball(20);
			ball1.x = Math.random() * stage.stageWidth;
			ball1.y = Math.random() * stage.stageHeight;
			ball1.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			addChild(ball1);
			
			ball2 = new Ball(20);
			ball2.x = Math.random() * stage.stageWidth;
			ball2.y = Math.random() * stage.stageHeight;
			ball2.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			addChild(ball2);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);
		}

		
		private function onEnterFrame(event:Event):void
		{
			if(!ball0Dragging)
			{
				springTo(ball0, ball1);
				springTo(ball0, ball2);
			}
			if(!ball1Dragging)
			{
				springTo(ball1, ball0);
				springTo(ball1, ball2);
			}
			if(!ball2Dragging)
			{
				springTo(ball2, ball0);
				springTo(ball2, ball1);
			}
			graphics.clear();
			graphics.lineStyle(1);
			graphics.moveTo(ball0.x, ball0.y);
			graphics.lineTo(ball1.x, ball1.y);
			graphics.lineTo(ball2.x, ball2.y);
			graphics.lineTo(ball0.x, ball0.y);
		}

		private function springTo(ballA:Ball, ballB:Ball):void
		{
			var dx:Number = ballB.x - ballA.x;
			var dy:Number = ballB.y - ballA.y;
			var angle:Number = Math.atan2(dy, dx);
			var targetX:Number = ballB.x - Math.cos(angle) * springLength;
			var targetY:Number = ballB.y - Math.sin(angle) * springLength;
			ballA.vx += (targetX - ballA.x) * spring;
			ballA.vy += (targetY - ballA.y) * spring;
			ballA.vx *= friction;
			ballA.vy *= friction;
			ballA.x += ballA.vx;
			ballA.y += ballA.vy;
		}
		
		private function onPress(event:MouseEvent):void
		{
			event.target.startDrag();
			if(event.target == ball0)
			{
				ball0Dragging = true;
			}
			if(event.target == ball1)
			{
				ball1Dragging = true;
			}
			if(event.target == ball2)
			{
				ball2Dragging = true;
			}
		}
		
		private function onRelease(event:MouseEvent):void
		{
			ball0.stopDrag();
			ball1.stopDrag();
			ball2.stopDrag();
			ball0Dragging = false;
			ball1Dragging = false;
			ball2Dragging = false;
		}
	}
}
