public class SoundPlayer{
	private var channelBG:SoundChannel=null;
	private var channelEff:SoundChannel=null;

	public static var instance:SoundPlayer=null;
	public static function getInstance():SoundPlayer
	{
		if(instance==null)
		  instance=new SoundPlayer;

		 return instance;
	}

	public function playBG(url:String):void
	{
		if(channelBG!=null)
			channelBG.stop();

		channelBG=createAndPlay(url,int.MAX_VALUE);
	}
	public function playEff(url:String,loops:int=1):void
	{
		if(channelEff!=null)
			channelEff.stop();

		channelEff=createAndPlay(url,loops);
	}

	private function createAndPlay(url:String,loops:int):SoundChannel
	{
		var sound:Sound=new Sound;
		var request:URLRequest=new  URLRequest(url);
		sound.load(request)
		return sound.play(0,loops);
	}

	public function stop():void
	{
		if(channelBG!-null)
			channelBG.stop();

		if(channelEff!=null)
			channelEff.stop();	
	}
}