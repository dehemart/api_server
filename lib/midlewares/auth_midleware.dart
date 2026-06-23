import 'package:api_server/config/env.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

class AuthMidleware {
  Middleware jwtAuthMiddleware() {
    return (Handler innerHandler) {
      return (Request request) async {
        // 1. Extract the Authorization header
        final authHeader = request.headers['Authorization'];
        if (authHeader == null || !authHeader.startsWith('Bearer ')) {
          return Response(401, body: 'Missing or invalid token format');
        }

        final tokenString = authHeader.substring(7); // Remove 'Bearer '

        try {
          // 2. Verify and parse the token
          final verifyKey = SecretKey(Env().jwtSecret);
          final jwt = JWT.decode(tokenString);

          // Ensure the token has not expired and matches our key
          JWT.verify(tokenString, verifyKey);

          // 3. Pass user data down to the handlers via request context
          final updatedRequest = request.change(context: {'user': jwt.payload});

          return await innerHandler(updatedRequest);
        } catch (e) {
          return Response(401, body: 'Invalid or expired token');
        }
      };
    };
  }
}
