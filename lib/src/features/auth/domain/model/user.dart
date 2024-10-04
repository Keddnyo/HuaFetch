class User {
  const User({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.loginToken,
    required this.appToken,
    required this.accessToken,
    required this.refreshToken,
  });

  final String? id;
  final String? nickname;
  final String? avatarUrl;
  final String? loginToken;
  final String? appToken;
  final String? accessToken;
  final String? refreshToken;
}
