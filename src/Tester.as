package  
{
	import br.ederlima.FlashFoursquare.FlashFoursquare;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	//
	import br.ederlima.FlashFoursquare.core.AuthorizationManager;
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	import br.ederlima.FlashFoursquare.events.AuthorizationEvent;
	import br.ederlima.FlashFoursquare.events.FlashFoursquareEvent;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class Tester extends MovieClip
	{
		private var _authmanager:AuthorizationManager;
		private var _authdata:AuthorizationData = new AuthorizationData();
		
		
		private var fs:FlashFoursquare = new FlashFoursquare();
		
		public function Tester() 
		{
			addEventListener(Event.ADDED_TO_STAGE, initMovie);
		}
		private function initMovie(event:Event):void
		{
			/*removeEventListener(Event.ADDED_TO_STAGE, initMovie);
			_authdata.key = "4ITKMVICVUJQYL2LSH1LKU2POEJNCN52L1V3WFSYMYXJQ111";
			_authdata.secret = "Y4YP4V5OTSEIW1WEM3R5GIYBGQT5RLB2F0BJW2AD0YC0KZBP";
			_authdata.username = "eder@ederlima.com.br";
			_authdata.password = "!!most!!awesome!!";
			_authmanager.addEventListener(AuthorizationEvent.TOKEN_RECEIVED, tokenReceived);
			_authmanager.addEventListener(AuthorizationEvent.TOKEN_ERROR, tokenError);*/
			//_authmanager.getAuthToken(_authdata);
			fs.authData = new AuthorizationData("eder@ederlima.com.br", "!!most!!awesome!!", "4ITKMVICVUJQYL2LSH1LKU2POEJNCN52L1V3WFSYMYXJQ111", "Y4YP4V5OTSEIW1WEM3R5GIYBGQT5RLB2F0BJW2AD0YC0KZBP");
			fs.addEventListener(FlashFoursquareEvent.AUTHORIZATION_SUCCESS, onSuccess);
			fs.addEventListener(FlashFoursquareEvent.AUTHORIZATION_FAIL, onFail);
			fs.authorize();
		}
		private function tokenError(event:AuthorizationEvent):void
		{
			trace("Error");
		}
		private function tokenReceived(event:AuthorizationEvent):void
		{
			trace(event.token.token, event.token.tokenSecret);
		}
		//
		private function onSuccess(event:FlashFoursquareEvent):void
		{
			_authmanager = AuthorizationManager.getInstance();
			trace("Authorization Ok");
			trace("FlashFoursquare: AuthorizationManager.isAuthorized > ", _authmanager.isAuthorized.toString());
			fs.getFriends();
		}
		private function onFail(event:FlashFoursquareEvent):void
		{
			trace("Authorization Fail");
		}
		
	}

}