public class Notification extends Event
{
	private static var CurrentToken:int=0;

	private var Token:int=0;

	public function get Type():String
	{
		return super.type;
	}

	public function get Name():String
	{
		return super.type;
	}

	public var Body:*=null;

	public function Notification(type:String,body:*=null)
	{
		super(type);
		this.Body=body;
		this.Token=CurrentToken++;
	}

	//简化发送 完全等同于 Controller
	public function Send(IgnoreMapping:Boolean=false):void
	{
		Controller.Instance.SendCustomNotification(this,IgnoreMapping);
	}
}