package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;

	public class PlayBall extends Sprite
	{
		private var segments:Array;
		private var numSegments:uint = 6;
		private var gravity:Number = 0.5;
		private var bounce:Number = -0.9;
		private var ball:Ball;
		
		public function PlayBall()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			ball = new Ball(20);
			ball.vx = 10;
			addChild(ball);
			segments = new Array();
			for(var i:uint = 0; i < numSegments; i++)
			{
				var segment:Segment = new Segment(50, 10);
				addChild(segment);
				segments.push(segment);
			}
			segment.x = stage.stageWidth / 2;
			segment.y = stage.stageHeight;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			moveBall();
			var target:Point = reach(segments[0], ball.x, ball.y);
			for(var i:uint = 1; i < numSegments; i++)
			{
				var segment:Segment = segments[i];
				target = reach(segment, target.x, target.y);
			}
			for(i = numSegments - 1; i > 0; i--)
			{
				var segmentA:Segment = segments[i];
				var segmentB:Segment = segments[i - 1];
				position(segmentB, segmentA);
			}
			checkHit();
		}
		
		private function reach(segment:Segment, xpos:Number, ypos:Number):Point
		{
			var dx:Number = xpos - segment.x;
			var dy:Number = ypos - segment.y;
			var angle:Number = Math.atan2(dy, dx);
			segment.rotation = angle * 180 / Math.PI;
			
			var w:Number = segment.getPin().x - segment.x;
			var h:Number = segment.getPin().y - segment.y;
			var tx:Number = xpos - w;
			var ty:Number = ypos - h;
			return new Point(tx, ty);
		}
		
		private function position(segmentA:Segment, segmentB:Segment):void
		{
			segmentA.x = segmentB.getPin().x;
			segmentA.y = segmentB.getPin().y;
		}

		private function moveBall():void
		{
			ball.vy += gravity;
			ball.x += ball.vx;
			ball.y += ball.vy;
			if(ball.x + ball.radius > stage.stageWidth)
			{
				ball.x = stage.stageWidth - ball.radius;
				ball.vx *= bounce;
			}
			else if(ball.x - ball.radius < 0)
			{
				ball.x = ball.radius;
				ball.vx *= bounce;
			}
			if(ball.y + ball.radius > stage.stageHeight)
			{
				ball.y = stage.stageHeight - ball.radius;
				ball.vy *= bounce;
			}
			else if(ball.y - ball.radius < 0)
			{
				ball.y = ball.radius;
				ball.vy *= bounce;
			}
		}
		
		public function checkHit():void
		{
			var segment:Segment = segments[0];
			var dx:Number = segment.getPin().x - ball.x;
			var dy:Number = segment.getPin().y - ball.y;
			var dist:Number = Math.sqrt(dx * dx + dy * dy);
			if(dist < ball.radius)
			{
				ball.vx += Math.random() * 2 - 1;
				ball.vy -= 1;
			}
		}
	}
}
