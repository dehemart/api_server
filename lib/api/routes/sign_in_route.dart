import 'package:api_server/config/env.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

class SignInRoute {
  Future<Response> handler(Request req) async {
    final jwt = JWT({'userId': '12345', 'role': 'admin'}, issuer: 'https://yourdomain.com');

    final token = jwt.sign(SecretKey(Env().jwtSecret), expiresIn: Duration(minutes: Env().jwtRefreshExpiresMinuts));

    return Response.ok('{"token": "$token"}', headers: {'content-type': 'application/json'});
  }
}
