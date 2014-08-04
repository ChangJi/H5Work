public class GameWindow extends Sprite implements IGameWindow
{
	public var scenceLayOut:Sprite=null;
	public var uiLayOut:Sprite=null;
    //游戏层级管理
	public function GameWindow():void
	{
		scenceLayOut=new Sprite;
		scenceLayOut.name="scenceLayOut";
		this.addChild(scenceLayOut);

		uiLayOut=new Sprite;
		uiLayOut.name="uiLayOut";
		this.addChild(uiLayOut);
	}
	public function GetElementByName(ElementName:String):DisplayObject
	{
		var disp:DisplayObject=this.getChildByName(ElementName);
		if(disp!=null) return disp;

		var disp:DisplayObject=this.scenceLayOut.getChildByName(ElementName);
		if(disp!=null) return disp;

		var disp:DisplayObject=this.uiLayOut.getChildByName(ElementName);
		if(disp!=null) return disp;

		return null;
	}

	public function RemoveElement(element:DisplayObject):void
	{
		var disp:DisplayObject=this.getChildByName(element.name);
		if(disp!=null)
		{
			this.removeChild(element);
		}
		var disp:DisplayObject=this.scenceLayOut.getChildByName(element.name);
		if(disp!=null)
		{
			this.scenceLayOut.removeChild(element);
		}
		var disp:DisplayObject=this.uiLayOut.getChildByName(element.name);
		if(disp!=null)
		{
			this.uiLayOut.removeChild(element);
		}
	}

	public function Load():void
	{

	}
	public function Release():void
	{
		
	}
}