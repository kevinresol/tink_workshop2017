package;

using tink.CoreApi;

class Root {
	
	public function new() {}
	
	@:get('/')
	public function hello(query:{name:String}) {
		return {
			greetings: 'Hello, ${query.name}!',
		}
	}
	
	@:get('/apples/$number')
	public function apples(number:Int) {
		return {
			message: 'There are $number apple(s)',
		}
	}
	
	@:post
	public function post(body:{message:String})
		return {
			message: 'Got message: ${body.message}',
		}
	
	@:get
	public var version = {
		major: 1,
		minor: 0,
		patch: 0,
	}
	
	@:get('/delay/$seconds')
	public function async(seconds:Int) {
		// do any async stuff: read database, read file, perform http requests, etc
		// tink_web routes support sync values, Future and Promise
		return Future.async(function(cb) {
			haxe.Timer.delay(cb.bind('Delayed $seconds second(s)'), seconds * 1000);
		});
	}
	
	@:sub('/sub')
	public var sub = new Sub();
}

class Sub {
	public function new() {}
	
	@:get('/$foo')
	public function get(foo:String) {
		return 'Sub $foo';
	}
}