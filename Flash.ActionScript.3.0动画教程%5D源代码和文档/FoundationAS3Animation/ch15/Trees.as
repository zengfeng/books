package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	[SWF(backgroundColor=0x000000)]
	public class Trees extends Sprite
	{
		private var trees:Array;
		private var numTrees:uint = 100;
		private var fl:Number = 250;
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		private var floor:Number = 50;
		private var vz:Number = 0;
		private var friction:Number = 0.98;
		
		public function Trees()
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			trees = new Array();
			for(var i:uint = 0; i < numTrees; i++)
			{
				var tree:Tree = new Tree();
				trees.push(tree);
				tree.xpos = Math.random() * 2000 - 1000;
				tree.ypos = floor;
				tree.zpos = Math.random() * 10000;
				addChild(tree);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onEnterFrame(event:Event):void
		{
			for(var i:uint = 0; i < numTrees; i++)
			{
				var tree:Tree = trees[i];
				move(tree);
			}
			vz *= friction;
			sortZ();
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.UP)
			{
				vz -= 1;
			}
			else if(event.keyCode == Keyboard.DOWN)
			{
				vz += 1;
			}
		}
		
		private function move(tree:Tree):void
		{
			tree.zpos += vz;
			
			if(tree.zpos < -fl)
			{
				tree.zpos += 10000;
			}
			if(tree.zpos > 10000 - fl)
			{
				tree.zpos -= 10000;
			}
			
			var scale:Number = fl / (fl + tree.zpos);
			tree.scaleX = tree.scaleY = scale;
			tree.x = vpX + tree.xpos * scale;
			tree.y = vpY + tree.ypos * scale;
			tree.alpha = scale;
		}
		
		private function sortZ():void
		{
			trees.sortOn("zpos", Array.DESCENDING | Array.NUMERIC);
			for(var i:uint = 0; i < numTrees; i++)
			{
				var tree:Tree = trees[i];
				setChildIndex(tree, i);
			}
		}
	}
}
