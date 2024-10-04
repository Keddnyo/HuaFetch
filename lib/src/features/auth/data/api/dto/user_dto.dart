import 'auth_dto.dart';

class UserDto {
  const UserDto({
    this.tokenInfo,
    this.registInfo,
    this.thirdpartyInfo,
    this.result,
    this.domain,
    // this.domains,
  });

  final TokenInfoDto? tokenInfo;
  final RegistInfoDto? registInfo;
  final ThirdpartyInfoDto? thirdpartyInfo;
  final String? result;
  final DomainDto? domain;
  // final List<DomainsDto>? domains;
}
