package;

import haxe.io.Bytes;
import tink.http.containers.*;
import tink.http.Request;
import tink.http.Response;
import tink.http.Handler;
import tink.http.middleware.*;
import tink.web.routing.*;

using tink.CoreApi;

class Server {
	static function main() {
		
		var root = new Root();
		var router = new Router<MySession, Root>(root);
		
		var handler:Handler = function(req) return router.route(Context.authed(req, MySession.new)).recover(OutgoingResponse.reportError);
		handler = handler.applyMiddleware(new Static('.', '/'));
		
		var container = new NodeContainer(8080);
		container.run(handler);
		
	}
}