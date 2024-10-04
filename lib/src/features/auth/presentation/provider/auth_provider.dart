import '../../../../core/resource.dart';
import '../../data/api/auth_api.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/interactor/auth_interactor.dart';
import '../../domain/model/user.dart';

class AuthProvider {
  static final AuthInteractor _auth = AuthInteractor(
    repository: AuthRepositoryImpl(api: AuthApi()),
  );

  static Future<Resource<User>> signIn(String requestCode) =>
      _auth.signIn(requestCode);

  static void signOut(String loginToken) => _auth.signOut(loginToken);
}
