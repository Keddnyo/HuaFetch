import 'dart:convert';

import 'package:http/http.dart';

import '../../../../core/resource.dart';
import 'dto/auth_dto.dart';
import 'mapper/auth_mapper.dart';

class AuthApi {
  Future<Resource<UserDto>> signIn(String requestToken) async {
    const authority = 'account.huami.com';
    const path = '/v2/client/login';
    final parameters = {
      'app_name': 'com.huami.midong',
      'country_code': 'CN',
      'code': requestToken,
      'device_id': '00:00:00:00:00:00',
      'device_model': 'android_phone',
      'app_version': '5.2.0-play',
      'grant_type': 'request_token',
      'third_name': 'mi-watch',
    };

    final url = Uri.https(authority, path, parameters);

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await post(
      url,
      headers: headers,
    ).timeout(
      const Duration(
        seconds: 15,
      ),
      onTimeout: () => Future.value(
        Response(
          'Sign in request timeout',
          408,
        ),
      ),
    );

    if (response.statusCode != 200) {
      return ErrorResource(
        '${response.statusCode} - ${response.reasonPhrase}',
      );
    }

    final Map<String, dynamic> json = jsonDecode(response.body);
    final user = AuthMapper.toUserDto(json);

    return DataResource(user);
  }

  void signOut(String loginToken) => post(
        Uri.https('account-us2.huami.com', '/v1/client/logout'),
        body: {'login_token': loginToken},
      );
}
