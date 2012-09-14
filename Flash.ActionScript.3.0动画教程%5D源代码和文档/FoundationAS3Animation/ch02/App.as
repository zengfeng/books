package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class App extends Sprite
	{
		
		public function App()
		{
			init();
		}
		
		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			var base:MyBaseClass = new MyBaseClass();
			base.sayHello();
			
			var sub:MySubClass = new MySubClass();
			sub.sayHello();
			sub.sayGoodbye(); 
		}
	}
}
