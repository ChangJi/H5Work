public class GameSDK
{
	public function GameSDK():void
	{

	}

	private static var g_Instance:GameSDK=null;

	public static function get Instance():GameSDK
	{
		if(!g_Instance)
			g_Instance=new GameSDK();
		return g_Instance;
	}

	private var root:DisplayObjectContainer=null;

	private var mainWindow:IGameWindow=null;
	public function get MainWindow():IGameWindow
	{
		return mainWindow;
	}
	public function set MainWindow(value:IGameWindow):void
	{
		if(mainWindow!=null)
		{
			if(mainWindow is DisplayObject && (mainWindow as DisplayObject).parent!=null)
			{
				Config.RootContainer.removeChild(mainWindow as DisplayObject);
			}
			mainWindow.Release();
		}

		if(value==null)
		{
			mainWindow=null;
			return;
		}

		//设置新的mainWindow
		this.mainWindow=value;
		//mainWindow.Load(); // 目前没什么用

		//if(mainWindow is DisplayObject)
		//{
		//	if(Config.RootContainer!=null)
		//	{
		//		Config.RootContainer.addChild(mainWindow as DisplayObject);
		//		if(Config.RootContainer.numChildren>1)
		//		{
		//			Config.RootContainer.swapChildrenAt(0,1);
		//		}
		//	}
		//} 
	} 

	//XML数据管理器
	//public function getTemplateManager():TemplateManager
	//{
	//	return TemplateManager.Instance;
	//}
	//主UI管理器
	//public function getMainUIManager():MainUIManager
	//{
	//	return MainUIManager.Instance;
	//}
	//弹出窗体管理器
	//public function getWindowManager():WindowManager
	//{
	//	return WindowManager.Instance;
	//}
	//加载管理器 缓存中
	//public function getResourceManager():ResourceManager
	//{
	//	return ResourceManager.Instance;
	//}

	public function Run(stage:Stage,rootContainer:DisplayObjectContainer=null;width:int=1000,height:int=600):void
	{
		stage.align=StageAlign.TOP_LEFT;
		stage.scaleMode=StageScaleMode.NO_SCALE;
		stage.stageFocusRect=false;

		Config.GameStage=stage;

		root=rootContainer;
		Config.GameStage.addEventListener(Event.ENTER_FRAME,enterFrameHandler);
	}

	private function enterFrameHandler(e:Event):void
	{
		if(Config.GameStage.stageHeight>0)
		{
			Config.GameStage.removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
			if(Config.GameStage==null)
			{
				throw new Error("Stage no exist!");
				return;
			}

			if(root!=null)
			{
				Config.RootContainer=root;
			}

			if(this.mainWindow!=null && this.mainWindow is DisplayObject && (this.mainWindow as DisplayObject).parent==null)
			{
				Config.RootContainer.addChild(this.mainWindow as DisplayObject);
			}

			Config.GameWidth=Config.GameStage.stageWidth;
			Config.GameHeight=Config.GameStage.stageHeight;

			Config.StartGameTimer=flash.utils.getTimer();
		}
	}

	//此方法可有可无，一直不会执行
	protected function OnRelease():void
	{
		if(MainWindow)
		{
			MainWindow.Release();
			MainWindow=null;
		}
	}

	public function Exit():void
	{
		OnRelease();
	}
}