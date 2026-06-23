import 'dart:io';

import 'package:shelf/shelf_io.dart';
import 'package:api_server/api/routes.dart';
import 'package:api_server/config/env.dart';

void main(List<String> args) async {
  dotEnv.load(['.env']);
  final env = Env();

  final handler = Routes().handler();

  final address = InternetAddress.anyIPv4.address;
  final port = int.parse(env.serverPort);

  final server = await serve(handler, address, port);

  print('Server listening on port ${server.port} at ${server.address.address}');
}
