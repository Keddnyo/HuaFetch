class AdditionalInfoDto {
  const AdditionalInfoDto({
    this.sn,
    this.bindTimezone,
    this.authKey,
    this.productId,
    this.productVersion,
    this.hardwareVersion,
    this.brandType,
    this.lastDevicePAIDataSyncTime,
  });

  final String? sn;
  final int? bindTimezone;
  final String? authKey;
  final String? productId;
  final String? productVersion;
  final String? hardwareVersion;
  final String? brandType;
  final int? lastDevicePAIDataSyncTime;
}
