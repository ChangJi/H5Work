public final class Controller
{
	//调试级别 0从不调试 1显示全部调用信息
	public var DebugLevel:int=0;

	private var eventDispatcher:EventDispatcher=new EventDispatcher();
	//单例
	private static var g_Instance:Controller;

	public static function get Instance():Controller
	{
		if(g_Instance==null)
		{
			g_Instance=new Controller();
		}
		return g_Instance;
	}
	public function Controller():void
	{
		if(g_Instance!=null)
		{
			throw new Error("不能实例化 Controller");
		}
	}

	public function HasNotificationHandler(notificationName:String,IgnoreMapping:Boolean=false):Boolean
	{
		if(this.eventDispatcher.hasEventListener(notificationName))
			return true;
		return false;	
	}
	public function AddNotificationListener(notificationName:String,listener:Function):void
	{
		this.eventDispatcher.addEventListsner(notificationName,listener);
	}
	public function RemoveNotificationListener(notificationName:String,listener:Function):void
	{
		this.eventDispatcher.removeEventListsner(notificationName,listener);
	}

	public function SendNotification(notification:Notification,body:*=null,IgnoreMapping:Boolean=false):void
	{
		this.SendCustomNotification(new Notification(notificationName,body),IgnoreMapping);
	}
	private function SendCustomNotification(notification:Notification,IgnoreMapping:Boolean=false):void
	{
		//处理 IgnoreMapping

		doHandleByEventDispatch(notification);
	}
	private function doHandleByEventDispatch(notification:Notification):void
	{
		if(this.eventDispatcher.hasEventListener(notification.Name))
		{
			this.eventDispatcher.dispatchEvent(notification);
		}
	}

}