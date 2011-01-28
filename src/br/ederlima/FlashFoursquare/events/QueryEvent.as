package br.ederlima.FlashFoursquare.events 
{
	import flash.events.Event;
	import flash.xml.XMLDocument;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class QueryEvent extends Event 
	{
		public static const QUERY_RESPONSE:String = "queryResponse";
		public static const QUERY_ERROR:String = "queryError";
		
		private var _data:XML;
		private var _xmlDocument:XMLDocument;
		public function QueryEvent(type:String, data:XML = null, xmlDoc:XMLDocument = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_data = data;
			_xmlDocument = xmlDoc;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new QueryEvent(type, _data, _xmlDocument, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("QueryEvent", "type","XMLData","XMLDocument", "bubbles", "cancelable", "eventPhase"); 
		}
		
		/**
		 * XML data 
		 */
		public function get data():XML { return _data; }
		
		public function set data(value:XML):void 
		{
			_data = value;
		}
		/**
		 * XML XMLDocument
		 */
		public function get xmlDocument():XMLDocument { return _xmlDocument; }
		
		public function set xmlDocument(value:XMLDocument):void 
		{
			_xmlDocument = value;
		}
		
	}
	
}