package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class RotateXY extends Sprite
	{
		private var balls:Array;
		private var numBalls:uint = 50;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function RotateXY()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			balls = new Array();
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball3D = new Ball3D(15);
				balls.push(ball);
				ball.xpos = Math.random() * 200 - 100;
				ball.ypos = Math.random() * 200 - 100;
				ball.zpos = Math.random() * 200 - 100;
				addChild(ball);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var angleX:Number = (mouseY - vpY) * .001;
			var angleY:Number = (mouseX - vpX) * .001;
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball3D = balls[i];
				rotateX(ball, angleX);
				rotateY(ball, angleY);
				doPerspective(ball);
			}
			sortZ();
		}
		
		private function rotateX(ball:Ball3D, angleX:Number):void
		{
			var position:Array = [ball.xpos, ball.ypos, ball.zpos];
			
			var sin:Number = Math.sin(angleX);
			var cos:Number = Math.cos(angleX);
			var xRotMatrix:Array = new Array();
			xRotMatrix[0] = [1,    0,   0];
			xRotMatrix[1] = [0,  cos, sin];
			xRotMatrix[2] = [0, -sin, cos]
			
			var result:Array = matrixMultiply(position, xRotMatrix);
			ball.xpos = result[0];
			ball.ypos = result[1];
			ball.zpos = result[2];
		}
		
		private function rotateY(ball:Ball3D, angleY:Number):void
		{
			var position:Array = [ball.xpos, ball.ypos, ball.zpos];
			
			var sin:Number = Math.sin(angleY);
			var cos:Number = Math.cos(angleY);
			var yRotMatrix:Array = new Array();
			yRotMatrix[0] = [ cos, 0, sin];
			yRotMatrix[1] = [   0, 1,   0];
			yRotMatrix[2] = [-sin, 0, cos]
			
			var result:Array = matrixMultiply(position, yRotMatrix);
			ball.xpos = result[0];
			ball.ypos = result[1];
			ball.zpos = result[2];
		}
		
		private function matrixMultiply(matrixA:Array, matrixB:Array):Array
		{
			var result:Array = new Array();
			result[0] = matrixA[0] * matrixB[0][0] + 
						matrixA[1] * matrixB[1][0] +
						matrixA[2] * matrixB[2][0];
			
			result[1] = matrixA[0] * matrixB[0][1] +
						matrixA[1] * matrixB[1][1] +
						matrixA[2] * matrixB[2][1];
			
			result[2] = matrixA[0] * matrixB[0][2] +
						matrixA[1] * matrixB[1][2] +
						matrixA[2] * matrixB[2][2];
			return result;
		}
		
		private function doPerspective(ball:Ball3D):void
		{			
			if(ball.zpos > -fl)
			{
				var scale:Number = fl / (fl + ball.zpos);
				ball.scaleX = ball.scaleY = scale;
				ball.x = vpX + ball.xpos * scale;
				ball.y = vpY + ball.ypos * scale;
				ball.visible = true;
			}
			else
			{
				ball.visible = false;
			}
		}
		
		private function sortZ():void
		{
			balls.sortOn("zpos", Array.DESCENDING | Array.NUMERIC);
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball3D = balls[i];
				setChildIndex(ball, i);
			}
		}
	}
}
