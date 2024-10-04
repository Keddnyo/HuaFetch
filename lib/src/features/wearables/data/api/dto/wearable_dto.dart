import 'additional_info_dto.dart';

class WearableDto {
  const WearableDto({
    this.deviceType,
    this.deviceSource,
    this.deviceId,
    this.macAddress,
    this.sn,
    this.bindingStatus,
    this.applicationTime,
    this.lastDataSyncTime,
    this.lastStatusUpdateTime,
    this.additionalInfo,
    this.lastBindingPlatform,
    this.firmwareVersion,
    this.displayName,
    this.lastActiveStatusUpdateTime,
    this.activeStatus,
    this.priority,
  });

  final int? deviceType;
  final int? deviceSource;
  final String? deviceId;
  final String? macAddress;
  final String? sn;
  final int? bindingStatus;
  final int? applicationTime;
  final int? lastDataSyncTime;
  final int? lastStatusUpdateTime;
  final AdditionalInfoDto? additionalInfo;
  final String? lastBindingPlatform;
  final String? firmwareVersion;
  final String? displayName;
  final int? lastActiveStatusUpdateTime;
  final int? activeStatus;
  final String? priority;
}
