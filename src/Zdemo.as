public class Zdemo extends Sprite
{
	public function Zdemo()
	{
		this.addEventListener(Event.ADD_TO_STAGE,toStage);
	}

	private function toStage(e:Event):void
	{
		stage.showDefaultContextMenu=false;
		stage.align=StageAlign.TOP_LEFT;
		stage.scaleMode=StageScaleMode.NO_SCALE;

		// 版本配置 Version
		// Config资源配置

		//无配置文件
		this.removeEventListener(Event.ADD_TO_STAGE,toStage);
		var _stage:Stage=Config.GameStage?Config.GameStage:this.stage;
		GameSDK.Instance.MainWindow=new GameWindow();
		GameSDK.Instance.Run(_stage,this,_stage.stageWidth,_stage.stageHeight);
		var gameInit:GameAppInitLoader=new GameAppInitLoader();
		gameInit.load();
	}

	//配置加载完成
	private function loadComplete(e:Event):void
	{
		this.removeEventListener(Event.ADD_TO_STAGE,toStage);
		var _stage:Stage=Config.GameStage?Config.GameStage:this.stage;
		GameSDK.Instance.MainWindow=new GameWindow();
		GameSDK.Instance.Run(_stage,this,_stage.stageWidth,_stage.stageHeight);
		var gameInit:GameAppInitLoader=new GameAppInitLoader();
		gameInit.load();
	}
}