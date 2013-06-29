package
{
	import com.gordon.ILL;
	import com.wujinhong.Customise;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.utils.setTimeout;
	
	import impl.TestImpl;

	/**
	 * @author Gordon
	 */	
	[SWF(width="1000", height="800", backgroundColor="#000000", frameRate="48")]
	public class Test extends MovieClip implements ILL
	{
		private var ss:Shape;
		private var _trail:trail;
		private var tf:TextField;
		private var custom:DisplayObject;
		public function Test()
		{
			this.stop();
			tf = new TextField();
			tf.htmlText = "<TEXTFORMAT LEADING='3'><P ALIGN='LEFT'><FONT FACE='SimSun' SIZE='14' COLOR='#00FF00' LETTERSPACING='0' KERNING='0'>123" +
				"<FONT SIZE='12' COLOR='#FF0000'><B>马夫</B></FONT>" +
				"</FONT></P></TEXTFORMAT>";
			addChild(tf);
			ss = new Shape();
			
			trace(length);
			ss.graphics.beginFill(0x000000,.5);
			ss.graphics.drawCircle(0,0,50);
			ss.graphics.endFill();
			addChild(ss);
			ss.x = ss.y = 50;
			ss.cacheAsBitmap = true;
//			this.addEventListener(Event.ENTER_FRAME,lldf);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,llddf);
			
			trace(length);
			_trail = new trail();
			addChild(_trail);
			_trail.y = 700;
			stage.addEventListener(MouseEvent.RIGHT_CLICK,noMenu);
			
			ll();
			ssf();
		}
		
		public function ll():void
		{
			if (TestImpl.get().hasOwnProperty("dizzy"))
			{
				trace( 123546, "hasOwnProperty(\"dizzy\")" );
			}
			if (TestImpl.get().hasOwnProperty("str"))
			{
				trace(123546);
			}
			if (TestImpl.get().hasOwnProperty("s")) 
			{
				trace(123546);
			}
			
			var args:Vector.< String > = new Vector.<String>( 5, true );
			args.push( "CRC_RES_LIST_FILE_PATH" );
			args.push( "RES_CRC_LIST_FILE_PATH" );
		}
		
		protected function noMenu(e:MouseEvent):void
		{
			// Number of symbols to add.
			const NUM_SYMBOLS:uint = 75;
			
			var symbolsArray:Array = [];
			var idx:uint;
			var flake:Snow;
			
			for (idx = 0; idx < NUM_SYMBOLS; idx++) {
				flake = new Snow();
				addChild(flake);
				symbolsArray.push(flake);
				// Call randomInterval() after 0 to a given ms.
				setTimeout(randomInterval, int(Math.random() * 10000), flake);
			}
			
			function randomInterval(target:Snow):void
			{
				// Set the current Snow instance's x and y property 
				target.x = Math.random()* 550-50;
				target.y = -Math.random() * 200;
				
				//randomly scale the x and y
				var ranScale:Number = Math.random() * 3;
				target.scaleX = ranScale;
				target.scaleY = ranScale;
				
				var tween:String;
				// ranScale is between 0.0 and 1.0
				if (ranScale < 1)
				{
					_trail.slow.addTarget(target);
				}
				else if (ranScale < 2)
				{
					_trail.medium.addTarget(target);
				}
				else
				{
					_trail.fast.addTarget(target);
				}
			}
		}
		/**
		 *实现接口方法 
		 */		
		public function ssf():void
		{
			addForTest();
		}
		private function slash():void
		{
			var link:String = "F:\FlasCC\samples\01_HelloWorld";
			if ( -1 != Capabilities.os.search( /Windows/ ) )
			{
				while ( -1 != link.search( /\\/ ) )
				{
					link = link.replace( /\\/, "/" );
				}
			}
			if ( link.charAt() != "/" )
			{
				link = "/" + link;
			}
		}
		private function addForTest():void
		{
			custom = new Customise() as DisplayObject;
			addChild( custom );
			custom.x = custom.y = 100;
			
			root_stage_parent();
		}
		/**
		 *区分 root stage parent this
		 */		
		private function root_stage_parent():void
		{
			if ( custom.root == custom.stage )
			{
				trace( "custom.root == custom.stage" );
			}
			if ( custom.root == custom.parent )
			{
				trace( "custom.root == custom.parent" );
			}
			if(this.parent == this.root)
			{
				trace( "this.parent == this.root" );
			}
			if(this == this.root)
			{
				trace( "this == this.root" );
			}
			if(this.parent is Stage)
			{
				trace( "this.parent is Stage" );
			}
			else
			{
				trace( "this.parent is not Stage" );
			}
		}
		
		protected function llddf(e:MouseEvent):void
		{
			ss.x = e.localX;
			ss.y = e.localY;
			ss.width += Math.random();
			ss.filters = [new GlowFilter(Math.random()*0xFFFFFF)];
			trace(e.localX,e.localY,e.stageX,e.stageY,e.movementX,e.movementY);
		}
		/**
		 *实现接口方法 
		 */
		protected function lldf(e:Event):void
		{
			ss.x = Math.random() * 15;
			ss.y = Math.random() * 15;
		}
	}
}