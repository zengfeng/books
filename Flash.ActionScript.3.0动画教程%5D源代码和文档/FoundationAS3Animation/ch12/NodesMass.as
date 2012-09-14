package {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.geom.Point;

	[SWF(backgroundColor=0x000000)]
	public class NodesMass extends Sprite
	{
		private var particles:Array;
		private var numParticles:uint = 30;
		private var minDist:Number = 100;
		private var springAmount:Number = .0025;
		
		public function NodesMass()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			particles = new Array();
			for(var i:uint = 0; i < numParticles; i++)
			{
				var size:Number = Math.random() * 10 + 2;
				var particle:Ball = new Ball(size, 0xffffff);
				particle.x = Math.random() * stage.stageWidth;
				particle.y = Math.random() * stage.stageHeight;
				particle.vx = Math.random() * 6 - 3;
				particle.vy = Math.random() * 6 - 3;
				particle.mass = size;
				addChild(particle);
				particles.push(particle);
			}
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event:Event):void
		{
			graphics.clear();
			for(var i:uint = 0; i < numParticles; i++)
			{
				var particle:Ball = particles[i];
				particle.x += particle.vx;
				particle.y += particle.vy;
				if(particle.x > stage.stageWidth)
				{
					particle.x = 0;
				}
				else if(particle.x < 0)
				{
					particle.x = stage.stageWidth;
				}
				if(particle.y > stage.stageHeight)
				{
					particle.y = 0;
				}
				else if(particle.y < 0)
				{
					particle.y = stage.stageHeight;
				}
			}
			  
			for(i=0; i < numParticles - 1; i++)
			{
				var partA:Ball = particles[i];
				for(var j:uint = i + 1; j < numParticles; j++)
				{
					var partB:Ball = particles[j];
					spring(partA, partB);
				}
			}
		}
		
		private function spring(partA:Ball, partB:Ball):void
		{
			var dx:Number = partB.x - partA.x;
			var dy:Number = partB.y - partA.y;
			var dist:Number = Math.sqrt(dx * dx + dy * dy);
			if(dist < minDist)
			{
				graphics.lineStyle(1, 0xffffff, 1 - dist / minDist);
				graphics.moveTo(partA.x, partA.y);
				graphics.lineTo(partB.x, partB.y);
				var ax:Number = dx * springAmount;
				var ay:Number = dy * springAmount;
				partA.vx += ax / partA.mass;
				partA.vy += ay / partA.mass;
				partB.vx -= ax / partB.mass;
				partB.vy -= ay / partB.mass;
			}
		}
	}
}
