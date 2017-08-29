package;

import tink.http.Request;
using tink.CoreApi;

class MySession {
	
	var header:IncomingRequestHeader;
	
	public function new(header)
		this.header = header;
		
	public function getUser():Promise<Option<{id:String}>> {
		return switch header.url.query.toMap().get('user_id') {
			case null: None;
			case id: Some({id: id.toString()});
		}
		
		// switch header.getAuth() {
		// 	case Success(Bearer(token)): Some({id: token.decode().id});
		// 	case Success(Basic(user, pass)): db.users.find(user, pass).next(Some);
		// 	case _: 
		// 		switch header.getCookie('access_token') {
		// 			case null: None;
		// 			case token: Some({id: token.decode().id});
		// 		}
		// }
	}
}