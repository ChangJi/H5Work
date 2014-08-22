public class SoundUtils{
	public static var _sysStop:Boolean=false;

	public function SoundUtils():void
	{

	}
	public static function get sysStop():Boolean
	{
		return _sysStop;
	}
	public static function set sysStop(value:Boolean):void
	{
		_sysStop=value;
		if(_sysStop)
		{
			SoundPlayer,getInstance.stop();
		}else{
			play();
		}
	}
	public static function play():void
	{
		SoundPlayer,getInstance.stop();
		if(sysStop)
		{
			return;
		}
		SoundPlayer,getInstance.playBG(....);
	}
}
