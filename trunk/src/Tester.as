package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	//
	import br.ederlima.FlashFoursquare.core.AuthorizationManager;
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class Tester extends MovieClip
	{
		private var _authmanager:AuthorizationManager = new AuthorizationManager();
		private var _authdata:AuthorizationData = new AuthorizationData();
		public function Tester() 
		{
			addEventListener(Event.ADDED_TO_STAGE, initMovie);
		}
		private function initMovie(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initMovie);
			_authdata.key = "4ITKMVICVUJQYL2LSH1LKU2POEJNCN52L1V3WFSYMYXJQ111";
			_authdata.secret = "Y4YP4V5OTSEIW1WEM3R5GIYBGQT5RLB2F0BJW2AD0YC0KZBP";
			_authdata.username = "YOURE-MAIL";
			_authdata.password = "YOUR-PASSWORD";
			_authmanager.getAuthToken(_authdata);
		}
		
	}

}