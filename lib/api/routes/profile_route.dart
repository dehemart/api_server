import 'dart:convert';

import 'package:shelf/shelf.dart';

class ProfileRoute {
  Future<Response> handler(Request req) async {
    final payload = await req.readAsString();
    final Map<String, dynamic> jsonMap = jsonDecode(payload);

    final titleEntry = <String, String>{'title': 'profile'};
    jsonMap.addEntries(titleEntry.entries);

    return Response(
      200,
      body: jsonEncode(jsonMap),
      headers: {'content-type': 'application/json', 'location': '/users/123'},
    );
  }
}
