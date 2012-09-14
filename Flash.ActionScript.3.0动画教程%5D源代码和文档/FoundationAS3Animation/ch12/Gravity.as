package {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;

	public class Gravity extends Sprite
	{
		private var particles:Array;
		private var numParticles:uint = 30;
		
		public function Gravity()
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
				var particle:Ball = new Ball(5);
				particle.x = Math.random() * stage.stageWidth;
				particle.y = Math.random() * stage.stageHeight;
				particle.mass = 1;
				addChild(particle);
				particles.push(particle);
			}
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			for(var i:uint = 0; i < numParticles; i++)
			{
				var particle:Ball = particles[i];
				particle.x += particle.vx;
				particle.y += particle.vy;
			}
			for(i=0; i < numParticles - 1; i++)
			{
				var partA:Ball = particles[i];
				for(var j:uint = i + 1; j < numParticles; j++)
				{
					var partB:Ball = particles[j];
					gravitate(partA, partB);
				}
			}
		}
		
		private function gravitate(partA:Ball, partB:Ball):void
		{
			var dx:Number = partB.x - partA.x;
			var dy:Number = partB.y - partA.y;
			var distSQ:Number = dx*dx + dy*dy;
			var dist:Number = Math.sqrt(distSQ);
			var force:Number = partA.mass * partB.mass / distSQ;
			var ax:Number = force * dx / dist;
			var ay:Number = force * dy / dist;
			partA.vx += ax / partA.mass;
			partA.vy += ay / partA.mass;
			partB.vx -= ax / partB.mass;
			partB.vy -= ay / partB.mass;
		}
	}
}
