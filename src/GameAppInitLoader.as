public class GameAppInitLoader
{
	public function GameAppInitLoader():void
	{

	}
	public function Load():void
	{
		// 加载B config.xml 中各种xml配置，各种swf资源

		// 临时启动
		.....

	}
	//加载B完成
	private function completeHandler(e:Event):void
	{
		//解析xml模板数据

		//socket连接
		if(!SocketManager.Instance.Connected)
		{
			Alert("服务器连接中....");
			SocketManager.Instance.Connection(Version.Ip,Version.Port,ConnectHandler);
			Controller.AddNotificationListener(SocketDefine.SOCKET_ERROR,SocketErrorHandler);
		}
	}
	//socket连接成功
	private function ConnectHandler(notify:Notification):void
	{
		if(notify.Body)
		{
			//开启登陆界面
			login=new LoginManager;
			login.Load();
		}
	}
}