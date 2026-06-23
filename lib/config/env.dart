import 'package:dotenv/dotenv.dart';

final dotEnv = DotEnv(includePlatformEnvironment: true);

class Env {
  String get serverPort => dotEnv['SERVER_PORT'] ?? '8080';
  String get jwtSecret => dotEnv['JWT_SECRET'] ?? 'no_jwt_secret_loaded';
  int get jwtSessionExpiresMinuts => int.tryParse(dotEnv['JWT_SESSION_EXPIRY_MINUTS'] ?? '15') ?? 15;
  int get jwtRefreshExpiresMinuts => int.tryParse(dotEnv['JWT_SESSION_EXPIRY_MINUTS'] ?? '120') ?? 120;
  String get dbHost => dotEnv['DB_HOST'] ?? 'localhost';
}
