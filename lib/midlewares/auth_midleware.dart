import 'package:api_server/config/env.dart';
import 'package:api_server/config/token_denylist.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

class AuthMidleware {
  Middleware jwtAuthMiddleware() {
    return (Handler innerHandler) {
      return (Request request) async {
        final authHeader = request.headers['Authorization'];
        if (authHeader == null || !authHeader.startsWith('Bearer ')) {
          return Response(401, body: 'Missing or invalid token format');
        }

        final tokenString = authHeader.substring(7);

        if (TokenDenylist.contains(tokenString)) {
          return Response(401, body: 'Token has been revoked (Signed Out)');
        }

        late JWT jwt;

        try {
          final verifyKey = SecretKey(Env().jwtSecret);
          jwt = JWT.verify(tokenString, verifyKey);
        } catch (e) {
          return Response(401, body: 'Invalid or expired token');
        }

        final updatedRequest = request.change(context: {'user': jwt.payload});
        return await innerHandler(updatedRequest);
      };
    };
  }
}
