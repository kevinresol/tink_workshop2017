package;

import tink.unit.Assert.assert;
import tink.unit.TestBatch;
import tink.testrunner.Runner;
import tink.http.containers.*;
import tink.http.clients.*;
import tink.http.Request;
import tink.http.Response;
import tink.web.routing.*;

using tink.io.Source;

class RunTests {
	static function main() {
		Runner.run(TestBatch.make([
			new Test(),
		])).handle(Runner.exit);
	}
}

class Test {
	public function new() {}
	
	public function internalSync() {
		return assert(new Root().me({id: 'user-id'}).id == 'user-id');
	}
	
	public function internalAsync() {
		return new Root().async(1)
			.next(function(ret) return assert(ret == 'Delayed 1 second(s)'));
	}
	
	public function external() {
		var container = new LocalContainer();
		var client = new LocalContainerClient(container);
		var root = new Root();
		var router = new Router<MySession, Root>(root);
		container.run(function(req) return router.route(Context.authed(req, MySession.new)).recover(OutgoingResponse.reportError));
		
		return client.request(new OutgoingRequest(new OutgoingRequestHeader(GET, '/me?user_id=123', []), ''))
			.next(function(res) return res.body.all())
			.next(function(chunk) return tink.Json.parse((chunk.toString():{id:String})))
			.next(function(parsed) return assert(parsed.id == '123'));
	}
}