import 'dart:convert';

import '../../../domain/model/wearable.dart';
import '../dto/additional_info_dto.dart';
import '../dto/wearable_dto.dart';

class WearableMapper {
  static AdditionalInfoDto _toAdditionalInfoDto(
    Map<String, dynamic> json,
  ) =>
      AdditionalInfoDto(
        sn: json['sn'],
        bindTimezone: json['bind_timezone'],
        authKey: json['auth_key'],
        productId: json['productId'],
        productVersion: json['productVersion'],
        hardwareVersion: json['hardwareVersion'],
        brandType: json['brand_type'],
        lastDevicePAIDataSyncTime: json['lastDevicePAIDataSyncTime'],
      );

  static WearableDto toWearableDto(
    Map<String, dynamic> json,
  ) =>
      WearableDto(
        deviceType: json['deviceType'],
        deviceSource: json['deviceSource'],
        deviceId: json['deviceId'],
        macAddress: json['macAddress'],
        sn: json['sn'],
        bindingStatus: json['bindingStatus'],
        applicationTime: json['applicationTime'],
        lastDataSyncTime: json['lastDataSyncTime'],
        lastStatusUpdateTime: json['lastStatusUpdateTime'],
        additionalInfo: _toAdditionalInfoDto(
          jsonDecode(
            json['additionalInfo'],
          ),
        ),
        lastBindingPlatform: json['lastBindingPlatform'],
        firmwareVersion: json['firmwareVersion'],
        displayName: json['displayName'],
        lastActiveStatusUpdateTime: json['lastActiveStatusUpdateTime'],
        activeStatus: json['activeStatus'],
        priority: json['priority'],
      );

  static Wearable toWearable(
    WearableDto dto,
  ) =>
      Wearable(
        deviceId: dto.deviceId,
        productId: dto.additionalInfo?.productId,
        deviceSource: dto.deviceSource,
        productVersion: dto.additionalInfo?.productVersion,
        firmwareVersion: dto.firmwareVersion,
        hardwareVersion: dto.additionalInfo?.hardwareVersion,
        serialNumber: dto.additionalInfo?.sn,
        macAddress: dto.macAddress,
        authKey: dto.additionalInfo?.authKey,
      );
}
