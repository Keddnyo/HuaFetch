class Wearable {
  const Wearable({
    required this.deviceId,
    required this.productId,
    required this.deviceSource,
    required this.productVersion,
    required this.firmwareVersion,
    required this.hardwareVersion,
    required this.serialNumber,
    required this.macAddress,
    required this.authKey,
  });

  final String? deviceId;
  final String? productId;
  final int? deviceSource;
  final String? productVersion;
  final String? firmwareVersion;
  final String? hardwareVersion;
  final String? serialNumber;
  final String? macAddress;
  final String? authKey;

  String? get signedAuthKey => authKey != null ? '0x$authKey' : null;
}
