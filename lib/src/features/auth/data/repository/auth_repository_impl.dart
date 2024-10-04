import '../../../../core/resource.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../api/auth_api.dart';
import '../api/mapper/auth_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.api});

  final AuthApi api;

  @override
  Future<Resource<User>> signIn(String requestCode) =>
      api.signIn(requestCode).then((dtoResource) => dtoResource is DataResource
          ? DataResource(AuthMapper.toUser(dtoResource.data!))
          : ErrorResource(dtoResource.error));

  @override
  void signOut(String loginToken) => api.signOut(loginToken);
}
