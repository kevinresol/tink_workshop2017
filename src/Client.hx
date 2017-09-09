package;

import tink.http.clients.*;
import tink.web.proxy.Remote;
import tink.url.Host;

class Client {
	static function main() {
		var remote = new Remote<Root>(new JsClient(), new RemoteEndpoint(new Host('localhost', 8080)));
		remote.hello({name: 'Haxe'}).handle(function(o) switch o {
			case Success(result): trace($type(result));
			case Failure(e): trace(e);
		});
	}
}