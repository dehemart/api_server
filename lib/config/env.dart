import 'package:dotenv/dotenv.dart';

const String _defaultServerPort = '8080';
const String _defaultJwtSecret = 'no_jwt_secret_loaded';
const int _defaultJwtSessionExpires = 15;
const int _defaultJwtRefreshExpires = 120;
const String _defaultDatabaseHost = 'localhost';

final dotEnv = DotEnv(includePlatformEnvironment: true);

class Env {
  String get dbHost => dotEnv['DB_HOST'] ?? _defaultDatabaseHost;
  String get serverPort => dotEnv['SERVER_PORT'] ?? _defaultServerPort;
  String get jwtSecret => dotEnv['JWT_SECRET'] ?? _defaultJwtSecret;
  int get jwtSessionExpires =>
      int.tryParse(dotEnv['JWT_SESSION_EXPIRY_MINUTS'] ?? _defaultJwtSessionExpires.toString()) ??
      _defaultJwtSessionExpires;
  int get jwtRefreshExpires =>
      int.tryParse(dotEnv['JWT_SESSION_EXPIRY_MINUTS'] ?? _defaultJwtRefreshExpires.toString()) ??
      _defaultJwtRefreshExpires;
}
