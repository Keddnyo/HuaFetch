import '../../../domain/model/user.dart';
import '../dto/auth_dto.dart';

class AuthMapper {
  static toUser(
    UserDto userDto,
  ) =>
      User(
        id: userDto.tokenInfo?.userId,
        nickname: userDto.thirdpartyInfo?.nickname,
        avatarUrl: userDto.thirdpartyInfo?.icon,
        loginToken: userDto.tokenInfo?.loginToken,
        appToken: userDto.tokenInfo?.appToken,
        accessToken: userDto.tokenInfo?.appToken,
        refreshToken: userDto.thirdpartyInfo?.refreshToken,
      );

  static UserDto toUserDto(
    Map<String, dynamic> json,
  ) =>
      UserDto(
        tokenInfo: _toTokenInfoDto(
          json['token_info'],
        ),
        registInfo: _toRegistInfoDto(
          json['regist_info'],
        ),
        thirdpartyInfo: _toThirdpartyInfoDto(
          json['thirdparty_info'],
        ),
        result: json['result'],
        domain: _toDomainDto(
          json['domain'],
        ),
        // domains: List.from(
        //   jsonDecode(
        //     json['domains'],
        //   ),
        // )
        //     .map(
        //       (json) => _toDomainsDto(json),
        //     )
        //     .toList(),
      );

  static TokenInfoDto _toTokenInfoDto(
    Map<String, dynamic> json,
  ) =>
      TokenInfoDto(
        loginToken: json['login_token'],
        appToken: json['app_token'],
        userId: json['user_id'],
        ttl: json['ttl'],
        appTtl: json['app_ttl'],
      );

  static RegistInfoDto _toRegistInfoDto(
    Map<String, dynamic> json,
  ) =>
      RegistInfoDto(
        isNewUser: json['is_new_user'],
        registDate: json['regist_date'],
        region: json['region'],
        countryCode: json['country_code'],
      );

  static ThirdpartyInfoDto _toThirdpartyInfoDto(
    Map<String, dynamic> json,
  ) =>
      ThirdpartyInfoDto(
        nickname: json['nickname'],
        icon: json['icon'],
        thirdId: json['third_id'],
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
        expiresIn: json['expires_in'],
      );

  static DomainDto _toDomainDto(
    Map<String, dynamic> json,
  ) =>
      DomainDto(
        idDns: json['id-dns'],
      );

  // static DomainsDto _toDomainsDto(
  //   Map<String, dynamic> json,
  // ) =>
  //     DomainsDto(
  //       cnames: List.from(
  //         jsonDecode(
  //           json['cnames'],
  //         ),
  //       ),
  //       host: json['host'],
  //     );
}
