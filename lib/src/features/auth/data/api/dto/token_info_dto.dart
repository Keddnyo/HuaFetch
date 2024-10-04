class TokenInfoDto {
  const TokenInfoDto({
    this.loginToken,
    this.appToken,
    this.userId,
    this.ttl,
    this.appTtl,
  });

  final String? loginToken;
  final String? appToken;
  final String? userId;
  final int? ttl;
  final int? appTtl;
}
