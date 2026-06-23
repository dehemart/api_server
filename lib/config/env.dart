import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  final String serverPort = dotenv.get('SERVER_PORT', fallback: '8080');
  final String jwtSecret = dotenv.get('JWT_SECRET', fallback: 'no_jwt_secret_loaded');
  final int jwtSessionExpiresMinuts = dotenv.getInt('JWT_SESSION_EXPIRY_MINUTS', fallback: 15);
  final int jwtRefreshExpiresMinuts = dotenv.getInt('JWT_SESSION_EXPIRY_MINUTS', fallback: 120);

  final String dbHost = dotenv.get('DB_HOST', fallback: 'localhost');
}
