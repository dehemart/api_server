import 'dart:convert';
import 'package:shelf/shelf.dart';

class DashboardRoute {
  Future<Response> handler(Request req) async {
    // 1. Get the user data that the AuthMiddleware extracted from the JWT
    final user = req.context['user'];

    // 2. Create a response that doesn't rely on reading a request body
    final responseData = {'title': 'dashboard', 'message': 'Welcome to the protected area!', 'userData': user};

    return Response(200, body: jsonEncode(responseData), headers: {'content-type': 'application/json'});
  }
}
