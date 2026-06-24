import 'dart:convert';

import 'package:shelf/shelf.dart';

class ProfileRoute {
  Future<Response> handler(Request req) async {
    final user = req.context['user'];

    final responseData = {'title': 'profile', 'message': 'Welcome to the protected area!', 'userData': user};

    return Response(200, body: jsonEncode(responseData), headers: {'content-type': 'application/json'});
  }
}
