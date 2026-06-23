class TokenDenylist {
  // A simple in-memory set to store revoked tokens.
  static final Set<String> _revokedTokens = {};

  static void add(String token) {
    _revokedTokens.add(token);
  }

  static bool contains(String token) {
    return _revokedTokens.contains(token);
  }
}
