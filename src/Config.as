public class Config
{
	private static var _falshStage:Stage=null;
	public static function set GameStage(value:Stage):void
	{
		_falshStage=value;
		if(_rootContainer==null)
		_rootContainer=value;
		if(value!=null)
		{
			GameWidth=value.stageWidth;
			GameHeight=value.stageHeight;
		}
	}
	public static function get GameStage():Stage
	{
		return _falshStage;
	}

	private static var _rootContainer:DisplayObjectContainer=null;
	public static function set RootContainer(value:DisplayObjectContainer):void
	{
		_rootContainer=value;
	}
	public static function get RootContainer():DisplayObjectContainer
	{
		return _rootContainer;
	}

	public static var GameWidth:int=1000;
	public static var GameHeight:int=600;
	public static var StartGameTimer:Number;
}