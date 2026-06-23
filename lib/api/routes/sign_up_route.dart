import 'dart:convert';

import 'package:shelf/shelf.dart';

class SignUpRoute {
  Future<Response> handler(Request req) async {
    final payload = await req.readAsString();
    final Map<String, dynamic> jsonMap = jsonDecode(payload);

    if (jsonMap.containsKey('password')) {
      jsonMap['password'] = "********";
    }

    return Response(
      201,
      body: jsonEncode(jsonMap),
      headers: {'content-type': 'application/json', 'location': '/users/123'},
    );
  }
}
