import '../../../../core/resource.dart';
import '../model/user.dart';
import '../repository/auth_repository.dart';

class AuthInteractor {
  const AuthInteractor({required this.repository});

  final AuthRepository repository;

  Future<Resource<User>> signIn(String requestCode) =>
      repository.signIn(requestCode);

  void signOut(String loginToken) => repository.signOut(loginToken);
}
