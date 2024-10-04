class RegistInfoDto {
  const RegistInfoDto({
    this.isNewUser,
    this.registDate,
    this.region,
    this.countryCode,
  });

  final int? isNewUser;
  final int? registDate;
  final String? region;
  final String? countryCode;
}
