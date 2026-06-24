import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:api_server/config/token_denylist.dart';

class SignOutRoute {
  Future<Response> handler(Request req) async {
    final authHeader = req.headers['Authorization'];

    if (authHeader != null && authHeader.startsWith('Bearer ')) {
      final token = authHeader.substring(7);

      TokenDenylist.add(token);
    }

    return Response(
      200,
      body: jsonEncode({'message': 'Successfully signed out.'}),
      headers: {'content-type': 'application/json'},
    );
  }
}
