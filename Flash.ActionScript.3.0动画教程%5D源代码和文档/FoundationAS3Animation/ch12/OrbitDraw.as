package {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.geom.Point;

	public class OrbitDraw extends Sprite
	{
		private var particles:Array;
		private var numParticles:uint = 2;
		
		public function OrbitDraw()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			particles = new Array();
			
			var sun:Ball = new Ball(100, 0xffff00);
			sun.x = stage.stageWidth / 2;
			sun.y = stage.stageHeight / 2;
			sun.mass = 10000;
			addChild(sun);
			particles.push(sun);
			  
			var planet:Ball = new Ball(10, 0x00ff00);
			planet.x = stage.stageWidth / 2 + 200;
			planet.y = stage.stageHeight / 2;
			planet.vy = 7;
			planet.mass = 1;
			addChild(planet);
			particles.push(planet);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			graphics.lineStyle(1, 0, .5);
			graphics.moveTo(planet.x, planet.y);
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
					checkCollision(partA, partB);
					gravitate(partA, partB);
				}
			}
			graphics.lineTo(particles[1].x, particles[1].y);
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
		
		private function checkCollision(ball0:Ball, ball1:Ball):void
		{
			var dx:Number = ball1.x - ball0.x;
			var dy:Number = ball1.y - ball0.y;
			var dist:Number = Math.sqrt(dx*dx + dy*dy);
			if(dist < ball0.radius + ball1.radius)
			{
				// calculate angle, sine and cosine
				var angle:Number = Math.atan2(dy, dx);
				var sin:Number = Math.sin(angle);
				var cos:Number = Math.cos(angle);
				
				// rotate ball0's position
				var pos0:Point = new Point(0, 0);
				
				// rotate ball1's position
				var pos1:Point = rotate(dx, dy, sin, cos, true);
				
				// rotate ball0's velocity
				var vel0:Point = rotate(ball0.vx,
										ball0.vy,
										sin,
										cos,
										true);
				
				// rotate ball1's velocity
				var vel1:Point = rotate(ball1.vx,
										ball1.vy,
										sin,
										cos,
										true);
				
				// collision reaction
				var vxTotal:Number = vel0.x - vel1.x;
				vel0.x = ((ball0.mass - ball1.mass) * vel0.x + 
				          2 * ball1.mass * vel1.x) / 
				          (ball0.mass + ball1.mass);
				vel1.x = vxTotal + vel0.x;

				// update position
				var absV:Number = Math.abs(vel0.x) + Math.abs(vel1.x);
				var overlap:Number = (ball0.radius + ball1.radius) 
				                      - Math.abs(pos0.x - pos1.x);
				pos0.x += vel0.x / absV * overlap;
				pos1.x += vel1.x / absV * overlap;
				
				// rotate positions back
				var pos0F:Object = rotate(pos0.x,
										  pos0.y,
										  sin,
										  cos,
										  false);
										  
				var pos1F:Object = rotate(pos1.x,
										  pos1.y,
										  sin,
										  cos,
										  false);

				// adjust positions to actual screen positions
				ball1.x = ball0.x + pos1F.x;
				ball1.y = ball0.y + pos1F.y;
				ball0.x = ball0.x + pos0F.x;
				ball0.y = ball0.y + pos0F.y;
				
				// rotate velocities back
				var vel0F:Object = rotate(vel0.x,
										  vel0.y,
										  sin,
										  cos,
										  false);
				var vel1F:Object = rotate(vel1.x,
										  vel1.y,
										  sin,
										  cos,
										  false);
				ball0.vx = vel0F.x;
				ball0.vy = vel0F.y;
				ball1.vx = vel1F.x;
				ball1.vy = vel1F.y;
			}
		}
		
		private function rotate(x:Number,
								y:Number,
								sin:Number,
								cos:Number,
								reverse:Boolean):Point
		{
			var result:Point = new Point();
			if(reverse)
			{
				result.x = x * cos + y * sin;
				result.y = y * cos - x * sin;
			}
			else
			{
				result.x = x * cos - y * sin;
				result.y = y * cos + x * sin;
			}
			return result;
		}		
	}
}
