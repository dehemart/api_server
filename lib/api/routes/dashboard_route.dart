import 'dart:convert';
import 'package:shelf/shelf.dart';

class DashboardRoute {
  Future<Response> handler(Request req) async {
    final user = req.context['user'];

    final responseData = {'title': 'dashboard', 'message': 'Welcome to the protected area!', 'userData': user};

    return Response(200, body: jsonEncode(responseData), headers: {'content-type': 'application/json'});
  }
}
