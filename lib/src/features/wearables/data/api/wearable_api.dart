import 'dart:convert';

import 'package:http/http.dart';

import 'dto/wearable_dto.dart';
import 'mapper/wearable_mapper.dart';

class WearableApi {
  const WearableApi({required this.userId, required this.appToken});

  final String userId;
  final String appToken;

  Future<List<WearableDto>> getWearables() async {
    const authority = 'api-mifit-us2.huami.com';
    final path = '/users/$userId/devices';
    final parameters = {'enableMultiDevice': 'true'};

    final url = Uri.https(authority, path, parameters);
    final headers = {'apptoken': appToken};

    final response = await get(url, headers: headers);

    if (response.statusCode != 200) {
      return [];
    }

    final Map<String, dynamic> json = jsonDecode(response.body);

    final List<dynamic>? items = json['items'];

    if (items == null || items.isEmpty) {
      return [];
    }

    final List<WearableDto> wearables = [];

    for (final item in items) {
      final wearable = WearableMapper.toWearableDto(item);

      wearables.add(wearable);
    }

    return wearables;
  }
}
