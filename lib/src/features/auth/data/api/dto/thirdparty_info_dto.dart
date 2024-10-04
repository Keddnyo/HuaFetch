class ThirdpartyInfoDto {
  const ThirdpartyInfoDto({
    this.nickname,
    this.icon,
    this.thirdId,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  });

  final String? nickname;
  final String? icon;
  final String? thirdId;
  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn;
}
