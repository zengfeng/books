package {
	public class MySubClass extends MyBaseClass {
		override public function sayHello():void {
			Logger.debug("Hola from MySubClass");
		}
		public function sayGoodbye():void {
			Logger.debug("Goodbye from MySubClass");
		}
	}
}